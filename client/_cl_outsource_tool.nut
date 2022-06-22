#if DEV && PC_PROG
untyped
#endif

global function ServerCallback_OVUpdateModelBounds
global function ServerCallback_OVAddSpawnNode
global function ServerCallback_OVSpawnModel
global function ServerCallback_OVEnable
global function ServerCallback_OVDisable

global function ClientCodeCallback_OutsourceModelOrCamReset
global function ClientCodeCallback_SwitchOutsourceEnv
global function ClientCodeCallback_UpdateOutsourceModel
global function ClientCodeCallback_ToggleAxisLocked

#if DEV && PC_PROG
global function OutsourceViewer_IsActive

const string OUTSOURCE_VIEWER_NODES_SCRIPT_NAME = "Outsource_Viewer_Node"

const int AXIS_LOCKED_X	= ( 1 << 0 )
const int AXIS_LOCKED_Y	= ( 1 << 1 )
const int AXIS_LOCKED_Z	= ( 1 << 2 )

const int SKIN_QUALITY_OTHER = 5

const int MAX_MODEL_NAMES = 10

const float SUN_PITCH = 30.0

const vector WEAPON_HEIGHT_OFFSET = < 0, 0, 20.0 >
const vector CHARM_HEIGHT_OFFSET = < 0, 0, 20.0 >

const vector WEAPON_ROTATION_OFFSET = < 0.0, 90.0, 0.0 >
const vector CHARM_ROTATION_OFFSET = < 0.0, 90.0, 0.0 >

const float VIEWER_CHARM_SIZE = 10.0

const float MODEL_TRANSLATESPEED = 0.25
const float MODEL_TRANSLATESPEED_Z = 0.75
const float MODEL_ROTATESPEED = 1.0

const vector colorSelected = <160,160,0>

enum eAssetType
{
	ASSETTYPE_CHARACTER,
	ASSETTYPE_WEAPON,
	ASSETTYPE_CHARM,
	ASSETTYPE_PROP,

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
	int currentAssetType = eAssetType.ASSETTYPE_CHARACTER
	int currentAsset = 0
	int currentAssetSkin = 0
	int currentCharm = 0

	table<string, vector> modelBounds
	bool modelSelectionBoundsVisible = false
	bool modelBoundsNeedsRefresh = false

	vector colorSelected = <160,160,0>

	bool shouldUsePreloadedModels = false
	int selectedPreloadedModel = 0

	bool tumbleModeActive = false
	bool freecamActive = false
	int axisLockedFlags = 0
	int noclipState = 0

	array<spawnNode> spawnNodes
	array<string> spawnNodeNames
	int currentNode = 0
	int maxNodes = 0

	bool shouldBeInShadow = false

	bool controllerHudCreated = false
	bool shouldShowHud = false
	array<var> hudModelNames
	var controllerRui

	int lastEnablematchending
	int lastEnabletimelimit

	bool extraCamModesEnabled = false

	bool watermarkEnabled = false
	var watermarkRui
} file

void function CreateControllerHud()
{
	if ( file.controllerHudCreated )
		return

	file.controllerRui = RuiCreate( $"ui/controller_layout.rpak", clGlobal.topoFullScreen, RUI_DRAW_HUD, MINIMAP_Z_BASE + 1000 )
	RuiSetImage( file.controllerRui, "gamepadImage", $"rui/menu/controls_menu/xbx_gamepad_button_layout" )
	RuiSetString( file.controllerRui, "ultimateText", "" )
	RuiSetVisible( file.controllerRui, false )

	file.controllerHudCreated = true

	file.hudModelNames.append( HudElement( "ModelViewerModelName0" ) )
	file.hudModelNames.append( HudElement( "ModelViewerModelName1" ) )
	file.hudModelNames.append( HudElement( "ModelViewerModelName2" ) )
	file.hudModelNames.append( HudElement( "ModelViewerModelName3" ) )
	file.hudModelNames.append( HudElement( "ModelViewerModelName4" ) )
	file.hudModelNames.append( HudElement( "ModelViewerModelName5" ) )
	file.hudModelNames.append( HudElement( "ModelViewerModelName6" ) )
	file.hudModelNames.append( HudElement( "ModelViewerModelName7" ) )
	file.hudModelNames.append( HudElement( "ModelViewerModelName8" ) )
	file.hudModelNames.append( HudElement( "ModelViewerModelName9" ) )

	Hud_SetColor( file.hudModelNames[0], 255, 255, 128 )

	file.lastEnablematchending = 1
	file.lastEnabletimelimit = 1
}

