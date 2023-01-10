global function ShStickers_LevelInit
global function Loadout_Sticker

#if CLIENT || SERVER
global function GetStickerObjectType
global function GetStickerObjectModel
#endif                    

#if UI
global function GetAllStickerObjectTypes
global function GetStickerObjectName
global function GetStickerPresentationType
global function CreateNestedRuiForSticker
#endif      

global function Sticker_IsTheEmpty
global function Sticker_GetStoryBlurbBodyText
global function Sticker_HasStoryBlurb
global function Sticker_GetDecalMaterialAsset
global function Sticker_GetReplacementMaterialAsset
global function Sticker_GetSortOrdinal
global function Sticker_GetDecalScale

#if SERVER
                                          
                             
                                             
#endif          

#if CLIENT
global function Sticker_SetMaterialModForLocalPlayer
global function Sticker_PlaceDecalForLocalPlayer
global function Sticker_OnPlaced
global function Sticker_CreateFlashData
global function Sticker_FlashOnLoadComplete
#endif

#if SERVER && DEV
                                    
                                              
#endif                 

#if CLIENT && DEV
global function DEV_TestCreateStickerMesh
global function DEV_TestCreateStickerDecal
global function DEV_StickerTestSetupForLocalPlayer
#endif

#if UI && DEV
global function DEV_PrintStickerLoadout
#endif             

global enum eStickerObjectType
{
	injector,
	shield_cell,
	shield_battery,
	phoenix_kit,
}

global const int NUM_STICKERS_PER_OBJECT = 1                               
#if CLIENT || SERVER
global const asset FLAT_STICKER_MODEL = $"mdl/props/stickers/flat_sticker.rmdl"

const asset SHIELD_CELL_MODEL = $"mdl/weapons/shield_battery/ptpov_shield_battery_small_held.rmdl"
const asset SHIELD_BATTERY_MODEL = $"mdl/weapons/shield_battery/ptpov_shield_battery_held.rmdl"
const asset HEALTH_INJECTOR_MODEL = $"mdl/weapons/health_injector/ptpov_health_injector.rmdl"
#endif                    

struct StickerFlashData
{
	entity flashEnt
	int    flashType
	vector flashColor
}

struct FileStruct_LifetimeLevel
{
	table<int, array<LoadoutEntry> > stickerSlotMap
	table<ItemFlavor, int>           stickerSortOrdinalMap

	table<int, StickerFlashData> stickerFlashData
}
FileStruct_LifetimeLevel& fileLevel


void function ShStickers_LevelInit()
{
	FileStruct_LifetimeLevel newFileLevel
	fileLevel = newFileLevel

	#if SERVER || CLIENT
		PrecacheModel( FLAT_STICKER_MODEL )

		PrecacheModel( SHIELD_CELL_MODEL )
		PrecacheModel( SHIELD_BATTERY_MODEL )
		PrecacheModel( HEALTH_INJECTOR_MODEL )
	#endif

	AddCallback_RegisterRootItemFlavors( RegisterStickers )

	#if (SERVER || CLIENT)
		DEV_SetupStickerNetworking()
	#endif
}


void function RegisterStickers()
{
	array<ItemFlavor> stickerItemList = []
	foreach ( asset stickerAsset in GetBaseItemFlavorsFromArray( "stickers" ) )
	{
		if ( stickerAsset == $"" )
			continue

		ItemFlavor ornull stickerItem = RegisterItemFlavorFromSettingsAsset( stickerAsset )
		if ( stickerItem == null )
			continue

		expect ItemFlavor( stickerItem )
		stickerItemList.append( stickerItem )
	}

	MakeItemFlavorSet( stickerItemList, fileLevel.stickerSortOrdinalMap )

	foreach ( int stickerObjectType in eStickerObjectType )
	{
		fileLevel.stickerSlotMap[stickerObjectType] <- []
		string stickerObjectName = GetEnumString( "eStickerObjectType", stickerObjectType )

		for ( int i = 0; i < NUM_STICKERS_PER_OBJECT; i++ )
		{
			LoadoutEntry entry = RegisterLoadoutSlot( eLoadoutEntryType.ITEM_FLAVOR, stickerObjectName + "_sticker_" + i, eLoadoutEntryClass.ACCOUNT )
			entry.category     = eLoadoutCategory.STICKERS
			#if DEV
				entry.DEV_name       = "Sticker " + i
			#endif
			entry.defaultItemFlavor   = stickerItemList[0]
			entry.validItemFlavorList = stickerItemList
			entry.isSlotLocked        = bool function( EHI playerEHI ) { return !IsLobby()	}
			entry.networkTo           = eLoadoutNetworking.PLAYER_EXCLUSIVE

			fileLevel.stickerSlotMap[stickerObjectType].append( entry )
		}
	}

	                                                                                                                                                 
#if CLIENT
	foreach ( int stickerObjectType in eStickerObjectType )
	{
		foreach( LoadoutEntry entry in fileLevel.stickerSlotMap[stickerObjectType] )
		{
			AddCallback_ItemFlavorLoadoutSlotDidChange_AnyPlayer( entry, OnStickerLocalPlayerItemLoadoutChanged )
		}
	}
#endif
}

