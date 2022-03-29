                

global function Crafting_Init
global function Crafting_RegisterNetworking
global function Crafting_IsEnabled
global function Crafting_GetPlayerCraftingMaterials
global function Crafting_GetLootDataFromIndex
global function Crafting_GetCraftingDataArray
global function Crafting_IsItemCurrentlyOwnedByAnyPlayer
global function Crafting_DoesPlayerOwnItem

#if SERVER
                                              

                                                      
                           
                                  
                                                     
      
                                             
                                                  
                                                 
                                                  
                                                 
                                          

                                                            
                                                         
       
                                              
                                                      
      

                                            
                                        
#endif

#if CLIENT
global function UICallback_PopulateCraftingPanel
global function Crafting_Workbench_OpenCraftingMenu
global function Crafting_PopulateItemRuiAtIndex
global function ServerCallback_CL_MaterialsChanged
global function ServerCallback_CL_HarvesterUsed
global function ServerCallback_CL_ArmorDeposited
global function ServerCallback_PromptNextHarvester
global function ServerCallback_PromptWorkbench
global function ServerCallback_PromptAllWorkbenches
global function ServerCallback_UpdateWorkbenchVars
global function Crafting_OnMenuItemSelected
global function Crafting_OnWorkbenchMenuClosed
global function TryCloseCraftingMenuFromDamage
global function TryCloseCraftingMenu

global function MarkNextStepForPlayer
global function MarkAllWorkbenches

global function Crafting_GetWorkbenchTitleString
global function Crafting_GetWorkbenchDescString

global function Crafting_IsPlayerAtWorkbench
#endif

      
const asset CRAFTING_DATATABLE = $"datatable/crafting_workbench.rpak"
const asset CRAFTING_CATEGORIES_DATATABLE = $"datatable/crafting_bundles.rpak"
const string CRAFTING_NULL_CHECK = "null"

                            
global const string HARVESTER_SCRIPTNAME = "crafting_harvester"
global const string WORKBENCH_CLUSTER_SCRIPTNAME = "crafting_workbench_cluster"
global const string WORKBENCH_SCRIPTNAME = "crafting_workbench"
global const string WORKBENCH_CLUSTER_AIRDROPPED_SCRIPTNAME = "crafting_workbench_cluster_airdropped"
const string WORKBENCH_RANDOMIZATION_TARGET_SCRIPTNAME = "crafting_workbench_randomization"

                  
const float HARVESTER_USE_DURATION = 0.5
const asset HARVESTER_MODEL = $"mdl/props/crafting_siphon/crafting_siphon.rmdl"
const string HARVESTER_FULL_IDLE_ANIM = "source_full_idle"
const string HARVESTER_EMPTY_IDLE_ANIM = "source_empty_idle"
const string HARVESTER_FULL_TO_EMPTY_ANIM = "source_full_to_empty"

const asset HARVESTER_IDLE_FX = $"P_siphon_idle"

                  
const asset WORKBENCH_CLUSTER_AIRDROP_MODEL = $"mdl/props/crafting_replicator/crafting_replicator.rmdl"
const asset WORKBENCH_CLUSTER_MODEL = $"mdl/props/crafting_replicator/crafting_replicator_no_engine.rmdl"
const asset WORKBENCH_MODEL = $"mdl/dev/empty_model.rmdl"
const float WORKBENCH_USE_DURATION = 1.0
const float WORKBENCH_CRAFTING_DURATION = 10.0
const float WORKBENCH_LIMITED_STOCK_USE_DEFAULT = 3
const string WORKBENCH_IDLE_ANIM = "crafting_replicator_ready_idle"
const string WORKBENCH_IDLE_GROUND_ANIM = "crafting_replicator_ready_groundidle"

const asset WORKBENCH_HOLO_FX = $"P_workbench_holo"
const asset WORKBENCH_START_FX = $"P_workbench_start"
const asset WORKBENCH_BEAM_FX = $"P_workbench_stock_beam_LT"
const asset WORKBENCH_ENGINE_SMOKE_FX = $"P_lootpod_vent_top"
const asset WORKBENCH_DOOR_OPEN_FX = $"P_lootpod_door_open"
const asset WORKBENCH_PRINTING_FX = $"P_replipod_printing_CP"


         
const int CRAFTING_PASSIVE_REWARD = 5
const int HARVESTER_SUCCESS_REWARD = 25

                
const asset WORKBENCH_ICON_ASSET = $"rui/hud/gametype_icons/survival/crafting_workbench"
const asset WORKBENCH_ICON_LIMITED_ASSET = $"rui/hud/gametype_icons/survival/crafting_workbench_limited"
const asset WORKBENCH_ICON_AIRDROP_ASSET = $"rui/hud/gametype_icons/survival/crafting_workbench_airdrop"
const asset HARVESTER_ICON_ASSET = $"rui/hud/gametype_icons/survival/crafting_harvester"
const asset CRAFTING_SMALL_HARVESTER_ASSET = $"rui/hud/gametype_icons/survival/crafting_small_harvester"
const asset CRAFTING_SMALL_WORKBENCH_ASSET = $"rui/hud/ping/icon_ping_crafting_hexagon"
global const asset CRAFTING_ZONE_ASSET = $"rui/hud/gametype_icons/survival/crafting_zone"
const asset CRAFTING_CURRENCY_ASSET = $"rui/hud/gametype_icons/survival/crafting_currency"

              
const string HARVESTER_AMBIENT_LOOP = "Crafting_Extractor_AmbientLoop"
const string WORKBENCH_AMBIENT_LOOP = "Crafting_Replicator_AmbientLoop"
const string HARVESTER_COLLECT_1P = "Crafting_Extractor_Collect_1P"
const string HARVESTER_COLLECT_3P = "Crafting_Extractor_Collect_3P"
const string WORKBENCH_MENU_OPEN_START = "Crafting_ReplicateMenu_OpenStart"
const string WORKBENCH_MENU_OPEN_FAIL = "Crafting_ReplicateMenu_OpenFail"
const string WORKBENCH_MENU_OPEN_SUCCESS = "Crafting_ReplicateMenu_OpenSuccess"
const string WORKBENCH_CRAFTING_START_1P = "Crafting_Replicator_Start_1P"
const string WORKBENCH_CRAFTING_START_3P = "Crafting_Replicator_Start_3P"
const string WORKBENCH_CRAFTING_FINISH = "Crafting_Replicator_CraftingFinish"
const string WORKBENCH_CRAFTING_FINISH_WARNING = "Crafting_Replicater_WarningToEnd"
const string WORKBENCH_CRAFTING_LOOP = "Crafting_Replicator_CraftingLoop"
const string WORKBENCH_CRAFTING_DOOR_OPEN = "Crafting_Replicator_DoorOpen"
const string WORKBENCH_CRAFTING_DOOR_CLOSE = "Crafting_Replicator_DoorClose"

              
const int RUI_TRACK_INDEX_CAPTURE_END_TIME = 0           
const int RUI_TRACK_INDEX_REQUIRED_TIME = 1        
const int RUI_TRACK_INDEX_ACTIVATOR_TEAM = 4      
const int RUI_TRACK_INDEX_COLOR = 0         

                      
const float CRAFTING_PICKUP_GRACE_PERIOD = 5.0
global const string HOLDER_ENT_NAME = "holder_ent"

            
global const int CRAFTING_EVO_GRANT = 150

                       
global const int CRAFTING_AMMO_MULTIPLIER = 3
global const int CRAFTING_AMMO_MULTIPLIER_SMALL = 2

global enum eCraftingExclusivityStyle
{
	RARITY,
	NONE,
	COUNT_
}

global enum eCraftingRotationStyle
{
	DAILY,
	WEEKLY,
	HOURLY,
	PERMANENT,
	LOADOUT_BASED,
	COUNT_
}

global enum eCraftingRandomization
{
	NO_DISTRIBUTION,                                         
	RANDOM_HARVESTER_DISTRIBUTION,                                   
	RANDOM_CLUSTER_DISTRIBUTION,                                           
	RANDOM_CLUSTER_LINKED_DISTRIBUTION,                                                                       
	RANDOM_COMBINATION_DISTRIBUTION,                                                          
	COUNT_
}

global struct CraftingBundle
{
	array< string > 			itemsInBundle

	#if CLIENT
		table<int, var> attachedRui
	#endif
}

global struct CraftingCategory
{
	int index
	string category
	int rotationStyle
	int exclusivityStyle
	int numSlots

	table< string, CraftingBundle > bundlesInCategory
	array< string > bundleStrings

	table< string, int > itemToCostTable
}

struct WorkbenchData
{
	entity workbench
	string lootAttachmentIndex
	string doorAnimIndex
	bool isDoorOpen = false
	array<entity> spawnedLoot

#if SERVER
	                   
#endif

	entity cluster
	bool isCrafting = false
}

struct {
	bool                           isEnabled = false
	bool						   isNetworkingRegistered = false

	table<string, CraftingCategory > craftingData
	array<CraftingCategory> craftingDataArray

	array<string> disabledGroundLoot
	entity		  limitedStockParent
	int 		  timeAtMatchStart

	#if CLIENT
	table<entity, entity>	   	   harvesterToClientProxy
	table<entity, var>             harvesterRuiTable
	table<entity, var>			   workbenchRuiTable
	array<var>					   gameStartRui
	bool						   gameStartRuiCreated
	array<var>					   fullmapRui
	bool						   fullmapInitialized = false
	array<var> 					   exclusivityNotification

	table<entity, var>			   harvesterMinimapRuiTable
	table<entity, var>			   harvesterFullmapRuiTable

	array<int>					   workbenchMarkerList
	array<var>				   	   workbenchMarkerRuiList

	array<int>				       nextStepMarkerList
	array<var>					   nextStepMarkerRuiList

	array< table<var, var> >	   nearbyLiveWorkbenchRui
	#endif

	#if SERVER
	                               			              
	             				   			              
	                               			                  
	                                     	                           
	                     		   			               
	                     		   			                   

	                       			                     
	   								              

	     							                         

                           
	               					                      
      
	#endif

	table<entity, entity>		   ambGenericTable
	array<entity>				   workbenchClusterArray
} file