void function RefreshHudLabels()
{
	if ( file.tumbleModeActive )
	{
		RuiSetString( file.controllerRui, "lTriggerText",	"Zoom Out %[L_TRIGGER|]%" )
		RuiSetString( file.controllerRui, "rTriggerText",	"%[R_TRIGGER|]% Zoom In" )
		RuiSetString( file.controllerRui, "lShoulderText",	"Rotate CCW %[L_SHOULDER|]%" )
		RuiSetString( file.controllerRui, "rShoulderText",	"%[R_SHOULDER|]% Rotate CW" )
		RuiSetString( file.controllerRui, "yText", 			"%[Y_BUTTON|]%" )
		RuiSetString( file.controllerRui, "xText",			"%[X_BUTTON|]% Swap Shadow Side" )
		RuiSetString( file.controllerRui, "bText",			"%[B_BUTTON|]%" )
		RuiSetString( file.controllerRui, "aText", 			"%[A_BUTTON|]%" )
		RuiSetString( file.controllerRui, "lStickText",		"Unused %$vgui/fonts/buttons/stick_left_move%\nToggle Move %[STICK1|]%" )
		RuiSetString( file.controllerRui, "rStickText",		"%$vgui/fonts/buttons/stick_right_move% Rotate Model\n%[STICK2|]% Reset Model" )
		RuiSetString( file.controllerRui, "upText", 		"Previous Preloaded Model %[UP|]%" )
		RuiSetString( file.controllerRui, "downText", 		"Next Preloaded Model %[DOWN|]%" )
		RuiSetString( file.controllerRui, "leftText", 		"Previous Environment %[LEFT|]%" )
		RuiSetString( file.controllerRui, "rightText", 		"Next Environment %[RIGHT|]%" )
		RuiSetString( file.controllerRui, "backText", 		"Show/Hide Controls" )
		RuiSetString( file.controllerRui, "startText", 		"Menu" )
	}
	else
	{
		RuiSetString( file.controllerRui, "lTriggerText",	"Zoom Out %[L_TRIGGER|]%" )
		RuiSetString( file.controllerRui, "rTriggerText",	"%[R_TRIGGER|]% Zoom In" )
		RuiSetString( file.controllerRui, "lShoulderText",	"Move Down %[L_SHOULDER|]%" )
		RuiSetString( file.controllerRui, "rShoulderText",	"%[R_SHOULDER|]% Move Up" )
		RuiSetString( file.controllerRui, "yText", 			"%[Y_BUTTON|]%" )
		RuiSetString( file.controllerRui, "xText",			"%[X_BUTTON|]% Swap Shadow Side" )
		RuiSetString( file.controllerRui, "bText",			"%[B_BUTTON|]%" )
		RuiSetString( file.controllerRui, "aText", 			"%[A_BUTTON|]%" )
		RuiSetString( file.controllerRui, "lStickText",		"Unused %$vgui/fonts/buttons/stick_left_move%\nToggle Rotation %[STICK1|]%" )
		RuiSetString( file.controllerRui, "rStickText",		"%$vgui/fonts/buttons/stick_right_move% Move Model\n%[STICK2|]% Reset Model" )
		RuiSetString( file.controllerRui, "upText", 		"Previous Preloaded Model %[UP|]%" )
		RuiSetString( file.controllerRui, "downText", 		"Next Preloaded Model %[DOWN|]%" )
		RuiSetString( file.controllerRui, "leftText", 		"Previous Environment %[LEFT|]%" )
		RuiSetString( file.controllerRui, "rightText", 		"Next Environment %[RIGHT|]%" )
		RuiSetString( file.controllerRui, "backText", 		"Show/Hide Controls" )
		RuiSetString( file.controllerRui, "startText", 		"Menu" )
	}
}


bool function OutsourceViewer_IsActive()
{
	return file.outsourceViewerEnabled
}

                                                    
                                                    
                                                    

array<int> OUTSOURCE_VIEWER_BUTTONS = [
	             
	BUTTON_DPAD_UP,			             
	BUTTON_DPAD_DOWN,		                 
	BUTTON_DPAD_LEFT,		                       
	BUTTON_DPAD_RIGHT,		                   
	BUTTON_SHOULDER_LEFT,	                                             
	BUTTON_SHOULDER_RIGHT,	                                   

	BUTTON_TRIGGER_LEFT,	           
	BUTTON_TRIGGER_RIGHT,	          

	BUTTON_A,				                                                  
	BUTTON_B,				                                                     
	BUTTON_X,				                     
	BUTTON_Y,				         
	BUTTON_BACK,			            
	BUTTON_STICK_LEFT,		                  
	BUTTON_STICK_RIGHT,		              

	           
	KEY_UP,		             
	KEY_DOWN,	                 
	KEY_LEFT,	                       
	KEY_RIGHT,	                   
	KEY_Q,		                                             
	KEY_E,		                                   

	KEY_W,		                     
	KEY_S,		                  
	KEY_A,		                  
	KEY_D,		                   

	KEY_F,		                                                  
	KEY_C,		                                                     
	KEY_TAB,	            
	KEY_T,		                  
	KEY_SPACE,	              
]

