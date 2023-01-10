global function ServerCallback_OVUpdateModelBounds
global function ServerCallback_OVAddSpawnNode
global function ServerCallback_OVSpawnModel
global function ServerCallback_OVEnable
global function ServerCallback_OVDisable

global function ClientCodeCallback_ResetCamera
global function ClientCodeCallback_ResetModel
global function ClientCodeCallback_SwitchOutsourceEnv
global function ClientCodeCallback_UpdateOutsourceModel
global function ClientCodeCallback_ToggleAxisLocked
global function ClientCodeCallback_UpdateMousePos
global function ClientCodeCallback_InputMouseScrolledUp
global function ClientCodeCallback_InputMouseScrolledDown
global function ClientCodeCallback_ToggleMoveModel
global function ClientCodeCallback_ToggleModelInShadow

#if DEV && PC_PROG
global function OutsourceViewer_IsActive

const int AXIS_LOCKED_X	= ( 1 << 0 )
const int AXIS_LOCKED_Y	= ( 1 << 1 )

const int SKIN_QUALITY_OTHER = 5

const float SUN_PITCH = 30.0

const vector WEAPON_FOCUS_OFFSET = < 0.0, 0.0, 3.0 >
const vector CHARACTER_FOCUS_OFFSET = < 0, 0, 20.0 >

const vector WEAPON_ROTATION_OFFSET = < 0.0, -90.0, 0.0 >
const vector CHARM_ROTATION_OFFSET = < 0.0, -90.0, 0.0 >

const float VIEWER_CHARM_SIZE = 10.0

const float MODEL_TRANSLATESPEED = 0.25
const float MODEL_TRANSLATESPEED_Z = 0.75
const float MODEL_ROTATESPEED = 1.0

const float STICK_DEADZONE = 0.1
const float STICK_ROTATE_SPEED = 2.0
const float STICK_MOVE_SPEED = 0.5

const float MOUSE_MOVE_SPEED = 0.1

const float BOUNDING_BOX_HEIGHT = 140
const float BOUNDING_BOX_RADIUS = 19600

const float MIN_DIST_FROM_FOCUS = 0.0
const float MAX_DIST_FROM_FOCUS = 1200.0

const float CHARACTER_BASE_ZOOM = 120
const float WEAPON_BASE_ZOOM = 60
const float CHARM_BASE_ZOOM = 42

const float MODEL_FADE_DIST = 9999999

const float halfPi = PI / 2.0

enum eAssetType
{
	ASSETTYPE_CHARACTER,
	ASSETTYPE_WEAPON,
	ASSETTYPE_CHARM,

	_count
}

struct spawnNode
{
	vector pos
	vector ang
}

struct {
	bool outsourceViewerEnabled = false

	array<asset> modelViewerModels
	entity viewerModel
	entity viewerCharmModel
	entity modelMover

	array<ItemFlavor> availableAssets
	array<ItemFlavor> availableAssetSkins
	array<ItemFlavor> availableCharms

	bool useWorldModel = false
	int currentAssetType = eAssetType.ASSETTYPE_CHARACTER
	int currentAsset = 0
	int currentAssetSkin = 0
	int currentCharm = 0

	table<string, vector> modelBounds
	bool modelSelectionBoundsVisible = false
	bool hasCurrentModelBounds = false

	bool tumbleModeActive = true
	int axisLockedFlags = 0

	float screenWidth = 1920                             
	float screenHeight = 1080                              
	float[2] previousMousePos	= [0, 0]
	float[2] mouseDelta			= [0, 0]
	float[2] rotationDelta		= [0, 0]
	float[2] rotationVel		= [0, 0]
	float[2] movementDelta		= [0, 0]

	array<spawnNode> spawnNodes
	array<string> spawnNodeNames
	int currentNode = 0
	int previousNode = 0
	int maxNodes = 0

	bool shouldBeInShadow = false

	int lastEnablematchending
	int lastEnabletimelimit

	bool watermarkEnabled = false
	var watermarkRui

	entity viewerCameraEntity
	float viewerCameraFOV

	float mouseWheelNewValue
	float mouseWheelLastValue

	bool shouldResetCameraOnModelUpdate = true
	float maxZoomIncrement_Mouse = 60.0
	float maxZoomIncrement_Controller = 20.0
	float lastZoomVal = 0.0
	float maxZoomAmount
	vector zoomTrackStartPos
	vector zoomTrackEndPos
	vector zoomNormVec
} file

bool function OutsourceViewer_IsActive()
{
	return file.outsourceViewerEnabled
}

void function EnableViewerWatermark()
{
	if ( file.watermarkEnabled )
		return

	file.watermarkEnabled = true

	var watermarkRui = RuiCreate( MINIMAP_UID_COORDS_RUI, clGlobal.topoFullScreen, RUI_DRAW_HUD, MINIMAP_Z_BASE + 1000 )
	InitHUDRui( watermarkRui, true )

	float watermarkTextScale = GetCurrentPlaylistVarFloat( "watermark_text_scale", 1.0 )
	float watermarkAlphaScale = GetCurrentPlaylistVarFloat( "watermark_alpha_scale", 1.0 )
	RuiSetFloat( watermarkRui, "watermarkTextScale", watermarkTextScale )
	RuiSetFloat( watermarkRui, "watermarkAlphaScale", watermarkAlphaScale )

	string uidString = GetConVarString( "platform_user_id" )
	if ( IsOdd( uidString.len() ) )
		uidString = "0" + uidString
	int uidLength     = uidString.len()
	int uidHalfLength = uidLength / 2
	string uidPart1   = uidString.slice( 0, uidHalfLength )
	string uidPart2   = uidString.slice( uidHalfLength, uidLength )
	Assert( uidPart1.len() == uidPart2.len() )

	string fakeHexUidString = GetUIDHex()
	RuiSetString( watermarkRui, "uid", fakeHexUidString )
	RuiSetInt( watermarkRui, "uidPart1", int( uidPart1 ) )
	RuiSetInt( watermarkRui, "uidPart2", int( uidPart2 ) )

	RuiSetString( watermarkRui, "name", GetPlayerName() )
	RuiSetBool( watermarkRui, "alwaysOn", true )
	RuiSetVisible( watermarkRui, true )

	file.watermarkRui = watermarkRui
}