void function Crafting_Init()
{
	RegisterCraftingData()
	RegisterCraftingDistribution()
	#if SERVER


		                                        
		                           

		                                                                                                                           

                           
		                                
		                                                                                                                 
                   
                                                                                                                  
       
                          
			                                                                                                                             
       
      
	#endif

	#if CLIENT
		if ( IsLobby() )
		{
			file.isEnabled = GetCurrentPlaylistVarBool( "crafting_enabled", true )
			return
		}
	#endif

	#if SERVER
		                                                                                                                   
		                                                                                                                           
	#endif

	#if SERVER
		                                                            
		                                                                   
	#endif
	#if CLIENT
		AddCreateCallback( "prop_dynamic", OnHarvesterCreated )
		AddCreateCallback( "prop_dynamic", OnWorkbenchClusterCreated )
		AddCreateCallback( "info_target", OnLimitedStockParentCreated )
	#endif

	RegisterSignal( "CraftingPlayerAttaching" )
	RegisterSignal( "CraftingComplete" )
	RegisterSignal( "CraftingPlayerDetached" )
	RegisterSignal( "OnPinged_Crafting" )
	RegisterSignal( "CraftingOnConnectionChanged" )

	if ( !GetCurrentPlaylistVarBool( "crafting_enabled", true ) )
		return

	printf( "CRAFTING: Crafting Systems enabled" )
	file.isEnabled = true

	#if SERVER
		                                                                             
		                                                                        
		                                                                            
		                                                         
		                                                                                                              
		                                                                                                    
		                                                      
		                                                      

		                                                              
		                                                     
		                                                                          
		                                                                           

		                                                          
		                                                                   
	#endif
	#if CLIENT
		AddCallback_GameStateEnter( eGameState.WaitingForPlayers, OnWaitingForPlayers_Client )
		AddCallback_GameStateEnter( eGameState.Playing, OnGameStartedPlaying_Client )
		AddDestroyCallback( "prop_dynamic", OnHarvesterDestroyed )
		                                                            
		AddCreateCallback( PLAYER_WAYPOINT_CLASSNAME, SetupProgressWaypoint )
		AddCallback_GameStateEnter( eGameState.Playing, Crafting_OnGameStatePlaying )
		AddLocalPlayerTookDamageCallback( TryCloseCraftingMenuFromDamage )
		RegisterMinimapPackages()
		AddCallback_OnPlayerMatchStateChanged( OnPlayerMatchStateChanged )
		AddCallback_ClientOnPlayerConnectionStateChanged( OnClientConnectionChanged )

		StatusEffect_RegisterEnabledCallback( eStatusEffect.interrupted, TryCloseCraftingMenuFromInterrupted )

		AddCallback_UseEntGainFocus( Crafting_OnGainFocus )
		AddCallback_UseEntLoseFocus( Crafting_OnLoseFocus )

		RegisterSignal( "CraftingWaypointCreated" )
		RegisterSignal( "HarvesterDisabled" )
		RegisterSignal( "WorkbenchUsed" )

		FlagInit( "CraftingNotificationLive", false )
	#endif

	PrecacheModel( HARVESTER_MODEL )
	PrecacheModel( WORKBENCH_MODEL )
	PrecacheModel( WORKBENCH_CLUSTER_MODEL )
	PrecacheModel( WORKBENCH_CLUSTER_AIRDROP_MODEL )


	PrecacheParticleSystem( HARVESTER_IDLE_FX )

	PrecacheParticleSystem( WORKBENCH_HOLO_FX )
	PrecacheParticleSystem( WORKBENCH_START_FX )
	PrecacheParticleSystem( WORKBENCH_BEAM_FX )
	PrecacheParticleSystem( WORKBENCH_ENGINE_SMOKE_FX )
	PrecacheParticleSystem( WORKBENCH_DOOR_OPEN_FX )
	PrecacheParticleSystem( WORKBENCH_PRINTING_FX )
}


void function Crafting_RegisterNetworking()
{
	if ( !GetCurrentPlaylistVarBool( "crafting_enabled", true ) )
		return

	file.isEnabled = true

	RegisterNetworkedVariable( "craftingMaterials", SNDC_PLAYER_GLOBAL, SNVT_BIG_INT, 0 )
	RegisterNetworkedVariable( "Crafting_NumHarvesters", SNDC_GLOBAL, SNVT_INT, 0 )
	RegisterNetworkedVariable( "Crafting_NumWorkbenches", SNDC_GLOBAL, SNVT_INT, 0 )
	RegisterNetworkedVariable( "Crafting_StartTime", SNDC_GLOBAL, SNVT_TIME, -1 )

	Remote_RegisterClientFunction( "ServerCallback_CL_MaterialsChanged", "int", -1, INT_MAX, "int", -1, INT_MAX, "string" )
	Remote_RegisterClientFunction( "ServerCallback_CL_HarvesterUsed", "entity", "entity" )
	Remote_RegisterClientFunction( "ServerCallback_CL_ArmorDeposited" )
	Remote_RegisterClientFunction( "ServerCallback_PromptNextHarvester", "entity", "entity" )
	Remote_RegisterClientFunction( "ServerCallback_PromptWorkbench", "entity", "entity" )
	Remote_RegisterClientFunction( "ServerCallback_PromptAllWorkbenches", "entity" )
	Remote_RegisterClientFunction( "ServerCallback_UpdateWorkbenchVars" )
	Remote_RegisterClientFunction( "Crafting_Workbench_OpenCraftingMenu", "entity" )
	Remote_RegisterClientFunction( "TryCloseCraftingMenu" )
	Remote_RegisterClientFunction( "MarkAllWorkbenches" )
	Remote_RegisterClientFunction( "MarkNextStepForPlayer", "entity" )

	file.isNetworkingRegistered = true
}


bool function Crafting_IsEnabled()
{
	return file.isEnabled
}


array<CraftingCategory> function Crafting_GetCraftingDataArray()
{
	return file.craftingDataArray
}


void function RegisterCraftingData()
{
	var dataTable = GetDataTable( CRAFTING_DATATABLE )
	int numRows = GetDataTableRowCount( dataTable )

	for ( int i=0; i<numRows; i++ )
	{
		CraftingCategory item
		item.index = i

		item.category = GetDataTableString( dataTable, i, GetDataTableColumnByName( dataTable, "category" ) )

		string rotationStyle = GetDataTableString( dataTable, i, GetDataTableColumnByName( dataTable, "rotationStyle" ) )
		item.rotationStyle = GetRotationStyleEnumFromString( rotationStyle )

		string exclusivityStyle = GetDataTableString( dataTable, i, GetDataTableColumnByName( dataTable, "exclusivityStyle" ) )
		item.exclusivityStyle = GetExclusivityStyleEnumFromString( exclusivityStyle )

		int numSlots = GetDataTableInt( dataTable, i, GetDataTableColumnByName( dataTable, "slots" ) )
		item.numSlots = numSlots

		string bundleString = GetDataTableString( dataTable, i, GetDataTableColumnByName( dataTable, "bundlesList" ) )
		array<string> bundles = GetTrimmedSplitString( bundleString, " " )
		foreach( bundle in bundles )
		{
			CraftingBundle newBundleStruct
			item.bundlesInCategory[bundle] <- newBundleStruct
			item.bundleStrings.append( bundle )
		}

		file.craftingData[ item.category ] <- item
		file.craftingDataArray.append( item )
	}

	printf( "CRAFTING: Data parsed and registered" )

	                                     
	foreach ( item in file.craftingDataArray )
	{
		string bundlesPlaylistCheck = GetCurrentPlaylistVarString( "crafting_dt_override_" + item.category + "_bundles", "" )
		if ( bundlesPlaylistCheck != "" )
		{
			array<string> bundles = GetTrimmedSplitString( bundlesPlaylistCheck, " " )
			foreach( bundle in bundles )
			{
				CraftingBundle newBundleStruct
				item.bundlesInCategory.clear()
				item.bundlesInCategory[bundle] <- newBundleStruct
				item.bundleStrings.clear()
				item.bundleStrings.append( bundle )
			}
		}
	}
}


void function RegisterCraftingDistribution()
{
	var distributionTable = GetDataTable( CRAFTING_CATEGORIES_DATATABLE )
	int numRows = GetDataTableRowCount( distributionTable )

	foreach ( category in file.craftingDataArray )
	{
		printf( "CRAFTING: Getting datatable for category " + category.category )
		foreach ( name, bundle in category.bundlesInCategory )
		{
			int startingRow = GetDataTableRowMatchingStringValue( distributionTable, GetDataTableColumnByName( distributionTable, "bundle" ), name )
			string bundlePlaylistCheck = GetCurrentPlaylistVarString( "crafting_dt_override_bundle_" + name, "" )

			if ( bundlePlaylistCheck != "" )
			{
				array<string> itemsInBundle = GetTrimmedSplitString( bundlePlaylistCheck, " " )
				Assert( itemsInBundle.len() == category.numSlots, "CRAFTING: Playlist override for bundle " + name + " in category " + category.category + " does not match expected number of slots: " + category.numSlots )

				foreach( item in itemsInBundle )
				{
					array<string> result = GetTrimmedSplitString( item, ":" )
					string itemRef = result[0]
					int cost = int(result[1])

					bundle.itemsInBundle.append( itemRef )
					category.itemToCostTable[itemRef] <- cost
				}
				continue
			}

			if ( startingRow == -1 )
				continue

			int currentRow = startingRow
			while ( ( currentRow < numRows && GetDataTableString( distributionTable, currentRow, GetDataTableColumnByName( distributionTable, "bundle" ) ) == "" ) || currentRow == startingRow )
			{
				string item = GetDataTableString( distributionTable, currentRow, GetDataTableColumnByName( distributionTable, "base" ) )
				int cost = GetDataTableInt( distributionTable, currentRow, GetDataTableColumnByName( distributionTable, "base_item_cost" ) )

				bundle.itemsInBundle.append( item )
				category.itemToCostTable[item] <-cost

				currentRow++
			}
		}
	}
}


void function HandleCraftingExclusivity()
{
	if ( !GetCurrentPlaylistVarBool( "crafting_enabled", true ) )
		return



	for( int i = 0; i< file.craftingDataArray.len(); i++ )
	{
		CraftingCategory  group = file.craftingDataArray[i]

		array<string> itemsToDisable

		if ( group.exclusivityStyle == eCraftingExclusivityStyle.RARITY )
		{
			array< string > validItems = GenerateCraftingItemsInCategory( null, group )
			foreach( item in validItems )
			{
				itemsToDisable.append( item )
			}
		}
		else if ( group.exclusivityStyle == eCraftingExclusivityStyle.NONE )
		{
			            
		}

		foreach( item in itemsToDisable )
		{
			if ( item.find( "mp_weapon" ) != -1 )
				                                         
				SURVIVAL_Loot_AddDisabledRef( item )
			else
				                                                                                                                                                       
				file.disabledGroundLoot.append( item )
		}
	}
}


int function GetRotationStyleEnumFromString( string input )
{
	int rotationStyle
	bool rotationStyleFound = false

	for ( int i = 0; i < eCraftingRotationStyle.COUNT_; i++ )
	{
		string enumStyle = GetEnumString( "eCraftingRotationStyle", i )
		if ( enumStyle.tolower() == input )
		{
			rotationStyle = i
			rotationStyleFound = true
			break
		}
	}

	Assert( rotationStyleFound, "Playlist Crafting Rotation Pattern '" + input + "' is not a specified enumerator." )

	return rotationStyle
}


int function GetExclusivityStyleEnumFromString( string input )
{
	int exclusivityStyle
	bool exclusivityStyleFound = false

	for ( int i = 0; i < eCraftingExclusivityStyle.COUNT_; i++ )
	{
		string enumStyle = GetEnumString( "eCraftingExclusivityStyle", i )
		if ( enumStyle.tolower() == input )
		{
			exclusivityStyle = i
			exclusivityStyleFound = true
			break
		}
	}

	Assert( exclusivityStyleFound, "Playlist Crafting Exclusivity Style '" + input + "' is not a specified enumerator." )

	return exclusivityStyle
}


void function Crafting_OnGameStatePlaying()
{
	#if SERVER
		                                                        
		                                                                                 
		 
			                             
		 
		                                                                                    
		 
			                                  
		 
		                                                                                           
		 
			                                 
		 
		                                                                                        
		 
			                                  
			                             
		 

		                                           
		 
			                                             
				                              
		 


		                         
		                   
		                                           
		 
			                                       
		 
	#endif

	file.timeAtMatchStart = GetUnixTimestamp()
}