void function RegisterButtons()
{
	foreach ( int buttonId in OUTSOURCE_VIEWER_BUTTONS )
	{
		RegisterButtonPressedCallback( buttonId, void function( var button ) : ( buttonId )
		{
			OnButtonPressed( button, buttonId )
		} )
	}
}

                      
void function OnButtonPressed( var button, int key )
{
	bool xLocked = ( file.axisLockedFlags & AXIS_LOCKED_X ) != 0
	bool yLocked = ( file.axisLockedFlags & AXIS_LOCKED_Y ) != 0
	bool zLocked = ( file.axisLockedFlags & AXIS_LOCKED_Z ) != 0

	switch ( key )
	{
		case KEY_W:
			if ( !file.freecamActive && !yLocked  )
			{
				if ( file.tumbleModeActive )
					thread PitchModelForward()
				else
					thread TranslateModelUp()
			}
			break
		case KEY_S:
			if ( !file.freecamActive && !yLocked )
			{
				if ( file.tumbleModeActive )
					thread PitchModelBack()
				else
					thread TranslateModelDown()
			}
			break
		case KEY_A:
			if ( !file.freecamActive && !xLocked  )
			{
				if ( file.tumbleModeActive )
					thread RotateModelCCW()
				else
					thread TranslateModelLeft()
			}
			break
		case KEY_D:
			if ( !file.freecamActive && !xLocked )
			{
				if ( file.tumbleModeActive )
					thread RotateModelCW()
				else
					thread TranslateModelRight()
			}
			break
		case KEY_UP:
		case BUTTON_DPAD_UP:
			NextModel()
			break
		case KEY_DOWN:
		case BUTTON_DPAD_DOWN:
			PrevModel()
			break
		case KEY_LEFT:
		case BUTTON_DPAD_LEFT:
			PrevEnvironmentNode()
			break
		case KEY_RIGHT:
		case BUTTON_DPAD_RIGHT:
			NextEnvironmentNode()
			break
		case KEY_Q:
		case BUTTON_SHOULDER_LEFT:
			if ( !zLocked )
			{
				if ( file.tumbleModeActive )
					thread RollModelLeft()
				else
					thread TranslateModelZDown()
			}
			break
		case KEY_E:
		case BUTTON_SHOULDER_RIGHT:
			if ( !zLocked )
			{
				if ( file.tumbleModeActive )
					thread RollModelRight()
				else
					thread TranslateModelZUp()
			}
			break
		case BUTTON_TRIGGER_LEFT:
		case BUTTON_TRIGGER_RIGHT:
			break
		case KEY_C:
			ToggleModelSelectionBounds()
			break
		case BUTTON_B:
			if ( file.extraCamModesEnabled )
				CycleCamMode()
			break
		case KEY_F:
		case BUTTON_A:
			if ( !file.tumbleModeActive && file.extraCamModesEnabled )
				EnableNoclip()
			break
		case BUTTON_X:
			file.shouldBeInShadow = !file.shouldBeInShadow
			UpdateSunAngles( file.spawnNodes[ file.currentNode ].ang )
			break
		case BUTTON_Y:
			break
		case KEY_TAB:
		case BUTTON_BACK:
			file.shouldShowHud = !file.shouldShowHud
			RefreshControllerLayoutVisibility()
			RefreshModelListVisibility()
			break
		case KEY_T:
		case BUTTON_STICK_LEFT:
			ToggleTumbleMode()
			break
		case KEY_SPACE:
		case BUTTON_STICK_RIGHT:
			if ( file.extraCamModesEnabled )
				OutsourceViewer_ResetView( file.viewerModel )
			else
				thread ResetViewerModelOriginAndAngles()
			break
	}
}

void function EnableViewerWatermark()
{
	if ( !file.watermarkEnabled )
		file.watermarkEnabled = true
	else
		return

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
		file.currentAssetType = eAssetType.ASSETTYPE_PROP
}