void function DisableViewerWatermark()
{
	file.watermarkEnabled = false
	RuiDestroyIfAlive( file.watermarkRui )
}

void function SetCurrentModelType( string modelName )
{
	if ( modelName.find( "humans" ) > 0 )
		file.currentAssetType = eAssetType.ASSETTYPE_CHARACTER
	else if ( modelName.find( "weapons" ) > 0 || modelName.find( "Weapon" ) > 0 )
		file.currentAssetType = eAssetType.ASSETTYPE_WEAPON
	else if ( modelName.find( "charm" ) > 0 || modelName.find( "Charm" ) > 0 )
		file.currentAssetType = eAssetType.ASSETTYPE_CHARM
	else
		Warning( "Art Viewer - Error: Unknown asset type on SetCurrentModelType." )
}

int function SortItemFlavorsByQuality( ItemFlavor item1, ItemFlavor item2 )
{
	int item1Tier  = ItemFlavor_GetQuality( item1 )
	int item2Tier  = ItemFlavor_GetQuality( item2 )
	if ( item1Tier > item2Tier )
		return 1
	if ( item1Tier < item2Tier )
		return -1

	return 0
}

void function RefreshWeaponItemFlavors()
{
	file.availableAssets.clear()
	file.availableAssetSkins.clear()
	file.availableCharms.clear()

	file.availableAssets = clone GetAllItemFlavorsOfType( eItemType.loot_main_weapon )
	Assert( file.availableAssets.len() > 0 )
	if ( file.availableAssets.len() == 0 )
	{
		Warning( "Art Viewer - No weapons found on item flavor refresh." )
		return
	}

	if ( file.currentAsset >= file.availableAssets.len() )
	{
		Warning( "Art Viewer - Current asset out of bounds, setting to 0." )
		file.currentAsset = 0
	}

	array< string > availableWeaponNames
	foreach ( int weaponIndex, ItemFlavor weapon in file.availableAssets )
	{
		string weaponName = Localize( ItemFlavor_GetLongName( weapon ) )
		availableWeaponNames.append( weaponName )
	}

	ItemFlavor currentWeapon = file.availableAssets[ file.currentAsset ]
	file.availableAssetSkins = clone GetValidItemFlavorsForLoadoutSlot( EHI_null, Loadout_WeaponSkin( currentWeapon ) )
	array< OutsourceViewer_SkinDetails > currentWeaponSkinNamesAndTiers

	if ( file.availableAssetSkins.len() == 0 )
	{
		Warning( "Art Viewer - No skins found for %s on refresh.", availableWeaponNames[ file.currentAsset ] )
	}
	else
	{
		file.availableAssetSkins.remove( 0 )                                                                 
		foreach ( skin in file.availableAssetSkins )
		{
			OutsourceViewer_SkinDetails skinDetails
			skinDetails.skinName = Localize( ItemFlavor_GetLongName( skin ) )

			if ( ItemFlavor_HasQuality( skin ) )
				skinDetails.skinTier = ItemFlavor_GetQuality( skin )
			else
				skinDetails.skinTier = SKIN_QUALITY_OTHER

			currentWeaponSkinNamesAndTiers.append( skinDetails )
		}
	}

	file.availableCharms = clone GetAllItemFlavorsOfType( eItemType.weapon_charm )
	array< string > availableCharmNames
	if ( file.availableCharms.len() == 0 )
	{
		Warning( "Art Viewer - No charms found, setting current charm to 0." )
		file.currentCharm = 0
	}
	else
	{
		foreach ( charm in file.availableCharms )
		{
			string charmName = Localize( ItemFlavor_GetLongName( charm ) )
			availableCharmNames.append( charmName )
		}
	}

	UpdateOVAssetUI( availableWeaponNames, currentWeaponSkinNamesAndTiers, availableCharmNames, file.currentAssetType, file.currentAsset, file.currentAssetSkin, file.currentCharm )
}

void function RefreshCharacterItemFlavors()
{
	file.availableAssets.clear()
	file.availableAssetSkins.clear()

	file.availableAssets = clone GetAllItemFlavorsOfType( eItemType.character )
	Assert( file.availableAssets.len() > 0 )
	if ( file.availableAssets.len() == 0 )
	{
		Warning( "Art Viewer - No characters found on item flavor refresh." )
		return
	}

	if ( file.currentAsset >= file.availableAssets.len() )
	{
		Warning( "Art Viewer - Current asset out of bounds, setting to 0." )
		file.currentAsset = 0
	}

	array< string > availableCharacterNames
	foreach ( int characterIndex, character in file.availableAssets )
	{
		string characterName = Localize( ItemFlavor_GetLongName( character ) )
		availableCharacterNames.append( characterName )
	}

	ItemFlavor currentCharacter = file.availableAssets[ file.currentAsset ]
	file.availableAssetSkins = clone GetValidItemFlavorsForLoadoutSlot( EHI_null, Loadout_CharacterSkin( currentCharacter ) )
	array< OutsourceViewer_SkinDetails > currentCharacterSkinNamesAndTiers

	if ( file.availableAssetSkins.len() == 0 )
	{
		Warning( "Art Viewer - No skins found for %s on refresh.", availableCharacterNames[ file.currentAsset ] )
	}
	else
	{
		file.availableAssetSkins.remove( 0 )                                                                 
		foreach ( skin in file.availableAssetSkins )
		{
			OutsourceViewer_SkinDetails skinDetails
			skinDetails.skinName = Localize( ItemFlavor_GetLongName( skin ) )

			if ( ItemFlavor_HasQuality( skin ) )
				skinDetails.skinTier = ItemFlavor_GetQuality( skin )
			else
				skinDetails.skinTier = SKIN_QUALITY_OTHER

			currentCharacterSkinNamesAndTiers.append( skinDetails )
		}
	}

	array< string > availableCharmNames
	UpdateOVAssetUI( availableCharacterNames, currentCharacterSkinNamesAndTiers, availableCharmNames, file.currentAssetType, file.currentAsset, file.currentAssetSkin, file.currentCharm )
}