#if SERVER
                                            
 
	                      
	                                                                                                                                      
	                                      

	                                                        
	 
		                                                               
		                                         
		 
			                      
			                                
			     
		 
	 

	                                                                                                                                     

	                         
 

                                           
 
	                                     
		      

	                               
	                                   
	                                      
	                                               

	                                                                               
		                                                                         

	                                        
	 
		                                                      
		                                    
		 
			                                                     
			 
				             
				                                                         
				 
					                                                                                                          
					 
						       
					 
				 
				                                           
				 
					                                                      
					                               
					   
					     
				 
				    
				 
					                                                         
					                               
					   
				 
			 
		 

		                                                 
		                             
		 
			                                                      
			 
				                                                           
			 
		 
	 
	    
	 
		                                                        
		                                                 
		                           
	 

	                            
	                                                     
	 
		                                
		                               
		   
	 

	                                                          
	 
		                                                                     
		 
			                                     
			                                    
			   
		 
	 

	                           
	                                                 

	                                                                      
 


                                                                    
 
	                                            
		      

	                                      
	                                 
	                                    
	            

	                                                                             
		                                                                       

	                                               
	 
		                                                           
		                                    
		 
			                                                            
			 
				             
				                                                     
				 
					                                                                                                               
					 
						       
					 
				 
				                                         
				 
					                                                           
					                                      
					   
					     
				 
				    
				 
					                                                              
					                                      
					   
				 
			 
		 

		                                               
		                             
		 
			                                                      
			 
				                                                       
			 
		 
	 
	    
	 
		                                                        
		                                                      
		                                  
	 

	                            
	                                                            
	 
		                                                                                                                     
		   
	 

	                                                        
	 
		                                                                 
		 
			                                                                                                             
			   
		 
	 

	                                  
	                                                      

	                                                             
	                        
	                             
	 
		                         
		                       
			              
		                     
			        

		                                                  
		                                   
		 
			                      
			                                            
			 
				                                                  
					                
			 

			                          
			 
				                                                                          
				            
				                                        
			 

			                      
				     
		 

		                              
	 

	                                                                      
	                                                                              
 

                                                                                                                             
 
	                                                        

	                                
	 
		                                                  
		 
			                            
			                                                                                    
			 
				                                       
				                                    
			 
			             
		 

		                                                                          
		 
			                            
			                                            
			             
		 
	 

	                        
	                 
 

                                                                                             
 
	                        
		      

	                                                              
	                          
	                        

	                                
	 
		                                                                                     
		 
			                            
			                                            
			             
			                  
		 
	 
 


                                 
 
	                                                
	 
		                                            
		                                 
		                                                        
		                   
		                                
		 
			                                                  
			 
				                                  
				             
			 
		 

		                                                   

		                            
		                                                                              
		                                
		 
			                                                                  
			                                                                                          
			                                                                                                                          
				                 
		 

		                                                                                          
		                                                                                 

		                     
		                                                                                    
		                                                                         
		                                          
		                                                   
		                                         
		                                                                              
		                               
		                                           
	 
 


                                       
 
	                                                          
	                                                                              
	                                                                           
	                                        
	                                    

	                                             
 

                                                            
 
	                                              
	                                                      
	                                                                                                                                   

	                                        
	                                                                   
	                                                                

	                                          
		                                                                             
 

                                                                        
 
	                                      
	 
		                                                            

		                                       
		 
			                                                                     
			                                   
			                                              
			 
				                                                    
				 
					                                                      
					 
						                                       
							                                               
					 
				 
			 

			                                          
				                                                               

			                                                 
			                                          
		 
	 

	                                          
		                                                                             
 

                                                       
 
	                              
 
#endif


int function GetLimitedStockFromWorkbench( entity workbench )
{
	if ( !IsLimitedStockWorkbench( workbench ) )
	{
		return 0
	}

	return workbench.GetShieldHealth()
}

bool function IsLimitedStockWorkbench( entity workbench )
{
	if ( !IsValid( file.limitedStockParent ) || !IsValid( workbench ) )
		return false

	                                                                           
	return false
}


string function LimitedStock_TextOverride( entity workbench )
{
	entity cluster
	foreach ( ent in workbench.GetLinkParentArray() )
	{
		if ( ent.GetScriptName() == WORKBENCH_CLUSTER_SCRIPTNAME )
		{
			cluster = ent
			break
		}
	}

	bool isWorkbenchBusy = workbench.GetLinkEntArray().len() != 0
	bool isWorkbenchCrafting = workbench.GetOwner() != null
	if ( isWorkbenchBusy || isWorkbenchCrafting || workbench.e.isBusy )
		return "#CRAFTING_WORKBENCH_USE_PROMPT_UNAVAILABLE"

	if ( GetLimitedStockFromWorkbench( cluster ) <= 0 )
		return "#CRAFTING_WORKBENCH_USE_PROMPT_INVALID"

	return "#CRAFTING_WORKBENCH_USE_PROMPT"
}


#if CLIENT
void function OnLimitedStockParentCreated( entity target )
{
	if ( !file.isEnabled )
		return

	if ( target.GetScriptName() != WORKBENCH_RANDOMIZATION_TARGET_SCRIPTNAME )
		return

	file.limitedStockParent = target
}


string function Crafting_GetWorkbenchTitleString()
{
	entity workbench = GetLocalClientPlayerWorkbench()
	if ( IsLimitedStockWorkbench( workbench ) )
		return Localize("#CRAFTING_WORKBENCH_LIMITED")
	else
		return Localize("#CRAFTING_WORKBENCH")
	unreachable
}


string function Crafting_GetWorkbenchDescString()
{
	entity workbench = GetLocalClientPlayerWorkbench()
	if ( IsLimitedStockWorkbench( workbench ) )
		return GetLimitedStockFromWorkbench( workbench ) <=1 ? Localize("#CRAFTING_LIMITED_USE_BENCH_SINGULAR", GetLimitedStockFromWorkbench( workbench )) : Localize("#CRAFTING_LIMITED_USE_BENCH", GetLimitedStockFromWorkbench( workbench ))
	else
		return Localize("#CRAFTING_WORKBENCH_DESC")
	unreachable
}


entity function GetLocalClientPlayerWorkbench()
{
	entity player = GetLocalClientPlayer()
	entity workbench
	array<entity> possibleWorkbenches = player.GetLinkParentArray()
	foreach( ent in possibleWorkbenches )
	{
		if ( ent.GetScriptName() == WORKBENCH_SCRIPTNAME )
		{
			foreach ( cluster in ent.GetLinkParentArray() )
			{
				if ( cluster.GetScriptName() == WORKBENCH_CLUSTER_SCRIPTNAME )
				{
					workbench = cluster
					break
				}
			}

			if ( workbench != null )
				break
		}
	}

	return workbench
}


void function RegisterMinimapPackages()
{
	RegisterMinimapPackage( "prop_script", eMinimapObject_prop_script.CRAFTING_HARVESTER, MINIMAP_OBJECT_RUI, MinimapPackage_Crafting_Harvester, FULLMAP_OBJECT_RUI, FullmapPackage_Crafting_Harvester )
	RegisterMinimapPackage( "prop_script", eMinimapObject_prop_script.CRAFTING_WORKBENCH, MINIMAP_OBJECT_RUI, MapPackage_Crafting_Workbench, FULLMAP_OBJECT_RUI, MapPackage_Crafting_Workbench )
	RegisterMinimapPackage( "prop_script", eMinimapObject_prop_script.CRAFTING_WORKBENCH_LIMITED, MINIMAP_OBJECT_RUI, MapPackage_Crafting_WorkbenchLimited, FULLMAP_OBJECT_RUI, MapPackage_Crafting_WorkbenchLimited )
}


void function FullmapPackage_Crafting_Harvester( entity ent, var rui )
{
	RuiSetImage( rui, "defaultIcon", HARVESTER_ICON_ASSET )
	RuiSetImage( rui, "clampedDefaultIcon", $"" )
	RuiSetBool( rui, "useTeamColor", false )

	RuiSetImage( rui, "smallIcon", CRAFTING_SMALL_HARVESTER_ASSET )
	RuiSetBool( rui, "hasSmallIcon", true )

	file.harvesterFullmapRuiTable[ent] <- rui
}

void function MinimapPackage_Crafting_Harvester( entity ent, var rui )
{
	RuiSetImage( rui, "defaultIcon", HARVESTER_ICON_ASSET )
	RuiSetImage( rui, "clampedDefaultIcon", $"" )
	RuiSetBool( rui, "useTeamColor", false )

	RuiSetImage( rui, "smallIcon", CRAFTING_SMALL_HARVESTER_ASSET )
	RuiSetBool( rui, "hasSmallIcon", true )

	file.harvesterMinimapRuiTable[ent] <- rui
}

void function MapPackage_Crafting_Workbench( entity ent, var rui )
{
	bool isAirdrop = ent.GetTargetName() == "craftingWorkbenchAirdropIcon"

	RuiSetImage( rui, "defaultIcon", isAirdrop ? WORKBENCH_ICON_AIRDROP_ASSET : WORKBENCH_ICON_ASSET )
	RuiSetImage( rui, "clampedDefaultIcon", $"" )
	RuiSetBool( rui, "useTeamColor", false )

	if ( !isAirdrop )
	{
		RuiSetImage( rui, "smallIcon", CRAFTING_SMALL_WORKBENCH_ASSET )
		RuiSetBool( rui, "hasSmallIcon", true )
	}
}

void function MapPackage_Crafting_WorkbenchLimited( entity ent, var rui )
{
	RuiSetImage( rui, "defaultIcon", WORKBENCH_ICON_LIMITED_ASSET )
	RuiSetImage( rui, "clampedDefaultIcon", $"" )
	RuiSetBool( rui, "useTeamColor", false )
}

void function TryCloseCraftingMenuFromDamage( float damage, vector damageOrigin, int damageType, int damageSourceId, entity attacker )
{
	if ( GetConVarBool( "player_setting_damage_closes_deathbox_menu" ) )
		TryCloseCraftingMenu()
}

void function TryCloseCraftingMenuFromInterrupted( entity player, int statusEffect, bool actuallyChanged )
{
	if ( player != GetLocalViewPlayer() || (GetLocalViewPlayer() == GetLocalClientPlayer() && !actuallyChanged) )
		return

	if ( GetCurrentPlaylistVarBool( "interrupted_closes_crafting_menu", true ) )
		TryCloseCraftingMenu()
}
#endif






                           
#if SERVER
                                          
 
	                                                                      
	                                                                       
	                                                             
 

                                                          
 
	                               
	                               
	                                           
	                                                    
	                            

	             

	                      
		      

	                                                                                          
	                                               
	                                 

	                          
	                                  

	                        
		                           
	                              
		                           

	                     
		                          
 

                                                       
 
	                                                     
		      

	                      
	 
		                
		      
	 

	                  
	                                            
	                                                                        
	                                                                        
	             

	                                    

	                                                                                       
	                                 
	                                                                                  
	                                      
	                              
	                                          
	                                                    
	                                                      
	                                                
	                               

	                                          
 
#endif