void function ToggleModelSelectionBounds()
{
	file.modelSelectionBoundsVisible = !file.modelSelectionBoundsVisible
	if ( file.modelSelectionBoundsVisible )
		thread ShowModelSectionBounds()
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

	array< string > availableWeaponNames
	foreach ( int weaponIndex, ItemFlavor weapon in file.availableAssets )
	{
		string weaponName = Localize( ItemFlavor_GetLongName( weapon ) )
		availableWeaponNames.append( weaponName )

		if ( file.shouldUsePreloadedModels )
		{
			asset preloadedModel = file.modelViewerModels[ file.selectedPreloadedModel ]
			if ( preloadedModel.find( weaponName.tolower() ) != -1 )
				file.currentAsset = weaponIndex
		}
	}

	if ( file.currentAsset >= file.availableAssets.len() )
	{
		Warning( "Art Viewer - Current asset out of bounds, setting to 0." )
		file.currentAsset = 0
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

	array< string > availableCharacterNames
	foreach ( int characterIndex, character in file.availableAssets )
	{
		string characterName = Localize( ItemFlavor_GetLongName( character ) )
		availableCharacterNames.append( characterName )

		if ( file.shouldUsePreloadedModels )
		{
			asset preloadedModel = file.modelViewerModels[ file.selectedPreloadedModel ]
			if ( preloadedModel.find( characterName.tolower() ) != -1 )
				file.currentAsset = characterIndex
		}
	}

	if ( file.currentAsset >= file.availableAssets.len() )
	{
		Warning( "Art Viewer - Current asset out of bounds, setting to 0." )
		file.currentAsset = 0
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

	array< string > availableCharmNames
	foreach ( int charmIndex, charm in file.availableCharms )
	{
		string charmName = Localize( ItemFlavor_GetLongName( charm ) )
		availableCharmNames.append( charmName )

		if ( file.shouldUsePreloadedModels )
		{
			asset preloadedModel = file.modelViewerModels[ file.selectedPreloadedModel ]
			if ( preloadedModel.find( charmName.tolower() ) != -1 )
				file.currentCharm = charmIndex
		}
	}

	if ( file.currentCharm >= file.availableCharms.len() )
	{
		Warning( "Art Viewer - Current charm out of bounds, setting to 0." )
		file.currentCharm = 0
	}

	array< OutsourceViewer_SkinDetails > currentSkinNamesAndTiers
	UpdateOVAssetUI( availableCharmNames, currentSkinNamesAndTiers, availableCharmNames, file.currentAssetType, file.currentCharm, file.currentAssetSkin, file.currentCharm )
}

void function RefreshPropsAndPropSkins()
{
	file.availableAssets.clear()
	file.availableAssetSkins.clear()

	file.currentAsset = 0
	file.currentAssetSkin = 0

	array< string > availablePropNames = [ "None" ]
	OutsourceViewer_SkinDetails skinDetails
	skinDetails.skinName = "None"
	skinDetails.skinTier = SKIN_QUALITY_OTHER
	array< OutsourceViewer_SkinDetails > currentPropSkinNamesAndTiers = [ skinDetails ]
	array< string > availableCharmNames

	UpdateOVAssetUI( availablePropNames, currentPropSkinNamesAndTiers, availableCharmNames, file.currentAssetType, file.currentAsset, file.currentAssetSkin, file.currentCharm )
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
		case eAssetType.ASSETTYPE_PROP:
			RefreshPropsAndPropSkins()
			break
		default:
			Warning( "Art Viewer - Unknown asset type: ", file.currentAssetType  )
			break
	}
}

void function RefreshControllerLayoutVisibility()
{
	RuiSetVisible( file.controllerRui, file.shouldShowHud )
}

void function RefreshModelListVisibility()
{
	foreach ( element in file.hudModelNames )
	{
		if ( file.shouldShowHud )
			element.Show()
		else
			element.Hide()
	}
}

void function ToggleTumbleMode()
{
	if ( !file.tumbleModeActive && file.viewerModel != null )
		file.tumbleModeActive = true
	else
		file.tumbleModeActive = false

	RefreshHudLabels()
}

void function CycleCamMode()
{
	Remote_ServerCallFunction( "ClientCallback_CycleCamMode" )

	if ( file.freecamActive )
	{
		file.freecamActive = false
		thread MoveModel( GetLocalClientPlayer() )
	}
	else
		file.freecamActive = true
}

void function GetPreloadedModels()
{
	                                               

	                                               
	   
	  	                
	  	                       

	  	                                           
	  		                                                                     

	  	                           
	  		                                       

	  	                         
	   
	  
	                                 

	                                        
	  	                                        
	                                                      
}

void function RestoreNoclip()
{
	if ( file.noclipState == 1 )
		GetLocalClientPlayer().ClientCommand( "noclip" )       
}

void function EnableNoclip()
{
	GetLocalClientPlayer().ClientCommand( "noclip" )       

	file.noclipState = file.noclipState == 0 ? 1 : 0
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

void function MoveModel( entity player )
{
	player.EndSignal( "Stop_MoveModel" )

	if ( file.viewerModel == null || file.modelMover == null )
		return
	if ( file.freecamActive )
		return
	if ( file.modelBoundsNeedsRefresh )
		return

	RefreshHudLabels()

	while ( file.viewerModel != null && file.modelMover != null && !file.freecamActive && !file.modelBoundsNeedsRefresh )
	{
		float xAxis
		float yAxis
		if ( file.extraCamModesEnabled )
		{
			xAxis = InputGetAxis( 0 )
			yAxis = InputGetAxis( 1 )
		}
		else
		{
			xAxis = InputGetAxis( 2 )
			yAxis = InputGetAxis( 3 )
		}

		if ( file.tumbleModeActive )
		{
			xAxis *= -1
			yAxis *= 1

			vector angles = file.modelMover.GetAngles()

			if ( fabs( yAxis ) + fabs( xAxis ) < 0.5 )
			{
				wait( 0.0 )
				continue
			}

			if ( fabs( yAxis ) > fabs( xAxis ) )
			{
				vector anglesRight = AnglesToRight( player.CameraAngles() )
				angles = RotateAnglesAboutAxis( angles, anglesRight, yAxis )
			}
			else
			{
				vector anglesUp = AnglesToUp( player.CameraAngles() )
				angles = RotateAnglesAboutAxis( angles, anglesUp, xAxis )
			}

			file.modelMover.SetAngles( angles )
		}
		else
		{
			xAxis *= 0.5
			yAxis *= -0.5

			if ( fabs( yAxis ) + fabs( xAxis ) < 0.5)
			{
				wait( 0.0 )
				continue
			}

			vector yMove = file.modelMover.GetOrigin() - player.CameraPosition()
			yMove.z = 0.0
			yMove = Normalize( yMove )
			yMove *= yAxis

			vector xMove = AnglesToRight( <0,player.CameraAngles().y,0> )
			xMove *= xAxis

			vector trans = xMove + yMove

			file.modelMover.SetOrigin( file.modelMover.GetOrigin() + trans )
		}
		wait( 0.0 )
	}
	file.viewerModel.ClearParent()
}

void function ResetViewerModelOriginAndAngles()
{
	WaitFrame()                                                      
	if ( file.viewerModel != null && file.modelMover != null)
	{
		spawnNode node = file.spawnNodes[ file.currentNode ]

		vector offset = < 0,0,0 >
		vector orientation = < 0.0, 180.0, 0.0 >
		switch ( file.currentAssetType )
		{
			case eAssetType.ASSETTYPE_WEAPON:
				offset = WEAPON_HEIGHT_OFFSET
				orientation = WEAPON_ROTATION_OFFSET
				break
			case eAssetType.ASSETTYPE_CHARM:
				offset = CHARM_HEIGHT_OFFSET
				orientation = CHARM_ROTATION_OFFSET
				break
		}

		file.modelMover.SetOrigin( node.pos + offset )
		file.modelMover.SetAngles( node.ang + orientation )
	}
}

void function SetCharmModel()
{
	ItemFlavor charmToApply  = file.availableCharms[ file.currentCharm ]
	string charmModel = WeaponCharm_GetCharmModel( charmToApply )
	if ( charmModel == "" )
	{
		if ( IsValid( file.viewerCharmModel ) )
			file.viewerCharmModel.Hide()

		return
	}

	WaitFrame()
	if ( IsValid( file.viewerCharmModel ) )
		file.viewerCharmModel.Destroy()

	file.viewerCharmModel = CreateClientSidePropDynamicCharm( <0,0,0>, <0,0,0>, charmModel )

	if ( file.currentAssetType == eAssetType.ASSETTYPE_WEAPON )
	{
		Assert( IsValid( file.viewerModel ) )
		if ( !IsValid( file.viewerModel ) )
		{
			file.viewerCharmModel.Hide()
			return
		}
		file.viewerCharmModel.kv.renderamt = file.viewerModel.kv.renderamt

		string attachmentName = WeaponCharm_GetAttachmentName( charmToApply )
		file.viewerCharmModel.SetParent( file.viewerModel, attachmentName, false )
		file.viewerCharmModel.SetModelScale( file.viewerModel.GetModelScale() )
	}
	else
	{
		Assert( IsValid( file.modelMover ) )
		if ( !IsValid( file.modelMover ) )
		{
			file.viewerCharmModel.Hide()
			return
		}

		file.modelMover.SetOrigin( file.viewerCharmModel.GetOrigin() - <0, 0, 5.0> )
		file.viewerCharmModel.SetParent( file.modelMover, "", true )
		file.viewerCharmModel.SetModelScale( VIEWER_CHARM_SIZE )

		thread ResetViewerModelOriginAndAngles()
	}
}

void function UpdateModelViewerSkin()
{
	if ( file.shouldUsePreloadedModels )
	{
		file.viewerModel.SetModel( file.modelViewerModels[ file.selectedPreloadedModel ] )
	}
	else
	{
		ItemFlavor skinToApply  = file.availableAssetSkins[ file.currentAssetSkin ]
		switch ( file.currentAssetType )
		{
			case eAssetType.ASSETTYPE_CHARACTER:
				file.viewerModel.Show()
				if ( IsValid( file.viewerCharmModel ) )
					file.viewerCharmModel.Hide()

				CharacterSkin_Apply( file.viewerModel, skinToApply )
				break
			case eAssetType.ASSETTYPE_WEAPON:
				file.viewerModel.Show()

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
					Assert ( false, "Tried to set camoIndex of " + string(camoIndex) + "but the maximum index is " + string(CAMO_SKIN_COUNT) )
					camoIndex = 0
				}

				file.viewerModel.SetSkin( skinIndex )
				file.viewerModel.SetCamo( camoIndex )

				thread SetCharmModel()
				break
			case eAssetType.ASSETTYPE_CHARM:
				Assert( file.availableCharms.len() > 0 )
				if ( file.availableCharms.len() > 0 )
				{
					thread SetCharmModel()
					file.viewerModel.Hide()
				}
				else
				{
					Warning( "Art Viewer - ERROR: No avaliable charms to update with." )
					if ( IsValid( file.viewerCharmModel ) )
						file.viewerCharmModel.Hide()
				}
				break
			case eAssetType.ASSETTYPE_PROP:
				break
		}
	}
}

void function InitViewerModel()
{
	entity player = GetLocalClientPlayer()
	player.Signal( "Stop_MoveModel" )

	Assert( IsValid( file.modelMover ) && IsValid( file.viewerModel ) )
	if ( !IsValid( file.modelMover ) || !IsValid( file.viewerModel ) )
		return

	file.modelMover.SetAngles( < 0, 0, 0 > )
	file.viewerModel.SetAngles( < 0, 0, 0 > )

	UpdateModelViewerSkin()
	RefreshHudLabels()

	if ( file.currentAssetType == eAssetType.ASSETTYPE_CHARM )
		return

	file.viewerModel.ClearParent()

	file.modelMover.SetOrigin( GetModelCenter( file.viewerModel ) )
	file.viewerModel.SetParent( file.modelMover, "", true )

	thread ResetViewerModelOriginAndAngles()

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
		OutsourceViewer_ResetView( file.modelMover )
		Remote_ServerCallFunction( "ClientCallback_OrbitPosition", file.currentNode, file.extraCamModesEnabled )
		thread ResetViewerModelOriginAndAngles()
	}
	else
		Warning( "Art Viewer - ERROR: Invalid model mover on current node update." )
}