void function RefreshCharmItemFlavors()
{
	file.availableCharms.clear()
	file.availableCharms = clone GetAllItemFlavorsOfType( eItemType.weapon_charm )

	Assert( file.availableCharms.len() > 0 )
	if ( file.availableCharms.len() == 0 )
	{
		Warning( "Art Viewer - No charms found on item flavor refresh." )
		return
	}

	if ( file.currentCharm >= file.availableCharms.len() )
	{
		Warning( "Art Viewer - Current charm out of bounds, setting to 0." )
		file.currentCharm = 0
	}

	array< string > availableCharmNames
	foreach ( int charmIndex, charm in file.availableCharms )
	{
		string charmName = Localize( ItemFlavor_GetLongName( charm ) )
		availableCharmNames.append( charmName )
	}

	array< OutsourceViewer_SkinDetails > currentSkinNamesAndTiers
	UpdateOVAssetUI( availableCharmNames, currentSkinNamesAndTiers, availableCharmNames, file.currentAssetType, file.currentCharm, file.currentAssetSkin, file.currentCharm )
}

void function RefreshAssetItemFlavors()
{
	switch ( file.currentAssetType )
	{
		case eAssetType.ASSETTYPE_CHARACTER:
			RefreshCharacterItemFlavors()
			break
		case eAssetType.ASSETTYPE_WEAPON:
			RefreshWeaponItemFlavors()
			break
		case eAssetType.ASSETTYPE_CHARM:
			RefreshCharmItemFlavors()
			break
		default:
			Warning( "Art Viewer - Unknown asset type: ", file.currentAssetType  )
			break
	}
}

void function ToggleTumbleMode()
{
	file.tumbleModeActive = !file.tumbleModeActive
}

void function ShowModelSectionBounds()
{
	while ( file.modelSelectionBoundsVisible )
	{
		vector mins = file.modelBounds.mins
		vector maxs = file.modelBounds.maxs

		int r = 160
		int g = 160
		int b = 0
		DrawAngledBox( file.viewerModel.GetOrigin(), file.viewerModel.GetAngles(), mins, maxs, <r, g, b>, true, 0.02 )

		vector originMin = < -0.1, -0.1, -0.1 >
		vector originMax = < 0.1, 0.1, 0.1 >
		DrawAngledBox( file.viewerModel.GetOrigin(), file.viewerModel.GetAngles(), originMin, originMax, COLOR_RED, true, 0.02 )

		DrawAngledBox( file.modelMover.GetOrigin(), file.modelMover.GetAngles(), originMin, originMax, COLOR_GREEN, true, 0.02 )
		wait( 0.0 )
	}
}

void function ToggleModelSelectionBounds()
{
	file.modelSelectionBoundsVisible = !file.modelSelectionBoundsVisible
	if ( file.modelSelectionBoundsVisible )
		thread ShowModelSectionBounds()
}

void function SetupCamZoom( bool calcStartingZoom )
{
	float baseZoom = 120
	vector focusOffset = < 0, 0, 0 >
	switch ( file.currentAssetType )
	{
		case eAssetType.ASSETTYPE_WEAPON:
			focusOffset = WEAPON_FOCUS_OFFSET
			baseZoom = WEAPON_BASE_ZOOM
			break
		case eAssetType.ASSETTYPE_CHARACTER:
			focusOffset = CHARACTER_FOCUS_OFFSET
			baseZoom = CHARACTER_BASE_ZOOM
			break
		case eAssetType.ASSETTYPE_CHARM:
			baseZoom = CHARM_BASE_ZOOM
			break
	}

	spawnNode currentNode	= file.spawnNodes[ file.currentNode ]
	vector forward			= AnglesToForward( currentNode.ang )
	file.zoomTrackEndPos	= OffsetPointRelativeToVector( currentNode.pos, <0, -MAX_DIST_FROM_FOCUS, 0>, forward )
	file.zoomTrackStartPos	= currentNode.pos + focusOffset
	file.zoomNormVec		= Normalize( file.zoomTrackStartPos - file.zoomTrackEndPos )

	TraceResults traceResult = TraceLine( file.zoomTrackStartPos, file.zoomTrackEndPos, [], TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE )
	float tracedZoomLimit	 = Distance( file.zoomTrackStartPos, traceResult.endPos )
	file.maxZoomAmount = Distance( file.zoomTrackStartPos, file.zoomTrackEndPos )
	file.maxZoomAmount = tracedZoomLimit < file.maxZoomAmount ? tracedZoomLimit : file.maxZoomAmount

	if ( calcStartingZoom )
	{
		float zoomAmount
		if ( file.hasCurrentModelBounds )
		{
			float halfModelBoundsHeight = GetCurrentModelHeight() / 2.0
			float halfModelBoundsWidth = GetCurrentModelWidth() / 2.0

			float horizontalFOV = DegToRad( file.viewerCameraFOV )
			float hwRatio =  file.screenHeight / file.screenWidth

			float topPlanAng = atan( tan( horizontalFOV / 2.0 ) * hwRatio )
			float topPlanToModelBoundsAng = halfPi - topPlanAng
			float zoomDistFromBoundsHeight = ( ( halfModelBoundsHeight * sin( topPlanToModelBoundsAng ) ) / sin( topPlanAng ) )

			float leftPlanAng = ( horizontalFOV / 2.0 )
			float leftPlanToModelBoundsAng = halfPi - leftPlanAng
			float zoomDistFromBoundsWidth = ( ( halfModelBoundsWidth * sin( leftPlanToModelBoundsAng ) ) / sin( leftPlanAng ) )

			float zoomDistFromBounds = zoomDistFromBoundsHeight > zoomDistFromBoundsWidth ? zoomDistFromBoundsHeight : zoomDistFromBoundsWidth
			zoomAmount = zoomDistFromBounds + ( GetCurrentModelDepth() / 2 )
			zoomAmount += zoomDistFromBounds / 10.0                                                          
		}
		else
		{
			zoomAmount = baseZoom
		}

		vector dest = file.zoomTrackStartPos - ( file.zoomNormVec * zoomAmount )
		file.viewerCameraEntity.SetOrigin( dest )
		file.lastZoomVal = zoomAmount
	}
	else
	{
		file.lastZoomVal = min( file.lastZoomVal, file.maxZoomAmount )

		vector dest = file.zoomTrackStartPos - ( file.zoomNormVec * file.lastZoomVal )
		file.viewerCameraEntity.SetOrigin( dest )
	}
}