#if CLIENT
void function OnHarvesterCreated( entity target )
{
	if ( !file.isEnabled )
	{
		return
	}

	if ( target.GetScriptName() != "crafting_harvester" )
		return

	AddCallback_OnUseEntity_ClientServer( target, HarvestCraftingMaterials )
	SetCallback_CanUseEntityCallback( target, Crafting_Harvester_IsNotBusy )
	AddEntityCallback_GetUseEntOverrideText( target, Crafting_Harvester_UseTextOverride )

	                                   
	vector origin = target.GetOrigin()
	vector angles = target.GetAngles()
	entity fakeHarvester = CreatePropDynamic( HARVESTER_MODEL, origin, angles)
	fakeHarvester.SetFadeDistance( 15000 )
	fakeHarvester.SetForceVisibleInPhaseShift( true )

	file.harvesterToClientProxy[target] <- fakeHarvester
	fakeHarvester.Anim_Play( HARVESTER_FULL_IDLE_ANIM )

	thread PlayHarvesterIdleFX( fakeHarvester )

	CreateHarvesterWorldIcon( target )

	entity ambGen = CreateClientSideAmbientGeneric( target.GetOrigin(), HARVESTER_AMBIENT_LOOP, 3000 )
	ambGen.SetEnabled( true )
	ambGen.SetParent( target )
	ambGen.SetLocalOrigin( <0, 0, 60> )

	file.ambGenericTable[target] <- ambGen
}

void function OnHarvesterDestroyed( entity target )
{

	if ( !( target in file.harvesterRuiTable ) )
		return

	RuiDestroy( file.harvesterRuiTable[target] )
	delete file.harvesterRuiTable[target]

	if (( target in file.harvesterToClientProxy ) && IsValid( file.harvesterToClientProxy[target] ) )
	{
		file.harvesterToClientProxy[target].Destroy()
		delete file.harvesterToClientProxy[target]
	}

	if (( target in file.ambGenericTable ) && IsValid( file.ambGenericTable[target] ))
	{
		file.ambGenericTable[target].Destroy()
		delete file.ambGenericTable[target]
	}
}

void function PlayHarvesterIdleFX( entity harvester )
{
	harvester.EndSignal( "OnDestroy" )
	harvester.EndSignal( "HarvesterDisabled" )

	                                        

	int attachId = harvester.LookupAttachment( "FX_INSIDE" )
	int idleFx = StartParticleEffectOnEntity( harvester, GetParticleSystemIndex( HARVESTER_IDLE_FX ), FX_PATTACH_POINT_FOLLOW, attachId )

	OnThreadEnd(
		function() : ( idleFx )
		{
			if ( IsValid( idleFx ) )
			{
				                                      
				EffectStop( idleFx, false, true )
			}
		}
	)

	WaitForever()
}

string function Crafting_Harvester_UseTextOverride( entity ent )
{
	entity player = GetLocalViewPlayer()

	CustomUsePrompt_Show( ent )
	CustomUsePrompt_SetSourcePos( ent.GetOrigin() + < 0, 0, 30 > )

	CustomUsePrompt_SetAdditionalText( "%ping% " + Localize( "#COMMS_PING" ) )
	CustomUsePrompt_SetText( Localize("#CRAFTING_HARVESTER_USE_PROMPT") )
	CustomUsePrompt_SetLineColor( GetCraftingColor() )
	CustomUsePrompt_SetHintImage( CRAFTING_CURRENCY_ASSET )
	CustomUsePrompt_SetShouldCenterImage( true )

	if ( PlayerIsInADS( player ) )
		CustomUsePrompt_ShowSourcePos( false )
	else
		CustomUsePrompt_ShowSourcePos( true )

	return ""
}
#endif


                                   
void function HarvestCraftingMaterials( entity harvester, entity player, int pickupFlags )
{
	#if SERVER
		                                              

		                                                                    
		                             
		                                                                 

		                                                                        
		                                                                          
		                                                                                                                      

		                                                                        
		                                                   
	#endif

	#if CLIENT
		file.ambGenericTable[harvester].SetEnabled( false )
		thread HarvesterAnimThread( file.harvesterToClientProxy[harvester] )
		thread PROTO_FadeModelIntensityOverTime( file.harvesterToClientProxy[harvester], 1, 1, 0.1 )
		Signal( file.harvesterToClientProxy[harvester], "HarvesterDisabled" )
		Signal( harvester, "HarvesterDisabled" )
	#endif
}

void function OnClientConnectionChanged( entity player )
{
	#if CLIENT
	if ( player != GetLocalClientPlayer() )
		return

	if ( !IsConnected() )
		return

	foreach ( ent in GetLocalClientPlayer().GetLinkParentArray() )
	{
		if ( ent.GetScriptName() != HARVESTER_SCRIPTNAME )
			continue

		                                                         
		HarvestCraftingMaterials( ent, GetLocalClientPlayer(), 0 )
	}
	#endif

	#if SERVER
		                                              
		 
			                                                  
				        

			                                                         
			                                                                                                          
		 
	#endif
}

#if CLIENT
void function HarvesterAnimThread( entity harvesterProxy )
{
	harvesterProxy.Anim_Stop()
	harvesterProxy.Anim_Play( HARVESTER_FULL_TO_EMPTY_ANIM )

	wait 2

	if ( IsValid( harvesterProxy ) )
	{
		harvesterProxy.Anim_Stop()
	}
}
#endif

#if SERVER
                                                                               
 
	                       
	                                            
	                        
	 
		                                                                                               
		      
	 

	                                                                           
	                           
	                                                            
	 
		                                         
			        

		                                                                
			        

		                                                                
			        

		                                 
		     
	 

	                                                           
	                            
	 
		                                               
		                                                                                                    
		      
	 

	                                                                                                              
	                                           
	                                                                                            
 

                                                                      
 
	                                           
	 
		                                             
	 
	    
	 
		                                              
	 
 

                                                                                        
 
	                      
	                                           
		                                             

	                       
	 
		                                                                          
	 
	    
	 
		                                                       
	 
 

                                                                                     
 
	                                                             
 

                                                      
 
	                                            
		                                      
 

                                                           
 
	                                                    
		                                    
 

                                                     
 
	                               
		      

	                                                    
	 
		                                                        
			                                 
	 
 

                                                 
 
	                                                          
 
#endif

bool function Crafting_Harvester_IsNotBusy( entity player, entity ent, int useFlags )
{
	if ( Bleedout_IsBleedingOut( player ) )
		return false

	if ( player.ContextAction_IsActive() )
		return false

	if ( !SURVIVAL_PlayerAllowedToPickup( player ) )
		return false

	                                                          
	bool harvesterFound = false
	foreach( linkedEnt in player.GetLinkParentArray() )
	{
		if ( linkedEnt.GetScriptName() == "crafting_harvester" && linkedEnt == ent )
			harvesterFound = true
	}

	if ( harvesterFound )
		return false

	return true
}

#if CLIENT
void function ServerCallback_CL_HarvesterUsed( entity harvester, entity minimapObj )
{
	if ( file.harvesterRuiTable[harvester] != null )
	{
		RuiDestroyIfAlive( file.harvesterRuiTable[harvester] )
		delete file.harvesterRuiTable[harvester]
	}
	                                                                   
	RuiSetFloat3( file.harvesterFullmapRuiTable[minimapObj], "iconColor", <0,0,0> )
	RuiSetFloat3( file.harvesterMinimapRuiTable[minimapObj], "iconColor", <0,0,0> )
}

void function ServerCallback_CL_MaterialsChanged( int amount, int difference, string headerText )
{
	if ( file.fullmapRui.len() != 0 && file.fullmapRui[0] != null )
		RuiSetInt( file.fullmapRui[0], "craftingMaterials", amount )

	string header
	string milesAlias
	if (headerText != ""){
		header = Localize(headerText).toupper() + "\n"
		if (headerText.find("CAMP_REWARD") >= 0)
			milesAlias = "UI_TropicsAI_AreaCompletionStinger"
	}

	if ( difference > 0 )
		AnnouncementMessageRight( GetLocalClientPlayer(), header + Localize( "#CRAFTING_HARVESTER_AWARD", difference ), "", <214,214,214>, $"", 2, milesAlias )
	else
		AnnouncementMessageRight( GetLocalClientPlayer(), header + Localize( "#CRAFTING_HARVESTER_BALANCE_UPDATE", amount ), "", <214,214,214>, $"", 2, milesAlias )
}

void function ServerCallback_CL_ArmorDeposited()
{
	thread CLArmorDepositThread()
}

void function CLArmorDepositThread()
{
	GetLocalClientPlayer().EndSignal( "OnDeath" )
	GetLocalClientPlayer().EndSignal( "OnDestroy" )

	wait 3.0
	AnnouncementMessageRight( GetLocalClientPlayer(), Localize( "#CRAFTING_WORKBENCH_ARMOR_DEPOSIT" ), "", <214,214,214>, $"", 3, "Crafting_MaterialsGathered_1P" )
}

void function CreateHarvesterWorldIcon( entity harvester )
{
	entity localViewPlayer = GetLocalViewPlayer()
	vector pos             = harvester.GetOrigin() + (harvester.GetUpVector() * 50)
	var rui                = CreateCockpitRui( $"ui/survey_beacon_marker_icon.rpak", RuiCalculateDistanceSortKey( localViewPlayer.EyePosition(), pos ) )
	RuiSetImage( rui, "beaconImage", CRAFTING_CURRENCY_ASSET )
	RuiSetGameTime( rui, "startTime", Time() )
	RuiSetFloat3( rui, "pos", pos )
	RuiSetFloat( rui, "sizeMin", 24 )
	RuiSetFloat( rui, "sizeMax", 40 )
	RuiSetFloat( rui, "minAlphaDist", 1000 )
	RuiSetFloat( rui, "maxAlphaDist", 3000 )
	RuiSetBool( rui, "shouldHideNearCrosshairs", true )
	RuiKeepSortKeyUpdated( rui, true, "pos" )
	file.harvesterRuiTable[harvester] <- rui
}
#endif





                               
#if SERVER
                                                                                                                                                                                       
 
	                              
		                                                                
 

                           
                                                                          
 
	                                                  

	                                           
	 
		                                                                         
			                                                                             
	 
 

                                                                                                                                                       
 
	                

	                                       

	                                            
	 
		                              
			                                     
	 

	                                      
		      

	                                                                  
	                                                 
	 
		                                                                                 
	 
 
      

                                                                                                
 
	                                                                
	                                                                    

	                                                                                                                        

	                                                                                             
		      

	                                                      

 

                                                                            
                                                                             
 
	                                                                
	                                        

	                       
		                

	                                                           

	                                                                                                   
 
#endif

int function Crafting_GetPlayerCraftingMaterials( entity player )
{
	return player.GetPlayerNetInt( "craftingMaterials" )
}