void function UpdateSunAngles( vector angles )
{
	entity lightEnvironmentEntity = GetLightEnvironmentEntity()
	Assert( IsValid( lightEnvironmentEntity ) )

	if ( IsValid( lightEnvironmentEntity ) )
	{
		angles += file.shouldBeInShadow ? < 0, 180, 0 > :  < 0, 0, 0 >
		lightEnvironmentEntity.OverrideAngles( SUN_PITCH, angles.y )
	}
	else
		Warning( "Art Viewer - ERROR: Invalid Light Environment Entity on sun angle update." )
}

void function NextEnvironmentNode()
{
	file.currentNode++
	if ( file.currentNode == file.maxNodes )
		file.currentNode = 0

	SetConVarInt( "outsourceviewer_environmentnode", file.currentNode )
	thread UpdateModelToCurrentEnvNode()
}

void function PrevEnvironmentNode()
{
	file.currentNode--
	if ( file.currentNode < 0 )
		file.currentNode = file.maxNodes - 1

	SetConVarInt( "outsourceviewer_environmentnode", file.currentNode )
	thread UpdateModelToCurrentEnvNode()
}

void function UpdatePreloadedModel()
{
	file.shouldUsePreloadedModels = true
	file.currentAsset = 0
	file.currentAssetSkin = 0
	SetCurrentModelType( string( file.modelViewerModels[ file.selectedPreloadedModel ] ) )
	RefreshAssetItemFlavors()

	if ( file.currentAssetType != eAssetType.ASSETTYPE_PROP )
	{
		file.modelBoundsNeedsRefresh = true
		Remote_ServerCallFunction( "ClientCallback_GetModelBounds", string ( file.modelViewerModels[ file.selectedPreloadedModel ] ) )
	}
	else
	{
		file.modelBoundsNeedsRefresh = false
		table<string, vector> tab = { mins = <0,0,0>, maxs = <0,0,0> }
		file.modelBounds = tab
		InitViewerModel()
	}
}