#if CLIENT
void function OnStickerLocalPlayerItemLoadoutChanged( EHI playerEHI, ItemFlavor flavor )
{
	if ( !IsLocalClientEHIValid() )
		return

	if ( LocalClientEHI() != playerEHI )
		return

	if ( !Sticker_IsTheEmpty( flavor ) )
	{
		asset stickerAsset = Sticker_GetDecalMaterialAsset( flavor )
		RequestLoadStickerPak( stickerAsset )
	}
}
#endif

#if CLIENT || SERVER
int function GetStickerObjectType( string modName )
{
	switch ( modName )
	{
		case "shield_small":
			return eStickerObjectType.shield_cell

		case "shield_large":
			return eStickerObjectType.shield_battery

		case "phoenix_kit":
			return eStickerObjectType.phoenix_kit

		case "health_small":
		case "health_large":
			return eStickerObjectType.injector
	}

	return -1
}


asset function GetStickerObjectModel( int stickerObjectType )
{
	switch ( stickerObjectType )
	{
		case eStickerObjectType.shield_cell:
			return SHIELD_CELL_MODEL

		case eStickerObjectType.shield_battery:
		case eStickerObjectType.phoenix_kit:
			return SHIELD_BATTERY_MODEL

		case eStickerObjectType.injector:
			return HEALTH_INJECTOR_MODEL
	}

	Assert( false, "Unsupported stickerObjectType value " + stickerObjectType + " passed to GetStickerObjectModel()" )
	unreachable
}
#endif                    


#if UI
array<int> function GetAllStickerObjectTypes()
{
	array<int> stickerObjectTypes
	foreach ( int stickerObjectType in eStickerObjectType )
		stickerObjectTypes.append( stickerObjectType )

	return stickerObjectTypes
}


string function GetStickerObjectName( int stickerObjectType )
{
	switch ( stickerObjectType )
	{
		case eStickerObjectType.shield_cell:
			return "#SURVIVAL_PICKUP_HEALTH_COMBO_SMALL"

		case eStickerObjectType.shield_battery:
			return "#SURVIVAL_PICKUP_HEALTH_COMBO_LARGE"

		case eStickerObjectType.phoenix_kit:
			return "#SURVIVAL_PICKUP_HEALTH_COMBO_FULL"

		case eStickerObjectType.injector:
			return "#HEALTH_INJECTOR"
	}

	Assert( false, "Unsupported stickerObjectType value " + stickerObjectType + " passed to GetStickerObjectName()" )
	unreachable
}


int function GetStickerPresentationType( int stickerObjectType )
{
	switch ( stickerObjectType )
	{
		case eStickerObjectType.injector:
			return ePresentationType.APPLIED_STICKER_INJECTOR

		case eStickerObjectType.shield_cell:
			return ePresentationType.APPLIED_STICKER_SMALL_CELL

		case eStickerObjectType.shield_battery:
		case eStickerObjectType.phoenix_kit:
			return ePresentationType.APPLIED_STICKER_LARGE_CELL
	}

	Assert( false, "Unsupported stickerObjectType value " + stickerObjectType + " passed to GetStickerPresentationType()" )
	unreachable
}


var function CreateNestedRuiForSticker( var baseRui, ItemFlavor stickerItem )
{
	var nestedRui = RuiCreateNested( baseRui, "badge", $"ui/comms_menu_icon_default.rpak" )

	RuiSetImage( nestedRui, "icon", ItemFlavor_GetIcon( stickerItem ) )
	RuiSetBool( nestedRui, "showBackground", false )

	return nestedRui
}
#endif      


LoadoutEntry function Loadout_Sticker( int stickerObjectType, int index )
{
	Assert( index == 0 )                                          

	return fileLevel.stickerSlotMap[stickerObjectType][index]
}

bool function Sticker_HasStoryBlurb( ItemFlavor flavor )
{
	Assert( ItemFlavor_GetType( flavor ) == eItemType.sticker )

	return ( Sticker_GetStoryBlurbBodyText( flavor ) != "" )
}