#if SERVER || CLIENT
bool function Crafting_IsPlayerAtWorkbench( entity player )
{
	foreach( ent in player.GetLinkParentArray() )
	{
		if ( ent.GetScriptName() == WORKBENCH_SCRIPTNAME )
			return true
	}

	return false
}
#endif





                                
#if SERVER
                                                          
 
	                               
	                               
	                                           
	                            

	             

	                      
		      

	                                                                                                          
	                                                               
	                                         

	                                                                                                

	                         
	                                  
	                              
	 
		                                                                                                                                              
		                                               
		                                 
		                                                        
		                                      

		                                  
		                               

		                       
		                               
		                                     
		            
		 
			       
				                             
				                                   
				     
			       
				                             
				                                   
				     
			       
				                             
				                                   
				     
		 

		                                                 
		                          

		                                               
		                                 
	 

	                                                                    

	                                   
		                                        

	                        
		                                   

	                     
	 
		                                  
		                                
			                      
	 

	                                  
	                                          

	                                                   
	                                                 

	                                     
	                        
	                               
	 
		                                                                                          
		                                                                                                                   
		                                                                                                             
		                                                                                                                        
		                                                                                
		                                  
		                                  

		                  
	 

	                                                         
 

                                                              
 
	                                                             
		      

	                      
	 
		                                          
		 
			                           
			             
		 

		                
		      
	 

	                                                 
	                                      
	                                             
	                         
	                          
	                                   
	                       

	                                      

	                            
	                                                                                       
	                                                                                                                                                                            
	                                      
	                              
	                                          
	                                                                                                                                                
	                                                      
	                                                
	                               

	                                          

	                                          
	 
		                               
	 

	                                           

	                                                        
 

                                                       
 
	                                                     
		      

	                  
	                                            
	                                                  
	                                      
	                                     
	                                                                    
	                                                                        

	                                    
 

                                                                 
 
	                                              

	                                             
	 
		                                                   
			                              
		                                           
	 

	                                             
	 
		                                 
		                                           
		 
			                       
			 
				                               
				                           
				     
			 
		 

		                           
			     
	 

	                                                            
	                                                         
 

                                                         
 
	                                  

	                                        

	                                                       
	                                                                                                                                                                                             

	            
		                       
		 
			                        
			 
				                                      
				                    
			 
		 
	 

	             
 

                                                       
 
	                                                                                                                                                                     
	                                                                                                                                                                     
	                                                                                                                                                                     
 

                                              
 
	                                                                             
		      

	                                       

	                                          
	                                                                                                

	                     
	                                                                        
	                                  

	                                  
	 
		                                                          
		                                                      

		                                                                                                        
	 

	                                                         
		                                                                

	                               

	              
	 
		                                          

		                                                                 
		 
			                                                       
			                                                  

			                                            
				        

			         
			                                                                                          

                                 
                                                                                                                                                
                                                                                                       
                                                                               
                                                                                    
                                       

			                                                             
			                                                                          
			                 

			                                             
			                                              

			                                   
			 
				                                                     
				                                       
				                                                                                             
				                                                     
				                                                               

				                                     
				                           
					                                                        


				                          
				                                                
				                                                     

				                                                                                                                                       
				                                                                               
					                                                       

				                                                                                                             

				                                                             

				                                                                   
				                                                       

				                        
			 

			                                                                            

			                                     
		        
			        
			                                     
		 
	 
 

                                                              
 
	                                                           
	                                                                                                        
	                                                
	                            
	                            
	                                                                
	                                        
	                        

	                             
	                                                 
	                                      

	                                

	                
	               
	                          

	                                                                                                                   
	                                        
	                                                                                           

	                                             

	            
		                            
		 
			                                                                                          
			                                                                    
		 
	 

	                  
		                                                                       

	                                                                                   
	                                                                    
	                                                            

	                               
	                                                                                                                                            
	                                                               
	                                         
	                                                                         

	                                                                                                

	                         
	                                  
	                              
	 
		                                                                                                                                              
		                                               
		                                 
		                                                        
		                                      

		                                  
		                               

		                       
		                               
		            
		 
			       
				                             
				                                   
				     
			       
				                             
				                                   
				     
			       
				                             
				                                   
				     
		 

		                                                 
		                          

		                                               
		                                 
	 

	                                                                    

	                                   
		                                        


	                                                 
	                                          
	                                  
	                                                  

	                                     
	                        
	                               
	 
		                                                                                          
		                                                                                                                   
		                                                                                                            
		                                                                                                                        
		                                                                                
		                                  
		                                  
		                  
	 

	                                                   
	                                                 

	                 
 

                                                                
 
	                                                                 
 


                                                                            
 
	                                          
	                                                                        
	 
		                                                                            
		                                            
	 
 


                                                         
                                                                   
 
	                                                                                   
	                                                                                  
	                                               
	                                             
	                      
 	                                                          
 	                                                         

	                                          
	 
		                                    
		                                                           
		                                                                          
	 	                                                

	 
	                                         
	 
		                                    
		                                                        
		                                                                       
	 	                                               
	 

 

#endif

#if CLIENT
void function OnWorkbenchClusterCreated( entity target )
{
	if ( !file.isEnabled )
	{
		return
	}

	if ( target.GetScriptName() != WORKBENCH_CLUSTER_SCRIPTNAME )
		return

	foreach( ent in target.GetLinkEntArray() )
	{
		OnWorkbenchCreated( ent, target )

		if ( ent.GetScriptName() == WORKBENCH_SCRIPTNAME && IsLimitedStockWorkbench( target ) )
			AddEntityCallback_GetUseEntOverrideText( ent, LimitedStock_TextOverride )
		else if ( ent.GetScriptName() == WORKBENCH_SCRIPTNAME )
			AddEntityCallback_GetUseEntOverrideText( ent, Crafting_Workbench_UseTextOverride )
	}

	                                                                       
	file.workbenchClusterArray.append( target )
}

void function OnWorkbenchCreated( entity target, entity cluster )
{
	if ( target.GetScriptName() != WORKBENCH_SCRIPTNAME )
		return

	AddCallback_OnUseEntity_ClientServer( target, UseCraftingWorkbench )
	SetCallback_CanUseEntityCallback( target, Crafting_Workbench_IsNotBusy )
}

                                                      
 
	                                

	             
	              
	 
		           

		                                    
		                                                                
		                              
		 
			               

			                                           
				                                                                       
		 
		                                   
		 
			                

			                                                
			 
				                              
				 
					                           
					                        
				 
			 

			                                   
		 
	 

	           
 

                                                                           
 
	                      
	                                                
		             

	                                                                             
	                    
	                                 
	 
		         
			                                            
			     
		         
			                                            
			     
		         
			                                            
			     
	 
	                                                                                             
	                                                                              
	                                                                 
	                                                                                     

	                   
	             
 

                                                   
 
	                                            
		      

	                                            
	                                     
   

string function Crafting_Workbench_UseTextOverride( entity ent )
{
	entity player = GetLocalViewPlayer()

	CustomUsePrompt_Show( ent )
	CustomUsePrompt_SetSourcePos( ent.GetOrigin() + ( ent.GetScriptName() == HARVESTER_SCRIPTNAME ? < 0, 0, 30 > : <0,0,-20> ) )

	CustomUsePrompt_SetText( Localize("#CRAFTING_WORKBENCH_USE_PROMPT") )
	CustomUsePrompt_SetLineColor( GetCraftingColor() )

	if ( PlayerIsInADS( player ) )
		CustomUsePrompt_ShowSourcePos( false )
	else
		CustomUsePrompt_ShowSourcePos( true )

	return ""
}
#endif



void function UseCraftingWorkbench( entity bench, entity player, int pickupFlags )
{
	#if CLIENT
		CustomUsePrompt_SetLastUsedTime( Time() )
	#endif

	if ( pickupFlags & USE_INPUT_LONG )
	{
		entity cluster
		foreach ( ent in bench.GetLinkParentArray() )
		{
			if ( ent.GetScriptName() == WORKBENCH_CLUSTER_SCRIPTNAME )
			{
				cluster = ent
				break
			}
		}

		                   
		if ( IsLimitedStockWorkbench( cluster ) && GetLimitedStockFromWorkbench( cluster ) <= 0 )
			return

		thread WorkbenchThink( bench, player )

		#if CLIENT
			cluster.Signal("WorkbenchUsed")
		#endif
	}
}

void function WorkbenchThink( entity ent, entity playerUser )
{
	ExtendedUseSettings settings = WorkbenchExtendedUseSettings( ent, playerUser )

	ent.EndSignal( "OnDestroy" )
	playerUser.EndSignal( "StartPhaseShift" )

	waitthread ExtendedUse( ent, playerUser, settings )
}

ExtendedUseSettings function WorkbenchExtendedUseSettings( entity ent, entity playerUser )
{
	ExtendedUseSettings settings
	settings.duration = 0.3
	#if CLIENT
	settings.loopSound = "UI_Survival_PickupTicker"
	settings.displayRui = $"ui/extended_use_hint.rpak"
	settings.displayRuiFunc = DefaultExtendedUseRui
	settings.icon = $""
	settings.hint = "#PROMPT_OPEN"
	#elseif SERVER
	                                                   
	                                                   
	#endif

	return settings
}

#if SERVER
                                                                                                       
 
	                                                         
	                                                   
	                                             
		      

	                                                
		      

	                              
		      

	                                   
		      

	                         

	              
	                                             
	 
		                                                          
		 
			             
			     
		 
	 

	                               
	                                                   
 

                                                                                                       
 
	                                                 
		                             
 

                                                                               
 
	                                          
	                                                                                   
 

                                                               
 
	                               
		                                                                                                                
 

                                                    
                                                                                                   
 
	                                                 
	                                                
	                             
	                                           
	                                 

	                  
	                                                 

	                                    
	                            

	            
		                                           
		 
			                                    
				                                

			                                                 
				      

			                                                                         
				      

			                                                            
			                                                         

			                              
			 
				                                                   
					                              
				                             
				                                                                                                                                                               
				                                                                                    
				                    

				                                                                       

				          
					                                                 
					 
						                                         
						                       
						                       
					 
				      
			 

			                                         
		 
	 

	                                       
		                              
	    
		      

	                     
	                                                                
		                  

	                                        
	                                 
	                                                                                                    
	                                                                                                       
	                                                                                                    
	                                                                                                       
	                                
	                       
		                                                   

	                                                         
	                                                      

	                                 
	 
		                                                                                                   
		      
	 

	                                                                                                                                        
	                                                                        
	                                                       
	                                                       

	                                     

	                                                  

	                                        
 

                                                
 
	                            
	                                  
	                                 
	                                    
	                                   
 

                                                                      
 
	                                                                                       

	                                                                      

	                                                                                                                        

	                                                                             
 

                                                                                              
 
	                       
	                                             
	 
		                                                  
		 
			               
			     
		 
	 

	                        
	 
		                                                                                                                
		      
	 

	                                                                               
	                                                                                 

	                                                                                               
 

                                                                                                       
 
	              
	                                                 
	 
		                                                          
		 
			             
			     
		 
	 

	                                                               

	                   
		      

	                               

	                                       

	                          
	                                                                             
	        
	                 
	                            
	 
		                             
		 
			                                 
		 

		                                  
	 

	                                                                      
	                
	 
		                                                           
		                                                                       
	 
	                                                  
	                                                                       

	                    
	                          
	                             
	 
		                          
		                                                                                 
		                                                               
		                                                                              
		                                                                                           

		                                                                           
	 

	                                           
		                                                   

	                                                                       

	                                   
	                                                                 
	 
		                                                                                                                                          
		                           
		 
			                             
			     
		 
	 

	                              
		                                                     

	                                      
	                                                          

	                                                                                 
	                         
	                               
	 
		                             
		 
			                                 
			                                                                                                 
			                                                    
			                                         
			 
				               
				                
					               

				                
					     

				                                                                                       
				                                         
			 
			                            
		        
			                                                               
			                                 
		 
	 

	                                                                             
	                                                              
	                                                                     
	                                                             

	                                                                                                                                                                                           

	                                              
	                        

	                 
	                                                                 
	      

	                                     

	                          
	            

	                                                           
	                                                           

	                                                         

	                                                                        
	                                        
	                                                           

	                              
	                                                                 
	 
		                           
		 
			                             
			     
		 
	 

	                              
		                                                     

	                                                           

	                                             
	                          
	                             
	 
		                                          
		                                      
		                                                                                                 
		                                                  
		                                                                             
		                                            
		 
			                         
			                                                              
			                     
			 
				                                         
				               
			 
			    
			 
				                                                         
				                                                                                        
			 
			                                                               
		 
		                                

		                    
		                                  
	 

	                                                                                                                      
	                                  
	 
			                             
			 
				                                                                 
			 

		                               

		                                         
		 
			                                                                            
		 
	 

	                                       
	                                               
	                                                           
 

                                                                        
 
	                                                                                 
	                                                                                                                             

	                                                                                 
	                                                         

	                                                                   
	                                                                               
 

                                                                                                                                                        
 
	                            
	                  
	                                        
	 
		                                       
		 
			                                     
			                                       
			 
				                        
				 
					                      
					     
				 
			 
		 

		                      
			     
	 

	                       
		      

	              
	                                                      
	 
		                                                          
		 
			             
			     
		 
	 

	                                     
	 
		                                            
		                                      

		                                  
		 


			                                           
			                       
			                                               
		 
	 
 

                                                                         
 
	        
	                          
		      

	                                                                                 
	                                                         

	                                                                                 
	                                                                   
	                                                                                
 

                                                                                        
 
	                                                           
 

                                                                                      
 
	                              
	                                
	                              
	                                      

	                                             
		      

	                                   
	                                                       

	                                                                                   
	                                                        
	                                       
	                        
	                         

	            
		                                                             
		 
			                      
				                                                      

			                        
				                
		 
	 

	                 
 

                                                                                    
 
	                         
		      

	                          
		      

	                                                      
		      

	                                                     
		                                      
 
#endif