void function NextModel()
{
	if ( file.modelViewerModels.len() == 0 )
		return

	file.selectedPreloadedModel--
	if ( file.selectedPreloadedModel < 0 )
		file.selectedPreloadedModel = file.modelViewerModels.len() -1

	foreach ( elem in file.hudModelNames )
		Hud_SetColor( elem, 255, 255, 255, 255 )
	Hud_SetColor( file.hudModelNames[file.selectedPreloadedModel], 255, 255, 128 )

	UpdatePreloadedModel()
}

void function PrevModel()
{
	if ( file.modelViewerModels.len() == 0 )
		return

	file.selectedPreloadedModel++
	if ( file.selectedPreloadedModel >= file.modelViewerModels.len() )
		file.selectedPreloadedModel = 0

	foreach ( elem in file.hudModelNames )
		Hud_SetColor( elem, 255, 255, 255, 255 )
	Hud_SetColor( file.hudModelNames[file.selectedPreloadedModel], 255, 255, 128 )

	UpdatePreloadedModel()
}

vector function GetModelCenter( entity model )
{
	vector mins = file.modelBounds.mins
	vector maxs = file.modelBounds.maxs

	return model.GetOrigin() + <mins.x + ( ( maxs.x - mins.x ) * 0.5 ), mins.y + ( ( maxs.y - mins.y ) * 0.5 ), mins.z + ( ( maxs.z - mins.z ) * 0.5 )>
}

void function TranslateModelUp()
{
	entity player = GetLocalViewPlayer()
	while ( InputIsButtonDown( KEY_W ) )
	{
		if ( !IsValid( player ) )
			break
		
		if ( IsValid( file.modelMover ) )
		{
			vector trans = file.modelMover.GetOrigin() - player.CameraPosition()
			trans.z = 0.0
			trans = Normalize( trans )
			trans *= MODEL_TRANSLATESPEED

			vector newOrigin = file.modelMover.GetOrigin() + trans
			file.modelMover.SetOrigin( newOrigin )
		}
		wait( 0.0 )
	}
}

void function TranslateModelDown()
{
	entity player = GetLocalViewPlayer()
	while ( InputIsButtonDown( KEY_S ))
	{
		if ( !IsValid( player ) )
			break

		if ( IsValid( file.modelMover ) )
		{
			vector trans = file.modelMover.GetOrigin() - player.CameraPosition()
			trans.z = 0.0
			trans = Normalize( trans )
			trans *= -MODEL_TRANSLATESPEED

			vector newOrigin = file.modelMover.GetOrigin() + trans
			file.modelMover.SetOrigin( newOrigin )
		}
		wait( 0.0 )
	}
}