void function ArtViewer_SetCameraZoomPos()
{
	float newIncrement = 0.0

	if ( IsControllerModeActive() )
	{
		float stickLTriggerRaw         = clamp( InputGetAxis( ANALOG_L_TRIGGER ), -1.0, 1.0 )
		float stickLTriggerRemappedAbs = ( fabs( stickLTriggerRaw ) < STICK_DEADZONE ) ? 0.0 : ( ( fabs( stickLTriggerRaw ) - STICK_DEADZONE ) / ( 1.0 - STICK_DEADZONE ) )
		float stickLTrigger            = EaseIn( stickLTriggerRemappedAbs ) * ( stickLTriggerRaw < 0.0 ? -1.0 : 1.0 )

		float stickRTriggerRaw         = clamp( InputGetAxis( ANALOG_R_TRIGGER ), -1.0, 1.0 )
		float stickRTriggerRemappedAbs = ( fabs( stickRTriggerRaw ) < STICK_DEADZONE ) ? 0.0 : ( ( fabs( stickRTriggerRaw ) - STICK_DEADZONE ) / ( 1.0 - STICK_DEADZONE ) )
		float stickRTrigger            = EaseIn( stickRTriggerRemappedAbs ) * ( stickRTriggerRaw < 0.0 ? -1.0 : 1.0 )

		float normalizedTriggerInput = 0.0
		if ( stickLTrigger > 0.0 )
			normalizedTriggerInput = stickLTrigger
		else if ( stickRTrigger > 0.0 )
			normalizedTriggerInput = -stickRTrigger
		else
			return

		float adjustedMaxIncrement = file.maxZoomIncrement_Controller * ( file.lastZoomVal / file.maxZoomAmount )
		newIncrement = normalizedTriggerInput * adjustedMaxIncrement
	}
	else
	{
		float delta = file.mouseWheelLastValue - file.mouseWheelNewValue
		if ( delta == 0.0 )
			return

		file.mouseWheelNewValue = Clamp( file.mouseWheelNewValue, -100.0, 100.0 )
		file.mouseWheelLastValue = file.mouseWheelNewValue

		float adjustedMaxIncrement = file.maxZoomIncrement_Mouse * ( file.lastZoomVal / file.maxZoomAmount )
		newIncrement = delta * adjustedMaxIncrement
	}

	float newZoomVal = Clamp( file.lastZoomVal + newIncrement, 0.0, file.maxZoomAmount )
	float distChange = fabs( newZoomVal + file.lastZoomVal )
	if ( distChange < 0.001 )
		return

	vector destination = file.zoomTrackStartPos - ( file.zoomNormVec * newZoomVal )
	file.viewerCameraEntity.SetOrigin( destination )
	file.lastZoomVal = newZoomVal
}

void function ArtViewer_UpdateEntityAngles()
{
	spawnNode node = file.spawnNodes[ file.currentNode ]
	vector pitchTowardCamera = AnglesCompose( node.ang + < 0, 180, 0>, <file.rotationDelta[1], 0, 0> )
	vector newAng            = AnglesCompose( pitchTowardCamera, <0, file.rotationDelta[0], 0> )

	file.modelMover.SetAngles( newAng )
}

void function ArtViewer_UpdateEntityOrigin()
{
	vector transXY	= AnglesToRight( file.viewerCameraEntity.GetAngles() ) * file.movementDelta[0]
	vector transZ 	= <0,0,-1> * file.movementDelta[1]
	vector trans	= transXY + transZ

	trans *= ( file.lastZoomVal * FrameTime() )                                              
	vector newOrigin = file.modelMover.GetOrigin() + trans
	spawnNode currentNode = file.spawnNodes[ file.currentNode ]

	vector lowerBounds = ( currentNode.pos - < 0.0, 0.0, BOUNDING_BOX_HEIGHT / 2 > )
	vector upperBounds = ( currentNode.pos + < 0.0, 0.0, BOUNDING_BOX_HEIGHT / 2 > )

	bool xLocked = ( file.axisLockedFlags & AXIS_LOCKED_X ) != 0
	if ( xLocked )
	{
		trans = < 0.0, 0.0, trans.z >
	}
	else
	{
		if ( GetDistanceSqrFromLineSegment( lowerBounds, upperBounds, newOrigin ) > BOUNDING_BOX_RADIUS )
			trans = < 0.0, 0.0, trans.z >
	}

	bool yLocked = ( file.axisLockedFlags & AXIS_LOCKED_Y ) != 0
	if ( yLocked )
	{
		trans.z = 0.0
	}
	else
	{
		vector bottomVec     = Normalize( upperBounds - lowerBounds )
		vector pointToBottom = Normalize( newOrigin - lowerBounds )

		vector topVec     = Normalize( lowerBounds - upperBounds )
		vector pointToTop = Normalize( newOrigin - upperBounds )

		if ( DotProduct( bottomVec, pointToBottom ) < 0 || DotProduct( topVec, pointToTop ) < 0.0  )
			trans.z = 0.0
	}

	newOrigin = file.modelMover.GetOrigin() + trans
	file.modelMover.SetOrigin( newOrigin )
}

float function StepTowardsZero( float vel, float amount )
{
	if ( vel > 0.0 )
		return vel > amount ? (  vel - amount ) : 0.0
	else if ( vel < 0.0 )
		return vel < amount ? ( vel + amount ) : 0.0

	return 0.0
}