bool function Crafting_IsItemCurrentlyOwnedByAnyPlayer( entity itemEnt )
{
	if ( !IsValid( itemEnt ) )
		return false

	if ( !IsValid( itemEnt.GetParent() ) )
		return false

	if ( ! ( itemEnt.GetParent().GetScriptName() == HOLDER_ENT_NAME ) )
		return false

	if ( !IsValid( itemEnt.GetParent().GetOwner() ) )
		return false

	if ( ! ( itemEnt.GetParent().GetOwner().IsPlayer() ) )
		return false

	return true
}

bool function Crafting_DoesPlayerOwnItem( entity player, entity itemEnt )
{
	if ( !IsValid( player ) )
		return false

	if ( !Crafting_IsItemCurrentlyOwnedByAnyPlayer( itemEnt ) )
		return false

	return player == itemEnt.GetParent().GetOwner()
}

array< string > function GenerateCraftingItemsInCategory( entity player, CraftingCategory categoryToCheck )
{
	int craftingRotation = categoryToCheck.rotationStyle

	                                                                   
	if ( craftingRotation == eCraftingRotationStyle.PERMANENT )
	{
		CraftingBundle bundle = GetBundleForCategory( categoryToCheck )
		return bundle.itemsInBundle
	}

	if ( craftingRotation == eCraftingRotationStyle.LOADOUT_BASED )
	{
		array< string > itemList
		CraftingBundle bundle = GetBundleForCategory( categoryToCheck )
		array< string > listToCheck = bundle.itemsInBundle

		array<entity> weapons  = SURVIVAL_GetPrimaryWeapons( player )
		foreach( slot, weapon in weapons )
		{
			int ammoType = weapon.GetWeaponAmmoPoolType()
			string ammoRef = AmmoType_GetRefFromIndex(ammoType)

			foreach( item in listToCheck )
			{
				if ( item == ammoRef )
					itemList.append( item )
			}
		}

		return itemList
	}


	CraftingBundle bundle = GetBundleForCategory( categoryToCheck )
	array< string > listToCheck = bundle.itemsInBundle

	return listToCheck
}


CraftingBundle function GetBundleForCategory( CraftingCategory categoryToCheck )
{
	int craftingRotation = categoryToCheck.rotationStyle

	                                                                   
	if ( craftingRotation == eCraftingRotationStyle.PERMANENT || craftingRotation == eCraftingRotationStyle.LOADOUT_BASED )
	{
		Assert( categoryToCheck.bundlesInCategory.len() != 0, "CRAFTING: Bundle list in category " + categoryToCheck.category + " is empty" )
		return categoryToCheck.bundlesInCategory[categoryToCheck.bundleStrings.top()]
	}

	                                                
	string unixTimeEventStartString = GetCurrentPlaylistVarString( "crafting_rotation_start", "2020-03-01 10:00:00 -08:00" )
	int unixTimeNow
	#if SERVER
		                                  
			                                                           
		    
			                                 
	#endif
	#if CLIENT
		if ( !IsLobby() )
			unixTimeNow = int(GetGlobalNetTime( "Crafting_StartTime" ))
		else
			unixTimeNow = GetUnixTimestamp()
	#endif

	int ornull unixTimeEventStart = DateTimeStringToUnixTimestamp( unixTimeEventStartString )
	Assert( unixTimeEventStart != null, format( "Bad format in playlist for setting 'crafting_rotation_start': '%s'", unixTimeEventStartString ) )
	expect int( unixTimeEventStart )

	int unixTimeSinceEventStarted = ( unixTimeNow - unixTimeEventStart )
	int hoursSinceEventStarted = int( floor( unixTimeSinceEventStarted / SECONDS_PER_HOUR ) )
	int daysSinceEventStarted =  int( floor( unixTimeSinceEventStarted / SECONDS_PER_DAY ) )
	int weeksSinceEventStarted = int( floor( unixTimeSinceEventStarted / SECONDS_PER_WEEK ) )

	int rotationRaw = 1
	if ( craftingRotation == eCraftingRotationStyle.WEEKLY )
	{
		rotationRaw = weeksSinceEventStarted
	} else if ( craftingRotation == eCraftingRotationStyle.DAILY )
	{
		rotationRaw = daysSinceEventStarted
	} else if ( craftingRotation == eCraftingRotationStyle.HOURLY )
	{
		rotationRaw = hoursSinceEventStarted
	}

	int rotationIndex = abs(rotationRaw % ( categoryToCheck.bundleStrings.len() ) )
	return categoryToCheck.bundlesInCategory[ categoryToCheck.bundleStrings[rotationIndex] ]
}






#if SERVER
                                                                                             
 
	                                            
		      

	                                                                                                         
		                                                                                      
 


                                                                                       
 
	                                             
		                                           
	                                
 

                                                                                            
 
	                                             
		                                           
	                                                               
 

                                                                        
 
	                                           
 


                                                        
 
	                       
	                                             
	 
		                                                  
		 
			               
			     
		 
	 

	                        
	 
		      
	 

	              
	                                                 
	 
		                                                          
		 
			             
			     
		 
	 

	                                                          
 

                                                                                   
 
	                                                
	                             
	                                           
	                                                 

	                                                                           
		      

	                                                       

	                                   

	            
		                                            
		 
			                                                                             
				      

			                                                            
			                                                         

			                              
			 
				                                                   
					                              
				                                 
				                                                                                                                                                                  
				                                                                                                         
				                    

				                                                                       
			 

			                                         
			                                                                                              
		 
	 

	                                    
	 
		                                                                                                     
		      
	 

	                     
	                                                                
		                  

	                                        
	                                 
	                                                                                                  
	                                                                                                  
	                                
	                       
		                                                   

	                                                                                                                                         
	                                     
 

#endif



bool function Crafting_Workbench_IsNotBusy( entity player, entity ent, int useFlags )
{
	if ( !SURVIVAL_PlayerCanUse_AnimatedInteraction( player, ent ) )
		return false

	bool isWorkbenchBusy = ent.GetLinkEntArray().len() != 0
	bool isWorkbenchCrafting = ent.GetOwner() != null
	if ( isWorkbenchBusy || isWorkbenchCrafting )
		return false

	return true
}


array<string> function Crafting_GetLootDataFromIndex( int index, entity player )
{
	entity workbench
	array<entity> possibleWorkbenches = player.GetLinkParentArray()
	foreach( ent in possibleWorkbenches )
	{
		if ( ent.GetScriptName() == WORKBENCH_SCRIPTNAME )
		{
			foreach ( cluster in ent.GetLinkParentArray() )
			{
				if ( cluster.GetScriptName() == WORKBENCH_CLUSTER_SCRIPTNAME )
				{
					workbench = cluster
					break
				}
			}

			if ( workbench != null )
				break
		}
	}

	CraftingCategory ornull item = GetCategoryForIndex( index )
	array< string > validItemList

	if ( item == null )
		return validItemList

	expect CraftingCategory( item )
	bool showWhenEmpty = false

	validItemList = GenerateCraftingItemsInCategory( player, item )

	int cumulativeIndex = 0
	foreach( category in file.craftingDataArray )
	{
		if ( category == item )
			break

		cumulativeIndex += category.numSlots
	}

	if ( item.category == "ammo" || item.category == "evo" )
		return validItemList

	if ( validItemList.len() == 0 )
		return validItemList

	array<string> finalItemList
	int difference = index - cumulativeIndex
	finalItemList.append( validItemList[difference] )
	return finalItemList
}


CraftingCategory ornull function GetCategoryForIndex( int index )
{
	int cumulativeIndex = 0
	foreach( category in file.craftingDataArray )
	{
		cumulativeIndex += category.numSlots
		if ( index < cumulativeIndex )
			return category
	}

	return null
}




#if CLIENT
void function MarkNextStepForPlayer( entity markedEnt )
{
	thread NextStepMarkerThread( markedEnt )
}

void function NextStepMarkerThread( entity markedEnt )
{
	table<int, var> result = CreateMarker( markedEnt, true )

	markedEnt.EndSignal( "HarvesterDisabled" )
	markedEnt.EndSignal( "WorkbenchUsed" )

	OnThreadEnd(
		function() : ( result )
		{
			foreach( fxId, rui in result)
			{
				EffectStop( fxId, true, false )
				RuiSetBool( rui, "isFinished", true )
			}
		}
	)

	wait 20

	return
}

void function MarkAllWorkbenches()
{
	foreach( cluster in file.workbenchClusterArray )
	{
		table<int, var> result = CreateMarker(cluster)
		foreach( fxId, rui in result)
		{
			file.workbenchMarkerList.append( fxId )
			file.workbenchMarkerRuiList.append( rui )
		}
	}
}

table<int, var> function CreateMarker( entity markedEnt, bool shouldFadeOutNearCrosshair = false )
{
	table<int, var> resultTable
	if ( !IsValid( markedEnt ) )
		return resultTable

	asset iconToUse = $""
	switch( markedEnt.GetScriptName() )
	{
		case HARVESTER_SCRIPTNAME:
			iconToUse = HARVESTER_ICON_ASSET
			break
		case WORKBENCH_CLUSTER_SCRIPTNAME:
			iconToUse = WORKBENCH_ICON_ASSET
			break
	}

	int fxId = GetParticleSystemIndex( WORKBENCH_BEAM_FX )
	int fxHandle = StartParticleEffectInWorldWithHandle( fxId, markedEnt.GetOrigin(), markedEnt.GetAngles() )

	entity localViewPlayer = GetLocalViewPlayer()
	vector pos             = markedEnt.GetOrigin() + (markedEnt.GetUpVector() * 200)
	var rui                = CreatePermanentCockpitPostFXRui( $"ui/survey_beacon_marker_icon.rpak", RuiCalculateDistanceSortKey( localViewPlayer.EyePosition(), pos ) )
	RuiSetImage( rui, "beaconImage", iconToUse )
	RuiSetGameTime( rui, "startTime", Time() )
	RuiSetFloat3( rui, "pos", pos )
	RuiSetFloat( rui, "sizeMin", 24 )
	RuiSetFloat( rui, "sizeMax", 40 )
	RuiSetFloat( rui, "minAlphaDist", 50000 )
	RuiSetFloat( rui, "maxAlphaDist", 200000 )
	RuiSetBool( rui, "shouldHideNearCrosshairs", shouldFadeOutNearCrosshair )
	RuiKeepSortKeyUpdated( rui, true, "pos" )

	EmitSoundOnEntity( localViewPlayer, "coop_minimap_ping" )

	resultTable[fxHandle] <- rui
	return resultTable
}