void function TranslateModelLeft()
{
	entity player = GetLocalViewPlayer()
	while ( InputIsButtonDown( KEY_A ) )
	{
		if ( !IsValid( player ) )
			break
		
		if ( IsValid( file.modelMover ) )
		{
			vector trans = AnglesToRight( <0,player.CameraAngles().y,0> )
			trans *= -MODEL_TRANSLATESPEED
			vector newOrigin = file.modelMover.GetOrigin() + trans
			file.modelMover.SetOrigin( newOrigin )
		}
		wait( 0.0 )
	}
}

void function TranslateModelRight()
{
	entity player = GetLocalViewPlayer()
	while ( InputIsButtonDown( KEY_D ) )
	{
		if ( !IsValid( player ) )
			break
		
		if ( IsValid( file.modelMover ) )
		{
			vector trans = AnglesToRight( <0,player.CameraAngles().y,0> )
			trans *= MODEL_TRANSLATESPEED
			vector newOrigin = file.modelMover.GetOrigin() + trans
			file.modelMover.SetOrigin( newOrigin )
		}
		wait( 0.0 )
	}
}

void function TranslateModelZUp()
{
	while ( InputIsButtonDown( BUTTON_SHOULDER_RIGHT ) || InputIsButtonDown( KEY_E ) )
	{
		if ( IsValid( file.modelMover ) )
		{
			vector trans = <0,0,1>
			trans *= MODEL_TRANSLATESPEED_Z
			vector newOrigin = file.modelMover.GetOrigin() + trans
			file.modelMover.SetOrigin( newOrigin )
		}
		wait( 0.0 )
	}
}

void function TranslateModelZDown()
{
	while ( InputIsButtonDown( BUTTON_SHOULDER_LEFT ) || InputIsButtonDown( KEY_Q ))
	{
		if ( IsValid( file.modelMover ) )
		{
			vector trans = <0,0,-1>
			trans *= MODEL_TRANSLATESPEED_Z
			vector newOrigin = file.modelMover.GetOrigin() + trans
			file.modelMover.SetOrigin( newOrigin )
		}
		wait( 0.0 )
	}
}

void function PitchModelBack()
{
	while( InputIsButtonDown( KEY_S ) )
	{
		entity player = GetLocalClientPlayer()
		vector angles = file.modelMover.GetAngles()
		vector anglesRight = AnglesToRight( player.CameraAngles() )
		angles = RotateAnglesAboutAxis( angles, anglesRight, MODEL_ROTATESPEED )
		file.modelMover.SetAngles( angles )
		wait( 0.0 )
	}
}

void function PitchModelForward()
{
	while( InputIsButtonDown( KEY_W ) )
	{
		entity player = GetLocalClientPlayer()
		vector angles = file.modelMover.GetAngles()
		vector anglesRight = AnglesToRight( player.CameraAngles() )
		angles = RotateAnglesAboutAxis( angles, anglesRight, -MODEL_ROTATESPEED )
		file.modelMover.SetAngles( angles )
		wait(0.0)
	}
}

void function RollModelRight()
{
	while( InputIsButtonDown( BUTTON_SHOULDER_RIGHT ) || InputIsButtonDown( KEY_E ) )
	{
		entity player = GetLocalClientPlayer()
		vector angles = file.modelMover.GetAngles()
		vector anglesForward = AnglesToForward( player.CameraAngles() )
		angles = RotateAnglesAboutAxis( angles, anglesForward, MODEL_ROTATESPEED )
		file.modelMover.SetAngles( angles )
		wait( 0.0 )
	}
}

void function RollModelLeft()
{
	while( InputIsButtonDown( BUTTON_SHOULDER_LEFT ) || InputIsButtonDown( KEY_Q ) )
	{
		entity player = GetLocalClientPlayer()
		vector angles = file.modelMover.GetAngles()
		vector anglesForward = AnglesToForward( player.CameraAngles() )
		angles = RotateAnglesAboutAxis( angles, anglesForward, -MODEL_ROTATESPEED )
		file.modelMover.SetAngles( angles )
		wait( 0.0 )
	}
}

void function RotateModelCCW()
{
	while ( InputIsButtonDown( KEY_A ) )
	{
		if ( IsValid( file.viewerModel ) )
		{
			entity player = GetLocalClientPlayer()
			vector angles = file.modelMover.GetAngles()
			vector anglesUp = AnglesToUp( player.CameraAngles() )
			angles = RotateAnglesAboutAxis( angles, anglesUp, MODEL_ROTATESPEED )
			file.modelMover.SetAngles( angles )
		}
		wait( 0.0 )
	}
}

void function RotateModelCW()
{
	while ( InputIsButtonDown( KEY_D ) )
	{
		if ( IsValid( file.viewerModel ) )
		{
			entity player = GetLocalClientPlayer()
			vector angles = file.modelMover.GetAngles()
			vector anglesUp = AnglesToUp( player.CameraAngles() )
			angles = RotateAnglesAboutAxis( angles, anglesUp, -MODEL_ROTATESPEED )
			file.modelMover.SetAngles( angles )
		}
		wait( 0.0 )
	}
}