void function ArtViewer_UpdateAnglesFromInput()
{
	float[2] currentRotationDelta = file.rotationDelta
	float[2] newRotationDelta
	float maxTurnSpeed = 270

	if ( IsControllerModeActive() )
	{
		float stickXRaw         = clamp( InputGetAxis( ANALOG_RIGHT_X ), -1.0, 1.0 )
		float stickXRemappedAbs = ( fabs( stickXRaw ) < STICK_DEADZONE ) ? 0.0 : ( ( fabs( stickXRaw ) - STICK_DEADZONE ) / ( 1.0 - STICK_DEADZONE ) )
		float stickX            = EaseIn( stickXRemappedAbs ) * (stickXRaw < 0.0 ? -1.0 : 1.0)
		file.rotationVel[0] += stickX * maxTurnSpeed * FrameTime() * STICK_ROTATE_SPEED

		float stickYRaw         = clamp( InputGetAxis( ANALOG_RIGHT_Y ), -1.0, 1.0 )
		float stickYRemappedAbs = ( fabs( stickYRaw ) < STICK_DEADZONE ) ? 0.0 : ( ( fabs( stickYRaw ) - STICK_DEADZONE ) / ( 1.0 - STICK_DEADZONE ) )
		float stickY            = EaseIn( stickYRemappedAbs ) * ( -stickYRaw < 0.0 ? -1.0 : 1.0 )
		file.rotationVel[1] -= stickY * maxTurnSpeed * FrameTime() * STICK_ROTATE_SPEED
	}
	else
	{
		file.rotationVel[0] += file.mouseDelta[0]
		file.mouseDelta[0] = 0                                                  

		file.rotationVel[1] += file.mouseDelta[1]
		file.mouseDelta[1] = 0                                                  
	}

	newRotationDelta[0] = currentRotationDelta[0] + (file.rotationVel[0] * FrameTime()) % 360.0
	newRotationDelta[1] = currentRotationDelta[1] + (file.rotationVel[1] * FrameTime()) % 360.0

	float velDecay = 180 * FrameTime()
	float dampX = max( fabs( file.rotationVel[0] ) / 60.0, 0.1 )
	float dampY = max( fabs( file.rotationVel[1] ) / 60.0, 0.1 )
	file.rotationVel[0] = clamp( StepTowardsZero( file.rotationVel[0], velDecay * dampX ), -maxTurnSpeed, maxTurnSpeed )
	file.rotationVel[1] = clamp( StepTowardsZero( file.rotationVel[1], velDecay * dampY ), -maxTurnSpeed, maxTurnSpeed )

	if ( currentRotationDelta[0] == newRotationDelta[0] && currentRotationDelta[1] == newRotationDelta[1] )
		return

	if ( !IsBitFlagSet( file.axisLockedFlags, AXIS_LOCKED_Y ) )
		currentRotationDelta[0] = newRotationDelta[0]
	if ( !IsBitFlagSet( file.axisLockedFlags, AXIS_LOCKED_X ) )
		currentRotationDelta[1] = newRotationDelta[1]

	ArtViewer_UpdateEntityAngles()
}

void function ArtViewer_UpdateOriginFromInput()
{
	float[2] currentMoveDelta = file.movementDelta
	float[2] newMoveDelta
	float maxMoveSpeed = 27

	if ( IsControllerModeActive() )
	{
		float stickXRaw         = clamp( InputGetAxis( ANALOG_RIGHT_X ), -1.0, 1.0 )
		float stickXRemappedAbs = ( fabs( stickXRaw ) < STICK_DEADZONE ) ? 0.0 : ( ( fabs( stickXRaw ) - STICK_DEADZONE ) / ( 1.0 - STICK_DEADZONE ) )
		float stickX            = EaseIn( stickXRemappedAbs ) * (stickXRaw < 0.0 ? -1.0 : 1.0)
		newMoveDelta[0] = stickX * maxMoveSpeed * FrameTime() * STICK_MOVE_SPEED

		float stickYRaw         = clamp( InputGetAxis( ANALOG_RIGHT_Y ), -1.0, 1.0 )
		float stickYRemappedAbs = ( fabs( stickYRaw ) < STICK_DEADZONE ) ? 0.0 : ( ( fabs( stickYRaw ) - STICK_DEADZONE ) / ( 1.0 - STICK_DEADZONE ) )
		float stickY            = EaseIn( stickYRemappedAbs ) * ( -stickYRaw < 0.0 ? -1.0 : 1.0 )
		newMoveDelta[1] = -stickY * maxMoveSpeed * FrameTime() * STICK_MOVE_SPEED
	}
	else
	{
		newMoveDelta[0] = file.mouseDelta[0] * MOUSE_MOVE_SPEED
		file.mouseDelta[0] = 0

		newMoveDelta[1] = file.mouseDelta[1] * MOUSE_MOVE_SPEED
		file.mouseDelta[1] = 0
	}

	if ( newMoveDelta[0] == 0.0 && newMoveDelta[1] == 0.0 )
		return

	currentMoveDelta[0] = newMoveDelta[0]
	currentMoveDelta[1] = newMoveDelta[1]

	ArtViewer_UpdateEntityOrigin()
}

void function MoveModel( entity player )
{
	player.EndSignal( "Stop_MoveModel" )

	if ( file.viewerModel == null || file.modelMover == null )
		return

	while ( file.viewerModel != null && file.modelMover != null )
	{
		ArtViewer_SetCameraZoomPos()
		if ( file.tumbleModeActive )
			ArtViewer_UpdateAnglesFromInput()
		else
			ArtViewer_UpdateOriginFromInput()

		WaitFrame()
	}
	file.viewerModel.ClearParent()
}

void function ResetViewerModelOriginAndAngles()
{
	if ( file.viewerModel != null && file.modelMover != null )
	{
		spawnNode node = file.spawnNodes[ file.currentNode ]

		file.previousMousePos[0] = 0
		file.previousMousePos[1] = 0
		file.mouseDelta[0] = 0
		file.mouseDelta[1] = 0

		file.rotationDelta[0] = 0
		file.rotationDelta[1] = 0
		file.rotationVel[0] = 0
		file.rotationVel[1] = 0

		file.movementDelta[0] = 0
		file.movementDelta[1] = 0

		file.modelMover.SetOrigin( node.pos )
		file.modelMover.SetAngles( node.ang + <0, 180, 0> )                                        
	}
}