void function DestroyWorkbenchMarkers()
{
	foreach( id in file.workbenchMarkerList )
		EffectStop( id, true, false )

	file.workbenchMarkerList.clear()

	foreach( rui in file.workbenchMarkerRuiList )
	{
		RuiSetBool( rui, "isFinished", true )
	}

	file.workbenchMarkerRuiList.clear()
}


void function Crafting_OnGainFocus( entity ent )
{
	if ( !IsValid( ent ) )
		return

	if ( ent.GetScriptName() == HARVESTER_SCRIPTNAME || ent.GetScriptName() == WORKBENCH_SCRIPTNAME )
		CustomUsePrompt_Show( ent )

}


void function Crafting_OnLoseFocus( entity ent )
{
	if ( ent != null && ent.GetScriptName() == HARVESTER_SCRIPTNAME )
		CustomUsePrompt_ClearForEntity( ent )
}


void function OnWaitingForPlayers_Client()
{
	if ( IsFiringRangeGameMode() || IsSurvivalTraining() )
		return

	if ( file.gameStartRui.len() != 0 )
		Warning( "CRAFTING: OnWaitingForPlayers_Client() in sh_crafting.nut is being triggering multiple times - Code should investigate" )
	                                                                                          
	if ( file.gameStartRuiCreated )
		return

	file.gameStartRuiCreated = true
	file.gameStartRui.append( RuiCreate( $"ui/crafting_game_start.rpak", clGlobal.topoFullScreen, RUI_DRAW_POSTEFFECTS, 1 ) )
	                               
	for ( int i = 0; i < 4; i++ )
	{
		var rui = SetupWorkbenchPreview( file.gameStartRui[0], i , "rotation" + i, false )
		file.gameStartRui.append( rui )
		if ( i == 1 || i == 3 )
			RuiSetBool( rui, "shouldDisplayRotation", true )
	}

	thread GameStart_CleanupThread()
}


void function GameStart_CleanupThread()
{
	OnThreadEnd(
		function() : (  )
		{
			if ( file.gameStartRui.len() != 0 )
			{
				RuiDestroy( file.gameStartRui[0] )
				file.gameStartRui.clear()
			}
		}
	)

	while ( GetGameState() == eGameState.WaitingForPlayers )
	{
		WaitFrame()
	}

	                                                                        
}


void function UICallback_PopulateCraftingPanel( var button )
{
	var rui = Hud_GetRui( button )
	if ( rui == null )
		return

	                               
	for ( int i = 0; i < 6; i++ )
	{
		var nestedRui = SetupWorkbenchPreview( rui, i , "rotation" + i, false )
		RuiSetBool( nestedRui, "shouldDisplayCost", false )
		if ( i == 1 || i == 3 )
			RuiSetBool( nestedRui, "shouldDisplayRotation", true )
	}
}


var function SetupWorkbenchPreview( var baseRui, int index, string uiHandle, bool shouldShowLimitedStock = true, bool shouldUseMini = false, string itemRefOverride = "" )
{
	RuiDestroyNestedIfAlive( baseRui, uiHandle )

	var rui = RuiCreateNested( baseRui, uiHandle, $"ui/crafting_button.rpak" )
	if ( shouldUseMini )
		RuiSetBool( rui, "isMini", true )

	RuiSetImage( rui, "iconImage", $"" )
	RuiSetInt( rui, "lootTier", 0 )
	RuiSetInt( rui, "cost", 0 )

	array< string > validItemList
	if ( itemRefOverride == "" )
	{
		validItemList = Crafting_GetLootDataFromIndex( index, GetLocalClientPlayer() )
	} else {
		validItemList.append( itemRefOverride )
	}

	RuiSetBool( rui, "isWeapon", false )
	RuiSetInt( rui, "limitedStockAmount", 0 )

	CraftingCategory ornull item
	item = GetCategoryForIndex( index )
	if ( item == null )
		return

	if ( validItemList.len() != 0 )
	{
		expect CraftingCategory( item )
		string refString = validItemList[0]
		int cost = item.itemToCostTable[refString]

		LootData lootRef = SURVIVAL_Loot_GetLootDataByRef( refString )
		RuiSetImage( rui, "iconImage", lootRef.hudIcon )
		RuiSetInt( rui, "lootTier", lootRef.tier )

		if ( lootRef.lootType == eLootType.MAINWEAPON )
		{
			RuiSetBool( rui, "isWeapon", true )
			RuiSetString( rui, "name", Localize( "#WPN_" + refString.slice(10) + "_SHORT" ) )
		}

		RuiSetInt( rui, "cost", cost )
	}

	RuiSetBool( rui, "isOwned", false )
	if ( item != null )
	{
		expect CraftingCategory( item )
		RuiSetInt( rui, "rotationStyle", item.rotationStyle )
	}

	return rui
}

void function OnGameStartedPlaying_Client()
{
	if ( IsFiringRangeGameMode() || IsSurvivalTraining() )
		return

	if ( file.fullmapInitialized )
	{
		printf( "CRAFTING: Cancelling fullmap init because it already exists" )
		return
	}

	file.fullmapRui.append( RuiCreate( $"ui/crafting_fullmap.rpak", clGlobal.topoFullscreenFullMap, FULLMAP_RUI_DRAW_LAYER, 20 ) )
	RuiTrackInt( file.fullmapRui[0], "craftingMaterials", GetLocalClientPlayer(), RUI_TRACK_SCRIPT_NETWORK_VAR_INT, GetNetworkedVariableIndex( "craftingMaterials" ) )
	for ( int i = 0; i < 6; i++ )
	{
		var rui = SetupWorkbenchPreview( file.fullmapRui[0], i, "rotation" + i, false )
		RuiSetBool( rui, "isMini", true )
		file.fullmapRui.append( rui )
	}

	InitHUDRui( file.fullmapRui[0], false )
	Fullmap_AddRui( file.fullmapRui[0] )

	file.fullmapInitialized = true

	                             
}

                                                                             
                                    
 
	                                           
	                                     

	      

	                      
	                                                                                                          
	                                                                      
	                                                                                  

	                        
	                                                                   
	                                          
	 
		                                           
		 
			                                                                                          
			 
				                                                                                                               
				                  
				                                               
				                                                                       
			 
		 
	 

	                                                    
	 
		                                                                                                                   
		                                                                              
	 

	                

	                                 
   

void function OnPlayerMatchStateChanged( entity player, int oldState, int newState )
{
	if ( player != GetLocalClientPlayer() )
		return

	if ( oldState == ePlayerMatchState.SKYDIVE_PRELAUNCH && newState == ePlayerMatchState.SKYDIVE_FALLING )
	{
		                                   
	}

	if ( oldState == ePlayerMatchState.SKYDIVE_FALLING && newState == ePlayerMatchState.NORMAL )
	{
		DestroyWorkbenchMarkers()
	}
}

                                          
 
	                                              
		      

	                                                                    
	      

	                                            
	 
		                                              
			                        
	 

	                                    

	                                       
   

vector function GetCraftingColor()
{
	return SrgbToLinear( <0, 255, 240> / 255.0 )
}









                                              
void function Crafting_Workbench_OpenCraftingMenu( entity workbench )
{
	CommsMenu_Shutdown( false )
	HideScoreboard()

	if ( !CommsMenu_CanUseMenu( GetLocalClientPlayer(), eChatPage.CRAFTING ) )
		return

	if ( Bleedout_IsBleedingOut( GetLocalClientPlayer() ) )
		return

	PushLockFOV(0.2)
	CommsMenu_OpenMenuTo( GetLocalClientPlayer(), eChatPage.CRAFTING, eCommsMenuStyle.CRAFTING, false )
}


bool function Crafting_OnMenuItemSelected( int index, var menuRui )
{
	if ( !file.isEnabled )
		return false

	CraftingCategory ornull item = GetCategoryForIndex( index )
	array< string > validItemList

	if ( item == null )
	{
		RuiSetGameTime( menuRui, "invalidSelectionTime", Time() )
		return false
	}

	expect CraftingCategory( item )
	validItemList = Crafting_GetLootDataFromIndex( index, GetLocalClientPlayer() )

	int cost
	bool canBuy = true
	if ( validItemList.len() != 0 )
	{
		foreach ( ref in validItemList )
			cost += item.itemToCostTable[ref]

		if ( item.category == "evo" )
		{
			LootData existingArmorData = EquipmentSlot_GetEquippedLootDataForSlot( GetLocalClientPlayer(), "armor" )
			if ( existingArmorData.ref.find( "evolving" ) == -1 )
			{
				canBuy = false
			}
			else
			{
				if ( existingArmorData.tier >= 5 )
					canBuy = false
			}
		}
	}
	else
	{
		canBuy = false
	}

	bool canAfford = Crafting_GetPlayerCraftingMaterials( GetLocalClientPlayer() ) >= cost

	                                       
	if (canBuy && canAfford)
	{
		Remote_ServerCallFunction( "ClientCallback_InitializeCraftingAtWorkbench", index )
		Crafting_Workbench_CloseCraftingMenu()
		return true
	} else {
		CraftingBundle bundle = GetBundleForCategory( item )
		RuiSetGameTime( bundle.attachedRui[index], "invalidSelectionTime", Time() )
		RuiSetGameTime( menuRui, "invalidSelectionTime", Time() )
		return false
	}

	unreachable
}


void function TryCloseCraftingMenu()
{
	if ( GetLocalClientPlayer() == GetLocalViewPlayer() )
	{
		Crafting_Workbench_CloseCraftingMenu()
	}
}


void function Crafting_Workbench_CloseCraftingMenu( )
{
	                                    

	if ( !IsCommsMenuActive() )
		return
	if ( CommsMenu_GetCurrentCommsMenu() != eCommsMenuStyle.CRAFTING )
		return

	CommsMenu_Shutdown( true )
}


void function Crafting_OnWorkbenchMenuClosed( bool instant )
{
	if ( !file.isEnabled)
		return

	Remote_ServerCallFunction( "ClientCallback_RegisterClosedCraftingMenu" )
	PopLockFOV( instant ? 0.0 : 0.1 )
}