void function OutsourceViewer_ResetView( entity model )
{
	spawnNode currNode = file.spawnNodes[ file.currentNode ]
	vector forward = AnglesToForward( currNode.ang )
	vector playerPos = OffsetPointRelativeToVector( currNode.pos, <0, 100, 0>, forward )
	vector viewAng = currNode.ang + < 0, 180.0, 0 >

	entity player = GetLocalClientPlayer()
	player.ClientCommand( "setpos " + playerPos.x + " " + playerPos.y + " " + playerPos.z )       
	player.ClientCommand( "setang " + viewAng.x + " " + viewAng.y + " " + viewAng.z )       
}
#endif                      

                                                            
                                                            
                                                            

void function ServerCallback_OVUpdateModelBounds( float minX, float minY, float minZ, float maxX, float maxY, float maxZ )
{
#if DEV && PC_PROG
	file.modelBoundsNeedsRefresh = false
	table<string, vector> tab = { mins = <minX,minY,minZ>, maxs = <maxX,maxY,maxZ> }
	file.modelBounds = tab
	InitViewerModel()
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
	entity player = GetLocalClientPlayer()
	player.ClientCommand( "noclip" )       
	file.noclipState = file.noclipState == 0 ? 1 : 0
	HideScriptHUD( player )

	file.shouldUsePreloadedModels = file.modelViewerModels.len() > 0
	file.selectedPreloadedModel = 0
	file.currentAssetType = eAssetType.ASSETTYPE_CHARACTER
	file.currentAsset = 0
	file.currentAssetSkin = 0
	file.currentCharm = 0

	if ( file.shouldUsePreloadedModels )
		SetCurrentModelType( string( file.modelViewerModels[ 0 ] ) )

	file.modelMover = CreateClientsideScriptMover( $"mdl/dev/empty_model.rmdl", < 0, 0, 0 >, < 0, 0, 0 > )
	file.viewerModel = CreateOVClientSideEntity( pos, ang, $"mdl/dev/empty_model.rmdl" )

	if ( file.modelMover == null || file.viewerModel == null )
	{
		Warning( "Art Viewer - Error: Failed to start the outsource viewer." )
		ServerCallback_OVDisable()
		return
	}

	if ( file.shouldUsePreloadedModels )
	{
		Hud_SetColor( file.hudModelNames[file.selectedPreloadedModel], 255, 255, 128 )
		UpdatePreloadedModel()
	}
	else
	{
		RefreshAssetItemFlavors()
		ClientCodeCallback_UpdateOutsourceModel( ARTVIEWER_PROPERTIES_ASSETTYPE, 0 )
	}

	OutsourceViewer_ResetView( file.viewerModel )

	Remote_ServerCallFunction( "ClientCallback_OrbitPosition", 0, file.extraCamModesEnabled )

	InitOutsourceUI_EnvironmentNodes( file.spawnNodeNames )
	UpdateSunAngles( ang )

	RefreshHudLabels()
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
	file.extraCamModesEnabled = GetConVarBool( "outsourceviewer_extracammodes" )

	UpdateMainHudVisibility( GetLocalViewPlayer() )

	EnableViewerWatermark()

	CreateControllerHud()
	GetPreloadedModels()

	RegisterButtons()
	RegisterSignal( "Stop_MoveModel" )

	file.lastEnablematchending = GetConVarInt( "mp_enablematchending" )
	GetLocalClientPlayer().ClientCommand( "mp_enablematchending 0" )       
	file.lastEnabletimelimit = GetConVarInt( "mp_enabletimelimit" )
	GetLocalClientPlayer().ClientCommand( "mp_enabletimelimit 0" )       

	GetLocalClientPlayer().ClientCommand( "exec outsource_viewer" )

	ModelViewerModeEnabled()
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

	RuiDestroyIfAlive( file.controllerRui )
	DisableViewerWatermark()
	UpdateMainHudVisibility( GetLocalViewPlayer() )


	delaythread( 0.5 ) RestoreNoclip()                                                       

	GetLocalClientPlayer().ClientCommand( "exec config_default_pc" )
	GetLocalClientPlayer().ClientCommand( "mp_enablematchending " + file.lastEnablematchending )       
	GetLocalClientPlayer().ClientCommand( "mp_enabletimelimit " + file.lastEnabletimelimit )       
#endif                      
}

                                                                 
                                                                 
                                                                 

void function ClientCodeCallback_OutsourceModelOrCamReset()
{
#if DEV && PC_PROG
	if ( file.extraCamModesEnabled )
		OutsourceViewer_ResetView( file.viewerModel )
	else
		thread ResetViewerModelOriginAndAngles()
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

	file.currentNode = envNum
	thread UpdateModelToCurrentEnvNode()
#endif                      
}

void function ClientCodeCallback_UpdateOutsourceModel( int pickerProperty, int updatedValue )
{
#if DEV && PC_PROG
	file.shouldUsePreloadedModels = false
	switch ( pickerProperty )
	{
		case ARTVIEWER_PROPERTIES_ASSETTYPE:
			if ( updatedValue >= eAssetType._count )
				return

			file.currentAssetType = updatedValue
			file.currentAsset = 0
			file.currentAssetSkin = 0

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
		default:
			return
			break
	}

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
			InitViewerModel()
			return
			break
		default:
			return
			break
	}

	if ( modelName != "" )
	{
		file.modelBoundsNeedsRefresh = true
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