void function SetCharmModel()
{
	file.viewerModel.Hide()

	Assert( file.availableCharms.len() > 0 )
	if ( file.availableCharms.len() == 0 )
	{
		Warning( "Art Viewer - ERROR: No avaliable charms to update with." )

		if ( IsValid( file.viewerCharmModel ) )
			file.viewerCharmModel.Hide()

		return
	}

	ItemFlavor charmToApply = file.availableCharms[ file.currentCharm ]
	string charmModel = WeaponCharm_GetCharmModel( charmToApply )
	if ( charmModel == "" )
	{
		if ( IsValid( file.viewerCharmModel ) )
			file.viewerCharmModel.Hide()

		return
	}

	if ( IsValid( file.viewerCharmModel ) )
		file.viewerCharmModel.Destroy()

	file.viewerCharmModel = CreateClientSidePropDynamicCharm( <0, 0, 0>, CHARM_ROTATION_OFFSET, charmModel )

	Assert( IsValid( file.modelMover ) )
	if ( !IsValid( file.modelMover ) )
	{
		file.viewerCharmModel.Hide()
		return
	}

	file.viewerCharmModel.SetOrigin( file.modelMover.GetOrigin() + <0, 0, 5.0> )
	file.viewerCharmModel.SetParent( file.modelMover, "", true )
	file.viewerCharmModel.SetModelScale( VIEWER_CHARM_SIZE )
}

void function UpdateCharacterSkin()
{
	file.viewerModel.SetAngles( <0, 0, 0> )

	Assert( file.availableAssetSkins.len() > 0 )
	if ( file.availableAssetSkins.len() == 0 )
	{
		Warning( "Art Viewer - ERROR: No avaliable character skins to update with." )
		return
	}

	ItemFlavor skinToApply = file.availableAssetSkins[ file.currentAssetSkin ]

	file.viewerModel.Show()
	if ( IsValid( file.viewerCharmModel ) )
		file.viewerCharmModel.Hide()

	CharacterSkin_Apply( file.viewerModel, skinToApply )

	Assert( file.hasCurrentModelBounds )
	if ( !file.hasCurrentModelBounds )
		return

	file.modelMover.SetOrigin( GetViewerModelCenter() )
}

void function UpdateWeaponSkin()
{
	Assert( file.availableAssetSkins.len() > 0 )
	if ( file.availableAssetSkins.len() == 0 )
	{
		Warning( "Art Viewer - ERROR: No avaliable weapon skins to update with." )
		return
	}

	ItemFlavor skinToApply = file.availableAssetSkins[ file.currentAssetSkin ]

	file.viewerModel.Show()
	if ( IsValid( file.viewerCharmModel ) )
		file.viewerCharmModel.Hide()

	if ( file.useWorldModel )
	{
		DestroyCharmForWeaponEntity( file.viewerModel )

		asset model = WeaponSkin_GetWorldModel( skinToApply )
		file.viewerModel.SetModel( model )

		int skinIndex = file.viewerModel.GetSkinIndexByName( WeaponSkin_GetSkinName( skinToApply ) )
		int camoIndex = WeaponSkin_GetCamoIndex( skinToApply )

		if ( skinIndex == -1 )
		{
			skinIndex = 0
			camoIndex = 0
		}

		if ( camoIndex >= CAMO_SKIN_COUNT )
		{
			Assert ( false, "Tried to set camoIndex of " + string(camoIndex) + " but the maximum index is " + string(CAMO_SKIN_COUNT) )
			camoIndex = 0
		}

		file.viewerModel.SetSkin( skinIndex )
		file.viewerModel.SetCamo( camoIndex )
	}
	else
	{
		ItemFlavor ornull charmToApply = null
		if ( file.availableCharms.len() > 0 )
			charmToApply = file.availableCharms[ file.currentCharm ]

		WeaponCosmetics_Apply( file.viewerModel, skinToApply, charmToApply )
	}

	bool isReactive = WeaponSkin_DoesReactToKills( skinToApply )
	ItemFlavor weaponFlavor = WeaponSkin_GetWeaponFlavor( skinToApply )
	if ( isReactive )
		MenuWeaponModel_ApplyReactiveSkinBodyGroup( skinToApply, weaponFlavor, file.viewerModel )
	else
		ShowDefaultBodygroupsOnFakeWeapon( file.viewerModel, WeaponItemFlavor_GetClassname( weaponFlavor ) )

	MenuWeaponModel_ClearReactiveEffects( file.viewerModel )
	if ( isReactive )
	{
		MenuWeaponModel_StartReactiveEffects( file.viewerModel, skinToApply )
	}

	file.viewerModel.kv.rendercolor = "0 0 0 255"                                          
	file.viewerModel.SetAngles( WEAPON_ROTATION_OFFSET )

	vector weaponRotatePoint
	int MenuAttachmentID = file.viewerModel.LookupAttachment( "MENU_ROTATE" )
	if ( MenuAttachmentID == 0 )
	{
		if ( file.hasCurrentModelBounds )
		{
			if ( !file.useWorldModel )
				Warning( "Failed to find weapon model center. Falling back onto model bounds center." )

			weaponRotatePoint = GetViewerModelCenter()
		}
		else
		{
			Warning( "Failed to find weapon model center. Falling back onto model origin." )
			weaponRotatePoint = file.viewerModel.GetOrigin()
		}
	}
	else
		weaponRotatePoint = file.viewerModel.GetAttachmentOrigin( MenuAttachmentID )

	file.modelMover.SetOrigin( weaponRotatePoint )
}

void function UpdateModelViewerSkin()
{
	entity player = GetLocalClientPlayer()
	player.Signal( "Stop_MoveModel" )

	Assert( IsValid( file.modelMover ) && IsValid( file.viewerModel ) )
	if ( !IsValid( file.modelMover ) || !IsValid( file.viewerModel ) )
		return

	vector prevAng = file.modelMover.GetAngles()
	vector prevPos = file.modelMover.GetOrigin()

	file.modelMover.SetAngles( <0, 0, 0> )
	file.viewerModel.ClearParent()

	switch ( file.currentAssetType )
	{
		case eAssetType.ASSETTYPE_CHARACTER:
			UpdateCharacterSkin()
			break
		case eAssetType.ASSETTYPE_WEAPON:
			UpdateWeaponSkin()
			break
		case eAssetType.ASSETTYPE_CHARM:
			SetCharmModel()
			break
		default:
			Warning( "Art Viewer - ERROR: Unexpected asset type: ", file.currentAssetType )
			return
	}

	file.viewerModel.SetParent( file.modelMover, "", true )
	file.modelMover.SetAngles( prevAng )
	file.modelMover.SetOrigin( prevPos )

	OVPostModelUpdate()

	SetupCamZoom( file.shouldResetCameraOnModelUpdate )
	if ( file.shouldResetCameraOnModelUpdate )
		file.shouldResetCameraOnModelUpdate = false

	thread MoveModel( player )
}