string function Sticker_GetStoryBlurbBodyText( ItemFlavor flavor )
{
	Assert( ItemFlavor_GetType( flavor ) == eItemType.sticker )

	return GetGlobalSettingsString( ItemFlavor_GetAsset( flavor ), "customSkinMenuBlurb" )
}

bool function Sticker_IsTheEmpty( ItemFlavor stickerItem )
{
	Assert( ItemFlavor_GetType( stickerItem ) == eItemType.sticker )

	return GetGlobalSettingsBool( ItemFlavor_GetAsset( stickerItem ), "isTheEmpty" )
}

                                                                  
asset function Sticker_GetDecalMaterialAsset( ItemFlavor stickerItem )
{
	Assert( ItemFlavor_GetType( stickerItem ) == eItemType.sticker )

	return GetKeyValueAsAsset( { kn = GetGlobalSettingsAsset( ItemFlavor_GetAsset( stickerItem ), "stickerMaterial" ) + "_rgdu.rpak" }, "kn" );
}

                                                                  
asset function Sticker_GetReplacementMaterialAsset( ItemFlavor stickerItem )
{
	Assert( ItemFlavor_GetType( stickerItem ) == eItemType.sticker )

	return GetKeyValueAsAsset( { kn = GetGlobalSettingsAsset( ItemFlavor_GetAsset( stickerItem ), "nonDecalStickerMaterial" ) + "_rgdp.rpak" }, "kn" );
}

int function Sticker_GetSortOrdinal( ItemFlavor stickerItem )
{
	Assert( ItemFlavor_GetType( stickerItem ) == eItemType.sticker )

	return fileLevel.stickerSortOrdinalMap[stickerItem]
}

float function Sticker_GetDecalScale( ItemFlavor stickerItem, int stickerObjectType )
{
	Assert( ItemFlavor_GetType( stickerItem ) == eItemType.sticker )

	switch ( stickerObjectType )
	{
		case eStickerObjectType.shield_cell:
			return GetGlobalSettingsFloat( ItemFlavor_GetAsset( stickerItem ), "shieldCellScale" )

		case eStickerObjectType.shield_battery:
			return GetGlobalSettingsFloat( ItemFlavor_GetAsset( stickerItem ), "shieldBatteryScale" )

		case eStickerObjectType.phoenix_kit:
			return GetGlobalSettingsFloat( ItemFlavor_GetAsset( stickerItem ), "phoenixKitScale" )

		case eStickerObjectType.injector:
			return GetGlobalSettingsFloat( ItemFlavor_GetAsset( stickerItem ), "injectorScale" )
	}

	return 0
}

#if SERVER
                                                                                                                                                              
                                                                                                  
 
	                                                        
	                                                                

	                                                                       
	                                   

	                                   

	                                                                         
 

                                                   
                                         
 
	                             
 


                                                            
 
       
	                                  

	                      
	                            
	                                                       
	                                                      
	                                                       
	                                                        
	                                                        
      
 

#endif          

#if (SERVER || CLIENT)
                                                                                                                                     
                                                                                                 
void function DEV_SetupStickerNetworking() 
{
	Remote_RegisterServerFunction( "DEV_StickerTestSetupForPlayer" )
}
#endif

#if SERVER && DEV
                                    
 
	                    
	                                  

	                      
	                            
	                                                       
	                                                      
	                                                       
	                                                        
	                                                        
 


                                                                 
 
	                              
	                                                                             
 
#endif                 

#if CLIENT && DEV
void function DEV_TestCreateStickerMesh( asset stickerMat )
{
	entity player = GP()
	vector origin = player.GetOrigin()
	vector angles = <0, 0, 0>

	entity model = CreateClientSidePropDynamic( origin, angles, FLAT_STICKER_MODEL )
	Sticker_SetMaterialModForLocalPlayer( model, stickerMat )
}

void function DEV_TestCreateStickerDecal( asset stickerMat, float scale )
{
	asset test_model = $"mdl/weapons/shield_battery/ptpov_shield_battery_held.rmdl"

	entity player = GP()
	vector origin = player.GetOrigin()
	vector angles = <0, 0, 0>

	entity model = CreateClientSidePropDynamic( origin, angles, test_model )
	Sticker_PlaceDecalForLocalPlayer( model, stickerMat, "STICKER_1", scale )
}

void function DEV_StickerTestSetupForLocalPlayer()
{
	Remote_ServerCallFunction( "DEV_StickerTestSetupForPlayer" )
}
#endif