void function CreateWorkbenchWorldIcon( entity workbench, bool isLimitedStock = false )
{
	entity localViewPlayer = GetLocalViewPlayer()
	vector pos             = workbench.GetOrigin() + (workbench.GetUpVector() * 160)
	var rui                = CreateCockpitRui( $"ui/survey_beacon_marker_icon.rpak", RuiCalculateDistanceSortKey( localViewPlayer.EyePosition(), pos ) )
	RuiSetImage( rui, "beaconImage", isLimitedStock ? WORKBENCH_ICON_LIMITED_ASSET : WORKBENCH_ICON_ASSET )
	RuiSetGameTime( rui, "startTime", Time() )
	RuiSetFloat3( rui, "pos", pos )
	RuiSetFloat( rui, "sizeMin", 48 )
	RuiSetFloat( rui, "minAlphaDist", 1000 )
	RuiSetFloat( rui, "maxAlphaDist", 3000 )
	RuiKeepSortKeyUpdated( rui, true, "pos" )
	file.workbenchRuiTable[workbench] <- rui
}

void function SetupProgressWaypoint( entity waypoint )
{
	if ( waypoint.GetWaypointType() != eWaypoint.OBJECTIVE || Waypoint_GetPingTypeForWaypoint( waypoint ) != ePingType.OBJECTIVE )
	{
		return
	}

	thread SetupProgressWaypoint_Internal( waypoint )
}

void function SetupProgressWaypoint_Internal( entity waypoint )
{
	if ( waypoint.GetWaypointType() != eWaypoint.OBJECTIVE || Waypoint_GetPingTypeForWaypoint( waypoint ) != ePingType.OBJECTIVE )
	{
		return
	}

	int timeoutCounter = 0
	while ( IsValid( waypoint ) && waypoint.wp.ruiHud == null )
	{
		printf( "CRAFTING: Waypoint WaitFrame" )
		WaitFrame()
		timeoutCounter++
		if (timeoutCounter > 1000)
			return
	}

	if ( !IsValid( waypoint ) )
	{
		printf( "CRAFTING: Waypoint Invalid" )
		return
	}

	RuiSetFloat( waypoint.wp.ruiHud, "maxDrawDistance", 3000 )
	RuiSetFloat( waypoint.wp.ruiHud, "iconSize", 72.0 )
	RuiSetFloat( waypoint.wp.ruiHud, "iconSizePinned", 72.0 )
	RuiSetImage( waypoint.wp.ruiHud, "outerIcon", $"rui/events/s03e01a/item_source_icon" )
	RuiSetImage( waypoint.wp.ruiHud, "innerIcon", $"rui/events/s03e01a/item_source_icon" )
	RuiSetInt( waypoint.wp.ruiHud, "yourObjectiveStatus", 2 )
	RuiSetInt( waypoint.wp.ruiHud, "yourTeamIndex", GetLocalViewPlayer().GetTeam() )
	RuiSetInt( waypoint.wp.ruiHud, "roundState", 0 )
	RuiSetString( waypoint.wp.ruiHud, "pingPrompt", Localize( "#CRAFTING_PROMPT" ) )
	RuiSetString( waypoint.wp.ruiHud, "pingPromptForOwner", Localize( "#CRAFTING_PROMPT" ) )
	RuiSetBool( waypoint.wp.ruiHud, "reverseProgress", false )
	RuiSetBool( waypoint.wp.ruiHud, "iconColorOverride", true )
	RuiSetFloat3( waypoint.wp.ruiHud, "iconColor", (GetKeyColor( COLORID_LOOT_TIER0 + waypoint.GetWaypointInt( 5 ) ) / 255.0) )

	RuiTrackGameTime( waypoint.wp.ruiHud, "captureEndTime", waypoint, RUI_TRACK_WAYPOINT_GAMETIME, RUI_TRACK_INDEX_CAPTURE_END_TIME )
	RuiTrackFloat( waypoint.wp.ruiHud, "captureTimeRequired", waypoint, RUI_TRACK_WAYPOINT_FLOAT, RUI_TRACK_INDEX_REQUIRED_TIME )
	RuiTrackInt( waypoint.wp.ruiHud, "currentControllingTeam", waypoint, RUI_TRACK_WAYPOINT_INT, RUI_TRACK_INDEX_ACTIVATOR_TEAM )

	thread PlayWorkbenchPrintingFX( waypoint, waypoint.GetWaypointString( 0 )  )
}

void function PlayWorkbenchPrintingFX( entity waypoint, string animIndex )
{
	waypoint.EndSignal( "OnDestroy" )

	entity workbench = waypoint.GetParent()
	foreach ( cluster in workbench.GetLinkParentArray() )
	{
		if ( cluster.GetScriptName() == WORKBENCH_CLUSTER_SCRIPTNAME )
		{
			workbench = cluster
			break
		}
	}

	int attachId = workbench.LookupAttachment( "FX_DOOR_OPEN_" + animIndex )
	int fxHandle = StartParticleEffectOnEntity( workbench, GetParticleSystemIndex( WORKBENCH_PRINTING_FX ), FX_PATTACH_POINT_FOLLOW, attachId )
	vector lootTier = GetFXRarityColorForTier( waypoint.GetWaypointInt( 5 ) )

	EffectSetControlPointVector( fxHandle, 1, lootTier )

	OnThreadEnd(
		function() : ( fxHandle )
		{
			if ( EffectDoesExist( fxHandle ) )
				EffectStop( fxHandle, true, false )
		}
	)

	WaitForever()
}

void function ServerCallback_UpdateWorkbenchVars()
{
	if ( GetGameState() != eGameState.Playing )
		return

	CommsMenu_RefreshData()
}


void function ServerCallback_PromptNextHarvester( entity playerBeingAddressed, entity harvester )
{
	if ( ShouldMuteCommsActionForCooldown( GetLocalViewPlayer(), eCommsAction.REPLY_CRAFTING_NEXT_HARVESTER_OR_WORKBENCH, null) )
		return

	thread PromptAfterDelayThread( playerBeingAddressed, eCommsAction.REPLY_CRAFTING_NEXT_HARVESTER_OR_WORKBENCH, "#PING_CRAFTING_NEXT_HARVESTER" , 2.5, 6 )
}

void function ServerCallback_PromptWorkbench( entity playerBeingAddressed, entity workbench )
{
	if ( ShouldMuteCommsActionForCooldown( GetLocalViewPlayer(), eCommsAction.REPLY_CRAFTING_NEXT_HARVESTER_OR_WORKBENCH, null) )
		return

	thread PromptAfterDelayThread( playerBeingAddressed, eCommsAction.REPLY_CRAFTING_NEXT_HARVESTER_OR_WORKBENCH, "#PING_CRAFTING_NEXT_WORKBENCH" , 2.5, 6 )
}

void function ServerCallback_PromptAllWorkbenches( entity playerBeingAddressed )
{
	if ( ShouldMuteCommsActionForCooldown( GetLocalViewPlayer(), eCommsAction.REPLY_CRAFTING_PING_ALL_WORKBENCHES, null ) )
		return

	thread PromptAfterDelayThread( playerBeingAddressed, eCommsAction.REPLY_CRAFTING_PING_ALL_WORKBENCHES, "#PING_CRAFTING_ALL_WORKBENCHES", 4 )
}

void function PromptAfterDelayThread( entity player, int commAction, string promptText, float delay = 2.5, float duration = 10 )
{
	wait delay

	if ( !IsValid( player ) )
		return

	AddOnscreenPromptFunction( "quickchat", CreateQuickchatFunction( commAction, player ), duration, Localize( promptText ) )
}


void function Crafting_PopulateItemRuiAtIndex( var rui, int index )
{
	if ( !file.isEnabled )
		return

	if ( IsLobby() )
		return

	CraftingCategory ornull item = GetCategoryForIndex( index )
	array<string> validItemList

	if ( item == null )
		return

	expect CraftingCategory( item )
	validItemList = Crafting_GetLootDataFromIndex( index, GetLocalClientPlayer() )

	int cost
	bool canBuy = true
	if ( validItemList.len() != 0 && item.category != "evo" )
	{
		foreach ( ref in validItemList )
			cost += item.itemToCostTable[ref]


		LootData lootRef = SURVIVAL_Loot_GetLootDataByRef( validItemList[0] )
		RuiSetImage( rui, "icon", lootRef.hudIcon )
		RuiSetInt( rui, "tier", lootRef.tier )
		if ( lootRef.lootType == eLootType.MAINWEAPON )
			RuiSetBool( rui, "isWeapon", true )
		else if ( lootRef.lootType == eLootType.AMMO && validItemList.len() > 1 && validItemList[1] != "" )
		{
			LootData lootRefAlt = SURVIVAL_Loot_GetLootDataByRef( validItemList[1] )
			RuiSetBool( rui, "isAmmo", true )
			RuiSetImage( rui, "altIcon", lootRefAlt.hudIcon )
			if ( lootRef.ref == "bullet" || lootRef.ref == "highcal" || lootRef.ref == "special" )
			{
				RuiSetInt( rui, "ammoAmount", lootRef.countPerDrop * CRAFTING_AMMO_MULTIPLIER )
			}

			if ( lootRefAlt.ref == "bullet" || lootRefAlt.ref == "highcal" || lootRefAlt.ref == "special" )
			{
				RuiSetInt( rui, "ammoAmountAlt", lootRefAlt.countPerDrop * CRAFTING_AMMO_MULTIPLIER )
			}

			if ( lootRef.ref == "shotgun" || lootRef.ref == "arrows" || lootRef.ref == "sniper" )
			{
				RuiSetInt( rui, "ammoAmount", lootRef.countPerDrop * CRAFTING_AMMO_MULTIPLIER_SMALL )
			}

			if ( lootRefAlt.ref == "shotgun" || lootRefAlt.ref == "arrows" || lootRefAlt.ref == "sniper" )
			{
				RuiSetInt( rui, "ammoAmountAlt", lootRefAlt.countPerDrop * CRAFTING_AMMO_MULTIPLIER_SMALL )
			}
		}
		else if ( lootRef.lootType == eLootType.AMMO )
		{
			if ( lootRef.ref == "bullet" || lootRef.ref == "highcal" || lootRef.ref == "special" )
			{
				RuiSetBool( rui, "isAmmo", true )
				RuiSetInt( rui, "ammoAmount", lootRef.countPerDrop * CRAFTING_AMMO_MULTIPLIER )
			}

			if ( lootRef.ref == "shotgun" || lootRef.ref == "arrows" || lootRef.ref == "sniper" )
			{
				RuiSetBool( rui, "isAmmo", true )
				RuiSetInt( rui, "ammoAmount", lootRef.countPerDrop * CRAFTING_AMMO_MULTIPLIER_SMALL )
			}
		}
	}
	else if ( validItemList.len() != 0 && item.category == "evo" )
	{
		cost = item.itemToCostTable[validItemList[0]]
		RuiSetImage( rui, "icon", $"rui/hud/gametype_icons/survival/crafting_evo_points" )
		RuiSetBool( rui, "isWeapon", true )

		LootData existingArmorData = EquipmentSlot_GetEquippedLootDataForSlot( GetLocalClientPlayer(), "armor" )
		if ( existingArmorData.ref.find( "evolving" ) == -1 )
		{
			canBuy = false
		}
		else
		{
			if ( existingArmorData.tier >= 5 )
				canBuy = false
		}
	}
	else
	{
		canBuy = false
	}

	RuiSetInt( rui, "cost", cost )
	RuiSetString( rui, "rotationStyle", GetEnumString( "eCraftingRotationStyle", item.rotationStyle ) )

	bool canAfford = Crafting_GetPlayerCraftingMaterials( GetLocalClientPlayer() ) >= cost
	RuiSetBool( rui, "isEnabled", canBuy && canAfford )

	CraftingBundle bundle = GetBundleForCategory( item )
	bundle.attachedRui[index] <- rui
}
#endif


      