void function UpdateModelToCurrentEnvNode()
{
	Assert( IsValid( file.modelMover ) )
	WaitFrame()                                               

	spawnNode node = file.spawnNodes[ file.currentNode ]
	if ( IsValid( file.modelMover ) )
	{
		UpdateSunAngles( node.ang )

		file.viewerCameraEntity.SetAngles( node.ang )
		SetupCamZoom( false )

		spawnNode prevNode = file.spawnNodes[ file.previousNode ]
		float dist = Distance( prevNode.pos, file.modelMover.GetOrigin() )
		vector normVec = Normalize( file.modelMover.GetOrigin() - prevNode.pos  )

		float angDiff = ( node.ang.y - prevNode.ang.y )
		vector posOffset = ( RotateVector( normVec, < 0, angDiff, 0 > ) * dist )
		file.modelMover.SetOrigin( node.pos + posOffset )
		file.modelMover.SetAngles( file.modelMover.GetAngles() + < 0, angDiff, 0 > )
	}
	else
		Warning( "Art Viewer - ERROR: Invalid model mover on current node update." )
}

void function UpdateSunAngles( vector angles )
{
	entity lightEnvironmentEntity = GetLightEnvironmentEntity()

	Assert( IsValid( lightEnvironmentEntity ) )
	if ( !IsValid( lightEnvironmentEntity ) )
	{
		Warning( "Art Viewer - ERROR: Invalid Light Environment Entity on sun angle update." )
		return
	}

	angles += file.shouldBeInShadow ? < 0, 180, 0 > :  < 0, 0, 0 >
	lightEnvironmentEntity.OverrideAngles( SUN_PITCH, angles.y )
}

vector function GetViewerModelCenter()
{
	vector mins = file.modelBounds.mins
	vector maxs = file.modelBounds.maxs

	AABB rotatedBounds = RotateAABB( mins, maxs, file.viewerModel.GetAngles() )

	mins = rotatedBounds.mins
	maxs = rotatedBounds.maxs
	
	return file.viewerModel.GetOrigin() + <mins.x + ( ( maxs.x - mins.x ) * 0.5 ), mins.y + ( ( maxs.y - mins.y ) * 0.5 ), mins.z + ( ( maxs.z - mins.z ) * 0.5 )>
}

float function GetCurrentModelWidth()
{
	return file.modelBounds.maxs.x - file.modelBounds.mins.x
}

float function GetCurrentModelHeight()
{
	return file.modelBounds.maxs.z - file.modelBounds.mins.z
}

float function GetCurrentModelDepth()
{
	return file.modelBounds.maxs.y - file.modelBounds.mins.y
}

void function OutsourceViewer_ResetView()
{
	spawnNode currNode = file.spawnNodes[ file.currentNode ]
	file.viewerCameraEntity.SetAngles( currNode.ang )

	SetupCamZoom( true )
}
#endif                      

                                                            
                                                            
                                                            

void function ServerCallback_OVUpdateModelBounds( float minX, float minY, float minZ, float maxX, float maxY, float maxZ )
{
#if DEV && PC_PROG
	file.hasCurrentModelBounds = true
	table<string, vector> tab = { mins = <minX,minY,minZ>, maxs = <maxX,maxY,maxZ> }
	file.modelBounds = tab
	UpdateModelViewerSkin()
#endif                      
}

void function ServerCallback_OVAddSpawnNode( vector pos, vector ang, string name )
{
#if DEV && PC_PROG
	spawnNode node
	node.pos = pos
	node.ang = ang
	file.spawnNodeNames.append( name )
	file.spawnNodes.append( node )

	file.maxNodes++
#endif                      
}

void function ServerCallback_OVSpawnModel( vector pos, vector ang )
{
#if DEV && PC_PROG
	file.currentAssetType	= eAssetType.ASSETTYPE_CHARACTER
	file.currentAsset		= 0
	file.currentAssetSkin	= 0
	file.currentCharm		= 0

	file.modelMover	 = CreateClientsideScriptMover( $"mdl/dev/empty_model.rmdl", pos, ang + <0, 180, 0> )                                        
	file.viewerModel = CreateOVClientSideEntity( pos, ang, $"mdl/dev/empty_model.rmdl" )

	if ( file.modelMover == null || file.viewerModel == null )
	{
		Warning( "Art Viewer - Error: Failed to start the outsource viewer." )
		ServerCallback_OVDisable()
		return
	}

	file.viewerModel.SetFadeDistance( MODEL_FADE_DIST )

	entity player = GetLocalClientPlayer()
	player.ClientCommand( "noclip" )       
	HideScriptHUD( player )

	file.viewerCameraFOV = DEFAULT_FOV
	file.viewerCameraEntity = CreateClientSidePointCamera( <0, 0, 0>, <0, 0, 0>, file.viewerCameraFOV )
	player.SetMenuCameraEntityWithAudio( file.viewerCameraEntity )

	RefreshAssetItemFlavors()
	file.shouldResetCameraOnModelUpdate = true
	ClientCodeCallback_UpdateOutsourceModel( ARTVIEWER_PROPERTIES_ASSETTYPE, 0 )

	OutsourceViewer_ResetView()

	InitOutsourceUI_EnvironmentNodes( file.spawnNodeNames )
	UpdateSunAngles( ang )
#endif                      
}

void function ServerCallback_OVEnable()
{
#if DEV && PC_PROG
	if ( file.outsourceViewerEnabled )
		return
	file.outsourceViewerEnabled = true

	file.viewerModel = null
	file.modelMover = null

	EnableViewerWatermark()
	UpdateMainHudVisibility( GetLocalViewPlayer() )

	RegisterSignal( "Stop_MoveModel" )

	file.lastEnablematchending = GetConVarInt( "mp_enablematchending" )
	GetLocalClientPlayer().ClientCommand( "mp_enablematchending 0" )       
	file.lastEnabletimelimit = GetConVarInt( "mp_enabletimelimit" )
	GetLocalClientPlayer().ClientCommand( "mp_enabletimelimit 0" )       

	file.screenHeight = float( GetScreenSize().height )
	file.screenWidth = float( GetScreenSize().width )
#endif                      
}