#if CLIENT
                                                                                                                                                            
                                            
int function Sticker_SetMaterialModForLocalPlayer( entity ent, asset stickerMat )
{
	int stickerInstance = SetEntMaterialToSticker( stickerMat, ent )
	AddEntityDestroyedCallback( ent, void function( entity ent ) : ( stickerInstance ) { DestroyStickerInstance( stickerInstance ) } )

	return stickerInstance
}

                                                                                                                                                   
                                            
int function Sticker_PlaceDecalForLocalPlayer( entity ent, asset stickerMat, string attachment, float scale )
{
	int stickerInstance = AddStickerDecalToEntity( ent, stickerMat, attachment, scale )
	AddEntityDestroyedCallback( ent, void function( entity ent ) : ( stickerInstance ) { DestroyStickerInstance( stickerInstance ) } )

	return stickerInstance
}

                                                                         
void function Sticker_OnPlaced( int stickerInstance, void functionref( int ) callbackFunc )
{
	thread function() : ( stickerInstance, callbackFunc )
	{
		while ( IsValidStickerInstance( stickerInstance ) && !IsStickerInstancePlaced( stickerInstance ) )
			WaitFrame()

		callbackFunc( stickerInstance )
	}()
}

void function Sticker_CreateFlashData( int stickerInstance, entity flashEnt, int flashType, vector flashColor )
{
	Sticker_CleanUpFlashData()

	                                                                                                                                      
	Assert( !( stickerInstance in fileLevel.stickerFlashData ) )

	if ( !( stickerInstance in fileLevel.stickerFlashData ) )
	{
		StickerFlashData sfd
		sfd.flashEnt = flashEnt
		sfd.flashType = flashType
		sfd.flashColor = flashColor

		                                                                             
		fileLevel.stickerFlashData[ stickerInstance ] <- sfd
	}
}

void function Sticker_CleanUpFlashData()
{
	array<int> deleteList
	foreach ( int stickerInstance, StickerFlashData sdf in fileLevel.stickerFlashData )
	{
		if ( !IsValid( sdf.flashEnt ) || !IsValidStickerInstance( stickerInstance ) )
			deleteList.append( stickerInstance )
	}

	foreach ( int stickerInstance in deleteList )
	{
		                                                                                 
		delete fileLevel.stickerFlashData[ stickerInstance ]
	}
}

void function Sticker_FlashOnLoadComplete( int stickerInstance )
{
	if ( !( stickerInstance in fileLevel.stickerFlashData ) )
		return

	entity flashEnt = fileLevel.stickerFlashData[ stickerInstance ].flashEnt

	if ( IsValid( flashEnt ) && IsValidStickerInstance( stickerInstance ) && IsStickerInstancePlaced( stickerInstance ) )
	{
		int flashType        = fileLevel.stickerFlashData[ stickerInstance ].flashType
		vector flashColor    = fileLevel.stickerFlashData[ stickerInstance ].flashColor
		bool includeChildren = false
		bool depthDiscard    = true
		thread FlashMenuModel( flashEnt, flashType, flashColor, includeChildren, depthDiscard )
	}
}
#endif

#if UI && DEV
void function DEV_PrintStickerLoadout()
{
	EHI playerEHI = ToEHI( GetLocalClientPlayer() )

	LoadoutEntry injectorStickerSlot = Loadout_Sticker( eStickerObjectType.injector, 0 )
	ItemFlavor injectorSticker = LoadoutSlot_GetItemFlavor( playerEHI, injectorStickerSlot )
	printt( "injectorStickerSlot contains:     ", string(ItemFlavor_GetAsset( injectorSticker )) )

	LoadoutEntry shieldCellStickerSlot = Loadout_Sticker( eStickerObjectType.shield_cell, 0 )
	ItemFlavor shieldCellSticker = LoadoutSlot_GetItemFlavor( playerEHI, shieldCellStickerSlot )
	printt( "shieldCellStickerSlot contains:   ", string(ItemFlavor_GetAsset( shieldCellSticker )) )

	LoadoutEntry shieldBatteryStickerSlot = Loadout_Sticker( eStickerObjectType.shield_battery, 0 )
	ItemFlavor shieldBatterySticker = LoadoutSlot_GetItemFlavor( playerEHI, shieldBatteryStickerSlot )
	printt( "shieldBatteryStickerSlot contains:", string(ItemFlavor_GetAsset( shieldBatterySticker )) )

	LoadoutEntry phoenixKitStickerSlot = Loadout_Sticker( eStickerObjectType.phoenix_kit, 0 )
	ItemFlavor phoenixKitSticker = LoadoutSlot_GetItemFlavor( playerEHI, phoenixKitStickerSlot )
	printt( "phoenixKitStickerSlot contains:   ", string(ItemFlavor_GetAsset( phoenixKitSticker )) )
}
#endif             