void function ServerCallback_OVDisable()
{
#if DEV && PC_PROG
	if ( !file.outsourceViewerEnabled )
		return
	file.outsourceViewerEnabled = false

	if ( IsValid( file.viewerModel ) )
		file.viewerModel.Destroy()

	if ( IsValid( file.modelMover ) )
		file.modelMover.Destroy()

	DisableViewerWatermark()
	UpdateMainHudVisibility( GetLocalViewPlayer() )

	GetLocalClientPlayer().ClientCommand( "mp_enablematchending " + file.lastEnablematchending )       
	GetLocalClientPlayer().ClientCommand( "mp_enabletimelimit " + file.lastEnabletimelimit )       
#endif                      
}

                                                                 
                                                                 
                                                                 


void function ClientCodeCallback_ResetCamera()
{
#if DEV && PC_PROG
	OutsourceViewer_ResetView()
#endif                      
}

void function ClientCodeCallback_ResetModel()
{
#if DEV && PC_PROG
	ResetViewerModelOriginAndAngles()
#endif                      
}

void function ClientCodeCallback_SwitchOutsourceEnv( int envNum )
{
#if DEV && PC_PROG
	if ( envNum < 0 && envNum >= file.maxNodes )
	{
		Warning( "Art Viewer - Error: Tried to switch to an invalid node" )
		return
	}

	file.previousNode = file.currentNode
	file.currentNode = envNum
	thread UpdateModelToCurrentEnvNode()
#endif                      
}

void function ClientCodeCallback_UpdateOutsourceModel( int pickerProperty, int updatedValue )
{
#if DEV && PC_PROG
	switch ( pickerProperty )
	{
		case ARTVIEWER_PROPERTIES_ASSETTYPE:
			if ( updatedValue >= eAssetType._count )
				return

			file.currentAssetType = updatedValue
			file.currentAsset = 0
			file.currentAssetSkin = 0
			file.shouldResetCameraOnModelUpdate = true

			if ( file.currentAssetType != eAssetType.ASSETTYPE_CHARM && file.currentAssetType != eAssetType.ASSETTYPE_WEAPON )
				file.currentCharm = 0

			RefreshAssetItemFlavors()
			break
		case ARTVIEWER_PROPERTIES_ASSET:
			if ( file.currentAssetType == eAssetType.ASSETTYPE_CHARM )
			{
				if ( updatedValue >= file.availableCharms.len() )
					return

				file.currentAssetSkin = 0
				file.currentCharm = updatedValue
			}
			else
			{
				if ( updatedValue >= file.availableAssets.len() )
					return

				file.currentAsset = updatedValue
				file.currentAssetSkin = 0
			}
			RefreshAssetItemFlavors()
			break
		case ARTVIEWER_PROPERTIES_SKIN:
			if ( updatedValue >= file.availableAssetSkins.len() )
				return

			file.currentAssetSkin = updatedValue
			break
		case ARTVIEWER_PROPERTIES_CHARM:
			if ( updatedValue >= file.availableCharms.len() )
				return

			file.currentCharm = updatedValue
			break
		case ARTVIEWER_PROPERTIES_WORLDMODEL:
			file.useWorldModel = bool( updatedValue )
			break
		default:
			return
			break
	}

	file.hasCurrentModelBounds = false
	string modelName
	switch ( file.currentAssetType )
	{
		case eAssetType.ASSETTYPE_CHARACTER:
			if ( file.availableAssetSkins.len() == 0  )
				return

			ItemFlavor currentSkin = file.availableAssetSkins[ file.currentAssetSkin ]
			modelName = string( CharacterSkin_GetBodyModel( currentSkin ) )
			break
		case eAssetType.ASSETTYPE_WEAPON:
			if ( file.availableAssetSkins.len() == 0  )
				return

			ItemFlavor currentSkin = file.availableAssetSkins[ file.currentAssetSkin ]
			modelName = string( WeaponSkin_GetWorldModel( currentSkin ) )
			break
		case eAssetType.ASSETTYPE_CHARM:
			UpdateModelViewerSkin()
			return
			break
		default:
			return
			break
	}

	if ( modelName != "" )
	{
		Remote_ServerCallFunction( "ClientCallback_GetModelBounds", modelName )
	}
#endif                      
}

void function ClientCodeCallback_ToggleAxisLocked( int flag )
{
#if DEV && PC_PROG
	file.axisLockedFlags = file.axisLockedFlags ^ flag
#endif                      
}

void function ClientCodeCallback_UpdateMousePos( float posX, float posY, bool imGuiFocused )
{
#if DEV && PC_PROG
	if ( IsControllerModeActive() )
		return

	float screenScaleXModifier = 1920.0 / file.screenWidth                             
	float mousePosXAdjustedForScale  = posX * screenScaleXModifier

	float screenScaleYModifier = 1080.0 / file.screenHeight                              
	float mousePosYAdjustedForScale  = posY * screenScaleYModifier

	if ( posX >= 0.0 && posY >= 0.0 && posX <= file.screenWidth && posY <= file.screenHeight )
	{
		if ( InputIsButtonDown( MOUSE_LEFT ) && !imGuiFocused )
		{
			file.mouseDelta[0] = mousePosXAdjustedForScale - file.previousMousePos[0]
			file.mouseDelta[1] = mousePosYAdjustedForScale - file.previousMousePos[1]
		}
	}

	file.previousMousePos[0] = mousePosXAdjustedForScale
	file.previousMousePos[1] = mousePosYAdjustedForScale
#endif                      
}

void function ClientCodeCallback_InputMouseScrolledUp()
{
#if DEV && PC_PROG
	file.mouseWheelNewValue++
#endif                      
}

void function ClientCodeCallback_InputMouseScrolledDown()
{
#if DEV && PC_PROG
	file.mouseWheelNewValue--
#endif                      
}

void function ClientCodeCallback_ToggleMoveModel()
{
#if DEV && PC_PROG
	file.tumbleModeActive = !file.tumbleModeActive

	file.rotationVel[0] = 0
	file.rotationVel[1] = 0
#endif                      
}
void function ClientCodeCallback_ToggleModelInShadow( bool inShadow )
{
#if DEV && PC_PROG
	file.shouldBeInShadow = inShadow
	UpdateSunAngles( file.spawnNodes[ file.currentNode ].ang )
#endif                      
}

