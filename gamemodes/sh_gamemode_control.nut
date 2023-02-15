                        

const string CONTROL_MODE_MOVER_SCRIPTNAME = "control_mover"

global function Control_Init
global function Control_RegisterNetworking

#if SERVER
                                      
                                 

                                                 
                                               

                                              
                                        
                                            

                                      

                     
                                          
      

                                                           
                                                               

                                                    

                                     
                                   
                                         
                                                
                                   
#endif          

#if CLIENT
global function Control_SendRespawnChoiceToServer

global function ServerCallback_Control_ShowSpawnSelection
global function ServerCallback_Control_UpdateSpawnWaveTimerTime
global function ServerCallback_Control_UpdateSpawnWaveTimerVisibility
global function ServerCallback_Control_DeregisterModeButtonPressedCallbacks
global function ServerCallback_Control_SetDeathScreenCallbacks

global function UICallback_Control_UpdatePlayerInfo
global function UICallback_Control_OnMenuPreClosed
global function UICallback_Control_ReportMenu_OnClosed
global function UICallback_Control_ReportMenu_OnOpened
global function UICallback_Control_OnResolutionChanged
global function UICallback_Control_SpawnHeaderUpdated
global function UICallback_Control_SpawnButtonClicked
global function UICallback_Control_LaunchSpawnMenuProcessThread
global function UICallback_ControlMenu_MouseWheelUp
global function UICallback_ControlMenu_MouseWheelDown

global function Control_PingObjectiveFromObjID

global function ServerCallback_Control_ProcessImmediatelyOpenCharacterSelect
global function ServerCallback_Control_PlayerJoinedMatchInProgress
global function ServerCallback_Control_OnPlayerChoosingRespawnChoiceChanged
global function ServerCallback_Control_NoVehiclesAvailable
global function ServerCallback_Control_UpdatePlayerExpHUDWeaponEvo
global function ServerCallback_Control_ProcessObjectiveStateChange
global function ServerCallback_Control_DisplayIconAtPosition
global function ServerCallback_Control_BountyActiveAlert
global function ServerCallback_Control_BountyClaimedAlert
global function ServerCallback_Control_AirdropNotification
global function ServerCallback_Control_UpdateExtraScoreBoardInfo
global function ServerCallback_Control_TransferCameraData
global function ServerCallback_PlayMatchEndMusic_Control
global function ServerCallback_PlayPodiumMusic
global function ServerCallback_Control_SetControlGeoValidForAirdropsOnClient
global function ServerCallback_Control_DisplayLockoutUnavailableWarning
global function ServerCallback_Control_MRBTimedEvent_OnMRBPickedUp

global function Control_OpenCharacterSelect
global function ServerCallback_Control_DisplaySpawnAlertMessage
global function ServerCallback_Control_DisplayWaveSpawnBarStatusMessage

global function Control_InstanceObjectivePing_Thread
global function Control_UpdatePlayerExpHUD
global function	Control_ScoreboardSetup
global function ServerCallback_Control_UpdateObjectivePingText
global function ServerCallback_Control_UpdateObjectivePingCounts
global function ServerCallback_Control_UpdateLastPingedObjective
global function ServerCallback_Control_SetIsPlayerUsingLosingExpTiers
global function UICallback_Control_Loadouts_OnClosed
global function ServerCallback_Control_PlayAllWeaponEvoUpgradeFX
global function ServerCallback_Control_Play3PEXPLevelUpFX
global function ServerCallback_Control_PlayCaptureZoneEnterExitSFX
global function ServerCallback_Control_NewEXPLeader
global function ServerCallback_Control_EXPLeaderKilled

global function Control_ObjectiveScoreTracker_PushAnnouncement
global function Control_PlayEXPGainSFX

global function Control_GetVictoryConditionForFlagset
global function Control_DeathScreenUpdate
global function Control_PopulateSummaryDataStrings
global function Control_ScoreboardUpdateHeader
global function Control_IsPlayerInMapCameraView
global function Control_CloseCharacterSelectOnlyIfOpen
global function Control_GetObjectiveNameFromObjectiveID_Localized
#endif          


#if UI
global function Control_PopulateAboutText
#endif      

global function Control_IsSpawningOnObjectiveBAllowed

#if CLIENT || SERVER
global function Control_GetPlayerCountForFaction
global function Control_GetPlayerExpTotal
global function Control_GetPlayerExpTier
global function Control_DidPlayerPingSameObjective
global function Control_GetPingCountForObjectiveForAlliance
global function Control_GetObjectiveStarterPings
global function Control_GetStarterPingFromTraceBlockerPing
global function Control_IsPlayerAbandoning
global function Control_GetDefaultWeaponTier
global function Control_GetAbandonPenaltyLength
global function Control_SetHomeBaseBadPlacesForMRBForAlliance

global const float CONTROL_MESSAGE_DURATION = 5.0
const float CONTROL_MESSAGE_DURATION_LONG = 11.0
const float CONTROL_MESSAGE_DURATION_SHORT = 3.0
const float LEGEND_DIALOGUE_DELAY_POST_ANNOUNCER_DIALOGUE_SHORT = 2.5
const float LEGEND_DIALOGUE_DELAY_POST_ANNOUNCER_DIALOGUE_LONG = 3.5
const float ANNOUNCER_DIALOGUE_DELAY = 1.5

global const string CONTROL_FUNC_BRUSH_GEO_NAME = "func_control_geo"
                                                                                                                                                             
const string CONTROL_EXPEVENT_ELIMINATION = "Control_Exp_Elimination"
const string CONTROL_EXPEVENT_ASSIST = "Control_Exp_Assist"
const string CONTROL_EXPEVENT_ATTACKERKILL = "Control_Exp_AttackerKill"
const string CONTROL_EXPEVENT_DEFENDERKILL = "Control_Exp_DefenderKill"
const string CONTROL_EXPEVENT_HIGHTIERKILL = "Control_Exp_HighTierKill"
const string CONTROL_EXPEVENT_REALLYHIGHTIERKILL = "Control_Exp_ReallyHighTierKill"
const string CONTROL_EXPEVENT_CONTESTING = "Control_Exp_ContestingObjective"
const string CONTROL_EXPEVENT_CAPTURING = "Control_Exp_CapturingObjective"
const string CONTROL_EXPEVENT_DEFENDING_ACTIVEPOINT = "Control_Exp_DefendingActiveObjective"
const string CONTROL_EXPEVENT_CAPTURED = "Control_Exp_CapturedObjective"
const string CONTROL_EXPEVENT_TEAM_CAPTURED = "Control_Exp_TeamCapturedObjective"
const string CONTROL_EXPEVENT_NEUTRALIZED = "Control_Exp_NeutralizedObjective"
const string CONTROL_EXPEVENT_TEAM_NEUTRALIZED = "Control_Exp_TeamNeutralizedObjective"
const string CONTROL_EXPEVENT_WITHSQUADBONUS = "Control_Exp_WithSquadBonus"
const string CONTROL_EXPEVENT_KILLEXPLEADER = "Control_Exp_KillEXPLeader"
const string CONTROL_EXPEVENT_DEFENDING = "Control_Exp_DefendingObjective"
const string CONTROL_EXPEVENT_BOUNTYCLAIMED = "Control_Exp_BountyClaimed"
const string CONTROL_EXPEVENT_LOCKOUTBROKEN = "Control_Exp_TeamCanceledLockout"
const string CONTROL_EXPEVENT_SPAWNONBASE = "Control_Exp_SpawnOnBase"
const string CONTROL_EXPEVENT_RESPAWN = "Control_Exp_Respawn"
const string CONTROL_EXPEVENT_MRBCARRIER = "Control_Exp_MRBCarrier"
const string CONTROL_EXPEVENT_MRBDEPLOYED = "Control_Exp_MRBDeployed"

const bool CONTROL_ARE_AIRDROPS_ALLOWED_ON_CONTROL_GEO = false                                                                                                                                                                                                 
const int CONTROL_VEHICLE_AIRDROP_BAD_PLACE_RADIUS = 300
const int CONTROL_SKYDIVE_LAUNCHER_AIRDROP_BAD_PLACE_RADIUS = 150
const int CONTROL_DEFAULT_MAX_PLAYERS = 18
#endif                    

#if DEV && SERVER
                           
                                        
                                          
                                             
                                             
                                                 
                                                    
                                                 
                                                     
                                         
                                                  
                                                    
#endif                     

#if DEV
	const bool CONTROL_SPAWN_DEBUGGING = false
	const bool CONTROL_DETAILED_DEBUG = false                                                                                     
	const bool CONTROL_DISPLAY_DEBUG_DRAWS = false                                                                     
	const float CONTROL_DEBUG_DRAW_DISPLAY_TIME = 1000.0
#endif       

global const CONTROL_DROPPOD_SCRIPTNAME = "control_droppod"
global const CONTROL_OBJECTIVE_SCRIPTNAME = "control_objective"

                     
global const CONTROL_INT_OBJ_TEAM_OWNER = 0
const FLOAT_CAP_PERC = 1
const FLOAT_BOUNTY_AMOUNT = 2
const FLOAT_AVG_BOUNDARY_RADIUS = 3
const INT_TEAM_CAPTURING = 3
global const INT_OBJECTIVE_ID = 4
const INT_TEAM0_PLAYERSONOBJ = 5
const INT_TEAM1_PLAYERSONOBJ = 6
const CONTROL_INT_OBJ_NEUTRAL_TEAM_OWNER = 7

const float CONTROL_INTRO_DELAY = 2.2

const string CONTROL_OBJECTIVE_A_NAME = "A"
const string CONTROL_OBJECTIVE_B_NAME = "B"
const string CONTROL_OBJECTIVE_C_NAME = "C"
const string CONTROL_OBJECTIVE_DEFAULT_NAME = "Default Objective Name"

const int CONTROL_OBJECTIVE_A_INDEX = 0
global const int CONTROL_OBJECTIVE_B_INDEX = 1
const int CONTROL_OBJECTIVE_C_INDEX = 2
const int CONTROL_FOB_INDEX_ALLIANCE_A = 0
const int CONTROL_FOB_INDEX_ALLIANCE_B = 2

const INT_TEAM0_SCORE = 4
const INT_TEAM1_SCORE = 5

const asset CONTROL_OBJ_DIAMOND_EMPTY = $"rui/hud/gametype_icons/winter_express/team_diamond_empty"
const asset CONTROL_OBJ_DIAMOND_YOURS = $"rui/hud/gametype_icons/winter_express/team_a_diamond"
const asset CONTROL_OBJ_DIAMOND_ENEMY = $"rui/hud/gametype_icons/winter_express/team_b_diamond"
const asset TEAMMATE_DEATH_ICON = $"rui/rui_screens/icon_skull_postdeath"
const asset TEAMMATE_SPAWN_ICON = $"rui/hud/pve/extraction_dropship"
const asset AIRDROP_LANDED_ICON = $"rui/hud/ping/icon_ping_loot"
const float CONTROL_TEAMMATE_DEATH_ICON_LIFETIME = 12.0                                                                                                                          
const float TEAMMATE_SPAWN_ICON_DURATION = 10.0

const SPAWN_DIST = 1000
const float SPAWN_MIN_RADIUS = 128
const float SPAWN_MIN_RADIUS_NEAR_SQUAD = 712
const float SPAWN_MAX_RADIUS_BASE = 1028
const float SPAWN_MAX_RADIUS_NEAR_SQUAD = 1400
const SPAWN_MAX_TRY_COUNT = 60
const SPAWN_VIEW_DISTANCE_CHECK = 150

                       
const int INT_WAYPOINT_TYPE = 7
global const int CONTROL_WAYPOINT_BASE0_INDEX = 0
global const int CONTROL_WAYPOINT_BASE1_INDEX = 1
global const int CONTROL_WAYPOINT_PLAYER_INDEX = 2
global const int CONTROL_WAYPOINT_POINT_INDEX = 3
global const int CONTROL_WAYPOINT_MRB_INDEX = 4
const int CONTROL_WAYPOINT_ALLIANCE_OWNER_INDEX = 5
const int CONTROL_MRB_SPAWN_WAYPOINT_ENDTIME = 6
const float CONTROL_DEFAULT_MRB_LIFETIME = 120.0
const float CONTROL_DEFAULT_MRB_AIRDROP_DELAY = 15.0
global const string MRB_WEAPON_REF_NAME = "mp_ability_mobile_respawn_beacon"                                                     
global const string MRB_SUPPLY_DROP_NAME = "mp_ability_mobile_supply_drop"                                                     
const string PLAYER_WITH_MRB_NET_NAME = "control_mrbtimedevent_player_with_mrb"
const string WAYPOINT_CONTROL_MRB = "waypoint_control_mrb"
const int CONTROL_WAYPOINT_OBJECT_ENTITY_INDEX = 0
const int CONTROL_WAYPOINT_TRIGGER_ENTITY_INDEX = 1

                                                                   
string WAYPOINT_CONTROL_PLAYERLOC = "waypoint_control_playerloc"
global const int CONTROL_PLAYERLOC_WAYPOINT_PLAYERENTITY_INDEX = 0

global const asset CONTROL_WAYPOINT_FLARE_ASSET = $"P_control_flare"

global const asset CONTROL_WAYPOINT_BASE_ICON = $"rui/hud/gametype_icons/survival/sur_hovertank_minimap"
global const asset CONTROL_WAYPOINT_PLAYER_ICON = $"rui/hud/gamestate/player_count_icon"

const string WAYPOINT_CONTROL_AIRDROP = "waypoint_control_airdrop"
const int AIRDROP_WAYPOINT_LOOTTIER_INT = 0
const asset HOVER_VEHICLE_SPAWN_BASE = $"mdl/olympus/olympus_vehicle_base.rmdl"
const asset FX_VEHICLE_SPAWN_POINT = $"P_veh_vh1_spawnpoint"
const int	VEHICLE_LIMIT = 6
const vector ANNOUNCEMENT_RED = <235, 65, 65>
const asset DEATH_SCREEN_RUI = $"ui/control_squad_summary_header_data.rpak"

global const string CONTROL_SCORINGEVENT_CAPTURED = "Control_CapturedObjective"
global const string CONTROL_EXPEVENT_GUNRACK_PURCHASE = "Control_Exp_GunRackUse"
global const string CONTROL_EXPEVENT_EXPRESET = "Control_Exp_ExpReset"

const string CONTROL_PIN_VICTORYCONDITION_UNKNOWN = "unknown"
const string CONTROL_PIN_VICTORYCONDITION_SCORE = "score_limit_reached"
const string CONTROL_PIN_VICTORYCONDITION_LOCKOUT = "lockout"

global const int CONTROL_MAX_EXP_TIER = 4
global const int CONTROL_MAX_LOOT_TIER = 3

global const int CONTROL_TEAMSCORE_LOCKOUTBROKEN = 50

#if SERVER
                                                                         
                                                                
                                                        
                                                      
                                                    
                                                    
                                                                                                                                                                                                                         
                                                                                                                                                                                                                                            

                                  
                                             
                                        
                                                    
                                                       
                                                                                                                   
                                                                                                                                                   

                                                                     
                                                                         
                                                                           

                                                                     
                                                                                                     
                                                                                                                                       
                                                                                                                                
                                                                                                                                 
                                                                                                                                                                                                                                  

                                                       
                                                     
                                                     
                                                                        
                                                  
                                                         
                                                          
                                                                           
                                                         
                                                                   
                                                       

                                                                         
                                                                         
                                                                   

                                                                                    

                             
                                                             

                                                                                        
#endif          

#if SERVER || CLIENT
const int CONTROL_VICTORY_FLAGS_UNKNOWN = 0
const int CONTROL_VICTORY_FLAGS_SCORE = ( 1 << 1 )
const int CONTROL_VICTORY_FLAGS_LOCKOUT = ( 1 << 2 )

const int CONTROL_TEAMSCORE_PER_POINT = 1
const float CONTROL_LOCKOUT_EVENT_DURATION = 90.0

const int CONTROL_MRB_ISMRBAIRDROP_BITFIELD = 1
#endif                    

#if CLIENT
                     
const FX_WEAPON_EVO_UPGRADE_FP = $"P_wpn_evo_upgrade_FP"
const FX_EXP_LEVELUP_3P = $"P_wpn_evo_upgrade"
const int CONTROL_OBJECTIVE_RUI_SORTING = 301                                           
const int CONTROL_TEAMMATE_ICON_SORTING = 302

      
             
const string CONTROL_SFX_WEAPON_EVO_LVL_1 = "Ctrl_Loadout_Upgrade_lvl1_1P"
const string CONTROL_SFX_WEAPON_EVO_LVL_2 = "Ctrl_Loadout_Upgrade_lvl2_1P"
const string CONTROL_SFX_WEAPON_EVO_LVL_3 = "Ctrl_Loadout_Upgrade_lvl3_1P"
const string CONTROL_SFX_WEAPON_EVO_LVL_4 = "Ctrl_Loadout_Upgrade_lvl4_1P"
           
const string CONTROL_SFX_EXP_GAIN = "Ctrl_XP_Gain_1p"
          
const string CONTROL_SFX_LOCKOUT_START = "Ctrl_LockOut_Begin_1p"
const string CONTROL_SFX_LOCKOUT_ABORT = "Ctrl_LockOut_Abort_1p"
               
const string CONTROL_SFX_CAPTURE_ZONE_ENTER = "Ctrl_Zone_Enter_1p"
const string CONTROL_SFX_CAPTURE_ZONE_EXIT = "Ctrl_Zone_EXIT_1p"
const string CONTROL_SFX_ZONE_CAPTURED_FRIENDLY = "Ctrl_Zone_Capture_1p"
const string CONTROL_SFX_ZONE_CAPTURED_ENEMY = "Ctrl_Zone_Capture_Enemy_1p"
const string CONTROL_SFX_ZONE_NEUTRALIZED = "Ctrl_Zone_Neutralized_1p"
                
const string CONTROL_SFX_CAPTURE_BONUS_ADDED = "Ctrl_CaptureBonus_Added_1p"
const string CONTROL_SFX_CAPTURE_BONUS_CLAIMED_FRIENDLY = "Ctrl_CaptureBonus_Claimed_1p"
const string CONTROL_SFX_CAPTURE_BONUS_CLAIMED_ENEMY = "Ctrl_CaptureBonus_Claimed_Enemy_1p"
            
const string CONTROL_SFX_GAME_END_VICTORY = "Ctrl_Victory_1p"
const string CONTROL_SFX_GAME_END_LOSS = "Ctrl_Loss_1p"
                                
const string CONTROL_FINAL_OBJECTIVE_BEING_CAPTURED_WARNING = "Ctrl_Match_End_Warning_1p"
                                    
const string CONTROL_SFX_JOIN_MATCH_IN_PROGRESS = "Ctrl_New_Player_Joined"

const string CONTROL_SFX_MRB_STATUS_UPDATE = "Ctrl_MRB_Update_1p"
const string CONTROL_SFX_MRB_STATUS_UPDATE_ENEMY = "Ctrl_MRB_Update_Enemy_1p"

global const asset CONTROL_MRB_INWORLD_ICON = $"rui/gamemodes/control/mobile_respawn_beacon_icon_shadow"
const asset CONTROL_MRB_DIAMOND_ICON = $"rui/gamemodes/control/icon_ping_go_inner_darker"
const asset CONTROL_MRB_DIAMOND_ICON_OUTLINE = $"rui/hud/ping/icon_ping_any_outline"
const asset CONTROL_MRB_DIAMOND_ICON_SHADOW = $"rui/hud/ping/icon_ping_any_shadow"
const asset CONTROL_MRB_HELD_OUTER_ICON = $"rui/gamemodes/control/compass_holding_MRB"
const float MRB_ICON_OFFSET = 10
const float MRB_ICON_OFFSET_CARRIED = 100
#endif          

#if DEV
const float SPAWNPOINT_RADIUS = 20
const float SPAWNPOINT_HEIGHT = 128
const float SPAWNPOINT_DISPLAY_TIME = 60
#endif       

global const array<string> CONTROL_DISABLED_BATTLE_CHATTER_EVENTS = [
	"bc_anotherSquadAttackingUs",
	"bc_squadsLeft2 ",
	"bc_squadsLeft3 ",
	"bc_squadsLeftHalf",
	"bc_twoSquaddiesLeft",
	"bc_championEliminated",
	"bc_killLeaderNew",
	"bc_podLeaderLaunch",
	"bc_imJumpmaster",
	"bc_firstBlood",
	"bc_weTookFirstBlood",
]

global const array<int> CONTROL_DISABLED_COMMS_ACTIONS = [
                          
	eCommsAction.INVENTORY_NO_AMMO_BULLET,
	eCommsAction.INVENTORY_NO_AMMO_ARROWS,
	eCommsAction.INVENTORY_NO_AMMO_HIGHCAL,
	eCommsAction.INVENTORY_NO_AMMO_SHOTGUN,
	eCommsAction.INVENTORY_NO_AMMO_SNIPER,
	eCommsAction.INVENTORY_NO_AMMO_SPECIAL,
       
]

global enum eControlPlayerRespawnChoice
{
	SPAWN_AT_BASE,
	SPAWN_ON_SQUAD,
	SPAWN_ON_POINT,
	SPAWN_ON_MRB,
	_count
}


global enum eControlPointObjectiveState
{
	CONTESTED,
	CONTROLLED,
}


global enum eControlSpawnFailureCode
{
	INVALID_CHOICE,
	CHOICE_IN_COMBAT,
}

#if CLIENT || UI
                                                                                       
global enum eControlSpawnWaypointUsage
{
	ENEMY_TEAM,
	NOT_USABLE,
	FRIENDLY_TEAM
}
#endif                

enum eControlSpawnAlertCode
{
	SPAWN_FAILED,
	SPAWN_CANCELLED,
	SPAWN_LOST_SPAWNPOINT,
	SPAWN_LOST_MRB,
	_count
}

enum eControlIconIndex
{
	DEATH_ICON,
	SPAWN_ICON,

	_count
}

                                                                                                                                                                    
enum eControlObjectivePingValue
{
	NONE,
	ATTACK_A,
	DEFEND_A,
	ATTACK_B,
	DEFEND_B,
	ATTACK_C,
	DEFEND_C
}

#if CLIENT
enum eControlMRBTimeEventMRBState
{
	IDLE,
	PERSONAL_HELD,
	FRIENDLY_HELD,
	ENEMY_HELD,
}
#endif          

#if SERVER || CLIENT
                                                                                                                             
enum eControlMRBTimeEventPhase
{
	INTRO,
	AIRDROP,
	MRB_IN_PLAY,
	MRB_LAUNCHED,
	MRB_DEPLOYED,
}

enum eControlMRBPlacementState
{
	SUCCESS,
	BAD_POSITION,
	NEAR_OBJECTIVE,
	NEAR_HOMEBASE,
	NEAR_HOMEBASE_ENEMY,
	_count
}
#endif                    

#if SERVER
                       
 
	              
	               
	               
	                    

	           
	           
	                       
	               

	                                                                  
	                                     
	                                     
	                                     
	                                                                                                                          
	                             

	                                         
	                                                  
	                                                    
	                                         

	                               
	                             
 

                           
 
	                           
	                                    
	                             	                    
 

                            
 
	            
	                 
	                
	               

	                                     
	                                                        

	                                                
	                                                         
 
#endif          

struct ControlAnnouncementData
{
	bool isInitialized = false

	entity 		wp
	bool 		shouldTerminateIfWPDies = false
	bool		shouldForcePushAnnouncement = false
	bool		shouldUseTimer

	string 		mainText
	string		subText
	float		displayLength

	float 		displayStartTime
	float		startTime
	float		eventLength

	vector 		overrideColor
}

struct ControlTeamData
{
	int teamScoreFromPoints = 0
	int teamScoreFromBonus = 0
	int teamScorePerSec = 0
}

const ControlTeamData ControlTeamDataDefaults = {
	teamScoreFromPoints =  0
	teamScoreFromBonus = 0
	teamScorePerSec = 0
}

struct {
	array<entity> spawnWaypoints                                                                                                                                                  
	bool isLockout = false
	bool isRampUp = false

	vector cameraLocation
	vector cameraAngles

	#if SERVER
		                                        
		                                        

		                           
		   				               

		             				                
		             				                               

		                                 
		                                     
		                            
		                          
		                       
		                                    
		                             
		                                  
		                                     
		                                  
		                           
		                            
		                                

		                  
		                         
		                         
		                         
		                         

		                            
		                                            
		                                            
		                                                
		                                
		                                        

		                                       
		                      	                                
		                                                                 
		                                             
		                                        
		                                             
		                                                    
		                                       

		       
		                        
		                          
		                                            
		                                         
		                                  
		                             
		                                
		                                           

		      
		                                                                                                 
		                                               
		                                                   
		                                              
		                             
		                               
		                
		                                                                                                                             

		            
		                       
		                       

		                  
		                                                  
		                                               

		          
		                          

		       
		                            
		                                  
		                                  
		                                                                                                    

		                  
		                          
		                                             
		                        
		                
		                     
		                            
		                
		                        
		                     
		                   
		                       
		                     

		                                           
	#endif          

	#if CLIENT || SERVER
		table< int, int > factionToPlayerCountTable
		array< entity > playersUsingLosingTeamExpTiersArray

		                 
		array<entity> objectiveStarterPings
		table< entity, int > objectiveToPingCountTableAllianceA
		table< entity, int > objectiveToPingCountTableAllianceB

		                            
		array< vector > allianceABlockedHomeBasePositionsForMRB = []
		array< vector > allianceBBlockedHomeBasePositionsForMRB = []
	#endif                    

	#if CLIENT
		array<entity> waypointList
		array<entity> flagPropList

		table<entity, var> waypointToMinimapRui
		table<entity, var> waypointToFullmapRui
		table<entity, var> waypointToObjectiveFlare

		var onObjectiveRui
		table<int, var> scoreTrackerRui
		table<int, var> fullmapScoreTrackerRui

		float characterSelectClosedTime = 0
		bool shouldImmediatelyOpenCharacterSelectOnRespawn = false

		array<var> spawnButtons
		table< entity, var > waypointToSpawnButton
		table< var, entity > spawnButtonToWaypoint
		var			spawnHeader
		float		uiVMUpdateTime
		var			bountyTracker

		entity	lastLocalObjectivePing

		var announcementRui
		var fullMapAnnouncementRui
		array<ControlAnnouncementData> announcementData
		ControlAnnouncementData& currentAnnouncement

		entity cameraMover
		bool contextPushed
		bool isPlayerInMapCameraView = false

		var respawnBlurRui
		var inGameMapRui
		bool tutorialShown = false
		table< entity, var > inGameMapPointsToRuis
		array< int > inGameMapPointNestedRuiIndexes

		bool firstTimeRespawnShouldWait = false

		array< ControlTeamData > teamData = [ ControlTeamDataDefaults, ControlTeamDataDefaults ]

		int mrbState
	#endif          

	#if DEV && SERVER
		                            
		                               
	#endif                 
} file


                                                       
                                                                                                                                                     
                                                                                      
global enum eControlStat {
	RATING = 4,
	OBJECTIVES_CAPTURED = 5,
}

  
                                                                                                                                                                 
                                                                                                                                                                  
                                                                                                                                                                  
                                                                                                                                                                  
                                                                                                                                                                  
                                                                                                                                                                  


  



void function Control_Init()
{
	#if CLIENT || SERVER
		AddCallback_EntitiesDidLoad( EntitiesDidLoad )
	#endif                    

	#if DEV && SERVER
		                                                
	#endif                 

	if ( !Control_IsModeEnabled() )
		return

	                                                                                                  
	#if SERVER
		                                                       
		                                                                                                                                  
		                                                                                    
		                                                               
		                                                                 
		                                                                        
		                                                                         
		                                                                

		                                                               

		                     
		                                                                                                                     
		                                                                                                   
		                                                                                                  
		                                                                                                                 
		                                                                                                                         
		                                                                                                                   
		                                                                                                          
		                                                                        

		                                                                                              
		                                                                                                                
		                                                                                                             
		                                                                          
		                                                                                                      
	#endif


	#if CLIENT || SERVER
		CausticTT_SetGasFunctionInvertedValue( true )

		PrecacheParticleSystem( $"P_wpn_evo_upgrade_FP" )
		PrecacheParticleSystem( $"P_wpn_evo_upgrade" )

                       
                                               
    
                                            
                                                
    
                             

		MobileRespawn_SetDeployPositionValidationFunc( Control_MRBTimedEvent_MRBDeployPositionValidation )
	#endif                    

	#if SERVER
		                                                                          
		                                                        

                       
                                               
    
                                                             
                                                                                      
    
       
			                                                                                          
        

		                             
		                                                                                               

		                                                         
		                                                                            
		                                                                              

		                                                                     
		                                                    
		                                                                            
		                                                                                                 
		                                                  
		                                                              
		                                                                               
		                                                        

		                                                          
		                                                    
		                                                 
		                                                           
		                                                                               
		                                                       

		                                        

		                                                                            
		                                                                       

		                                                                                 
		                                                       
		                                                                                       
		                                                                                       

		                                                                                 

		                                            
			                                                           

		                                      
		 
			                                                                                     
			                                                                         
		 

		                                     
		                                                                                                               
		                                                                             
		                                                                                   
		                                                                                         
		                                                                           
		                                                                                  
		                                                                                 
		                                                                                  
		                                                                                   
		                                                                                   
		                                                                                 
		                                                                                  
		                                                                                  
		                                                                                  
		                                                                             
		                                                                        

		                                                        

		                                            
		                                             

		       
			                                                        
		             

		                                                                   
		                                                               
		                                                               

		                                          
		 
			                                                            
			                                                                    
			                                       
			                                       
			                                        
			                                        
			                                        
			                                                                               
			                                                                           
			                                                                 
			                                                                                                            
		 
	#endif          

                       
		#if SERVER
			                                                 
			                                                                  
		#endif              
                                 

	#if CLIENT
		SetCustomScreenFadeAsset( $"ui/screen_fade_control.rpak" )
		ClApexScreens_SetCustomApexScreenBGAsset( $"rui/rui_screens/banner_c_control" )
		ClApexScreens_SetCustomLogoImage( $"rui/hud/gametype_icons/control/control_logo" )
		ClApexScreens_SetCustomLogoSize( <400, 400, 0> )

		PakHandle pakHandle = RequestPakFile( "control_mode", TRACK_FEATURE_UI )
		PrecacheParticleSystem( CONTROL_WAYPOINT_FLARE_ASSET )
		PrecacheParticleSystem( FX_WEAPON_EVO_UPGRADE_FP )
		PrecacheParticleSystem( FX_EXP_LEVELUP_3P )

		Control_RegisterTimedEvents()

		SetDeathCamSpectateTimeOverride( Control_GetMinDeathScreenTime )

		AddCreateCallback( PLAYER_WAYPOINT_CLASSNAME, Control_WaypointCreated_Spawn )
		SURVIVAL_SetGameStateAssetOverrideCallback( ControlOverrideGameState )
		Waypoints_RegisterCustomType( WAYPOINT_CONTROL_AIRDROP, InstanceWPControlAirdrop )
		Waypoints_RegisterCustomType( WAYPOINT_CONTROL_PLAYERLOC, InstanceWPControlPlayerLoc )

		if ( Control_ShouldShow2DMapIcons() )
		{
			RegisterMinimapPackages()
		}

		AddCallback_GameStateEnter( eGameState.Playing, Control_OnGamestateEnterPlaying_Client )
		AddCallback_GameStateEnter( eGameState.Prematch, Control_OnGamestateEnterPreMatch_Client )
		AddCallback_GameStateEnter( eGameState.WinnerDetermined, Control_OnGamestateEnterWinnerDetermined_Client )
		AddCallback_GameStateEnter( eGameState.Resolution, Control_OnGamestateEnterResolution_Client )
		GameMode_OverrideCompletedResolutionCleanupFunc( Control_OnGamestateEnterResolution_Client )
		AddCallback_OnCharacterSelectMenuClosed( Control_OnCharacterSelectMenuClosed )
		AddCallback_OnFindFullMapAimEntity( Control_GetObjectiveUnderAim, Control_PingObjectiveUnderAim )

		                                        
		Fullmap_AddCallback_OnFullmapCreated( Control_OnFullmapCreated )
		AddCallback_OnScoreboardCreated( Control_OnScoreboardCreated )
		AddCreateCallback( "player", Control_OnPlayerCreated )
		AddCallback_OnPlayerChangedTeam( Control_OnPlayerTeamChanged )
		AddCallback_PlayerClassChanged( Control_OnPlayerClassChanged )
		AddOnSpectatorTargetChangedCallback( Control_OnSpectatorTargetChanged )
		AddCallback_OnViewPlayerChanged( Control_OnViewPlayerChanged )
		AddCallback_OnPlayerDisconnected( Control_OnPlayerDisconnected )
		AddCallback_ClientOnPlayerConnectionStateChanged( Control_OnPlayerConnectionStateChanged )

		AddCreateCallback( "prop_script", OnVehicleBaseSpawned )
		AddCreateCallback( PLAYER_WAYPOINT_CLASSNAME, Control_OnPlayerWaypointCreated )
		AddDestroyCallback( PLAYER_WAYPOINT_CLASSNAME, Control_OnPlayerWaypointDestroyed )

		CircleAnnouncementsEnable( false )
		CircleBannerAnnouncementsEnable( false )
		RegisterDisabledBattleChatterEvents( CONTROL_DISABLED_BATTLE_CHATTER_EVENTS )
		RunUIScript( "Control_Respawn_SetKillerInfo" )                         
		SetMapFeatureItem( 400, "#CONTROL_EMPTY_OBJ", "#CONTROL_EMPTY_OBJ_DESC", CONTROL_OBJ_DIAMOND_EMPTY )
		SetMapFeatureItem( 500, "#CONTROL_YOUR_OBJ", "#CONTROL_YOUR_OBJ_DESC", CONTROL_OBJ_DIAMOND_YOURS )
		SetMapFeatureItem( 300, "#CONTROL_ENEMY_OBJ", "#CONTROL_ENEMY_OBJ_DESC", CONTROL_OBJ_DIAMOND_ENEMY )

		RegisterSignal( "Control_PlayerHasChosenRespawn" )
		RegisterSignal( "Control_RequestOpenSpawnMenuOnUI" )
		RegisterSignal( "Control_PlayerStartingRespawnSelection" )
		RegisterSignal( "Control_NewCameraDataReceived" )
		RegisterSignal( "Control_PlayerHideScoreboardMap" )
		RegisterSignal( "OnValidSpawnPointThreadStarted" )
		RegisterSignal( "OnSpawnMenuClosed" )
		RegisterSignal( "Control_OnObjectiveStateChanged_Client" )
		RegisterSignal( "EndUpdateAllianceUIScoreGameState" )
		RegisterSignal( "EndUpdateAllianceUIScoreMap" )


		if ( Control_GetIsMRBTimedEventEnabled() )
			Waypoints_RegisterCustomType( WAYPOINT_CONTROL_MRB, InstanceWPControlMRB)
	#endif          

	#if DEV
		if ( CONTROL_DETAILED_DEBUG )
		{
			printf( "CONTROL: CONTROL_DETAILED_DEBUG is set to true, debug prints that fire very frequently are enabled" )
		}
		else
		{
			printf( "CONTROL: CONTROL_DETAILED_DEBUG is set to false, to enable debug prints that fire frequently set CONTROL_DETAILED_DEBUG to true" )
		}
	#endif       
}

#if CLIENT || SERVER
void function EntitiesDidLoad()
{
	#if SERVER
		                                                                  
		                      
	#endif         

	#if CLIENT
		if( Control_IsModeEnabled() )
		{
			                                                                     
			array<entity> jumpTowerFlags = GetEntArrayByScriptName( "jump_tower_flag" )
			foreach( flag in jumpTowerFlags )
				flag.Destroy()
		}
	#endif         
}
#endif                    


void function Control_RegisterNetworking()
{
	if ( !Control_IsModeEnabled() )
		return

                      
                      
                                               
                                                          
                            
                            

	RegisterNetworkedVariable( "Control_WaveStartTime", SNDC_GLOBAL, SNVT_TIME, 0.0 )
	RegisterNetworkedVariable( "Control_WaveSpawnTime", SNDC_GLOBAL, SNVT_TIME, 0.0 )
	RegisterNetworkedVariable( "Control_IsPlayerOnSpawnSelectScreen", SNDC_PLAYER_EXCLUSIVE, SNVT_BOOL, false )
	RegisterNetworkedVariable( "Control_IsPlayerExemptFromWaveSpawn", SNDC_PLAYER_EXCLUSIVE, SNVT_BOOL, false )
	RegisterNetworkedVariable( "Control_IsLateJoinPlayerFirstSpawn", SNDC_PLAYER_EXCLUSIVE, SNVT_BOOL, false )
	RegisterNetworkedVariable( "Control_ObjectiveIndex", SNDC_PLAYER_EXCLUSIVE, SNVT_INT, -1)
	RegisterNetworkedVariable( "control_personal_score", SNDC_PLAYER_GLOBAL, SNVT_BIG_INT, 0 )
	RegisterNetworkedVariable( "control_current_exp_total", SNDC_PLAYER_EXCLUSIVE, SNVT_BIG_INT, 0 )
	RegisterNetworkedVariable( "control_current_exp_tier", SNDC_PLAYER_EXCLUSIVE, SNVT_INT, 0 )
	RegisterNetworkedVariable( "Control_IsMatchFair", SNDC_GLOBAL, SNVT_BOOL, true )

	Remote_RegisterServerFunction( "ClientCallback_Control_ProcessRespawnChoice", "int", 0, eControlPlayerRespawnChoice._count, "entity" )
	Remote_RegisterServerFunction( "ClientCallback_Control_PlayerRespawningFromMenu" )

	Remote_RegisterClientFunction( "ServerCallback_Control_ShowSpawnSelection" )
	Remote_RegisterClientFunction( "ServerCallback_Control_ProcessImmediatelyOpenCharacterSelect" )
	Remote_RegisterClientFunction( "ServerCallback_Control_PlayerJoinedMatchInProgress" )
	Remote_RegisterClientFunction( "ServerCallback_Control_UpdateSpawnWaveTimerTime" )
	Remote_RegisterClientFunction( "ServerCallback_Control_UpdateSpawnWaveTimerVisibility", "bool" )
	Remote_RegisterClientFunction( "ServerCallback_Control_DeregisterModeButtonPressedCallbacks" )
	Remote_RegisterClientFunction( "ServerCallback_Control_SetDeathScreenCallbacks" )
	Remote_RegisterClientFunction( "ServerCallback_Control_NoVehiclesAvailable" )
	Remote_RegisterClientFunction( "ServerCallback_Control_UpdatePlayerExpHUDWeaponEvo", "bool", "bool" )
	Remote_RegisterClientFunction( "ServerCallback_Control_ProcessObjectiveStateChange", "entity", "int", -1, 2, "int", ALLIANCE_NONE, 2, "int", ALLIANCE_NONE, 2, "int", ALLIANCE_NONE, 2, "int",ALLIANCE_NONE, 2, "bool" )
	Remote_RegisterClientFunction( "ServerCallback_Control_DisplayIconAtPosition", "vector", -1.0, 1.0, 32, "int", 0, eControlIconIndex._count, "int", INT_MIN, INT_MAX, "float", 0.0, FLT_MAX, 32 )
	Remote_RegisterClientFunction( "ServerCallback_Control_BountyActiveAlert", "entity" )
	Remote_RegisterClientFunction( "ServerCallback_Control_BountyClaimedAlert", "entity", "int", INT_MIN, INT_MAX, "int",ALLIANCE_NONE, 2  )
	Remote_RegisterClientFunction( "ServerCallback_Control_AirdropNotification", "bool" )
	Remote_RegisterClientFunction( "ServerCallback_Control_UpdateExtraScoreBoardInfo", "int", 0, 2, "int", INT_MIN, INT_MAX, "int", INT_MIN, INT_MAX )
	Remote_RegisterClientFunction( "ServerCallback_Control_UpdateObjectivePingText", "entity", "int", INT_MIN, INT_MAX, "int", INT_MIN, INT_MAX, "bool" )
	Remote_RegisterClientFunction( "ServerCallback_Control_UpdateObjectivePingCounts", "entity", "int", ALLIANCE_A, ALLIANCE_B + 1, "int", 0, INT_MAX )
	Remote_RegisterClientFunction( "ServerCallback_Control_UpdateLastPingedObjective", "entity", "entity", "entity", "int", INT_MIN, INT_MAX, "bool" )
	Remote_RegisterClientFunction( "ServerCallback_Control_SetIsPlayerUsingLosingExpTiers", "bool" )
	Remote_RegisterClientFunction( "ServerCallback_Control_DisplaySpawnAlertMessage", "int", 0, eControlSpawnAlertCode._count )
	Remote_RegisterClientFunction( "ServerCallback_Control_DisplayWaveSpawnBarStatusMessage", "bool", "int", 0, eControlPlayerRespawnChoice._count )
	Remote_RegisterClientFunction( "ServerCallback_Control_TransferCameraData", "vector", -FLT_MAX, FLT_MAX, 32, "vector", -FLT_MAX, FLT_MAX, 32 )
	Remote_RegisterClientFunction( "ServerCallback_Control_SetControlGeoValidForAirdropsOnClient", "entity" )
	Remote_RegisterClientFunction( "ServerCallback_Control_PlayAllWeaponEvoUpgradeFX", "entity", "int", 0, CONTROL_MAX_EXP_TIER + 1, "bool" )
	Remote_RegisterClientFunction( "ServerCallback_Control_Play3PEXPLevelUpFX", "entity", "int", 0, CONTROL_MAX_EXP_TIER + 1 )
	Remote_RegisterClientFunction( "ServerCallback_Control_PlayCaptureZoneEnterExitSFX", "bool" )
	Remote_RegisterClientFunction( "ServerCallback_Control_NewEXPLeader", "entity", "int", INT_MIN, INT_MAX )
	Remote_RegisterClientFunction( "ServerCallback_Control_EXPLeaderKilled", "entity", "entity" )
	Remote_RegisterClientFunction( "ServerCallback_PlayMatchEndMusic_Control", "int", 0, eWinReason._count )
	Remote_RegisterClientFunction( "ServerCallback_PlayPodiumMusic" )
	Remote_RegisterClientFunction( "ServerCallback_Control_DisplayLockoutUnavailableWarning" )

	RegisterNetworkedVariable( PLAYER_WITH_MRB_NET_NAME, SNDC_GLOBAL, SNVT_ENTITY )
	Remote_RegisterClientFunction( "ServerCallback_Control_MRBTimedEvent_OnMRBPickedUp" )

	Remote_RegisterUIFunction( "Control_RemoveAllButtonSpawnIcons" )
	Remote_RegisterUIFunction( "ControlSpawnMenu_SetLoadoutAndLegendSelectMenuIsEnabled", "bool" )

	if ( IsUsingLoadoutSelectionSystem() )
	{
		Remote_RegisterUIFunction( "ControlSpawnMenu_UpdatePlayerLoadout" )
		Remote_RegisterUIFunction( "UI_OpenControlSpawnMenu", "bool", "int", INT_MIN, INT_MAX )
	}

	#if CLIENT
		RegisterNetVarBoolChangeCallback( "Control_IsPlayerOnSpawnSelectScreen", ServerCallback_Control_OnPlayerChoosingRespawnChoiceChanged )
		RegisterNetVarIntChangeCallback ( "control_current_exp_total", Control_UpdatePlayerExpHUD )
	#endif          
}

bool function Control_ShouldShow2DMapIcons()
{
	                                                                                                          
	return !( GetCurrentPlaylistVarBool( "disable_minimap", false ) ) && !Control_IsModeEnabled()
}

float function Control_GetDefaultExpPercentToAwardForPointSpawn()
{
	return GetCurrentPlaylistVarFloat( "exp_percent_award_spawn_on_point", -1 )
}

float function Control_GetDefaultExpPercentToAwardForBaseSpawn()
{
	return GetCurrentPlaylistVarFloat( "exp_percent_award_spawn_on_base", 1 )
}

bool function Control_ShouldUseRecoveredExpPercentIfGreaterThanDefaults()
{
	return GetCurrentPlaylistVarBool( "exp_recover_exp_percent_if_greater_than_default", true )
}

bool function Control_GetIsMRBTimedEventEnabled()
{
	return GetCurrentPlaylistVarBool( "control_enable_mrb_event", true )
}

                     
                                                   
 
                                                                  
 
                           

bool function Control_IsSpawningOnObjectiveBAllowed()
{
	return GetCurrentPlaylistVarBool( "control_is_b_point_spawn_allowed", true )
}

#if DEV && SERVER
                                    
 
	                                             

	                                                     
	                                                             
	                                                

	                           
 
#endif                 

#if SERVER
                                                
 
	                                                                       
 
#endif          

#if SERVER
                                         
 
	                                                                  
 
#endif          

#if SERVER
                                     
 
	                                                              
 
#endif          

#if SERVER
                                                                                                          
                                                        
 
	                                                                                  
 
#endif          

#if SERVER
                                              
 
	                                                                   
 
#endif          

#if SERVER
                                             
 
	                                                                          
 
#endif          

#if SERVER
                                                         
 
	                                                                    
 
#endif          

#if SERVER
                                                        
 
	                                                                           
 
#endif          

#if SERVER
                                                   
 
	                                                                      
 
#endif          

#if SERVER
                                                      
 
	                                                                                 
 
#endif          

#if SERVER
                                               
 
	                                                                              
		                                 

	                                                
 
#endif          

#if SERVER
                                                                
 
	                                                                                          
 
#endif          

#if SERVER
                                                  
 
	                                                                         
 
#endif          

#if SERVER
                                                
 
	                                                                                                      
 
#endif          

#if SERVER
                                                    
 
	                                                                                                                
 
#endif          

#if SERVER
                                                   
 
	                                                                                                            
 
#endif          


                                                               
#if CLIENT || SERVER
bool function Control_GetAreAirdropsEnabled()
{
	return GetCurrentPlaylistVarBool( "control_enable_airdrops", true )
}
#endif                    

#if CLIENT || SERVER
bool function Control_GetAreBonusCaptureTimedEventsEnabled()
{
	return GetCurrentPlaylistVarBool( "control_enable_bonus_capture_events", true )
}
#endif                    

#if CLIENT || SERVER
bool function Control_GetIsLockoutEnabled()
{
	return GetCurrentPlaylistVarBool( "control_enable_lockout", true )
}
#endif                    

#if CLIENT || SERVER
bool function Control_GetIsLockoutInstantWin()
{
	return GetCurrentPlaylistVarBool( "control_end_game_on_lockout_start", false )
}
#endif                    

#if CLIENT || SERVER
bool function Control_GetIsWeaponEvoEnabled()
{
	return GetCurrentPlaylistVarBool( "control_has_evolving_equipment", false )
}
#endif                    

#if CLIENT || SERVER
                                                                                          
bool function Control_GetIsMinHeldObjectivesOnlyForWinningTeam()
{
	return GetCurrentPlaylistVarBool( "control_is_min_objectives_rule_winners_only", false )
}
#endif                    

#if CLIENT || SERVER
                                                                                           
bool function Control_ShouldTriggerCatchupMechanicsForTeamInBalance()
{
	return GetCurrentPlaylistVarBool( "control_team_inbalance_trigger_catchup", false )
}
#endif                    

#if CLIENT || SERVER
                                                                                         
bool function Control_ShouldSkipSpawnWaveForCatchupMechanic()
{
	return GetCurrentPlaylistVarBool( "control_use_spawn_wave_skip_for_catchup", false )
}
#endif                    

#if CLIENT || SERVER
                                                                    
bool function Control_GetShouldEvoWeaponsOnReload()
{
	return GetCurrentPlaylistVarBool( "weapon_evo_on_reload", false )
}
#endif                    

#if CLIENT || SERVER
int function Control_GetDefaultEquipmentTier()
{
	return GetCurrentPlaylistVarInt( "control_default_equipment_tier", 1 )
}
#endif                    

#if CLIENT || SERVER
int function Control_GetDefaultWeaponTier()
{
	return GetCurrentPlaylistVarInt( "control_default_weapon_tier", 1 )
}
#endif                    

#if CLIENT || SERVER
                                                                                      
                                                                                 
int function Control_GetMinHeldObjectivesToGenerateScore()
{
	int minHeldObjectives = GetCurrentPlaylistVarInt( "control_min_held_zones_to_score", 0 )

	#if SERVER
		                                                              
		                                                                                                                                                 
	#endif          

	return minHeldObjectives
}
#endif                    

#if CLIENT || SERVER
                                                                                                                                                
int function Control_GetPointDiffForCatchupMechanics()
{
	return GetCurrentPlaylistVarInt( "control_point_diff_to_be_losingteam", 0 )
}
#endif                    

#if CLIENT || SERVER
float function Control_GetMinDeathScreenTime()
{
	return GetCurrentPlaylistVarFloat( "control_min_deathscreen_time", 4.0 )
}
#endif                    

#if CLIENT || SERVER
float function Control_GetMaxDeathScreenTime()
{
	return GetCurrentPlaylistVarFloat( "control_max_deathscreen_time", 20.0 )
}
#endif                    

#if CLIENT || SERVER
const float MIN_MRB_LIFETIME = 20.0
float function Control_GetMRBSpawnLifetime()
{
	float mrbLifetime = GetCurrentPlaylistVarFloat("control_mrb_event_spawn_lifetime", CONTROL_DEFAULT_MRB_LIFETIME )
	                                                                                                                                                                                     
	                                                     
	Assert( mrbLifetime >= MIN_MRB_LIFETIME, "Control MRB lifetime is set to be shorter than the min lifetime of " + MIN_MRB_LIFETIME )

	return mrbLifetime
}
#endif                    

#if CLIENT || SERVER
float function Control_GetMRBAirdropDelay()
{
	return GetCurrentPlaylistVarFloat("control_mrb_event_airdrop_delay", CONTROL_DEFAULT_MRB_AIRDROP_DELAY )
}
#endif                    

#if UI
                                                                           
array< aboutGamemodeDetailsTab > function Control_PopulateAboutText()
{
	array< aboutGamemodeDetailsTab > tabs
	string playlistUiRules = GetPlaylist_UIRules()

	if ( !GameModeHasRules() || playlistUiRules != GAMEMODE_CONTROL )
		return tabs

	aboutGamemodeDetailsTab tab1
	aboutGamemodeDetailsTab tab2
	aboutGamemodeDetailsTab tab3
	aboutGamemodeDetailsTab tab4

	array< aboutGamemodeDetailsData > tab1Rules
	array< aboutGamemodeDetailsData > tab2Rules
	array< aboutGamemodeDetailsData > tab3Rules
	array< aboutGamemodeDetailsData > tab4Rules

	int withSquadBonusEXPVal = GetCurrentPlaylistVarInt( "exp_value_playing_with_squad", 5 )

	                                              
	tab1.tabName = "#GAMEMODE_RULES_OVERVIEW_TAB_NAME"
	tab1Rules.append( UI_GameModeRulesDialog_BuildDetailsData( "#CONTROL_RULES_CAPTURING_HEADER", "#CONTROL_RULES_CAPTURING_BODY", $"rui/hud/gametype_icons/control/about_capture" ) )
	tab1Rules.append( UI_GameModeRulesDialog_BuildDetailsData( "#CONTROL_RULES_RATINGS_HEADER", "#CONTROL_RULES_RATINGS_BODY", $"rui/hud/gametype_icons/control/about_ratings" ) )
	tab1Rules.append( UI_GameModeRulesDialog_BuildDetailsData( "#CONTROL_RULES_TIMEDEVENT_HEADER", "#CONTROL_RULES_TIMEDEVENT_BODY", $"rui/hud/gametype_icons/control/about_events" ) )

	                                          
	tab2.tabName = "#CONTROL_RULES_RATINGS_TAB_NAME"
	string killRatingsBody = Localize( "#CONTROL_RULES_KILL_RATINGS_BODY", string( GetCurrentPlaylistVarInt( "exp_value_kill", 20 ) ), string( GetCurrentPlaylistVarInt( "exp_value_kill_assist", 20 ) ), string( GetCurrentPlaylistVarInt( "exp_value_mrb_deployed", 50 ) ), string( withSquadBonusEXPVal ) )
	string specialKillRatingsBody = Localize( "#CONTROL_RULES_SPECIAL_KILL_RATINGS_BODY", string( GetCurrentPlaylistVarInt( "exp_value_kill_attacker", 15 ) ), string( GetCurrentPlaylistVarInt( "exp_value_kill_defender", 15 ) ), string( GetCurrentPlaylistVarInt( "exp_value_kill_high_tier", 15 ) ), string( GetCurrentPlaylistVarInt( "exp_value_kill_reallyhigh_tier", 25 ) ), string( GetCurrentPlaylistVarInt( "exp_value_kill_expleader", 50 ) ) )
	string objectiveRatingsBody = Localize( "#CONTROL_RULES_OBJECTIVE_RATINGS_BODY", string( GetCurrentPlaylistVarInt( "exp_value_capturing", 5 ) ), string( GetCurrentPlaylistVarInt( "exp_value_contesting", 10 ) ), string( GetCurrentPlaylistVarInt( "exp_value_defending_active", 10 ) ), string( GetCurrentPlaylistVarInt( "exp_value_neutralize", 50 ) ), string( GetCurrentPlaylistVarInt( "exp_value_capture", 50 ) ), string( withSquadBonusEXPVal ) )
	string teamRatingsBody = Localize( "#CONTROL_RULES_TEAM_RATINGS_BODY", string( GetCurrentPlaylistVarInt( "exp_value_team_neutralize", 25 ) ), string( GetCurrentPlaylistVarInt( "exp_value_team_capture", 25 ) ), string( CONTROL_TEAMSCORE_LOCKOUTBROKEN ) )
	tab2Rules.append( UI_GameModeRulesDialog_BuildDetailsData( "#CONTROL_RULES_KILL_RATINGS_HEADER", killRatingsBody, $"rui/hud/gametype_icons/control/about_kill_ratings" ) )
	tab2Rules.append( UI_GameModeRulesDialog_BuildDetailsData( "#CONTROL_RULES_SPECIAL_KILL_RATINGS_HEADER", specialKillRatingsBody, $"rui/hud/gametype_icons/control/about_special_kill_ratings" ) )
	tab2Rules.append( UI_GameModeRulesDialog_BuildDetailsData( "#CONTROL_RULES_OBJECTIVE_RATINGS_HEADER", objectiveRatingsBody, $"rui/hud/gametype_icons/control/about_objective_ratings" ) )
	tab2Rules.append( UI_GameModeRulesDialog_BuildDetailsData( "#CONTROL_RULES_TEAM_RATINGS_HEADER", teamRatingsBody, $"rui/hud/gametype_icons/control/about_team_ratings" ) )

	                                   
	tab3.tabName = "#CONTROL_RULES_SPAWNING_TAB_NAME"
	string baseSpawnBody = Localize( "#CONTROL_RULES_BASE_SPAWN_BODY", string( Control_GetDefaultExpPercentToAwardForBaseSpawn() * 100 ) )
	tab3Rules.append( UI_GameModeRulesDialog_BuildDetailsData( "#CONTROL_RULES_BASE_SPAWN_HEADER", baseSpawnBody, $"rui/hud/gametype_icons/control/about_base_spawns" ) )
	tab3Rules.append( UI_GameModeRulesDialog_BuildDetailsData( "#CONTROL_RULES_FORWARDBASE_SPAWN_HEADER", "#CONTROL_RULES_FORWARDBASE_SPAWN_BODY", $"rui/hud/gametype_icons/control/about_forwardbase_spawns" ) )
	tab3Rules.append( UI_GameModeRulesDialog_BuildDetailsData( "#CONTROL_RULES_CENTRAL_SPAWN_HEADER", "#CONTROL_RULES_CENTRAL_SPAWN_BODY", $"rui/hud/gametype_icons/control/about_central_spawns" ) )

	tab1.rules = tab1Rules
	tab2.rules = tab2Rules
	tab3.rules = tab3Rules
	tab4.rules = tab4Rules

	tabs.append( tab1 )
	tabs.append( tab2 )
	tabs.append( tab3 )
	tabs.append( tab4 )

	return tabs
}
#endif      

                                                                                                                          
  
                                                                                                                                                          
                                                                                                                                                           
                                                                                                                                                           
                                                                                                                                                           
                                                                                                                                                           
                                                                                                                                                           

                                                                                                                                                                   
#if SERVER
                                                        
 
	                          
	                                    
	                                     
		                                             
	                                 
		                                      
	                                       
		                                                 

	       
		                                                                                                        
	             

	                               
 
#endif          

#if SERVER
                                                                  
 
	                                 
	                                                   
	                               
	 
		                                                                                                                      
		      
	 

	                                                                     
		                                                                                                                                                    

	                                                                

	                     
	                        
	                                     
	                                            

	                                                      
	                            
	 
		                                                   
			                   
	 

	       
		                                                                                                                    
	             

	                                 
 
#endif          

#if SERVER
                                                                  
 
	                                 
	                                                   
	                               
	 
		                                                                                                                             
		      
	 

	                                                                     
		                                                                                                                                                          

	                                                                

	       
		                                                                                                                        
	             

	                                       
 
#endif          

#if SERVER
                                                         
 
	                                                                        
	                                        
	                        
		      

	                                              
	                                                                 
	 
		                                  
	 
 
#endif          

#if SERVER
                                                                            
 
	                                                    
	                        
		      

	                                                              
		                                                                                                                                                       

	                                                   
 
#endif          

#if SERVER
                                                                           
 
	                                 
	                                                        
	                               
	 
		                                                                                                                                               
		      
	 

	                                                                     
		                                                                                                                                                               

	                                                                

	       
		                                                                                                                                  
	             

	                                                    
 
#endif          

#if SERVER
                                                                
 
	                                                                       
	                                                              
	 
		       
			                                             
		             

		                                       
	 
 
#endif          

#if SERVER
                                             
 
	                                                                
	                                   
	 
		                                                   
		 
			                                         

			                             
			 
				                                     
				                       

				                                                    
				                                                  
				 
					                                   
					                                               
				 
			 
			    
			 
				       
					                                                                      
				             

				                   
			 
		 
	 
 
#endif          

#if SERVER
                                                                                                                                                                           
                                                                                  
 
	                         
		      

	                                                                
	                                    
	 
		                                                     
		 
			                                         

			                              
			 
				                                                                  
				                                                  
				 
					                                               
					                                                                                                                  
				 
			 
		 
	 
 
#endif          

#if SERVER
                                                               
 
	                                 
	                                              
	                               
	 
		                                                                                                                     
		      
	 

	                                                                     
		                                                                                                                                                   

	                                                                

	       
		                                                                                                                      
	             

	                                                                         
	                                        
 
#endif          

#if SERVER
                                                            
 
	                                 
	                                             
	                              
	 
		                                                                                                       
		      
	 

	                                                                        
		                                                                                                                                                   

	                           
	                     

	                             
 
#endif          

#if SERVER
                                                                        
 
	                                         

	                                                                  
		      

	                          
	 
		                                                                
			                                                                                                                                                    

		                                           
	 
	                               
	 
		                                                             
	 

	                                                         
	                      
	 
		                                                                                                       

		       
			                                  
				                                                                                                                                        
		             
	 
 
#endif          

#if SERVER
                                    
                                                           
 
	                              
	 
		              
	 
 
#endif          

#if SERVER
                                                                  
 
	                                 
	                                              
	                               
	 
		                                                                                                                       
		      
	 

	                                                                     
		                                                                                                                                                      

	                                                                  

	       
		                                                                                                                         
	             

	                                   
 
#endif          

#if SERVER
                                                                       
 
	                                                                                                                                                                                                                                        
	 
		                                 
		                                              
		                               
		 
			                                                                                                                                   
			      
		 

		                                                                     
			                                                                                                                                                            

		                                                                  

		       
			                                                                                                                               
		             

		                                        
	 
	    
	 
		              
	 
 
#endif          

#if SERVER
                                          
 
	                         
 
#endif          

#if SERVER
                                
 
	                                                                              
	             
	                                 
	                                                                                       

	                                                    
	                              
	 
		                                                
		 
			                                                     
			 
				         
				                           
				     
			 
		 
	 

	                                                                                           
	                            
	 
		                                                                                                                                         
		                                                
		 
			                                                              
		 

		                                  
		                                                  
	 

	                                                

	       
		                                                                                                                                                                                           
	             

	                                
	                                   
	                           
	                                         
	                                      
	                              
	                                   

	                      
	                        
	                           

	                                                                                 
	                            

	                                    

	                             

	                                                              
	                                          
	 
		                                                                                                                            
	 
 
#endif          

#if SERVER
                                                 
 
	                                                            
	                                               
	 
		                                              
		                                                             
		 
			                                                    
		 
		    
		 
			                          
			                                                                 
			                                     
			 
				                                       
					                                         
				               
			 

			                       
			                                   
		 
	 
	                             

	                                             
	 
		                                        
		                                                            
		                                                            
		                                                              
		                                                                 

		       
			                                  
				                                                                                                           
		             
	 
 
#endif          

#if SERVER
                                              
 
	                                                  
	                                                  
	 
		                                         
		                                                   
		                                                                

		                                                           
		 
			                                       
		 
	 
	                              
 
#endif          

#if SERVER
                                         
 
	                                                
	                                                
	 
		                                  
		                                              
		                                                                

		                                                           
		 
			                                  
			              
		 
	 
	                            
 
#endif          

#if SERVER
                                          
 
	                                      
	 
		                                           
		                                                      
		                                                                

		                                                           
			                                                 

		                                                                       
		 
			                   
			                                                      
			 
				                                                     
				 
					                        
					     
				 
			 

			                       
			                                                                                                      
			 
				                                                                                                             
			 
			    
			 
				                    
				                      
				                                                                                                       
			 
		 
		                                                                         
		 
			                             
			                                                                                    
		 
	 
 
#endif          

#if SERVER
                                                    
 
	                                                           
	                                                           
	 
		                                             
		                                              
		                                                                

		                                                           
		 
			                                  
			              
		 
	 
	                                       
 
#endif          

#if SERVER
                                                 
 
	                                                        
	                                                        
	 
		                                          
		                                              
		                                                                

		                                                           
		 
			                                  
			              
		 
	 
	                                    
 
#endif          

#if SERVER
                                                              
                                            
 
	                                                       
	                                                   
	 
		                                        
		                                                 
		                                                                  

		                                                           
		 
			                                         
			                 
		 
	 
	                                   
 
#endif          

#if SERVER
                                                                    
                                                 
 
	                                                                 
	                                                        
	 
		                                                  
		                                                      
		                                                                  

		                                                           
		 
			                                                   
			                      
		 
	 
	                                             
 
#endif          

#if SERVER
                                                  
 
	                                                                    
	                                                        
	 
		                                                     
		                                                           
		                                                                  

		                                                           
		 
			                                                             
			                           
		 
	 

	                                                

	                                       
		                                                                                                     

	                                        
	 
		                            
	 
	    
	 
		                                                            
		                                                            
	 
 
#endif          

#if SERVER
                                          
 
	                          
	                             
	                                                        
		                                       
	                                                            
		                                                 

	                                                         
	                                  
	                                   
	 
		                                                                                      
			                                      
	 

	                                                             
	                                   
	                                                                  

	                                               
	                                                
	                                  
	                                                                                                    
	                                                                          
	                                                    

	                                    
	                                                          
 
#endif          

#if SERVER
                                         
 
	                                                                                 
	                                                                    

	                                 
	                                                                  
	 
		                                                                
		                           
		 
			                         
		 
		    
		 
			                                         
			                                                       
			                                    
			                                       
			 
				                                                    
				                                                               
				                                            
				 
					                  
					     
				 
			 
			                                         
		 
	 
	                                                

	                  
	                                                        
	 
		                              

		                                  
		                                      
		                                                    
		                                    
		                                        
		                                       
		                                   
		                                       
		                                     
		                                     

		                                                           
		                                                          
		                                    
		                

		                     
		                                                                  

		            
		                                                                 
	 
 
#endif          

#if SERVER
                                      
 
	                                  
	                                  

	                                           
	 
		       
			                                                                      
		             

		                     
		          
		          
		                

		                                        
			                                      
		                                        
			                                      
		                                 
			                                     

		                                                                                                
		                                                                
		                                                               
		                                         

		                                 
			                                                  
		                                      
			                                                  
		    
			                                                                                                                                                                                

		                                   
	 

	                                               
	                                          
	                                          

	                                                    

	                                                       
		                                                                              
	                                                       
		                                                                              
 
#endif          

#if SERVER
                                        
 
	                       
 
#endif          

#if SERVER
                                          
 
	                          
		      

	                                                
	                                         
	                                     
	                                 

	                                                        
	 
		                              
		                                                                                         

		                          
		                              
		                                
		 
			                    
			                          
		 

		                                       
		                                                                       
		                                                                         
		                            
		                                                                                                                                                                          
		                         
		                                           

		                   

		                   
		                                     
		 
			                                                                                        
			                                                                                 
			                                      
			                                   
			                                          
			                                          
			                                                      
			                                                
			                               
		 

		                                               

		                                              
			                                                                                         
		    
			                                                      
		                                                                                                                           
		                                                                            
		                                                                                   
		                                                                                                                                                            
		                                                                                                                                                            
		                                          
	 

	                                

	                                                              
	                                  
	                                                 
	                                                 

	                                      

	                          

	                                    
	                               
 
#endif          

#if SERVER
                                      
 
	                                          
	                               
 
#endif          

#if SERVER
                                           
 
	                                               
		      

	                                

	                                                   
	                               
		      

	                              
		                                                                                                      

	                                                                                                             
	                                                                               
	                            
		      

	                                     
	                               
	                          
	 
		                                                                                 
		 
			                                                 
			                                                                                            
				        

			                                        
			 
				                                               
				                                            
				 
					                                           
					     
				 
			 
		 
	 

	                                                                    
	                                         
	 
		                                                                                      
		                                                                                                                                                     

		                           
		 
			                                                  
			                                                                                                                                                       
		 
		                                
		 
			                                                  
			                                                                                                                                                       
		 
		                                
		 
			                                                  
			                                                  
			                                                                                                                                                                
		 
	 

	                                                   
	 
		                                            
		                                                 
		                                                                                                     
		                                                          
		                                                                           
	 
	                                                   
	 
		                                            
		                                                                                                                   
		                                                                                                     
		                                                          
		                                                                           
	 

	                                                                    
	                                                                                      
 
#endif          

#if SERVER
                                                                             
 
	                          
	                                                           

	                             
	                                                                                                                         

	                                                            
	                          
	 
		                                                                    

		                                                    
		                                                                        
		                                   

		                                            
		                                                                                                    

		                                     
		                                                    

		                                    

		                                                                                                                                             
	 
 
#endif          

#if SERVER
                            
                                                            
 
	               
	 
		       
			                                                                      
		       
			                                                                         
		       
			                                                                       
		       
			                                                               
		       
			                                                              
		       
			                                                                
		       
			                                                                      
		       
			                                                                    
		       
			                                                          
		       
			                                                         
		        
			              
	 
	           
 
#endif          

#if SERVER
                                                        
 
	       
		                                                                     
	             

	                              
 
#endif          

#if SERVER
                                       
 
	                                         

	                                   
	                             

	                                                             
	 
		               
		                                               
			                                           
		                                                   

		                                                                      

		              
		                                                         

		                                     

		                                                          
		                         
		 
			                                            
			                                                   
			 
				                                                                          
			 
			                                                        
			 
				                                                                          
			 
		 

		           
	 

	                                                        
	 
		                                                                      
		                                                 
	 
 
#endif          

#if SERVER || CLIENT
                                                                                     
void function Control_SetHomeBaseBadPlacesForMRBForAlliance( int alliance, array < vector > locations )
{
	if ( alliance == ALLIANCE_A )
	{
		file.allianceABlockedHomeBasePositionsForMRB.extend( locations )
	}
	else if ( alliance == ALLIANCE_B )
	{
		file.allianceBBlockedHomeBasePositionsForMRB.extend( locations )
	}
}
#endif                    


#if SERVER
                                                                     
 
	                                                                                          
	                                                                                                   
	                                
	                                     

	                             
	 
		                                                                         
	 
	    
	 
		                                                                         
	 

	              
 
#endif          

#if SERVER
                                                          
 
	                                                                                              
	                           
	                                     
	                                                       

	                                                                          

	              
 
#endif          

#if SERVER
                                                                          
 
	                                                                                                      
	                                   
	                                     

	                                                                         

	              
 
#endif          

#if SERVER
                                                    
 
	       
		                                              
	             

	                                                  
		                                        

	                                                  
	                                                                                                                                  
		                                                           
 
#endif          

#if SERVER
                                                                       
 
	       
		                                             
	             

	                                                 
	 
		                                                   

		                        
			                                                         
	 
 
#endif          

#if SERVER
                                                                       
 
	                                               

	                             
	                               

	                       
	                              

	            
		                          
		 
			                                                 
			 
				                                                                                                                                                                         
				 
					                                                       
					                                                                                              
				 
				                                                                 
				                                                 
			 
		 
	 

	                                                       
	                                                                               
		           

	                            
 
#endif          

#if SERVER
                                                    
 
	                       
	                                    
	 
		                               
		 
			                                   
			        
		 

		                                                                                                                                  
		 
			                                   
		 
	 

	                       
 
#endif          

#if CLIENT
                                                                                                                                                                                                                        
void function ServerCallback_Control_SetControlGeoValidForAirdropsOnClient( entity geo )
{
	if ( IsValid( geo ) && !GetAllowedAirdropDynamicEntitiesArray().contains( geo ) )
		AddToAllowedAirdropDynamicEntities( geo )
}
#endif          

#if CLIENT
                                                                         
void function ServerCallback_Control_DeregisterModeButtonPressedCallbacks()
{
	Control_DeregisterModeButtonPressedCallbacks()
}
#endif          

#if CLIENT
void function ServerCallback_Control_SetDeathScreenCallbacks()
{
	DeathScreen_SetModeSpecificRuiUpdateFunc( Control_DeathScreenUpdate )
	DeathScreen_SetDataRuiAssetForGamemode( DEATH_SCREEN_RUI )
	SetSummaryDataDisplayStringsCallback( Control_PopulateSummaryDataStrings )
}
#endif          

#if SERVER || CLIENT
                                                                                        
                                                                                   
                                                                                                                                                                             
                                                                                                                                                                                 
                                                                                    
void function Control_RegisterTimedEvents()
{
	                                       
	if (  Control_GetIsLockoutEnabled() )
	{
		TimedEventData lockoutData
		lockoutData.shouldShowPreamble = false

		#if SERVER
			                                   
			                                            
			                                                            
			                                 
			                                
			                                                        
			                                                                              
			                                               
		#endif          

		#if CLIENT
			lockoutData.eventName = "#EVENT_LOCKOUT_NAME"
			lockoutData.infoOverrideFunctionThread = Control_LockoutInfoOverride_Thread
			lockoutData.shouldHideTimer = false
		#endif          

		TimedEvents_RegisterTimedEvent( lockoutData )
	}

	                                       
	if ( Control_GetAreAirdropsEnabled() )
	{
		TimedEventData airdropData
		airdropData.shouldShowPreamble = false
		#if SERVER
			                                   
			                                            
			                                          
			                                                                    
			                                 
			                                  
			                              
			                                                                              
		#endif          

		#if CLIENT
			airdropData.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL )
			airdropData.eventName = "#EVENT_AIRDROP_NAME"
			airdropData.eventDesc = "#EVENT_AIRDROP_DESC"
			airdropData.shouldHideTimer = true
		#endif          

		TimedEvents_RegisterTimedEvent( airdropData )
	}

	                                          
	if ( Control_GetIsMRBTimedEventEnabled() )
	{
		TimedEventData mrbEventData
		mrbEventData.shouldShowPreamble = true
		mrbEventData.shouldHideUntilPrembleDone = true
		#if SERVER
			                                    
			                                              
			                                           
			                                                                    
			                                   
			                                   
			                                
			                                                                                     
		#endif          

		#if CLIENT
			mrbEventData.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL )
			mrbEventData.eventName = "#EVENT_STARTS_IN"
			mrbEventData.eventDesc = "#EVENT_MRB_DESC"
			mrbEventData.shouldHideTimer = false
			mrbEventData.shouldAutoShowSuddenDeathText = false
			mrbEventData.infoOverrideFunctionThread = Control_MRBTimedEvent_InfoOverride_Thread
		#endif          

		TimedEvents_RegisterTimedEvent( mrbEventData )
	}

	                                       
	if ( Control_GetAreBonusCaptureTimedEventsEnabled() )
	{
		TimedEventData bountyData
		bountyData.shouldShowPreamble = true
		bountyData.shouldHideUntilPrembleDone = true
		#if SERVER
			                                  
			                                            
			                                         
			                                                          
			                                 
			                                 
			                              
			                                                                            
		#endif          

		#if CLIENT
			bountyData.eventName = "#EVENT_STARTS_IN"
			bountyData.eventDesc = "#EVENT_BOUNTY_DESC"
			bountyData.infoOverrideFunctionThread = Control_BountyInfoOverride_Thread
			bountyData.shouldHideTimer = false
		#endif          

		TimedEvents_RegisterTimedEvent( bountyData )
	}

	#if SERVER
		                                                              
	#endif          
}
#endif                    

#if CLIENT
                                                                                          
entity function Control_GetObjectiveUnderAim( vector worldPos, float adjustedRange )
{
	float closestDistSqr = FLT_MAX
	entity closestEnt
	array<entity> objectiveArray = file.waypointList
	foreach ( objective in objectiveArray )
	{
		if ( !IsValid( objective ) )
			continue

		vector objectiveOrigin = objective.GetOrigin()
		if ( fabs( objectiveOrigin.x - worldPos.x ) > adjustedRange || fabs( objectiveOrigin.y - worldPos.y ) > adjustedRange )
			continue

		float distSqr = Distance2DSqr( objectiveOrigin, worldPos )
		if ( distSqr < closestDistSqr )
		{
			closestDistSqr = distSqr
			closestEnt     = objective
		}
	}

	return closestEnt
}
#endif          

#if CLIENT
                                                                        
bool function Control_PingObjectiveUnderAim( entity objective )
{
	entity player = GetLocalClientPlayer()

	if ( !IsValid( player ) )
		return false

	Ping_SetControlObjective( player, objective )
	return true
}
#endif          

#if CLIENT
                                                                        
void function Control_PingObjectiveFromObjID( int objID )
{
	entity player = GetLocalClientPlayer()

	if ( !IsValid( player ) )
		return

	foreach ( ping in Control_GetObjectiveStarterPings() )
	{
		if ( !IsValid( ping ) )
			continue

		int objectiveWaypointPingType = Waypoint_GetPingTypeForWaypoint( ping )
		if ( objectiveWaypointPingType == ePingType.CONTROL_OBJECTIVE_DEFEND || objectiveWaypointPingType == ePingType.CONTROL_OBJECTIVE_ATTACK )
		{
			if ( IsValid( ping.GetParent() ) && IsValid( ping.GetParent().GetOwner() ) )
			{
				entity pingedObjective = ping.GetParent().GetOwner()
				int pingedObjectiveObjID = pingedObjective.GetWaypointInt( INT_OBJECTIVE_ID )
				if ( pingedObjectiveObjID == objID )
					Ping_SetControlObjective( player, pingedObjective )
			}
		}
	}
}
#endif          



  
                                                                                                                                                                                      
                                                                                                                                                                                       
                                                                                                                                                                                       
                                                                                                                                                                                       
                                                                                                                                                                                       
                                                                                                                                                                                       

                                                                                                                                                                                         
#if SERVER
                                                                                                                                                                                                                                    
                                           
 
	                                            
	 
		                                      
	 

	                                   
	                                              
	                                              

	                                                                          
	                                     
	 
		                                                                                                                                                                                  
			                                                                   
	 
 
#endif          

#if SERVER
                                                                   
 
	            
 
#endif          

#if SERVER
                                             
 
	            
 
#endif          

#if SERVER
                                                                    
 
	                                                                                                           
	                                                                              
	                                                  
	                                                                                                                            

	                              
	 
		                               
		              

		                                                                                    

		                                                                                            
		                                      
		 
			        
			                                                    
		 
	   
 
#endif          

#if SERVER
                                                
 
	                                                                              
	                                                  
	                                                                                                                            
	                                                             

	                                                                                                                                                              
	                                                                                                                              
	 
		                                          
		                                                                     

		                                                                                                
		 
			                                                                                                     
		 
	 

	                                  

	                                                                                                                                       
		                                                                   

	                                                                                                                                                                                              
	                                                                      
	 
		                
		                                                           
		                                                                   
	 

	                                                                                                                                         
	                                                            
		                                                              
 
#endif          

#if SERVER
                                                                    
                                                          
 
	                                                                                                                            
 
#endif          

#if SERVER
                                                 
                                                   
 
	                        
	 
		                                                                                             
	 
 
#endif          

#if SERVER
                                                
 
	                                               

	                             
	                               

	                                                                        
		           

	                                                                                                                                                                             
	                                   

	                                    

	                                                        

	                                               

	                                              
	 
		                                                                             
		                                               
	 

	                                      
	                                                               

	                                  
		                                                     
	                              
		                                              

	                                                   
	                                                                
		                                                  

	               
	                                         

	                                                                                                               
	                                                                                       
	 
		                              
		                                                                    
	 
	
	                                
	                                                                                                           
	                                      

	                                      
 
#endif          

#if SERVER
                                                                       
 
	                                                                                 
	                         
		      

	                                                      
	                          
	 
		                         
			      

		                                 
		                                     

		                                                 
		 
			                                     
		 
	 
 
#endif          







  
                                                                                 
                                                                                  
                                                                               
                                                                                
                                                                                 
                                                                                  


                                                                                            
                                                                                             
                                                                                          
                                                                                          
                                                                                          
                                                                                          

                                                                                               
#if SERVER || CLIENT
                                                                    
bool function Control_IsPointAnFOB( int pointIndex )
{
	return pointIndex == CONTROL_FOB_INDEX_ALLIANCE_A || pointIndex == CONTROL_FOB_INDEX_ALLIANCE_B
}
#endif                    

#if SERVER
                                                                              
 
	                               
		      

	                                                                                
	                                                     
		                                           

	                                                           
	                                                                                                

	       
		                             
			                                                
	             
 
#endif          

#if SERVER
                                                                             
 
	                               
		      

	                                                                                
	                                                    
		                                                      

	                                                      
	                                                                                                 

	       
		                             
			                                             
	             
 
#endif          

#if SERVER
                                                                                                                  
                                                                                                                                  
                                                                                                                                         
                                                                                                                    
                                                                  
                                                                                        
                                                                 
 
	                                               

	                                                       
	                           
	                            
	                              

	                                     

	            
		                     
		 
			                               
				                       
		 
	 

	                  
	                                                                                                     
	 
		                          
		                                                    
		                                                      
		                                               

		                                                                  
		 
			                               
			                           
		 

		                                                                                       
		 
			                                                                                   
			                                                           

			                                                
			                                                  
			                  
				           

			                                  
			                                                                          
			                                                         
			                                                         
			                                                                                                                  
		 
		    
		 
			                             
			                             

			                                               
			 
				                        
				 
					                                                       
						                       
					                                                            
						                       

					                                                                 
					                                                     
						                                                                                                                   
					    
						                                                   
				 
			 

			                                                                             
			                                                                             

			                                                                                        
			                                                                                                                                    
			                                                                                                                                                                                              
			                                                                                       
			                                        

			                                         
			                                 
			                                                    
				                          
			                                                         
				                          

			                                            
			                                     
			 
				           
			 
			    
			 
				                                      
			 

			                                                                                   
			                                                                                                                                            
			                                                                                                                                                                                                                                                            
				                      

			                                                  

			                   
			 
				                               
				           
				                                                                                                                           
				                                          
			 
			                                                                   
			 
				                   
				              
				                                                                                                                                                                                      
				                                                                                                                 
				                                                       
				                                                   
			 
			                                                                                                  
			 
				                                                   
				                                                                                                                 
			 
			    
			 
				                                                                                                                 
			 

			                                  
			                                                                          

			                                                   
			                                     
			 
				                                                
				 
					                                                                               
					 
						                                                   
							                                                                                                               
						    
							                                                 
					 
				 
			 
		 

		                               
		                                                             
			                                                                                                                                   
		    
			                                                           

		                          
		           
	 
 
#endif          

#if SERVER
                                                                                                    
                                                                                          
 
	                              
	                                                                                       

	                                                    
	 
		                                                                    
		                                                                         
			                                     
	 
	                          
 
#endif          

#if SERVER
                                            
                                             
 
	                                               

	                                                            
	                                                

	                                             
	                                                                                    

	                          
	 
		                                            
		                                            
		                                                
	 

	                                              
	 
		                                                               
		                                                           
		                                                           

		                                                                                                                 
		                                            
		                                                                                                                                                                         

		                                                         
		                                                                                                                                   

		                                                            
		                                                                                                    
		                                                                                    

		                    
		                                                                        
		                                                                        
		                                                                                              
		                                                                                              

		                                         
		 
			                                
			                                               
		 

		                                         
		 
			                                
			                                               
		 

		                          
		                               

		                                                                    
			                                                  

		                                   
		 
			       
				                                                                              
			             
			                                                        
			     
		 

		                     
		                          
		 
			                                                           
			                                             
			                                                       
			                                                     

			                                                          
			                                                                                                           
			 
				                                                                     
				                                                                                  
				                                           
			 

			                                                                           
			                                                                                                                                                                 
			 
				                                                                    
				                                                                              
				                                           
			 

			                           
			                                                                                                               
			 
				                                                                     
				                                                                                  
				                                               
			 
		 

		                    
		                                                                 
		                                                            
		 
			                      
				                                                   
			                    
			                        
		 
		                                                             
		 
			                      
				                                                   
			                        
		 
		                                                            
		 
			                      
				                                                   
			                        
		 
		                                                             
		 
			                      
				                                                   
			                        
		 

		                               
	 
 
#endif          

#if SERVER
                                                                                                                  
 
	                               
	                                     
	                                                                         
	                                                  

	                                  
	                                                                                  
	                                                                 
	                                                                                              

	                                     

	                                          
	                                            
	            
	 
		                                           
		                                                                                                                                                                           
		                                                                

		                                                                                                                                     
		                                                                                                  
		 
			                                      
			 
				                                                                                                                                              
				 
					                                                                              
					                                                                                                                                                                                
					                                                                              
					                     
						                                                                                                                              
				 
			 
		 
	 
	                                                   
	 
		                                                                                      
		                                                                                                      
		                                                                                     
		                                                                                               
		                                                                   

		                                                                                                                                     
		                                                                                                     
		 
			                                      
			 
				                                                                                                                                              
				 
					                                                                                                                              
				 
			 
		 
	 

	                                                       
	                                                                                                                                 
		      

	                                                           
	                                                                                                                      
	 
		                  
		                                                     
	 

	                                                       
	                                                                           
		      

	                                       

	                           
	                                                        
	 
		                                               
			                     
	 

	                                                                                             

	                                                                                                                                                                              

	                                                                                                            
	                                                                                                                                                                                    
	 
		                                          
		 
			                                                                                                  
		 
	 
 
#endif          

#if SERVER
                                                
                                                                                                               
 
	                                                
		      

	                         

	                                                                                                                          
	                                                                                                                                                                                     
	 
		                                                                    
	 
	                                                                                                                                                            
	 
		                    
		 
			                                                       
			                 
			 
				                               
					                                                               
					     
				                               
					                                                               
					     
				                               
					                                                               
					     
				        
					                                                                                                                                   
					     
			 
			     
			                                                             
			                 
			 
				                               
					                                                                  
					     
				                               
					                                                                  
					     
				                               
					                                                                  
					     
				        
					                                                                                                                                      
					     
			 
			     
			        
				                                                                                                            
				     
		 
	 

	                             
		                                                                                                                          
 
#endif          

#if SERVER
                                                                                                                                                                                                   
 
	                     
		      

	                                          
		                                                                                                                                                                                                                
 
#endif          

#if SERVER
                                                           
 
	                                
		      

	                             
	                                                                               
	                                                          

	                                                                
	 
		                                                   
		                                                                                      
	 

	              
	                                                        
	                             

	                                                                                         
	                                                                                                                                                       
 
#endif          

#if SERVER
                                                                                               
 
	                     
		      

	                                          
		                                                                                                                     
 
#endif          

#if SERVER
                                                                         
 
	                     
		      

	                                                
		      

	                                          
		                                                                                       

	                           

	                                        
	                            
		               

	                           
	                    
	 
		                               
			                                                                                                        
			     
		                               
			                                                                                                        
			     
		                               
			                                                                                                        
			     
		        
			                                                                                                              
			     
	 

	                                                             
	                                                                               
	                                                                        
 
#endif          

#if SERVER
                                                                                          
                                                                        
 
	       
		                           
			      
	             

	                                                                                                             
	                                                

	                              
 
#endif          

#if SERVER
                                                                                 
 
	                                                       
		      

	                                     
	 
		                                                                               
		                                                                                   

		                                                               
		                                                                                                                
	 

	                                      
	 
		                                                                                                                                
		                                                       
		                                             
		                                                     
		                                               
		                                              
	 
 
#endif          

#if SERVER
                                                                   
 
	                                                       
		      

	                                      
	 
		                                                                                                                                  
		                                                       
		                                             
		                                                     
		                                               
		                                              
	 
 
#endif          

#if SERVER
                                                                                
 
	                                                                                                    

	                                                                                                                              
	                                                                        
	 
		                                                                                    
		                                                                                                                                                   
	 

	                                      
	 
		                                                            
		                                                    
		 
			                                                                                   
			 
				                                                                                                                                
			 
		 
	 

	                                               
	 
		                                                                                                        
		 
			                                                                                                                                                                                                                                               
			                                      
			 
				                                                                                                                      
				                                             
			 
			                                                                                                    
			                                               

			                                                                    
			                                                                              
				                                                               

			                                                               
		 
	 
 
#endif          

#if SERVER
                                                          
                                                                               
 
	                                                                               
	                                                             
	                                                    
	 
		                                                                                   
		 
			                                                                                          
			                                                                                                                                                                                                                                                                              
			                                                       
			                                                   

			                                      
			 
				                                                                                    
			 
		 
	 

	                                    
	 
		                                        
	 
	    
	 
		                                        
	 
 
#endif          

#if SERVER
                                     
                                                                                   
 
	                                                            
	                                       
		      

	                                                                                                       
	                                                                                       
	                                                                                                                                                      

	                                      
	 
		                                                               
		                                                     
		 
			                                                                                   
			 
				                                                                                                                                      
			 
		 
	 

	                                                    
	                                               
	 
		                                                                                                        
		 
			                                                                                                                                                                                                                                                  
			                                      
			 
				                                                                                                                            
				                                             
			 
		 
	 
 
#endif          

#if SERVER
                                   
                                                              
 
	                            
	                            

	                                                             
	                                               
	 
		                 
		 
			                                                                              
			 
				                      
			 
			    
			 
				                      
			 
		 
	 

	                                                                                              
	                                               
	 
		                         
			        

		                                                                                                                                                  
		                                                                                                                                              

		                                            
		                                                                                          
		 
			                                                   
			                                                  
			 
				                                                                                                                                                                                                                                                
				                                                                          
				                                                             
				 
					                                                                                   
					                                             
				 
			 
			                                                                                                           
			 
				                                                                                                                                                                                                                                                 
				                                                                             
				                                                              
				 
					                                                                                     
					                                             
				 
			 
		 

		                                               
		                                                                                          
		 
			                                                                                      
			 
				                                                                                                                                                                                                                                                
				                                                                          
				                                                              
				 
					                                                                                   
					                                             
				 
			 
			                                                                                          
			 
				                                                                                                                                                                                                                                                            
				                                                                                        
				                                                                   
				 
					                                                                                                     
					                                             
				 
			 
		 
	 
 
#endif          

#if SERVER
                                                                                            
                                                               
 
	                                             
	                                                                     

	                                                              
	                                                    
	 
		                                                                                   
		 
			                                                                                                             

			                                                                             
				                                                                                                       
		 
	 

	                                    
	 
		                                                           
	 
	    
	 
		                                                           
	 
 
#endif          

#if SERVER
                                                               
                                                                                                                                                                
 
	                         
		      

	                                                              
	                                                  
	                              
	                               
		                                                             

	                 
	 
		                                                               
		                                                                                   

		                                                                                                       
		                                                                                    

		                         
		 
			                                                                                                                   
			                                            
			                                                                               
			                                                                      
			                                                               

			                                                                    
			                                                                 
				                                                  

			                                                           
		 

		                                                                      
		                                                                                   
	 

	                          
	                                                                                                                                                           
 
#endif          

#if SERVER
                                                                       
                                                                                  
 
	                         
		      

	                    
	                              
	                                                            
	                                                                                  

	                             
	 
		                                                    
		                                                                                        
		                                                        
	 

	                                       
	                                                                                                                                  
	 
		                                                                     
		                                                                                                      
	 

	                                                              
	                                              
	                              

	                          
	                                                                                                                                                       
 
#endif          

#if SERVER
                                                                                   
                                                                  
 
	                                                                                        
	                                                                                                                               
		      

	                              
	                                                                                                                      
	                                                                               
	 
		                                                                                                                                                    
		 
			                        
			     
		 
	 

	                        
		                                                                                             
 
#endif          

#if SERVER
                                                                         
                                                                
 
	                         
		      

	                             
	                                                                                                     
	                                                        
	 
		                                                                                                                                                                                         
		 
			                       
			     
		 
	 

	                       
	 
		                                                        
		                                                                                  
		                                                                                                     
			                                                                                         
	 
 
#endif          

#if SERVER
                                                                          
                                                                               
 
	                                               
		      

	                             
	                                                                                                     
	                                                        
	 
		                                                                                                                                                                                         
		 
			                       
			     
		 
	 

	                       
	 
		                                                         
		                                                                                  
		                                                                                                     
			                                                                                         
	 
 
#endif          

#if SERVER
                                                             
                                                                                 
 
	                                               
		      

	                                                                                            
	                                                                   

	                                                                           
	 
		                          
		 
			                                                                                                                                             
		 
		                              
		 
			                                                                                                                                 
		 
	 
 
#endif          

#if SERVER
                                                        
                                                                        
 
	                                               
		      

	                                                                                                                               
		                                                                                                                                          
 
#endif          

#if SERVER
                                                       
                                                                   
                                                        
                                                                
                                                                                                                                                    
                                                          
 
	                                               

	                                                   
	                                                          

	                                                                                                    
	            
		               
		 
			                                                                                                                            
				                                                                        
		 
	 

	                                                  

	                                                         
	                                                                                        
	 
		                                                                                                                                       
		                                             
		                                           
	 

	                                                                      
 
#endif          

#if SERVER
                                                    
                        
                                                                      
 
	                                               

	                         
		      

	                         
		      

	                                                
		      

	                                 
	                                                                                         

	                                                                                                                
	                                                  
	 
		                                                          
		                    
                                            

		      
	 
	                                                                                                                                                                                             
	 
		              

		                        
		                           
		                                                  
		 
			                                                                                         
			 
				                                                      
				                                   
			 
		 

		                                                                                                                       
		                                      
		 
			                             
			                
		 
		    
		 
			      
		 
	 
	    
	 
		                                                                                                                                                                                  
		                                                                                                                                  
		           

		                                            

		                                                                                           
		                                                   
                                                                            

		                    
			      
	 

	                                                                                                                                                                              
	                                                                                                          
		      

	                                                
		      

	                                       
	                                                                                         
	                                                                                  
		                                                     

	                         
		      

	                                       
	                       
                                    
	                                                
	                                    
	                                             

	                                                                   
	                                                             
		                                       

	                                                                                                           
	                                                                                                                                                                      

	                                                                                   

                                                                                                                                                                                                 
                                                                                                                                                                                                                              
                                                                                                                         
                                                                                                                     
	                                                       
	 
		                             
			                                                                                                         
	 

	                                                       
 
#endif          

#if SERVER
                                                                                                                                                                                            
                                                                                     
 
	                                     
	                                                     
 
#endif          

#if SERVER
                                                 
                                                                            
 
	                                                                  
	                                                                                                                       
 
#endif          

#if SERVER
                                                                              
 
	                                                                             
	                                          

	                                                                                                            
	                                                                                 
	                                                   
	 
		                                                                      
		                                                                                                                                                 
		                                                                                                            
		                                                     
	 
	                                                    
	 
		                                          
		                                               
		               
		                                         
	 

	                                                    
	                                                   
	                                                         
	 
		                                     
		 
			                        
			 
				                                                    
					                                                                                                  

				                                                      
					                                                                                                     
			 
		 
	 

	                                    
	                                     
	 
		                        
			                                        
	 

	                                               
	 
		                                                                                  
		                                               
		 
			                        
				                                                           
		 
	 

	                                 
	                                                                                  
		                                                     

	                                                                                 
	                                                      
	 
		                        
		 
			                                                                                                   
			                                                                                                                                                    
			                              
			                                                            
			                                                                                                       
		 

	 
 
#endif          

#if SERVER
                                                                          
 
	               
	                          
	 
		                               
			                                         
			     

		                           
			                                           
			     
		        
			                                           
			     
	 

	                  
 
#endif          

#if SERVER
                                                                                                                                                              
                                                     
 
	                                                   
	                                           
	 
		                         
			        

		                                                                         
	 
 
#endif          

                     
          
                                          
 
                                                                         
                                      
  
                           
           

                                                                                                    
                                             
           

                                                                               
   
              
   

                                                                                                                         
   
              
   
  

                                                                           
             
 
                
                           

#if SERVER
                                                    
 
	                               
		        

	                                           
		        

	                                                                              
	                                                                     
 
#endif          

                     
          
                                             
 
                                              
        

                                        

                                             
  
                           
           

                          
   
                                                                                                      
                                                                                                                                                       
                                 
                                                                              
                                                                                                                                      
   
  
 
                
                           

#if SERVER
                                                                                                                  
 
	                                
		      

	                                                
		      

	                         

	                                
	 
		                                         
		 
			                                                 
				                            
		 
	 

	                                                                                                                        
 
#endif          

#if SERVER
                                                                                                                                                       
 
	                                
		      

	                                                
		      

	                         
	                                
	 
		                                         
		 
			                                                    
			                      
				                                                                                  
		 
	 

 
#endif          

#if SERVER
                                                                                                                                                                                                                           
                                                         
                                                           
	                                        
	                                        
	                                        
	                                        
	                                        
	                                        
	                                     
	                                     
	                                     
	                                     
                                                                                                                                                
                                                                          
                                                                                         
 
	                                                
		      

	                                                                           
	                                                                                                    
		      

	                                
	 
		                                              
		                                                                               
		                   
		 
			                                                                                                                                      
			                                                                                      
			 
				                                                                                                                              

				                                 
				 
					                                                                           
					                                                                                                                                  
				 
			 
		 
	 
 
#endif          



  
                                                                                                                                                                                                                        
                                                                                                                                                                                                                         
                                                                                                                                                                                                                      
                                                                                                                                                                                                                      
                                                                                                                                                                                                                      
                                                                                                                                                                                                                      

                                  
  

#if CLIENT
void function Control_OnGamestateEnterPlaying_Client()
{
	entity player = GetLocalViewPlayer()
	if ( IsValid( player) )
	{
		                                                                                                          
		Minimap_UpdateMinimapVisibility( player )

		                                                                                                                
		if ( Control_GetIsLockoutInstantWin() )
			thread Control_ManageNearLockoutState_Thread()
	}
}
#endif          

#if CLIENT
void function Control_OnGamestateEnterPreMatch_Client()
{
	file.firstTimeRespawnShouldWait = true
	                                   
	Control_SetPlayerCountForFaction( ALLIANCE_A )
	Control_SetPlayerCountForFaction( ALLIANCE_B )
}
#endif          

#if CLIENT
void function Control_OnGamestateEnterWinnerDetermined_Client()
{
	Control_DeregisterModeButtonPressedCallbacks()
	RunUIScript( "UpdateSystemMenu" )
}
#endif          

#if CLIENT
void function Control_OnGamestateEnterResolution_Client()
{
	Control_DeregisterModeButtonPressedCallbacks()
	Signal( clGlobal.levelEnt, "GameModes_CompletedResolutionCleanup" )
}
#endif          

#if CLIENT
void function Control_DeregisterModeButtonPressedCallbacks( bool shouldCloseCharacterSelect = true )
{
	RunUIScript( "UI_CloseGameModeRulesDialog" )
	RunUIScript( "Control_SetAllButtonsDisabled" )

	if ( shouldCloseCharacterSelect )
		Control_CloseCharacterSelectOnlyIfOpen()

	if ( IsUsingLoadoutSelectionSystem() )
		RunUIScript( "LoadoutSelectionMenu_CloseLoadoutMenu" )

	RunUIScript( "UI_CloseControlSpawnMenu" )
	DestroyRespawnBlur()
}
#endif          

#if CLIENT
void function Control_CloseCharacterSelectOnlyIfOpen()
{
	if ( CharacterSelect_MenuIsOpen() )
		CloseCharacterSelectNewMenu()
}
#endif          

#if CLIENT
void function ControlOverrideGameState()
{
	ClGameState_RegisterGameStateAsset( $"ui/gamestate_control_mode.rpak" )
	ClGameState_RegisterGameStateFullmapAsset( $"ui/gamestate_info_fullmap_control.rpak" )
}
#endif          

#if CLIENT
void function Control_OnFullmapCreated( var fullmap )
{
	ObjectiveScoreTrackerSetup( fullmap )
}
#endif          

#if CLIENT
void function Control_OnScoreboardCreated()
{
	ObjectiveScoreTrackerSetup( ClGameState_GetRui() )
	ObjectiveScoreTracker_AnnouncementSetup( ClGameState_GetRui() )
}
#endif          

#if CLIENT
void function Control_OnPlayerCreated( entity player )
{
	ObjectiveScoreTracker_PopulatePlayerData( GetFullmapGamestateRui() )
	ObjectiveScoreTracker_PopulatePlayerData( ClGameState_GetRui() )
}
#endif          

#if CLIENT
void function Control_OnPlayerTeamChanged( entity player, int oldTeam, int newTeam )
{
	ObjectiveScoreTracker_PopulatePlayerData( GetFullmapGamestateRui() )
	ObjectiveScoreTracker_PopulatePlayerData( ClGameState_GetRui() )
}
#endif          

#if CLIENT
void function Control_OnPlayerClassChanged( entity player )
{
	ObjectiveScoreTracker_PopulatePlayerData( GetFullmapGamestateRui() )
	ObjectiveScoreTracker_PopulatePlayerData( ClGameState_GetRui() )
}
#endif          

#if CLIENT
void function Control_OnSpectatorTargetChanged( entity spectatingPlayer, entity prevSpectatorTarget, entity newSpectatorTarget )
{
	ObjectiveScoreTracker_PopulatePlayerData( GetFullmapGamestateRui() )
	ObjectiveScoreTracker_PopulatePlayerData( ClGameState_GetRui() )
}
#endif          

#if CLIENT
void function Control_OnViewPlayerChanged( entity player )
{
	ObjectiveScoreTracker_PopulatePlayerData( GetFullmapGamestateRui() )
	ObjectiveScoreTracker_PopulatePlayerData( ClGameState_GetRui() )
}
#endif          

#if CLIENT
void function Control_OnPlayerDisconnected( entity player )
{
	entity localPlayer = GetLocalClientPlayer()
	if ( !IsValid( player ) || !IsValid( localPlayer ) )
		return

	if ( player != GetLocalClientPlayer() )
		return

	                                                                                                                                    
	Control_DeregisterModeButtonPressedCallbacks( false )
}
#endif          

#if CLIENT
                                                             
void function Control_OnPlayerConnectionStateChanged( entity player )
{
	                                   
	Control_SetPlayerCountForFaction( ALLIANCE_A )
	Control_SetPlayerCountForFaction( ALLIANCE_B )
}
#endif          

#if CLIENT
void function Control_InstanceObjectivePing_Thread( entity wp )
{
	Assert( IsNewThread(), "Must be threaded off" )

	if ( !IsValid( wp ) )
		return

	EndSignal( wp, "OnDestroy" )

	int wpType = wp.GetWaypointType()
	Assert( wpType == eWaypoint.CONTROL_OBJECTIVE )

	entity viewPlayer = GetLocalViewPlayer()
	if ( !IsValid( viewPlayer ) )
	{
		Warning( "%s(): no view-player.", FUNC_NAME() )
		return
	}

	#if DEV
		if ( viewPlayer.GetTeamMemberIndex() < 0 )
			Warning( "%s(): team member index was invalid.", FUNC_NAME() )
	#endif       

	while ( IsValid( viewPlayer ) && viewPlayer.GetTeamMemberIndex() < 0 )
	{
		WaitFrame()
		viewPlayer = GetLocalViewPlayer()
	}

	if ( IsValid( viewPlayer ) )
	{
		var rui = CreateWaypointRui( $"ui/waypoint_control_objective.rpak", CONTROL_OBJECTIVE_RUI_SORTING )
		RuiKeepSortKeyUpdated( rui, true, "targetPos" )

		RuiTrackInt( rui, "viewPlayerTeamMemberIndex", viewPlayer, RUI_TRACK_PLAYER_TEAM_MEMBER_INDEX )
		RuiTrackFloat3( rui, "targetPos", wp, RUI_TRACK_ABSORIGIN_FOLLOW )
		RuiTrackFloat3( rui, "playerAngles", viewPlayer, RUI_TRACK_CAMANGLES_FOLLOW )                             

		PlayerMatchState_RuiTrackInt( rui, "matchStateCurrent", viewPlayer )

		bool visible = ShouldWaypointRuiBeVisible()
		RuiSetVisible( rui, visible )

		SetWaypointRui_HUD( wp, rui )
		UpdateResponseIcons( wp )

		SetupObjectiveWaypoint( wp, rui )
	}
}
#endif          

#if CLIENT
void function SetupObjectiveWaypoint( entity wp, var rui )
{
	entity localViewPlayer = GetLocalViewPlayer()
	if ( wp.GetWaypointType() == eWaypoint.CONTROL_OBJECTIVE && IsValid( localViewPlayer ) )
	{
		thread ManageObjectiveWaypoint( wp, rui )
		int objectiveID = wp.GetWaypointInt( INT_OBJECTIVE_ID )
		entity localPlayer = GetLocalClientPlayer()

		RuiSetString( rui, "objectiveName", Control_GetObjectiveNameFromObjectiveID_Localized( objectiveID ) )
		RuiTrackFloat( rui, "capturePercentage", wp, RUI_TRACK_WAYPOINT_FLOAT, FLOAT_CAP_PERC )
		RuiTrackInt( rui, "currentControllingTeam", wp, RUI_TRACK_WAYPOINT_INT, INT_TEAM_CAPTURING )
		RuiTrackInt( rui, "currentOwner", wp, RUI_TRACK_WAYPOINT_INT, CONTROL_INT_OBJ_TEAM_OWNER )
		RuiTrackInt( rui, "neutralPointOwnership", wp, RUI_TRACK_WAYPOINT_INT, CONTROL_INT_OBJ_NEUTRAL_TEAM_OWNER )
		RuiSetInt( wp.wp.ruiHud, "yourTeamIndex", AllianceProximity_GetAllianceFromTeamWithObserverCorrection( localPlayer.GetTeam() ) )
		RuiTrackInt( rui, "team0PlayersOnObj", wp, RUI_TRACK_WAYPOINT_INT, INT_TEAM0_PLAYERSONOBJ )
		RuiTrackInt( rui, "team1PlayersOnObj", wp, RUI_TRACK_WAYPOINT_INT, INT_TEAM1_PLAYERSONOBJ )

		thread ObjectiveWaypointThink( wp, rui )
		thread ObjectiveGameStateTrackerThink( wp, ClGameState_GetRui(), true, true )
		thread ObjectiveGameStateTrackerThink( wp, GetFullmapGamestateRui(), true, false )

		thread ManageObjectiveVFX_Client_Thread( wp )
	}
}
#endif          

#if CLIENT
void function ManageObjectiveWaypoint( entity wp, var rui )
{
	Assert( IsNewThread(), "Must be threaded off" )

	file.waypointList.append( wp )

	OnThreadEnd( void function() : ( wp ) {
		#if DEV
			printf( "CONTROL: Objective waypoint destroyed" )
		#endif       

		file.waypointList.fastremovebyvalue( wp )
	} )

	WaitSignal( wp, "OnDestroy" )
}
#endif          

#if CLIENT
void function ManageObjectiveVFX_Client_Thread( entity wp )
{
	Assert( IsNewThread(), "Must be threaded off" )

	if ( !IsValid( wp ) )
		return

	wp.EndSignal( "OnDestroy" )
	wp.EndSignal( SIGNAL_WAYPOINT_RUI_SET )

	entity scriptParent = wp.GetParent()
	entity objectiveFlag = scriptParent
	entity objectiveBorder = wp.GetWaypointEntity( CONTROL_WAYPOINT_TRIGGER_ENTITY_INDEX )

	if ( GetEditorClass( scriptParent ) != "control_flag_prop" )
	{
		array<entity> linkedEnts = scriptParent.GetLinkEntArray()
		foreach( ent in linkedEnts )
		{
			if ( GetEditorClass( ent ) == "control_flag_prop" )
				objectiveFlag = ent
		}
	}

	if ( !IsValid( objectiveFlag ) && !IsValid( objectiveBorder ) )
		return

	#if DEV
		printf( "CONTROL: Setting up flare on objective " + scriptParent + " with flag ent " + objectiveFlag )
	#endif       

	int flareFX
	if ( IsValid( objectiveFlag ) )
	{
		flareFX = StartParticleEffectOnEntity( objectiveFlag, GetParticleSystemIndex( CONTROL_WAYPOINT_FLARE_ASSET ), FX_PATTACH_POINT_FOLLOW_NOROTATE, objectiveFlag.LookupAttachment( "fx_end" ) )
		EffectWake( flareFX )
	}

	entity player = GetLocalViewPlayer()

	OnThreadEnd(
		function() : ( flareFX )
		{
			if ( EffectDoesExist( flareFX ) )
				EffectStop( flareFX, false, false )
		}
	)

	while ( GetGameState() == eGameState.Playing )
	{
		player = GetLocalViewPlayer()

		                                                                                                                       
		if ( !IsValid( player ) || !IsValid( wp ) || !IsValid( objectiveFlag ) && !IsValid( objectiveBorder ) )
			break

		                                                           
		bool isPointContested = wp.GetWaypointInt( INT_TEAM0_PLAYERSONOBJ ) > 0 && wp.GetWaypointInt( INT_TEAM1_PLAYERSONOBJ ) > 0
		vector vfxColor = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL )
		int objectiveOwner = wp.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )
		int playerAlliance = AllianceProximity_GetAllianceFromTeam( player.GetTeam() )

		if ( isPointContested )
		{
			vfxColor = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.CONTESTED )
		}
		else if ( objectiveOwner == playerAlliance )
		{
			vfxColor = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED )
		}
		else if ( objectiveOwner != playerAlliance && objectiveOwner != ALLIANCE_NONE )
		{
			vfxColor = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
		}

		                      
		if ( IsValid( objectiveFlag ) && EffectDoesExist( flareFX ) )
			EffectSetControlPointVector( flareFX, 1, vfxColor )

		                              
		                                                                                                               
		                                                                          
		  	                                         

		wp.WaitSignal( "Control_OnObjectiveStateChanged_Client" )
	}
}
#endif          

#if CLIENT
void function ObjectiveWaypointThink( entity wp, var rui )
{
	wp.EndSignal( "OnDestroy" )
	wp.EndSignal( SIGNAL_WAYPOINT_RUI_SET )

	bool isPointContested = false

	while ( GetGameState() == eGameState.Playing )
	{
		entity player = GetLocalViewPlayer()

		if ( IsValid( player ) )
		{
			int playerTeam = player.GetTeam()
			int playerAlliance = AllianceProximity_GetAllianceFromTeam( playerTeam )

			if ( Control_ShouldShow2DMapIcons() )
			{
				var minimapRui
				var fullmapRui
				if ( wp in file.waypointToMinimapRui )
					minimapRui = file.waypointToMinimapRui[wp]
				if ( wp in file.waypointToFullmapRui )
					fullmapRui = file.waypointToFullmapRui[wp]

				asset iconToSet
				if ( wp.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER ) == ALLIANCE_NONE )
				{
					iconToSet = CONTROL_OBJ_DIAMOND_EMPTY
				}
				else if ( wp.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER ) == playerAlliance )
				{
					iconToSet = CONTROL_OBJ_DIAMOND_YOURS
				}
				else
				{
					iconToSet = CONTROL_OBJ_DIAMOND_ENEMY
				}

				if ( IsValid( minimapRui ) )
					RuiSetImage( minimapRui, "defaultIcon", iconToSet )
				if ( IsValid( fullmapRui ) )
					RuiSetImage( fullmapRui, "defaultIcon", iconToSet )
			}

			if ( IsValid( rui ) )
			{
				bool hasEmphasis = wp.GetWaypointFloat( FLOAT_BOUNTY_AMOUNT ) > 0
				RuiSetBool( rui,"hasEmphasis", hasEmphasis )
				RuiSetInt( rui, "numTeamPings", Control_GetPingCountForObjectiveForAlliance( wp, playerAlliance ) )
				RuiSetBool( rui, "localPlayerOnObjective",  Control_Client_IsOnObjective( wp, player ) )
				RuiSetBool( rui, "isHidden", file.inGameMapRui != null || IsScoreboardShown() )                                                         
			}
		}

		                                                                                                         
		bool tempIsPointContested = wp.GetWaypointInt( INT_TEAM0_PLAYERSONOBJ ) > 0 && wp.GetWaypointInt( INT_TEAM1_PLAYERSONOBJ ) > 0
		if ( isPointContested != tempIsPointContested )
		{
			isPointContested = tempIsPointContested
			Signal( wp, "Control_OnObjectiveStateChanged_Client" )
		}

		WaitFrame()
	}
}
#endif          

#if CLIENT
void function ObjectiveGameStateTrackerThink( entity wp, var gameStateRui, bool shouldTrackOnObjective = true, bool shouldTrackOwner = false )
{
	Assert( IsNewThread(), "Must be threaded off" )
	wp.EndSignal( "OnDestroy" )
	wp.EndSignal( SIGNAL_WAYPOINT_RUI_SET )

	int waypointIndex = wp.GetWaypointInt( INT_OBJECTIVE_ID )
	var mainTrackerRui = RuiCreateNested( gameStateRui, "objective" + waypointIndex, $"ui/control_mode_progress_tracker.rpak" )
	entity localPlayer = GetLocalClientPlayer()
	entity localPlayerView = GetLocalViewPlayer()

	if ( !IsValid( localPlayer ) )
		return

	if( !GamemodeUtility_IsPlayerOnTeamObserver( localPlayer ) )
		localPlayerView.EndSignal( "OnDestroy" )

	              
	RuiSetString( mainTrackerRui, "name", Control_GetObjectiveNameFromObjectiveID_Localized( waypointIndex ) )

	RuiTrackFloat( mainTrackerRui, "capturePercentage", wp, RUI_TRACK_WAYPOINT_FLOAT, FLOAT_CAP_PERC )
	RuiTrackInt( mainTrackerRui, "currentControllingTeam", wp, RUI_TRACK_WAYPOINT_INT, INT_TEAM_CAPTURING )
	RuiTrackInt( mainTrackerRui, "currentOwner", wp, RUI_TRACK_WAYPOINT_INT, CONTROL_INT_OBJ_TEAM_OWNER )
	RuiTrackInt( mainTrackerRui, "neutralPointOwnership", wp, RUI_TRACK_WAYPOINT_INT, CONTROL_INT_OBJ_NEUTRAL_TEAM_OWNER )
	RuiTrackInt( mainTrackerRui, "team0PlayersOnObj", wp, RUI_TRACK_WAYPOINT_INT, INT_TEAM0_PLAYERSONOBJ )
	RuiTrackInt( mainTrackerRui, "team1PlayersOnObj", wp, RUI_TRACK_WAYPOINT_INT, INT_TEAM1_PLAYERSONOBJ )

	OnThreadEnd(
		function() : ( gameStateRui, waypointIndex )
		{
			RuiDestroyNestedIfAlive( gameStateRui, "objective" + waypointIndex )
		}
	)

	while ( GetGameState() == eGameState.Playing )
	{
		localPlayerView = GetLocalViewPlayer()
		if ( IsValid( localPlayerView ) )
		{
			int slot = OFFHAND_INVENTORY
			entity weapon = localPlayerView.GetOffhandWeapon( slot )
			if( weapon != null )
			{
				switch ( weapon.GetWeaponSettingEnum( eWeaponVar.cooldown_type, eWeaponCooldownType ) )
				{
					case eWeaponCooldownType.ammo:
						int maxAmmoReady = weapon.UsesClipsForAmmo() ? weapon.GetWeaponSettingInt( eWeaponVar.ammo_clip_size ) : weapon.GetWeaponPrimaryAmmoCountMax( weapon.GetActiveAmmoSource() )
						int ammoPerShot = weapon.GetWeaponSettingInt( eWeaponVar.ammo_per_shot )

						RuiSetInt( gameStateRui, "ultimateSegments", maxAmmoReady / ammoPerShot )
						break
					default:
						RuiSetInt( gameStateRui, "ultimateSegments", 1 )
						break
				}
			}
			else
				RuiSetInt( gameStateRui, "ultimateSegments", 1 )

			if ( shouldTrackOnObjective )
			{
				if ( Control_Client_IsOnObjective( wp, localPlayerView ) )
				{
					RuiSetBool( gameStateRui, "isOnObjective" + waypointIndex, true )
					RuiSetBool( mainTrackerRui, "isOnObjective", true )
					RuiSetFloat( mainTrackerRui, "iconScale", 1.35 )
				}
				else
				{
					RuiSetBool( gameStateRui, "isOnObjective" + waypointIndex, false )
					RuiSetBool( mainTrackerRui, "isOnObjective", false )
					RuiSetFloat( mainTrackerRui, "iconScale", 0.7 )
				}
			}
		}
		                     

		RuiSetInt( mainTrackerRui, "yourTeamIndex", AllianceProximity_GetAllianceFromTeamWithObserverCorrection( localPlayerView.GetTeam() ) )
		if ( wp.GetWaypointFloat( FLOAT_BOUNTY_AMOUNT ) > 0 )
			RuiSetBool( mainTrackerRui, "shouldPlayEmphasis", true )
		else
			RuiSetBool( mainTrackerRui, "shouldPlayEmphasis", false )

		WaitFrame()
	}
}
#endif          

#if CLIENT
const float MIN_TIME_BETWEEN_OBJECTIVECAPTURE_ALARMS = 10.0
const float MIN_TIME_BETWEEN_OBJECTIVECAPTURE_ALARM_MSG = 60.0
                                                                                                                  
void function Control_ManageNearLockoutState_Thread()
{
	Assert( IsNewThread(), "Must be threaded off" )
	float timeWarningMessageLastDisplayed = -1

	while ( GetGameState() == eGameState.Playing )
	{
		if ( Control_GetIsMatchNearEnemyLockoutState() )
		{
			bool shouldDisplayMessageWithAlarm = timeWarningMessageLastDisplayed == -1 || Time() > timeWarningMessageLastDisplayed + MIN_TIME_BETWEEN_OBJECTIVECAPTURE_ALARM_MSG
			Control_PlayFinalObjectiveCapturingWarning( shouldDisplayMessageWithAlarm )

			if ( shouldDisplayMessageWithAlarm )
				timeWarningMessageLastDisplayed = Time()

			wait MIN_TIME_BETWEEN_OBJECTIVECAPTURE_ALARMS
		}

		WaitFrame()
	}
}
#endif          

#if CLIENT
                                                                                      
bool function Control_GetIsMatchNearEnemyLockoutState()
{
	bool isNearLockout = false
	entity localPlayer = GetLocalViewPlayer()

	if ( !IsValid( localPlayer ) )
		return isNearLockout

	int playerAlliance = AllianceProximity_GetAllianceFromTeam( localPlayer.GetTeam() )
	int enemyAlliance = AllianceProximity_GetOtherAlliance( playerAlliance )
	int allianceWithObjectiveMajority = Control_GetAllianceWithOwnedObjectiveMajority()

	if ( Control_isValidMatchStateForLockout( CONTROL_LOCKOUT_EVENT_DURATION, false ) && !file.isLockout && allianceWithObjectiveMajority != ALLIANCE_NONE && allianceWithObjectiveMajority != playerAlliance )
	{
		foreach ( wp in file.waypointList )
		{
			                                                                                                                            
			if ( wp.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER ) != enemyAlliance )                                                                       
			{
				int numEnemiesOnObjective = playerAlliance == ALLIANCE_A ? wp.GetWaypointInt( INT_TEAM1_PLAYERSONOBJ ) : wp.GetWaypointInt( INT_TEAM0_PLAYERSONOBJ )

				if ( numEnemiesOnObjective > 0 )
				{
					isNearLockout = true
					break
				}
			}
		}
	}

	return isNearLockout
}
#endif          

#if CLIENT
                                                                  
int function Control_GetAllianceWithOwnedObjectiveMajority()
{
	int allianceWithObjectiveMajority = ALLIANCE_NONE
	int aOwnedPoints = Control_GetNumOwnedObjectivesByAlliance( ALLIANCE_A )
	int bOwnedPoints = Control_GetNumOwnedObjectivesByAlliance( ALLIANCE_B )

	if ( aOwnedPoints > 1 )
	{
		allianceWithObjectiveMajority = ALLIANCE_A
	}
	else if ( bOwnedPoints > 1 )
	{
		allianceWithObjectiveMajority = ALLIANCE_B
	}

	return allianceWithObjectiveMajority
}
#endif          

#if CLIENT
void function ObjectiveScoreTrackerSetup( var rui )
{
	table<int, var> nestedRuiTable

	for( int i = 0; i<2; i++ )
	{
		var childRui = RuiCreateNested( rui, "team" + i + "Tracker", $"ui/control_score_tracker.rpak" )
		RuiSetFloat( childRui, "scoreLimit", float( GetScoreLimit_FromPlaylist() ) )
		RuiSetInt( childRui, "trackerIndex", i )

		if ( i == 1 )
			RuiSetBool( childRui, "reverseOrientation", true )

		nestedRuiTable[i] <- childRui
	}

	if ( rui == ClGameState_GetRui() )
		file.scoreTrackerRui = nestedRuiTable
	else if ( rui == GetFullmapGamestateRui() )
		file.fullmapScoreTrackerRui = nestedRuiTable
	else
		return

	                                                                                                                                                                                                           
	if ( rui != null )
		ObjectiveScoreTracker_PopulatePlayerData( rui )
}
#endif          

#if CLIENT
void function ObjectiveScoreTracker_PopulatePlayerData( var parentRui )
{
	                                                      
	if ( parentRui == null )
		ObjectiveScoreTrackerSetup( ClGameState_GetRui() )

	if ( GetLocalClientPlayer() == null || GetGameState() < eGameState.Prematch)
		return                                                                                                                                                                

	entity localPlayer = GetLocalClientPlayer()

	int friendlyAlliance = AllianceProximity_GetAllianceFromTeamWithObserverCorrection( localPlayer.GetTeam() )
	int enemyAlliance = AllianceProximity_GetOtherAlliance( friendlyAlliance )

	table<int, var> nestedRuiTable
	if ( parentRui == ClGameState_GetRui() )
	{
		nestedRuiTable = file.scoreTrackerRui
		localPlayer.Signal( "EndUpdateAllianceUIScoreGameState" )
	}
	else if ( parentRui == GetFullmapGamestateRui() )
	{
		nestedRuiTable = file.fullmapScoreTrackerRui
		localPlayer.Signal( "EndUpdateAllianceUIScoreMap" )
	}

	thread UpdateAllianceUIScore( parentRui, localPlayer, nestedRuiTable[1], nestedRuiTable[0], friendlyAlliance, enemyAlliance )            

	Control_UpdateScoreGenerationOnClient()
}
#endif          

#if CLIENT
void function UpdateAllianceUIScore( var parentRui, entity player, var blueRui, var redRui, int blueTeam , int redTeam )
{
	if ( parentRui == ClGameState_GetRui() )
		player.EndSignal( "EndUpdateAllianceUIScoreGameState" )
	else if ( parentRui == GetFullmapGamestateRui() )
		player.EndSignal( "EndUpdateAllianceUIScoreMap" )

	player.EndSignal( "OnDestroy" )

	while( GetGameState() == eGameState.Playing )
	{
		ControlTeamData blueData = file.teamData[ blueTeam ]
		ControlTeamData redData = file.teamData[ redTeam ]

		float blueScore =  float( blueData.teamScoreFromPoints + blueData.teamScoreFromBonus )
		float redScore =  float( redData.teamScoreFromPoints + redData.teamScoreFromBonus )

		RuiSetInt( blueRui, "yourTeamIndex", blueTeam )
		RuiSetFloat( blueRui, "teamScore", blueScore )
		RuiSetFloat( blueRui, "opponentScore", redScore )

		RuiSetInt( redRui, "yourTeamIndex", redTeam )
		RuiSetFloat( redRui, "teamScore", redScore )
		RuiSetFloat( redRui, "opponentScore", blueScore )

		WaitFrame()
	}
}
#endif

#if CLIENT
void function ObjectiveScoreTracker_AnnouncementSetup( var parentRui )
{
	if ( parentRui == null )
		return

	file.announcementRui = RuiCreateNested( parentRui, "announcementTracker", $"ui/control_announcement_tracker.rpak" )
	thread ObjectiveScoreTracker_AnnouncementManagement()
}
#endif          

#if CLIENT
void function ObjectiveScoreTracker_AnnouncementManagement()
{
	Assert( IsNewThread(), "Must be threaded off" )

	bool shouldUpdateCatchupMechanicsUI = Control_GetMinHeldObjectivesToGenerateScore() > 0 && Control_GetIsMinHeldObjectivesOnlyForWinningTeam() ? true : false
	bool isUsingCatchupMechanic = false

	while ( true )
	{
		float currentTime = Time()

		if ( file.currentAnnouncement.isInitialized )
		{
			array<ControlAnnouncementData> announcementCopy = clone file.announcementData
			foreach( announcement in announcementCopy )
			{
				if ( announcement.shouldForcePushAnnouncement )
				{
					Control_DisplayAnnouncement( announcement )
				}
			}

			                                                                              
			if ( file.currentAnnouncement.shouldTerminateIfWPDies && !IsValid(file.currentAnnouncement.wp ) )
				Control_CancelAnnouncementDisplay()

			float announcementDisplayEndTime = file.currentAnnouncement.displayStartTime + file.currentAnnouncement.displayLength
			float eventEndTime = file.currentAnnouncement.startTime + file.currentAnnouncement.eventLength
			float trueEndTime = min( announcementDisplayEndTime, eventEndTime )
			if ( currentTime > trueEndTime )
				Control_CancelAnnouncementDisplay()
		}
		else
		{
			array<ControlAnnouncementData> announcementCopy = clone file.announcementData

			                                                     
			foreach( announcement in announcementCopy )
			{
				float announcementEndTime = announcement.startTime + announcement.eventLength
				if ( currentTime > announcementEndTime )
				{
					                                              
					file.announcementData.removebyvalue( announcement )
				}
				else
				{
					Control_DisplayAnnouncement( announcement )
				}
			}
		}
		entity player = GetLocalClientPlayer()
		bool isPlayerOnSpawnSelectScreen = false
		if ( IsValid( player ) )
			isPlayerOnSpawnSelectScreen = player.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" )

		if(file.announcementRui != null)
			RuiSetBool( file.announcementRui, "isRespawnMap", isPlayerOnSpawnSelectScreen )


		                                                                                                               
		                                                                                                             
		                                                                                                   
		if ( shouldUpdateCatchupMechanicsUI && isUsingCatchupMechanic != Control_ShouldUseCatchupMechanics() )
		{
			isUsingCatchupMechanic = Control_ShouldUseCatchupMechanics()
			Control_UpdateScoreGenerationOnClient()
		}

		Control_SetRatingsVisibility( player )

		WaitFrame()
	}
}
#endif          

#if CLIENT
void function Control_SetRatingsVisibility( entity player )
{
	if ( IsValid( player ) )
	{
		var rui = ClGameState_GetRui()
		int gameState = GetGameState()

		HudVisibilityStatus hudStatus = GetHudStatus( player )

		if( IsPrivateMatch() && GetLocalClientPlayer().IsObserver() && GetLocalViewPlayer().GetTeam() == TEAM_SPECTATOR )
		{
			RuiSetBool( rui, "shouldDisplayExpUI", false )
		}
		else
		{
			RuiSetBool( rui, "shouldDisplayExpUI", Control_GetIsWeaponEvoEnabled() && hudStatus.mainHud && gameState >= eGameState.Playing )
		}
	}
}
#endif

#if CLIENT
void function Control_ObjectiveScoreTracker_PushAnnouncement( 	entity wp,
														bool shouldTerminateIfWPDies,
														string mainText,
														string subText,
														float eventLength,
														float displayLength,
														bool shouldForcePushAnnouncement,
														bool shouldUseTimer,
														vector overrideColor)
{
	ControlAnnouncementData announcementData

	announcementData.isInitialized = true
	announcementData.wp = wp
	announcementData.shouldTerminateIfWPDies = shouldTerminateIfWPDies
	announcementData.shouldForcePushAnnouncement = shouldForcePushAnnouncement
	announcementData.shouldUseTimer = shouldUseTimer

	announcementData.mainText = mainText
	announcementData.subText = subText

	announcementData.startTime = Time()
	announcementData.eventLength = eventLength
	announcementData.displayLength = displayLength
	announcementData.overrideColor = overrideColor

	file.announcementData.append( announcementData )
}
#endif          

#if CLIENT
void function Control_ObjectiveScoreTracker_UpdateAnnouncement( entity wp,
		bool shouldTerminateIfWPDies,
		string mainText,
		string subText,
		float eventLength,
		float displayLength,
		bool shouldForcePushAnnouncement,
		bool shouldUseTimer )
{
	entity localViewPlayer = GetLocalViewPlayer()
	entity localClientPlayer = GetLocalClientPlayer()
	if ( !IsValid( localViewPlayer ) )
		return

	if ( !file.currentAnnouncement.isInitialized || !IsValid(file.currentAnnouncement.wp ) )
	{
		if( file.announcementData.len() > 0 )
		{
			Control_DisplayAnnouncement( file.announcementData.top() )
		}
		else
		{
			Warning( "Control_ObjectiveScoreTracker_UpdateAnnouncement - No current announcement!" )
			return
		}

	}

	file.currentAnnouncement.displayLength = file.currentAnnouncement.displayLength + displayLength

	table<int, var> nestedRuiTable
	nestedRuiTable = file.scoreTrackerRui

	RuiSetFloat( nestedRuiTable[0], "announcementLength", file.currentAnnouncement.displayLength )
	RuiSetFloat( nestedRuiTable[1], "announcementLength", file.currentAnnouncement.displayLength )

	nestedRuiTable = file.fullmapScoreTrackerRui

	RuiSetFloat( nestedRuiTable[0], "announcementLength", file.currentAnnouncement.displayLength )
	RuiSetFloat( nestedRuiTable[1], "announcementLength", file.currentAnnouncement.displayLength )

	RuiSetFloat( ClGameState_GetRui(), "announcementLength",  file.currentAnnouncement.displayLength )
	RuiSetFloat( GetFullmapGamestateRui(), "announcementLength", file.currentAnnouncement.displayLength )

	entity linkedEnt = file.currentAnnouncement.wp.GetParent()
	int yourTeamIndex = AllianceProximity_GetAllianceFromTeam( localViewPlayer.GetTeam() )
	vector colorOverride

	if ( IsValid( linkedEnt ) )
	{
		int currentOwner = linkedEnt.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )
		if ( currentOwner == ALLIANCE_NONE )
			colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL )
		else
		{
			if( GamemodeUtility_IsPlayerOnTeamObserver( localClientPlayer ) )
			{
				colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL )
			}
			if ( yourTeamIndex == currentOwner )
			{
				colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED )
			}
			else
			{
				colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
			}
		}
	}
	else
	{
		colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL )
	}

	RuiSetString( file.announcementRui, "mainText", mainText )
	RuiSetString( file.announcementRui, "subText", subText )
	RuiSetBool( file.announcementRui, "shouldUseTimer", shouldUseTimer )
	RuiSetFloat( file.announcementRui, "announcementLength", file.currentAnnouncement.displayLength )
	RuiSetFloat3( file.announcementRui, "colorOverride", SrgbToLinear( colorOverride / 255.0 ) )

	RuiSetString( file.fullMapAnnouncementRui, "mainText", mainText )
	RuiSetString( file.fullMapAnnouncementRui, "subText", subText )
	RuiSetBool( file.fullMapAnnouncementRui, "shouldUseTimer", shouldUseTimer )
	RuiSetFloat( file.fullMapAnnouncementRui, "announcementLength", file.currentAnnouncement.displayLength )
	RuiSetFloat3( file.fullMapAnnouncementRui, "colorOverride", SrgbToLinear( colorOverride / 255.0 ) )
}
#endif          

#if CLIENT
void function Control_DisplayAnnouncement( ControlAnnouncementData data )
{
	float announcementEndTime = data.startTime + data.eventLength
	float currentTime = Time()
	float timeUntilEnd = announcementEndTime - currentTime
	float displayTime = min( timeUntilEnd, data.displayLength )
  
	data.displayStartTime = currentTime

	RuiSetGameTime( ClGameState_GetRui(), "announcementStartTime", currentTime )
	RuiSetFloat( ClGameState_GetRui(), "announcementLength", displayTime )

	RuiSetGameTime( GetFullmapGamestateRui(), "announcementStartTime", currentTime )
	RuiSetFloat( GetFullmapGamestateRui(), "announcementLength", displayTime )

	table<int, var> nestedRuiTable
	nestedRuiTable = file.scoreTrackerRui

	RuiSetGameTime( nestedRuiTable[0], "announcementStartTime", currentTime )
	RuiSetFloat( nestedRuiTable[0], "announcementLength", displayTime )
	RuiSetGameTime( nestedRuiTable[1], "announcementStartTime", currentTime )
	RuiSetFloat( nestedRuiTable[1], "announcementLength", displayTime )

	nestedRuiTable = file.fullmapScoreTrackerRui

	RuiSetGameTime( nestedRuiTable[0], "announcementStartTime", currentTime )
	RuiSetFloat( nestedRuiTable[0], "announcementLength", displayTime )
	RuiSetGameTime( nestedRuiTable[1], "announcementStartTime", currentTime )
	RuiSetFloat( nestedRuiTable[1], "announcementLength", displayTime )

	RuiSetGameTime( file.announcementRui, "announcementStartTime", currentTime )
	RuiSetFloat( file.announcementRui, "announcementLength", displayTime )
	RuiSetString( file.announcementRui, "mainText", data.mainText )
	RuiSetString( file.announcementRui, "subText", data.subText )
	RuiSetBool( file.announcementRui, "shouldUseTimer", data.shouldUseTimer )
	RuiSetFloat3( file.announcementRui, "colorOverride",  SrgbToLinear( data.overrideColor / 255.0 ) )

	if(file.fullMapAnnouncementRui == null)
		file.fullMapAnnouncementRui = RuiCreateNested( GetFullmapGamestateRui(), "announcementTracker", $"ui/control_announcement_tracker.rpak" )

	RuiSetGameTime( file.fullMapAnnouncementRui, "announcementStartTime", currentTime )
	RuiSetFloat( file.fullMapAnnouncementRui, "announcementLength", displayTime )
	RuiSetString( file.fullMapAnnouncementRui, "mainText", data.mainText )
	RuiSetString( file.fullMapAnnouncementRui, "subText", data.subText )
	RuiSetBool( file.fullMapAnnouncementRui, "shouldUseTimer", data.shouldUseTimer )
	RuiSetFloat3( file.fullMapAnnouncementRui, "colorOverride",  SrgbToLinear( data.overrideColor / 255.0 ) )
	RuiSetBool( file.fullMapAnnouncementRui, "isWorldMap", true )

	file.currentAnnouncement = data
	file.announcementData.removebyvalue( data )
}
#endif          

#if CLIENT
void function Control_CancelAnnouncementDisplay()
{
	ControlAnnouncementData rawData
	file.currentAnnouncement = rawData
}
#endif          

#if CLIENT
void function Control_BountyInfoOverride_Thread( entity wp, TimedEventLocalClientData data )
{
	Assert( IsNewThread(), "Must be threaded off" )
	entity localViewPlayer = GetLocalViewPlayer()

	if ( !IsValid( localViewPlayer ) )
		return

	EndSignal( wp, "OnDestroy" )
	localViewPlayer.EndSignal( "OnDestroy" )

	string originalName = data.eventName

	Control_ObjectiveScoreTracker_PushAnnouncement( wp,
		true,
		"",
		Localize( data.eventName ),
		wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_END_TIME ) - wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_START_TIME ),
		CONTROL_MESSAGE_DURATION_LONG,
		false,
		true,
		GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL ))

	while ( !IsValid( wp ) || !IsValid( wp.GetParent() ) )
	{
		WaitFrame()
	}

	localViewPlayer = GetLocalViewPlayer()
	entity localClientPlayer = GetLocalClientPlayer()

	if ( !IsValid( localViewPlayer ) )
		return

	                                        
	entity linkedEnt = wp.GetParent()
	int currentOwner = linkedEnt.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )
	int objectiveID = linkedEnt.GetWaypointInt( INT_OBJECTIVE_ID )
	string objectiveName = Control_GetObjectiveNameFromObjectiveID_Localized( objectiveID )
	string eventName
	if( GamemodeUtility_IsPlayerOnTeamObserver( localClientPlayer ) )
		eventName = Localize( "#CONTROL_POINT_BOUNTY_CONTROL", objectiveName )                    
	else if ( currentOwner == ALLIANCE_NONE )
		eventName = Localize( "#CONTROL_POINT_BOUNTY_ATTACK", objectiveName )
	else
	{
		int yourTeamIndex = AllianceProximity_GetAllianceFromTeam( localViewPlayer.GetTeam() )
		if ( yourTeamIndex == currentOwner )
			eventName = Localize( "#CONTROL_POINT_BOUNTY_DEFEND", objectiveName )
		else
			eventName = Localize( "#CONTROL_POINT_BOUNTY_ATTACK", objectiveName )
	}

	Control_ObjectiveScoreTracker_UpdateAnnouncement( wp,
											true,
											eventName.toupper(),
											Localize( data.eventName ),
											wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_END_TIME ) - wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_START_TIME ),
											CONTROL_MESSAGE_DURATION,
											false,
											true )

	                                             
	while ( IsValid( localViewPlayer ) )
	{
		linkedEnt = wp.GetParent()
		if ( IsValid( linkedEnt ) )
		{
			currentOwner = linkedEnt.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )
			if( GamemodeUtility_IsPlayerOnTeamObserver( localClientPlayer ) )
			{
				data.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL )
				data.eventName = Localize( "#CONTROL_POINT_BOUNTY_CONTROL", objectiveName )                                                                             
			}
			else if ( currentOwner == ALLIANCE_NONE )
			{
				data.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL )
				data.eventName = Localize( "#CONTROL_POINT_BOUNTY_ATTACK", objectiveName )
			}
			else
			{
				int yourTeamIndex = AllianceProximity_GetAllianceFromTeam( localViewPlayer.GetTeam() )                                   
				if ( yourTeamIndex == currentOwner )
				{
					data.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED )
					data.eventName = Localize( "#CONTROL_POINT_BOUNTY_DEFEND", objectiveName )
				}
				else
				{
					data.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
					data.eventName = Localize( "#CONTROL_POINT_BOUNTY_ATTACK", objectiveName )
				}
			}
		}
		else
		{
			data.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL )
			data.eventName = originalName
		}

		WaitFrame()

		localViewPlayer = GetLocalViewPlayer()
	}
}
#endif          

#if CLIENT
void function Control_LockoutInfoOverride_Thread( entity wp, TimedEventLocalClientData data )
{
	Assert( IsNewThread(), "Must be threaded off" )

	EndSignal( wp, "OnDestroy" )

	file.isLockout = true
	string originalName = data.eventName

	while ( !IsValid( wp ) )
	{
		WaitFrame()
	}

	float eventEnd = wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_END_TIME )
	int majorityTeam = wp.GetWaypointInt( 5 )
	entity localViewPlayer = GetLocalViewPlayer()
	entity localClientPlayer = GetLocalClientPlayer()

	OnThreadEnd(
		function() : ( wp, eventEnd, majorityTeam, localClientPlayer )
		{
			file.isLockout = false

			foreach( scoreRui in file.scoreTrackerRui )
			{
				RuiSetBool( scoreRui, "isLockout", false )
			}

			foreach( scoreRui in file.fullmapScoreTrackerRui )
			{
				RuiSetBool( scoreRui, "isLockout", false )
			}

			if ( Time() < eventEnd )
			{
				entity localPlayer = GetLocalViewPlayer()

				if ( IsValid( localPlayer ) )
				{
					int yourTeamIndex = AllianceProximity_GetAllianceFromTeam( localPlayer.GetTeam() )
					string subText =  yourTeamIndex == majorityTeam ? Localize( "#CONTROL_LOCKOUT_ENEMY_CAPTURED_OBJ" ) : Localize( "#CONTROL_LOCKOUT_FRIENDLY_CAPTURED_OBJ" )
					Control_ObjectiveScoreTracker_PushAnnouncement( null,
						false,
						Localize( "#CONTROL_LOCKOUT_ABORTED" ),
						GamemodeUtility_IsPlayerOnTeamObserver( localClientPlayer )? "": subText,
						CONTROL_MESSAGE_DURATION_LONG,
						CONTROL_MESSAGE_DURATION_LONG,
						false,
						false,
						GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL ) )

					EmitUISound( CONTROL_SFX_LOCKOUT_ABORT )
				}
			}
		}
	)

	if ( IsValid( localViewPlayer ) )
	{
		EmitUISound( CONTROL_SFX_LOCKOUT_START )

		string eventDesc  = Control_GetIsLockoutInstantWin() ? Localize( "#CONTROL_INSTALOCKOUT_EVENT_DESC" ) : Localize( "#CONTROL_LOCKOUT_EVENT_DESC" )
		int yourTeamIndex = AllianceProximity_GetAllianceFromTeam( localViewPlayer.GetTeam() )
		if ( GamemodeUtility_IsPlayerOnTeamObserver( localClientPlayer ) )
		{
			if ( majorityTeam == 0 )
			{
				string descDetails = Control_GetIsLockoutInstantWin() ? Localize( "#CONTROL_INSTALOCKOUT_INSTRUCTIONS_TEAM1" ) : ""
				eventDesc = eventDesc + descDetails
				data.eventDesc = eventDesc
				data.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED )
			}
			else
			{
				string descDetails = Control_GetIsLockoutInstantWin() ? Localize( "#CONTROL_INSTALOCKOUT_INSTRUCTIONS_TEAM2" ) : ""
				eventDesc = eventDesc + descDetails
				data.eventDesc = eventDesc
				data.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
			}
		}
		else
		{
			if ( yourTeamIndex ==  majorityTeam )
			{
				string descDetails = Control_GetIsLockoutInstantWin() ? Localize( "#CONTROL_INSTALOCKOUT_INSTRUCTIONS_WINNINGTEAM" ) : Localize( "#CONTROL_LOCKOUT_INSTRUCTIONS_WINNINGTEAM" )
				eventDesc = eventDesc + descDetails
				data.eventDesc = eventDesc
				data.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED )
			}
			else
			{
				string descDetails = Control_GetIsLockoutInstantWin() ? Localize( "#CONTROL_INSTALOCKOUT_INSTRUCTIONS_LOSINGTEAM" ) : Localize( "#CONTROL_LOCKOUT_INSTRUCTIONS_LOSINGTEAM" )
				eventDesc = eventDesc + descDetails
				data.eventDesc = eventDesc
				data.colorOverride = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
			}
		}


		Control_ObjectiveScoreTracker_PushAnnouncement( wp,
			true,
			"",
			Localize( data.eventName ),
			wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_END_TIME ) - wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_START_TIME ),
			wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_END_TIME ) - wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_START_TIME ),
			true,
			true,
			data.colorOverride)

		foreach( scoreRui in file.scoreTrackerRui )
		{
			RuiSetBool( scoreRui, "isLockout", true )
		}

		foreach( scoreRui in file.fullmapScoreTrackerRui )
		{
			RuiSetBool( scoreRui, "isLockout", true )
		}
	}

	WaitForever()
}
#endif          

#if CLIENT
void function Control_PlayFinalObjectiveCapturingWarning( bool shouldDisplayMessage )
{
	entity player = GetLocalViewPlayer()

	if ( !IsValid( player ) )
		return

	if ( shouldDisplayMessage )
	{
		GamemodeUtility_AnnouncementMessageWarning( player, Localize( "#CONTROL_INSTALOCKOUT_FINAL_OBJECTIVE_CAPTURE" ), GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED ), CONTROL_FINAL_OBJECTIVE_BEING_CAPTURED_WARNING, CONTROL_MESSAGE_DURATION_SHORT )
	}
	else
	{
		EmitUISound( CONTROL_FINAL_OBJECTIVE_BEING_CAPTURED_WARNING )
	}
}
#endif          

#if CLIENT
void function RegisterMinimapPackages()
{
	RegisterMinimapPackage( "prop_script", eMinimapObject_prop_script.CONTROL_OBJECTIVE, MINIMAP_OBJECT_DYNAMIC_RUI, MinimapPackage_Objective, FULLMAP_OBJECT_RUI, FullmapPackage_Objective )
}
#endif          

#if CLIENT
void function MinimapPackage_Objective( entity ent, var rui )
{
	RuiSetImage( rui, "defaultIcon", CONTROL_OBJ_DIAMOND_EMPTY )
	RuiSetImage( rui, "clampedDefaultIcon", $"" )
	RuiSetFloat2( rui, "iconScale", <0.5, 0.5, 0> )

	entity waypoint
	foreach( child in ent.GetParent().GetChildren() )
	{
		if ( child != ent )
		{
			waypoint = child
			break
		}
	}

	if ( IsValid(waypoint ) )
		file.waypointToMinimapRui[waypoint] <- rui
}
#endif          

#if CLIENT
void function FullmapPackage_Objective( entity ent, var rui )
{
	RuiSetImage( rui, "defaultIcon", CONTROL_OBJ_DIAMOND_EMPTY )
	RuiSetImage( rui, "clampedDefaultIcon", $"" )

	entity waypoint
	foreach( child in ent.GetParent().GetChildren() )
	{
		if ( child != ent )
		{
			waypoint = child
			break
		}
	}

	if ( IsValid(waypoint ) )
		file.waypointToFullmapRui[waypoint] <- rui
}
#endif          

#if CLIENT
void function ServerCallback_Control_ProcessObjectiveStateChange( entity objective, int newState, int owner, int lastOwner, int capturer, int lastCapturer, bool didCapturingTeamBreakLockout )
{
	if ( !IsValid( objective ) )
		return

	entity localViewPlayer = GetLocalViewPlayer()
	if ( !IsValid( localViewPlayer ) )
		return

	                                                                                                 
	Signal( objective, "Control_OnObjectiveStateChanged_Client" )

	int localPlayerAlliance = AllianceProximity_GetAllianceFromTeam( localViewPlayer.GetTeam() )
	int objectiveID = objective.GetWaypointInt( INT_OBJECTIVE_ID )
	string objectiveName = Control_GetObjectiveNameFromObjectiveID_Localized( objectiveID )

	if ( newState == eControlPointObjectiveState.CONTROLLED )
	{
		if ( owner == ALLIANCE_NONE )
		{
			                       
			Obituary_Print_Localized( Localize( "#CONTROL_UNCONTROLLED_POINT", objectiveName ), GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL ) )
		}
		else
		{
			                             
			string teamName = localPlayerAlliance == owner ? "#PL_YOUR_TEAM" : "#PL_ENEMY_TEAM"
			vector announcementColor = localPlayerAlliance == owner ? GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED ) : GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
			string soundAlias = localPlayerAlliance == owner ? CONTROL_SFX_ZONE_CAPTURED_FRIENDLY : CONTROL_SFX_ZONE_CAPTURED_ENEMY
			Obituary_Print_Localized( Localize( "#CONTROL_CAPTURED_POINT", Localize( teamName ), objectiveName ), announcementColor )

			if ( !file.isLockout && !didCapturingTeamBreakLockout )
				EmitSoundOnEntity( objective, soundAlias )
		}
	}
	else if ( newState == eControlPointObjectiveState.CONTESTED )
	{
		if ( owner == ALLIANCE_NONE )
		{
			                       
			string teamName = localPlayerAlliance != capturer ? "#PL_YOUR_TEAM" : "#PL_ENEMY_TEAM"
			vector announcementColor = localPlayerAlliance != capturer ? GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED ) : GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
			string warningAnnouncement = "#CONTROL_OBJ_FLIPPED"
			vector warningColor = localPlayerAlliance == capturer ? GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED ) : GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
			Obituary_Print_Localized( Localize( "#CONTROL_LOST_POINT", Localize( teamName ), objectiveName ), announcementColor )

			EmitSoundOnEntity( objective, CONTROL_SFX_ZONE_NEUTRALIZED )
		}
	}

	Control_UpdateScoreGenerationOnClient()
}
#endif          

#if CLIENT
                                                                         
void function Control_UpdateScoreGenerationOnClient()
{
	entity localViewPlayer = GetLocalViewPlayer()

	if ( !IsValid( localViewPlayer ) )
		return

	entity localPlayer = GetLocalClientPlayer()
	bool isObserver = GamemodeUtility_IsPlayerOnTeamObserver( localPlayer )

	int localPlayerAlliance = AllianceProximity_GetAllianceFromTeamWithObserverCorrection( localViewPlayer.GetTeam() )
	int enemyAlliance = AllianceProximity_GetOtherAlliance( localPlayerAlliance )

	                                                                                                                         
	                                                        
	int minNumOwnedObjectivesToGainScore = Control_GetMinHeldObjectivesToGenerateScore()
	int numObjectivesOwnedByLocalPlayerAlliance = Control_GetNumOwnedObjectivesByAlliance( localPlayerAlliance )
	int numObjectivesOwnedByEnemyAlliance = Control_GetNumOwnedObjectivesByAlliance( enemyAlliance )
	int minNumOwnedPointsFriendly = Control_GetMinHeldObjectivesToGenerateScore_ForAlliance( localPlayerAlliance )
	int minNumOwnedPointsEnemy = Control_GetMinHeldObjectivesToGenerateScore_ForAlliance( enemyAlliance )

	                                                                                                                             
	                                                                                                      
	int numObjectivesNeeded = maxint( minNumOwnedPointsFriendly - numObjectivesOwnedByLocalPlayerAlliance, 0 )
	int teamScorePerSec = numObjectivesOwnedByLocalPlayerAlliance >= minNumOwnedPointsFriendly ? numObjectivesOwnedByLocalPlayerAlliance : 0
	int numObjectivesNeededEnemy = maxint( minNumOwnedPointsEnemy - numObjectivesOwnedByEnemyAlliance, 0 )
	int teamScorePerSecEnemy = numObjectivesOwnedByEnemyAlliance >= minNumOwnedPointsEnemy ? numObjectivesOwnedByEnemyAlliance : 0

	if ( minNumOwnedObjectivesToGainScore > 1 )
	{
		var scoreTrackerRui = file.scoreTrackerRui[1]
		var mapScoreTrackerRui = file.fullmapScoreTrackerRui[1]

		if ( IsValid( scoreTrackerRui ) )
		{
			RuiSetBool( scoreTrackerRui, "shouldDisplayMinOwnedObjectiveMessage", true )
			RuiSetInt( scoreTrackerRui, "yourTeamObjectivesNeededToScore", numObjectivesNeeded )
			RuiSetInt( scoreTrackerRui, "teamScorePerSec", teamScorePerSec )
			RuiSetBool( scoreTrackerRui, "shouldDisplayCatchupMechanicMessage", Control_ShouldUseCatchupMechanics() )
			RuiSetInt( scoreTrackerRui, "catchupMechanicScoreDifference", Control_GetPointDiffForCatchupMechanics() )
		}

		if ( IsValid( mapScoreTrackerRui ) )
		{
			RuiSetBool( mapScoreTrackerRui, "shouldDisplayMinOwnedObjectiveMessage", true )
			RuiSetInt( mapScoreTrackerRui, "yourTeamObjectivesNeededToScore", numObjectivesNeeded )
			RuiSetInt( mapScoreTrackerRui, "teamScorePerSec", teamScorePerSec )
			RuiSetBool( mapScoreTrackerRui, "shouldDisplayCatchupMechanicMessage", Control_ShouldUseCatchupMechanics() )
			RuiSetInt( mapScoreTrackerRui, "catchupMechanicScoreDifference", Control_GetPointDiffForCatchupMechanics() )
		}

		                                                                          
		var scoreTrackerRuiEnemy = file.scoreTrackerRui[0]
		var mapScoreTrackerRuiEnemy = file.fullmapScoreTrackerRui[0]

		if ( IsValid( scoreTrackerRuiEnemy ) )
		{
			RuiSetBool( scoreTrackerRuiEnemy, "shouldDisplayMinOwnedObjectiveMessage", true )
			RuiSetInt( scoreTrackerRuiEnemy, "teamScorePerSec", teamScorePerSecEnemy )
		}

		if ( IsValid( mapScoreTrackerRuiEnemy ) )
		{
			RuiSetBool( mapScoreTrackerRuiEnemy, "shouldDisplayMinOwnedObjectiveMessage", true )
			RuiSetInt( mapScoreTrackerRuiEnemy, "teamScorePerSec", teamScorePerSecEnemy )
		}
	}

	                                                                                                                                      
	file.teamData[ALLIANCE_A].teamScorePerSec = Control_GetNumOwnedObjectivesByAlliance( ALLIANCE_A )
	file.teamData[ALLIANCE_B].teamScorePerSec = Control_GetNumOwnedObjectivesByAlliance( ALLIANCE_B )
}
#endif          

#if CLIENT
void function ServerCallback_Control_BountyClaimedAlert( entity wp, int bountyAmount, int capturingTeam )
{
	if ( !IsValid( wp ) )
		return

	entity localViewPlayer = GetLocalViewPlayer()
	entity localClientPlayer = GetLocalClientPlayer()

	if ( !IsValid( localViewPlayer ) )
		return

	if ( !IsValid( localClientPlayer ) )
		return

	int localPlayerAlliance = AllianceProximity_GetAllianceFromTeam( localViewPlayer.GetTeam() )

	string teamName = localPlayerAlliance == capturingTeam ? "#PL_YOUR_TEAM" : "#PL_ENEMY_TEAM"
	teamName = Localize( teamName )
	string announcementSFX = localPlayerAlliance == capturingTeam ? CONTROL_SFX_CAPTURE_BONUS_CLAIMED_FRIENDLY : CONTROL_SFX_CAPTURE_BONUS_CLAIMED_ENEMY
	vector announcementColor = localPlayerAlliance == capturingTeam ? GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED ) : GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
	int objectiveID = wp.GetWaypointInt( INT_OBJECTIVE_ID )
	string objectiveName = Control_GetObjectiveNameFromObjectiveID_Localized( objectiveID )
	Obituary_Print_Localized( Localize( "#CONTROL_POINT_BOUNTY_CLAIMED_SPECIFIC_OBIT", objectiveName, Localize( teamName ) ), announcementColor )
	AnnouncementMessageRight( GetLocalClientPlayer(), Localize( "#CONTROL_POINT_BOUNTY_CLAIMED_SPECIFIC", objectiveName, teamName ), "", SrgbToLinear( announcementColor / 255 ), $"rui/hud/gametype_icons/control/capture_bonus", CONTROL_MESSAGE_DURATION, announcementSFX, SrgbToLinear( announcementColor / 255 ) )
}
#endif          

#if CLIENT
void function ServerCallback_Control_BountyActiveAlert( entity wp )
{
	if ( !IsValid( wp ) )
		return

	entity localViewPlayer = GetLocalViewPlayer()

	if ( !IsValid( localViewPlayer ) )
		return

	int localPlayerAlliance = AllianceProximity_GetAllianceFromTeam( localViewPlayer.GetTeam() )
	int ownerTeam = wp.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )
	vector announcementColor = localPlayerAlliance == ownerTeam ? GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED ) : GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
	int objectiveID = wp.GetWaypointInt( INT_OBJECTIVE_ID )
	string objectiveName = Control_GetObjectiveNameFromObjectiveID_Localized( objectiveID )

	Obituary_Print_Localized( Localize( "#CONTROL_POINT_BOUNTY_PLACED_SPECIFIC_OBIT", objectiveName ), announcementColor )
	AnnouncementMessageRight( localViewPlayer, Localize( "#CONTROL_POINT_BOUNTY_PLACED_SPECIFIC", objectiveName ), "", SrgbToLinear( announcementColor / 255), $"rui/hud/gametype_icons/control/capture_bonus", CONTROL_MESSAGE_DURATION, CONTROL_SFX_CAPTURE_BONUS_ADDED, SrgbToLinear( announcementColor / 255 ) )
}
#endif          

#if CLIENT
bool function Control_Client_IsOnObjective( entity wp, entity player )
{
	return player.GetPlayerNetInt( "Control_ObjectiveIndex" ) == wp.GetWaypointInt( INT_OBJECTIVE_ID )
}
#endif          

#if CLIENT
                                                                                                                    
string function Control_GetObjectiveNameFromObjectiveID_Localized( int objectiveID )
{
	string objectiveName = CONTROL_OBJECTIVE_DEFAULT_NAME
	bool didGetValidObjectiveName = false
	switch ( objectiveID )
	{
		case CONTROL_OBJECTIVE_A_INDEX:
			objectiveName = "#CONTROL_OBJECTIVE_A"
			didGetValidObjectiveName = true
			break
		case CONTROL_OBJECTIVE_B_INDEX:
			objectiveName = "#CONTROL_OBJECTIVE_B"
			didGetValidObjectiveName = true
			break
		case CONTROL_OBJECTIVE_C_INDEX:
			objectiveName = "#CONTROL_OBJECTIVE_C"
			didGetValidObjectiveName = true
			break
		default:
			Warning("Running Control_GetObjectiveNameFromObjectiveID_Localized function with an invalid objectiveID: %i", objectiveID )
			break
	}

	if ( !didGetValidObjectiveName )
		return objectiveName

	return Localize( objectiveName )
}
#endif

  
                                                                                                  
                                                                                                   
                                                                                                 
                                                                                                  
                                                                                                   
                                                                                                  


	               
  


                                                                                                          
                                                                                                                                              
                                                      
string function Control_GetObjectiveNameFromObjectiveID( int objectiveID )
{
	string objectiveName = CONTROL_OBJECTIVE_DEFAULT_NAME
	switch ( objectiveID )
	{
		case CONTROL_OBJECTIVE_A_INDEX:
			objectiveName = CONTROL_OBJECTIVE_A_NAME
			break
		case CONTROL_OBJECTIVE_B_INDEX:
			objectiveName = CONTROL_OBJECTIVE_B_NAME
			break
		case CONTROL_OBJECTIVE_C_INDEX:
			objectiveName = CONTROL_OBJECTIVE_C_NAME
			break
		default:
			Warning("Running Control_GetObjectiveNameFromObjectiveID function with an invalid objectiveID: %i", objectiveID )
			break
	}

	return objectiveName
}

#if SERVER
                                                                                                                                 
                                                                             
 
	                          
	                    
	 
		                                                       
		 
			                                                              
			 
				                               
					                      
			 
		 

		                           
		 
			                                                            
			                                                             
		 
	 

	                   
 
#endif          

#if SERVER
                                                                                                    
                                                                    
 
	                          
	                    
	 
		                                                                                                                           
		                                                                                                                                                                                            
		                                                     
		                           
	 

	                   
 
#endif          

#if SERVER
                                                                      
                                                                                                 
 
	                                                                   
		      

	                                             
	                                    
		      

	                                                                    
		      

	                                                                                                      
	                                                            
		      

	                                                                            
	                 

	                                                                                                         
	 
		                                                
		 
			                                                          
			                         
			 
				                    
				 
					                                                                                                                                
					                                                
					                                                                                                                            
					                                                                
					                                           
					      
				 
				                                                
				                                                                                                                            
				                                                                
				                                           
			 
		 

		                                                                                                       
			      

		                                                                  

		                                                                                                                                 
		                                               
		
		                                                                                                                            
		                                                                      
		                                                     
		 
			                                               
			 
				                                                                    
			 
			                                                    
			 
				                                                                    
			 
			                                                    
			 
				                                                                    
			 
		 
		                                                          
		 
			                                               
			 
				                                                                    
			 
			                                                    
			 
				                                                                    
			 
			                                                    
			 
				                                                                    
			 
		 

		                                     
		 
			                                                                   
			 
				                                                                        
				           
				                                                                        
			 
			    
			 
				                                                                         
			 

			                                             
			 
				                                                                                                                   
					                                                                                                                                             
			 
		 
		                                          
		 
			                                                                   
			 
				                                                                        
				           
				                                                                        
			 
			    
			 
				                                                                         
			 

			                                             
			 
				                                                                                                                   
					                                                                                                                                             
			 
		 
		                                                                                                                             
	 
 
#endif          

#if SERVER
                                                                        
                                                           
 
	                                                                        
	 
		                                                    
		                                                                    
			      

		                                                                    
		                 
		                                                                         
		 
			                             
			 
				                                                                   
				 
					                                                                        
					           
					                                                                                     
				 
				    
				 
					                                                                         
				 

				                                       
				                                             
				 
					                                                                                                                   
						                                                                                                                                                          
				 
			 
			                                  
			 
				                                                                   
				 
					                                                                        
					           
					                                                                                     
				 
				    
				 
					                                                                         
				 

				                                       
				                                             
				 
					                                                                                                                   
						                                                                                                                                                          
				 
			 
			                                                                            
		 
	 
 
#endif          

#if SERVER
                                                                       
                                                                                                     
 
	                                                                                                          
		      

	                                                 

	                                                                                     
		                                             

	                                                                                          
	                             
	                                     
	 
		                                                                                                 
			                                
	 

	                                                                                                                                                                                                         
	                   

	                                              
	 
		                       
			        

		                                                                          
			        

		                                                                       
		                                                                                                                                         
		 
			                                                                            
			 
				                                                    
				                                           
					                   
			 
		 
	 

	                              
	 
		                                                    
		 
			                                
			 
				                                              
				                                                        
				 
					                                                                        
					                                                                                                                          
					 
						                                                                
							                                        
					 
				 
				                                                                                                                                                                       
			 
		 
	 
 
#endif          

#if SERVER
                                                                                                                                               
                                                                                          
 
	                                        
	                                                                                                          
		      

	                                          
	                           

	                                              
	 
		                       
			        

		                                                                  
		                                                                                               
		 
			                                                    
			                                           
			 
				                                                                       
				                                                                          
				                                                                               

				                                                                                                      
				 
					                                                                                                  
					                            
				 
				                                                                                                          
				 
					                                                                                                 
					                            
				 
			 
		 

	 
	                                                                                                                           
	                                                                                           

	                                        
	 
		                      
		 
			                                                                          
			                                                                                                        
			                                     
			 
				                                                
				 
					                                                          
					                         
					 
						                      
						 
							                                                
							                                                                                                                            
							                                                                
						 
					 
				 
			 
			
			                                                                              
			              

			                                  
			 
				                                 
				 
					                                                                                                                                                                           
				 
				    
				 
					                                                                                                                                                                           
				 
			 
			                                       
			 
				                                 
				 
					                                                                                                                                                                           
				 
				    
				 
					                                                                                                                                                                           
				 
			 
			    
			 
				                                 
				 
					                                                                                                                                                                           
				 
				                                      
				 
					                                                                                                                                                                           
				 
			 
		 
	 
 
#endif          

                      
#if SERVER
                                                                                       
 
	                               
		      

	                                                                                         

	                               
		      

	                                                                                    
	 
		                                                                                                                                       
		                                                                                           

		                                                                                          

		                                                
		                                                         
		                                                                                            
		                                                                  
	 
	    
	 
		                                                                       
		                                                          

		                                                                              
		                                                                                                                               
		                                                                                                         

		                                                                                                                                   
		 
			                                                  
		 
	 

	                                                                                                                         
	                                                                                                                                                                                          
	                                                                                                                          
	 
		                        
		                                                   
	 
 
#endif          
                            

                      
#if CLIENT || SERVER
bool function Control_IsPlayerAbandoning( entity player )
{
	if ( !Control_IsModeEnabled() )
		return false

	if ( !GetCurrentPlaylistVarBool( "control_match_abandon_penalty", true ) )
		return false

	if ( GetGameState() >= eGameState.WinnerDetermined )
		return false

	if ( Control_IsLeavingReasonableForPlayer( player ) )
		return false

	if ( GetGameState() >= eGameState.Prematch && !player.GetPlayerNetBool( "rankedDidPlayerEverHaveAFullTeam" ) )
		return false

	return true
}
#endif                    
                            

                      
#if CLIENT || SERVER
bool function Control_IsLeavingReasonableForPlayer( entity player )
{
	if ( !GetGlobalNetBool( "Control_IsMatchFair" ) )
		return true

	return false
}
#endif                    
                            

#if CLIENT || SERVER
int function Control_GetAbandonPenaltyLength( entity player )
{
	if( !IsValid( player ) )
		return 0

	int numGamesAbandoned = expect int ( player.GetPersistentVar( "numControlAbandons" ) ) + 1

	int banLength
	switch( numGamesAbandoned )
	{
		case 0:
			banLength = 0                         
			break
		case 1:
			banLength = GetCurrentPlaylistVarInt( "control_abandon_penalty_1", 60 * 2 )            
			break
		case 2:
			banLength = GetCurrentPlaylistVarInt( "control_abandon_penalty_2", 60 * 5 )            
			break
		case 3:
			banLength = GetCurrentPlaylistVarInt( "control_abandon_penalty_3", 60 * 10 )              
			break
		case 4:
			banLength = GetCurrentPlaylistVarInt( "control_abandon_penalty_4", 60 * 20 )              
			break
		default:
			banLength = GetCurrentPlaylistVarInt( "control_abandon_penalty_4", 60 * 20 )                                                            
			break
	}

	return banLength
}
#endif                    

#if CLIENT || SERVER
                                                               
array<entity> function Control_GetObjectiveStarterPings()
{
	return file.objectiveStarterPings
}
#endif                    

#if CLIENT || SERVER
                                                                     
int function Control_GetPingCountForObjectiveForAlliance( entity wp, int alliance )
{
	int pingCount = 0

	if ( IsValid( wp ) && wp.GetWaypointType() == eWaypoint.CONTROL_OBJECTIVE )
	{
		if ( alliance == ALLIANCE_A && wp in file.objectiveToPingCountTableAllianceA )
		{
			pingCount = file.objectiveToPingCountTableAllianceA[ wp ]
		}
		else if ( alliance == ALLIANCE_B && wp in file.objectiveToPingCountTableAllianceB )
		{
			pingCount = file.objectiveToPingCountTableAllianceB[ wp ]
		}
	}
	return pingCount
}
#endif                    

#if CLIENT || SERVER
                                                                                                                                                                                 
                                                                                                                                                                                       
entity function Control_GetStarterPingFromTraceBlockerPing( entity pingedEnt, int playerTeam )
{
	entity starterPing = null

	if ( IsValid( pingedEnt ) && pingedEnt.GetScriptName() == CONTROL_OBJECTIVE_SCRIPTNAME && IsValid( pingedEnt.GetOwner() ) )
	{
		array<entity> objectiveStartPings = Control_GetObjectiveStarterPings()

		if ( objectiveStartPings.len() > 0 )
		{
			entity objective = pingedEnt.GetOwner()
			int pingType

			foreach ( ping in objectiveStartPings )
			{
				if ( !IsValid( ping ) )
					continue

				                                                               
				if ( IsValid( ping ) && IsValid( ping.GetParent() ) && IsValid( ping.GetParent().GetOwner() ) )
				{
					entity pingedObjective = ping.GetParent().GetOwner()
					if ( pingedObjective == objective )
					{
						int objectiveWaypointPingType = Waypoint_GetPingTypeForWaypoint( ping )
						bool isPingTeamPlayerTeam = AllianceProximity_GetAllianceFromTeam( playerTeam ) == AllianceProximity_GetAllianceFromTeam( ping.GetTeam() ) ? true : false

						if ( isPingTeamPlayerTeam )
						{
							starterPing = ping
							pingType = objectiveWaypointPingType
						}
					}
				}
			}
		}
	}

	return starterPing
}
#endif                    

#if CLIENT
                                                                                            
void function Control_OnPlayerWaypointCreated( entity wp )
{
	if ( IsValid( wp ) && wp.GetWaypointType() == eWaypoint.PING_LOCATION && IsValid( wp.GetOwner() ) )
	{
		entity objectiveWaypoint = wp.GetOwner()

		if ( objectiveWaypoint.GetNetworkedClassName() != PLAYER_WAYPOINT_CLASSNAME )
			return

		if ( IsValid( objectiveWaypoint ) && objectiveWaypoint.GetWaypointType() == eWaypoint.CONTROL_OBJECTIVE && !file.objectiveStarterPings.contains( wp ) )
				file.objectiveStarterPings.append( wp )
	}
}
#endif          

#if CLIENT
                                                                                              
void function Control_OnPlayerWaypointDestroyed( entity wp )
{
	if ( IsValid( wp ) && wp.GetWaypointType() == eWaypoint.PING_LOCATION && IsValid( wp.GetOwner() ) && file.objectiveStarterPings.contains( wp ) )
		file.objectiveStarterPings.fastremovebyvalue( wp )
}
#endif          

#if CLIENT
                                        
void function ServerCallback_Control_UpdateObjectivePingText( entity wp, int pingType, int pingCount, bool doesPlayerHavePingOnObjective )
{
	if ( IsValid( wp ) && IsValid( wp.wp.ruiHud ) && pingCount >= 0 )
	{
		if ( pingType == ePingType.CONTROL_OBJECTIVE_DEFEND || pingType == ePingType.CONTROL_OBJECTIVE_ATTACK )
		{
			                                                                                                   
			string promptText = ""

			if ( pingCount <= 0 )                                                        
			{
				promptText = Localize( "#PROMPT_PING_CONTROL_OBJECTIVE" )
			}
			else                                     
			{
				if ( doesPlayerHavePingOnObjective )
				{
					if ( pingCount == 1 )                                                                                             
					{
						promptText = Localize( "#PROMPT_CANCELED_PING" )
					}
					else                                                                                                          
					{
						promptText = Localize( "#PROMPT_PING_CONTROL_OBJECTIVE_CANCEL", pingCount )
					}
				}
				else                                                                                                                                   
				{
					promptText = Localize( "#PROMPT_PING_CONTROL_OBJECTIVE_JOIN", pingCount )
				}
			}

			promptText = promptText + " `1%ping%`0"
			RuiSetString( wp.wp.ruiHud, "pingPrompt", promptText )
		}
	}
}
#endif          

#if CLIENT
                                                      
void function ServerCallback_Control_UpdateLastPingedObjective( entity pingingPlayer, entity wp, entity pingedEnt, int pingType, bool isDestroying )
{
	entity localPlayer = GetLocalViewPlayer()

	if ( !IsValid( wp ) || !IsValid( pingedEnt ) ||!IsValid( pingingPlayer ) || !IsValid( localPlayer ) )
		return

	if ( pingingPlayer != localPlayer )
		return

	if ( pingType != ePingType.CONTROL_OBJECTIVE_DEFEND &&  pingType != ePingType.CONTROL_OBJECTIVE_ATTACK )
		return

	entity objectiveWaypoint = pingedEnt.GetOwner()
	if ( IsValid( objectiveWaypoint ) && objectiveWaypoint.GetWaypointType() == eWaypoint.CONTROL_OBJECTIVE )
	{
		if ( isDestroying )
		{
			file.lastLocalObjectivePing = null
		}
		else
		{
			file.lastLocalObjectivePing = wp
		}
	}
}
#endif          

#if CLIENT
                                                      
void function ServerCallback_Control_UpdateObjectivePingCounts( entity objectiveWaypoint, int alliance, int count )
{
	if ( IsValid( objectiveWaypoint ) && objectiveWaypoint.GetWaypointType() == eWaypoint.CONTROL_OBJECTIVE )
	{
		if ( alliance == ALLIANCE_A )
		{
			file.objectiveToPingCountTableAllianceA[ objectiveWaypoint ] <- count
		}
		else if ( alliance == ALLIANCE_B )
		{
			file.objectiveToPingCountTableAllianceB[ objectiveWaypoint ] <- count
		}
	}
}
#endif          

#if CLIENT || SERVER
                                                                             
bool function Control_DidPlayerPingSameObjective( entity player, entity wp, entity pingEnt )
{
	if ( !IsValid( pingEnt ) || !IsValid( player ) || !IsValid( wp ) )
		return false

	entity objectiveWaypoint = pingEnt.GetOwner()
	if ( IsValid( objectiveWaypoint ) && objectiveWaypoint.GetWaypointType() == eWaypoint.CONTROL_OBJECTIVE )
	{
		#if CLIENT
			entity oldPing = file.lastLocalObjectivePing
			if ( IsValid( oldPing ) && oldPing == wp )
				return true
		#endif          

		#if SERVER
		                                                
		 
			                                                          
			                                          
				           
		 
		#endif          
	}
	return false
}
#endif                    

#if CLIENT || SERVER
                                                                                                               
bool function Control_ShouldUseCatchupMechanics()
{
	return Control_GetAllianceUsingCatchupMechanics() != ALLIANCE_NONE
}
#endif                    

#if CLIENT || SERVER
                                                                                                                                                                        
int function Control_GetAllianceUsingCatchupMechanics()
{
	int allianceUsingCatchupMechanics = ALLIANCE_NONE
	int losingAlliance = ALLIANCE_NONE

	                                                                                                    
	int scoreDifference = AllianceProximity_GetAllianceScoreDifference()

	                                                         
	if ( scoreDifference > 0 )
	{
		losingAlliance = AllianceProximity_GetOtherAlliance( GamemodeUtility_GetWinningAlliance() )

		if ( scoreDifference >= Control_GetPointDiffForCatchupMechanics() )
		{
			allianceUsingCatchupMechanics = losingAlliance
		}
		else if ( Control_ShouldTriggerCatchupMechanicsForTeamInBalance() )
		{
			                                                                                                                                                                    
			int allianceAPlayerNum = Control_GetPlayerCountForFaction( ALLIANCE_A )
			int allianceBPlayerNum = Control_GetPlayerCountForFaction( ALLIANCE_B )

			if ( allianceAPlayerNum != allianceBPlayerNum )
			{
				int allianceWithLessPlayers = allianceAPlayerNum > allianceBPlayerNum ? ALLIANCE_B : ALLIANCE_A
				if ( allianceWithLessPlayers == losingAlliance )
					allianceUsingCatchupMechanics = losingAlliance
			}
		}
	}

	return allianceUsingCatchupMechanics
}
#endif                    

#if CLIENT || SERVER
                                                                                                     
                                                                                                  
                                                                                                                                   
int function Control_GetMinHeldObjectivesToGenerateScore_ForAlliance( int alliance )
{
	int minNumOwnedObjectivesToGainScore = Control_GetMinHeldObjectivesToGenerateScore()
	return ( minNumOwnedObjectivesToGainScore > 0 && ( !Control_GetIsMinHeldObjectivesOnlyForWinningTeam() || Control_ShouldUseCatchupMechanics() && GamemodeUtility_GetWinningAlliance() == alliance ) ) ? minNumOwnedObjectivesToGainScore : 0
}
#endif                    


#if SERVER || CLIENT
                                       
void function Control_SetPlayerCountForFaction( int faction )
{
	                                                                                                                                                                                 
	if ( GetGameState() == eGameState.WinnerDetermined )
		return

	if ( faction == ALLIANCE_NONE )
		return

	int numPlayersInFaction = 0
	foreach( player in GetPlayerArray() )
	{
		if ( IsValid( player ) && IsTeamInAlliance( player.GetTeam(), faction ) )
		{
			numPlayersInFaction++
		}
	}
	file.factionToPlayerCountTable[ faction ] <- numPlayersInFaction
}
#endif                    

#if SERVER || CLIENT
                                                                                                                                                                          
int function Control_GetPlayerCountForFaction( int faction )
{
	int numPlayersInFaction = 0
	if ( faction in file.factionToPlayerCountTable )
		numPlayersInFaction = file.factionToPlayerCountTable[ faction ]

	return numPlayersInFaction
}
#endif                    

#if CLIENT || SERVER
int function Control_GetNumOwnedObjectivesByAlliance( int alliance )
{
	int numOwnedObjectives = 0

	#if SERVER
		                                                        
		 
			                                          
				                    
		 
	#endif          

	#if CLIENT
		foreach( wp in file.waypointList )
		{
			if ( IsValid( wp ) && wp.GetWaypointType() == eWaypoint.CONTROL_OBJECTIVE )
			{
				int objectiveOwner = wp.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )
				if ( objectiveOwner == alliance )
					numOwnedObjectives++
			}
		}
	#endif          

	return numOwnedObjectives
}
#endif                    

  
                                                   
                                                    
                                                    
                                                    
                                                    
                                                    


                                                                                            
                                                                                             
                                                                                          
                                                                                          
                                                                                          
                                                                                          

                                                                                               
#if SERVER
                                                                                      
 
	                                                
		      

	                        
	 
		                                                                             

		                       
		                                                 
			                                               

		                         
		                                         
			                              

		                                                                                                                 
		                                                                                                      
			                                               

		                                                
		                                                                        
	 

	                         
		      

	                                                                  
	 
		                              
		                                            

		                             
		                                                          
		 
			                                                                
				                                     
		 

		                                                                                                                                                     
	 

	                             
	                                                                                                                        
 
#endif          

#if SERVER
                                                               
 
	                                                  
		            

	                                                                   
	                                 
		       	     

	                                                                 
	                                                                
	                                       
		           

	            
 
#endif          

#if SERVER
                                                                                    
                                                                                           
 
	                                               

	           

	                                               
		      

	                               
	 
		                     
		                                                                            
			                                                  

		                                                 
			                                                                                                                                    

		                                                                                
		                                                       
		 
			                                                                                                      
		 

		                                                   
	 
 
#endif          

#if SERVER
                                 
                                                                                         
                                                               
 
	                         
		      

	                                

	                                   
	 
		                                           
		                                                                                             
		                           
		                                 
		 
			                                                                
			                                                                                       
			 
				                                                                         
			 
		 

		                            
		 
			                                                                                                                                                                        
		 
		    
		 
			                                                                                   
		 
		                                      
		                                                                                  
	 

	                                                                                               
	                                                                                      
	                                                              
	                   
	                                      
	 
		                          
			        

		                                                                
		                             
		 
			     
		 
		                                               
		 
			                                                            
			                                                                                                                                    
			                                    
		 
	 

	                           
	                                                                  

	                            
	 
		                        
			                                                                                                                                   
	 

	                           
	                                                                                                
	                                                                                             
	 
		                                                                                                                                      
	 

	                                                                   
	                                                                    
	                                                                      
	                                                                                
	                                                                          
	                                                            

	                                                                   
	 
		                                                             
		                                       
		 
			                                                                                                                      
		 
	 

	                                                                     
	 
		                                                              
		                                       
		 
			                                                                                                                      
		 
	 

	                                                                               
	 
		                                                                   
		                                       
		 
			                                                                                                                      
		 
	 

	                                                                         
	 
		                                                                
		                                       
		 
			                                                                                                                      
		 
	 

	                                                                                         
	                                         
	 
		                                        
	 
 
#endif          

#if SERVER
                                                                
                                                                     
 
	                                 
	 
		                                                                                            
		                                                                                                                                  

		                                                                                         
		                                         
		 
			                                        
		 
	 
 
#endif          

#if SERVER
                                                                              
 
	                               
		      

	                                                                                               
 
#endif          

#if SERVER
                                                                             
 
	                               
		      

	                                                                                                          
 
#endif          

#if SERVER
                                             
 
	                                            
		                          

	                          
	                                                        

	                                    
 
#endif          

#if SERVER
                                                   
                                                     
                                                                                                                                      
                                                        
 
	                                               

	                                                                      
	                                                                                                                                                                   
	                                                    
	 
		                          
		                                                     
		                                                        
		                                                                       

		                                      
		 
			                        
			 
				                                                                                                                    
				                                                                   
				 
					                                              
				 

				                                      
				                                                                                          
			 
		 

		                                                         

		                                                                           
		                                                                                   

		                                                  
		 
			                                 
			 
				                                                                          
				                                                                                                
				                                                                                                           

				                                                            
				                   
				 
					                                                 
					                      
						                                             

					                                                   
				 
			 
		 

		                                          

		                                                                
		                                     
		                      

		                                                                                                      
		                                                                   
		                                                  
		 
			                                                                                                                                     
			 
				                                                                        
				                                                                 

				                                                                                                           

				                                                                                                                                                        
				                                                                
				 
					                                              

					                                                     
						                          

					        
				 
				                                                                                           
			 
		 

		                                                             
		                                     
			                                                             

		                                                                                                       
		                            
		 
			                             

			                                                                                                  
			                                      
			 
				                                                                                                                  
				 
					                                              
				 
			 
		 
	 
 
#endif          

#if SERVER
                                                                                      
                                                                       
 
	                                   

	                                     
	 
		                                                                                                                
			                                    
	 

	                          
 
#endif          

#if SERVER
                                                                                                                                                                                                                  
                                                                   
 
	                         
		      

	                                                                      
	                                                                   
		                                                                     
	                                                
	                                                                                                       
 
#endif          

#if SERVER
                                                                                                                                                               
                                               
 
	                  
	                             
	 
		                                                                                
	 
	    
	 
		                                                                                      
	 

	                   
 
#endif          

#if SERVER
                                                       
                                                                                                                  
 
	                    

	                        
	 
		                                                                                                       
		                                                                 
		 
			                                                                           
		 
		                                                                                                                                                                                                                                  
		 
			                                                                                         
		 
	 

	                                                                                                                              
	              
	 
		                                                   
	 
	    
	 
		                                                                    
	 
 
#endif          

#if SERVER
                                                                                                 
                                                                                                  
 
	                                                              

	                        
	 
		                                                             
			                                                   

		                                                                                                                                                        
		                            
		                                 
			                                      

		                                                                                                                   

		                                                                      
	 

	                                                                           


 
#endif          

#if SERVER
                                                                                      
                                                                            
 
	                                                            
		                                                              

	                                                                                                                                                                                          
	                                   
	                                                                       
 
#endif          

#if SERVER
                                                              
 
	                         
		      

	                               

	                                                        
	                                                                  
	                                                  
	           

	                         
		      

	                                       
	 
		                                               
		                            
		                                                                   
	 

	                                                                                            
 
#endif          

#if SERVER
                                                        
                                               
 
	                          
	                                                                         
	                          
 
#endif          

#if SERVER
                                                             
 
	                         
		      
	                                           
		      

	                                        
		                                               

	                                    
	                                                        

	                                               
 
#endif          

#if SERVER
                                                         
 
	                                                                       

	                                                                      
	                                                                      
	 
		                                              
	 
	                                                                                                                                         
	 
		                                                                              
		                                                                                                      
			                                              
	 

	                                                                                                       
	                                                                      
	                                                                                                                            

	                                                             
		                                                   

	                                                                                            
	                                      
		                                                    

	       
		                                                        
	             
 
#endif          

#if SERVER
                                                                      
 
	                                               

	                     
	 
		                                                                                               

		                        
		 
			                                                                                
			                                                                                    
			                                                                                
			                                                                                                      
			                                                                 
		 
	 
 
#endif          

#if SERVER || CLIENT
                                                                  
                                                                                                           
                                                                                                                                             
entity function Control_GetBestSpawnLocationForAlliance( int alliance )
{
	                                                                                 
	entity mrbSpawn = null
	entity bSpawn = null
	entity aOrCSpawn = null
	entity homeSpawn = null

	                        
	foreach( point in file.spawnWaypoints )
	{
		if ( IsValid( point ) )
		{
			int waypointType = point.GetWaypointInt( INT_WAYPOINT_TYPE )
			switch( waypointType )
			{
				case CONTROL_WAYPOINT_BASE0_INDEX:
					if ( alliance == CONTROL_WAYPOINT_BASE0_INDEX )
						homeSpawn = point
					break
				case CONTROL_WAYPOINT_BASE1_INDEX:
					if ( alliance == CONTROL_WAYPOINT_BASE1_INDEX )
						homeSpawn = point
					break
				case CONTROL_WAYPOINT_POINT_INDEX:
					entity objectiveWaypoint = point.GetParent()
					if ( IsValid( objectiveWaypoint ) )
					{
						int objectiveID = objectiveWaypoint.GetWaypointInt( INT_OBJECTIVE_ID )
						int waypointOwner = objectiveWaypoint.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )

						                                                          
						if ( alliance == waypointOwner )
						{
							                                                                                   
							if ( objectiveID == CONTROL_OBJECTIVE_A_INDEX || objectiveID == CONTROL_OBJECTIVE_C_INDEX )
							{
								if ( ( objectiveID == CONTROL_FOB_INDEX_ALLIANCE_A && alliance == ALLIANCE_A ) || ( objectiveID == CONTROL_FOB_INDEX_ALLIANCE_B && alliance == ALLIANCE_B ) )
								{
									aOrCSpawn = point
								}
							}
							else if ( objectiveID == CONTROL_OBJECTIVE_B_INDEX && Control_IsSpawningOnObjectiveBAllowed() )                                                                                                     
							{
								bSpawn = point
							}
						}
					}
					break
				case CONTROL_WAYPOINT_MRB_INDEX:
					int waypointOwner = point.GetWaypointInt( CONTROL_WAYPOINT_ALLIANCE_OWNER_INDEX )
					if ( alliance == waypointOwner )
						mrbSpawn = point
					break
				default:
					break
			}
		}
	}

	                                                  
	if ( mrbSpawn != null )
	{
		return mrbSpawn
	}
	else if ( bSpawn != null && aOrCSpawn != null )
	{
		return bSpawn
	}
	else if ( aOrCSpawn != null )
	{
		return aOrCSpawn
	}
	else if ( homeSpawn != null )
	{
		return homeSpawn
	}

	Assert( false, "CONTROL: No valid spawns found when running the Control_GetBestSpawnLocationForAlliance function" )
	return null
}
#endif                    

#if SERVER || CLIENT
                                                   
int function Control_GetRespawnChoiceFromSpawnWaypoint( entity spawnWaypoint )
{
	int respawnChoice = -1

	if ( IsValid( spawnWaypoint ) )
	{
		int waypointType = spawnWaypoint.GetWaypointInt( INT_WAYPOINT_TYPE )
		switch( waypointType )
		{
			case CONTROL_WAYPOINT_BASE0_INDEX:
			case CONTROL_WAYPOINT_BASE1_INDEX:
				respawnChoice = eControlPlayerRespawnChoice.SPAWN_AT_BASE
				break
			case CONTROL_WAYPOINT_POINT_INDEX:
				respawnChoice = eControlPlayerRespawnChoice.SPAWN_ON_POINT
				break
			case CONTROL_WAYPOINT_PLAYER_INDEX:
				respawnChoice = eControlPlayerRespawnChoice.SPAWN_ON_SQUAD
				break
			case CONTROL_WAYPOINT_MRB_INDEX:
				respawnChoice = eControlPlayerRespawnChoice.SPAWN_ON_MRB
				break
			default:
				Warning( "Running Control_GetRespawnChoiceFromSpawnWaypoint with an Invalid waypoint type: %i, setting respawn choice to homebase by default", waypointType )
				respawnChoice = eControlPlayerRespawnChoice.SPAWN_AT_BASE
				break
		}
	}

	return respawnChoice
}
#endif                    

#if SERVER || CLIENT
                                                                                                                                                                                           
entity function Control_GetEntityToSpawnOnFromRespawnChoice( entity wp, int respawnChoice )
{
	entity entityToSpawnOn = null

	if ( IsValid( wp ) )
	{
		switch( respawnChoice )
		{
			case eControlPlayerRespawnChoice.SPAWN_ON_POINT:                  
			case eControlPlayerRespawnChoice.SPAWN_ON_MRB:                  
			case eControlPlayerRespawnChoice.SPAWN_ON_SQUAD:              
				entityToSpawnOn = wp.GetParent()
				break
			default:
				break
		}
	}

	return entityToSpawnOn
}
#endif                    

#if SERVER
                                                                                                                          
                                                                                                                     
 
	                         
		      

	                                                                               
		      

	                                                                    
	                                                                              
		                                                               
	                                                                 
		                                                  

	                                                            
	 
		                                                                                               
		 
			                                                                     
			                                                                           
		 
		                                                                                                                                                                                                                
		 
			                                                                             
			                                                                              
		 
		    
		 
			                                                                                   
			                                                                        
		 
	 
 
#endif          

#if SERVER
                                                                                                              
                                                                                                                                     
 
	                         
		      

	                                                                               
		      

	                                                            
	 
		                                                                                                    
		 
			                                                                
			 
				                                                                             
			 
			                                                                                                                                
			 
				                                                                                    
			 

			                                                                                              
			                                                                                                                                                                                                
			                                                          

			                                                                    
			                     
				                                                        
		 
	 
 
#endif          

#if SERVER
                                    
                                                                                      
 
	                                           
		      

	                                                                                                      
	                               
		      

	                                                                       
	                                                                                            
	 
		                                                                                                                 
		                                                                     
		                                                                                                 
	 

	                                   
 
#endif          

#if SERVER
                                                                                  
                                                        
 
	                                                                       
	                                                                                            
	 
		                                                                                                            
		                                                                                                       
	 

	                                                        
	                                           
		                                           

	                                             
		                                             
 
#endif          

#if SERVER
                                                                              
 
	                         
		      

	                                                           
	                                                                                                       

	                                        
	                                                                                             
		      

	                            
	                         
		      

	             
	                                                       
 
#endif          

#if SERVER
                                                                                        
 
	                                               

	                                 

	                                                                  
	 
		                                                                         
	   
 
#endif          

#if SERVER
                                    
                                                                                                        
 
	                                                                                                                                                                                                                                   
	 
		                                                     
		                                                         
		                                                                                                                       
	 
 
#endif          

#if SERVER
                                   
                                                                                                                                                         
                                                                                                           
 
	                                                                      
	                                                                                                                                                                   
	                                                
		      

	       
		                                                                                                       
	             

	                                                                        

	                                                                    
	                                                                       
	 
		                        
		 
			                                                                                                  
			                                                                                  

			                                                                                                                                       
			                                                                
			 
				                                   
				                                                       
			 
		 
	 
	    
	 
		                                                                                                          
		                                                                                                      
	 
 
#endif          

#if SERVER
                                                         
 
	            
 
#endif          

#if SERVER
                                                        
 
	                                                        
 
#endif          

#if SERVER
                                                                                                                                         
 
	                           
		                                   

	                                  
	                                                                
	                                                              
	                                                        

	                                                                           
	                                                    
	 
		                                        
		                      
			                                    

		                                          
	 

	                             
	                                               

	                                         
	 
		                                                                            
		                                                           
		                                                                                                                           
	 

	                                           

	                                                                                                                 
	                          
	 
		                                    
		                                   

		              
		                              
			                                                
		                                              
		                       

		                                      

		       
			                              
				                                                          
		             

		                         
			                                                  
	 

	                                                                                                                                                  
	                                                                            
		                                                  
 
#endif          

#if SERVER
                                                                      
 
	                                               

	           

	                         
		      

	                                                            
	                                                              
	                     

	                                                                                                                
 
#endif          

#if SERVER
                                                                                                                                                             
                                                                                                                                                                                                                                                    
                                                         
 
	                                               

	                         
		      

	                                           
		      

	                                                               
	                               
	                                                                             

	                               
	                             
	                                         

	            
	                           
	 
		            
	 
	 

	                                                            
	                                                          

	                                             
	 
		                     
		                                                
		 
			                                   
			                                                           

			                                                                                                                                            
       		                       
        		 
            		                                                    
            		 
               		                                           
               		                                                            
            		 
        		 
       		    
        		 
            		                                                   
            		 
                		                                                     
                		                                                           
            		 
        		 

			           
		 
	 
 
#endif          

#if SERVER
                                                                                 
 
	                         
		      

	                                  
	                                            

	                                                                                              
	                          

	               
	                                         

	                                                                                                               
	                                                                  
	 
		                              
		                                                                    
	 
 
#endif          

#if SERVER
                                                             
 
	                                        
 
#endif          

#if SERVER
                                                      
 
	           

	                         
		      

	                                           
	                                     
		      

	                                                                       
	 
		                                  
		                   
		                 
		                      
	 
 
#endif          

#if SERVER
                                                        
 
	                                                                                     
	                    
	                    
	                                                    
	                                   
	 
		                                                                                                                                                              
		 
			                          
			                                                    
		 
	 

	                              
	 
		                                                                        
			                                                                     
			                                                                     

			                    
				         
			                         
				        

			        
		   
	 
 
#endif          

#if SERVER
                                                                                                                                      
 
	                         
		            

	                                                                      
	                                                                                                                                                                   
	                                                
		            

	                          
	                                                                                        

	                                  
		                                                                                                                                

	                                                                                                                                         

	                                    
	 
		                          
	 
	    
	 
		                     
	 

	                                                                        

	       
		                                       
		 
			                                                    
			 
				                                                                                                                           
				                                                     
				                                                                                                                            
			 
			    
			 
				                                                                                                                                                                                                    
			 
		 
	             

	                         
	 
		                                                 
		                                                 

		                                                
		                                              
		                       
		                                                                                                                                                          
		                                                                                                                                             
	 
	    
	 
		            
	 

	           
 
#endif          

#if SERVER
                                                                                                                            
 
	                                
		            

	                                            
		            

	                                                                      
	                                                                                                                                                                   
	                                                
		            

	       
		                                                          
	             

	                                                                                             
	                                                                                              

	                                                                                                    

	                                       
	                                                                              
	                               
	                             
	 
		                                           
		 
			                                               
			                                                        
			 
				                          
				                                 

				       
					                                                     
						                                                                                                               

					                             
						                                                                                                                     
				             
				        
			 

			                                                         
			 
				                                    
				                                 

				       
					                                                     
						                                                                                                              

					                             
						                                                                                                                      
				             

				        
			 

			                                                                   
			       
				                                                     
					                                                                                                            

				                             
					                                                                                                                   
			             
		 
		    
		 
			                                                                     
			                                 

			       
				                                                     
					                                                                                                             

				                             
					                                                                                              
			             
		 
	 

	                                               

	                         
	                                                                                       

	                                    
	 
		                            
	 
	    
	 
		                       
	 

	       
		                                       
		 
			                                                            
			 
				                   
				                                                                      
				                                                                                                                                
			 
			    
			 
				                                                                                                                                                                                                        
			 
		 
	             

	                             
	 
		                                    
		                                           
		                                           

		                                                                          
		 
			                                                                                                   
			                                     
		 

		                                                                                                                                              
	 
	    
	 
		            
	 

	           
 
#endif          

#if SERVER
                                                                                                                                                              
                                                                                          
 
	                                                                      
	                                                                                                                                                                   
	                                                
		      

	                                                         
	                                   
	                             
	 
		                        
		 
			                                    
		 
		    
		 
			                                                                                             
		 
	 

	                                     
		      

	                                
	 
		                                          

		                                                   
		                                                                                                                   
		                                                                               
		 
			                                                          
			 
				                                                                                                
					     

				                                        
				                                                                                               
				                               
				 
					                                          
					                                   
					                                                                              
					                                                                                                         
				 
			 
		 

		                               
		                                       
		                                       
		 
			                                                            
			                                                                
			                                                            
			 
				                                                        
				                                                      
				               
			 

			                                                                                        
			                                                                                                                                                                                
			                                                   
			 
				                                                                                                  
				                                                                                     
			 

			                                    
			                                                                         

			                              
		 
	 
	                                                                                                                     
	 
		                                         
		 
			                                                                                             
		 
	 
 
#endif          

#if SERVER
                                                                
 
	                                               

	                                           
		      

	                             
	                               

	                                     

	            
		                       
		 
			                              
				                                      
		 
	 

	                                
	                                         

	                                                      
	        

	                                                                                               
	                                                   
	 
		                                                                                                                      
		        
	 
 
#endif          

#if SERVER && DEV
                                                                               
 
	                                               

	           

	                                                       
		                         
			      

		                         
		 
			                      
			                                  
				                                                                                                                              

			                                                                                     
		 
	   

	                             
	                               

	                                             

	       

	                       
	                                  
		                                                                                                                                
 
#endif                 

#if SERVER
                                                                                                        
                                                                                           
 
	       
		                                                          
	             
	                                
	 
		                                                  
		 
			                                                                                                                              
  			                                                            
  			 
	  			       
	  				                    
	  					                                                                                                                                          
	  			      
  				            
  			 
			       
				                                                     
					                                                                                                                                         
			             

			        
		 
		       
			                                                    
				                                                                                                                                           
		             
		            
	 
	           
 
#endif          

#if SERVER
                                                                                                          
 
	       
		                                                          
	             

	                         
	                                
	 
		                                  
			     

		                                                  
		 
			                                                                                                                              
  			                                                            
  			 
	  			       
	  				                    
	  					                                                                                                                                          
	  			      
  				                           
  			 
			       
				                                                     
					                                                                                                                                         
			             

			        
		 
		       
			                                                     
				                                                                                                                                           
		             

		                           
	 
	                  
 
#endif          

#if SERVER
                                                                                                        
                                                                           
 
	                             
	 
		                              
		  	                                                       
		            
	 

	                                                                      
	                                           
	 
		            
	 

	                                                        
	 
		                              
		  	                                                              
		            
	 

	                                                                                        
	                                    
	 
		                              
		  	                                                    
		            
	 

	                                                      
	 
		            
	 

	                                                              
	 
		                              
		  	                                                        
		            
	 

	           
 
#endif          

#if SERVER
                                                                                      
 
	                             
	 
		                              
		  	                                                       
		            
	 

	                                                        
	 
		                              
		  	                                                              
		            
	 

	                                                      
	 
		            
	 

	                                                              
	 
		                              
		  	                                                        
		            
	 

	                                                                            
 
#endif          

#if SERVER
                                                               
 
	                                                      
 
#endif          

#if SERVER
                                                                    
 
	                                               

	                                                                          

	                                                                      
	                                                                            
	                                 

	            
		                         
		 
			                                                        
				                                                        

			                                                        
				                                                        
		 
	 

	             
 
#endif          

#if SERVER
                                                                             
 
	                                                           

	                                                        
	 
		                                                                            
			                                                                  
	 
	    
	 
		                                                               
	 
	                                                  
 
#endif          

#if SERVER
                                                                                                                                                                                   
                                                                         
 
	                                               

	           

	                        
		                                                        
 
#endif          

#if SERVER
                                                                                                                                                                                             
                                                                   
                                                                                                               
 
	               
	                                         
	                                                        
	 
		                                                             
	 
	    
	 
		            
	 

	                                                   
	                                                                                                                   

	                                                                                    
	 
		                                           
			            
	 

	                                              
	                                                                                                                                         
	                              
	                                                                                                  
	                                                                                                  
	                                                                                                                       
	                              
	 
		                                                     

		                                              
		 
			                                                                                        
			                                                                        
			                                                                                                                                                                                  
			            
		 

		                            
		                                                         

		                                         
		                                                    

		                                                                                                             
		       
			                                                                                                   
		             

		                                                                                                                                         
		                                                                                                                                                 
		 
			                                                                                      
			                                                                                                                      

			           
		 
	 

	            
 
#endif          

#if SERVER
                                                          
 
	                                                                       
	                                                                   
	 
		                                                                
		                                                                                                   
			                    
	 

	                            
 
#endif          

#if SERVER
                                                                                                  
 
	                                                                         
	                                                                 
 
#endif          

#if SERVER
                                                                                       
 
	                
	                                                                                    
	                               
		                                                   
	    
		                                                           

	                
 
#endif          

#if SERVER
                                                                        
 
	                           
		      

	                                                     

	                                 
	 
		                                                                                                                 
		 
			       
				                                                                                        
			             

			                                                          
			                                                         
		 
	 
 
#endif          

#if SERVER
                                                                                  
 
	                                               

	                               
	                                 

	            
		                                       
		 
			                                  
		 
	 

	                                                  
 
#endif          

#if SERVER
                                                                   
 
	                                               

	                                                                                                

	                               
	                                 

	            
		                                       
		 
			                                           
		 
	 

	                                                  
 
#endif          

#if SERVER
                                           
 
	                         
		      

	                                                 
	                                                                                                      
 
#endif          

#if SERVER
                                                                
                                                                                                        
 
	                         
		      

	                                     
	 
		                                 
		                                                             
		 
			                                                                                                                                                            
			 
				                                                                                                                                                           
			 
		 
	 
 
#endif          

  
                                                                                                                                                         
                                                                                                                                                          
                                                                                                                                                       
                                                                                                                                                       
                                                                                                                                                       
                                                                                                                                                       


                       
  


#if CLIENT
void function Control_OnPlayerSentSpawnRequest( entity player, entity wp )
{
	int respawnChoice = Control_GetRespawnChoiceFromSpawnWaypoint( wp )
	entity entityToSpawnOn = Control_GetEntityToSpawnOnFromRespawnChoice( wp, respawnChoice )

	#if DEV
		printf( "CONTROL: Sending spawn request from " + wp.GetTargetName() + " of type " + respawnChoice )
	#endif       

	Control_SendRespawnChoiceToServer( respawnChoice, entityToSpawnOn )
}
#endif          

#if CLIENT
void function Control_WaypointCreated_Spawn( entity wp )
{
	thread Control_ManageRespawnWaypoint_Thread( wp )
}
#endif          

#if CLIENT
void function Control_ManageRespawnWaypoint_Thread( entity wp )
{
	Assert( IsNewThread(), "Must be threaded off" )

	                                                                                                                                                 
	FlagWait( "EntitiesDidLoad" )

	if ( !IsValid( wp ) )
		return

	if ( Waypoint_GetPingTypeForWaypoint( wp ) != ePingType.PING_CONTROL_SPAWN_POINT )
		return

	while ( IsValid( wp ) && wp.wp.ruiHud == null )
	{
		WaitFrame()
	}

	if ( !IsValid( wp ) )
		return

	int waypointType
	if ( Waypoint_GetPingTypeForWaypoint( wp ) == ePingType.PING_CONTROL_SPAWN_POINT )
	{
		RuiSetFloat( wp.wp.ruiHud, "maxDrawDistance", 50000 )
		RuiSetBool( wp.wp.ruiHud, "displayDistance", false )
		RuiSetBool( wp.wp.ruiHud, "alwaysShowLargeIcon", true )

		waypointType = wp.GetWaypointInt( INT_WAYPOINT_TYPE )

		switch( waypointType )
		{
			case CONTROL_WAYPOINT_BASE0_INDEX:
				RuiSetImage( wp.wp.ruiHud, "outerIcon", CONTROL_WAYPOINT_BASE_ICON )
				                                                          
				file.allianceABlockedHomeBasePositionsForMRB.append( wp.GetOrigin() )
				break
			case CONTROL_WAYPOINT_BASE1_INDEX:
				RuiSetImage( wp.wp.ruiHud, "outerIcon", CONTROL_WAYPOINT_BASE_ICON )
				                                                          
				file.allianceBBlockedHomeBasePositionsForMRB.append( wp.GetOrigin() )
				break
			case CONTROL_WAYPOINT_POINT_INDEX:
				RuiSetImage( wp.wp.ruiHud, "outerIcon", CONTROL_OBJ_DIAMOND_YOURS )
				break
			case CONTROL_WAYPOINT_PLAYER_INDEX:
				RuiSetImage( wp.wp.ruiHud, "outerIcon", CONTROL_WAYPOINT_PLAYER_ICON )
				break
			default:
				break
		}

		file.spawnWaypoints.append( wp )
	}

	int waypointEHI = wp.GetEncodedEHandle()
	wp.EndSignal( "OnDestroy" )

	OnThreadEnd( function() : ( wp, waypointEHI )
	{
		RunUIScript( "ClearWaypointDataForUI", waypointEHI )
		file.spawnWaypoints.fastremovebyvalue( wp )
	} )

	entity parentObjective
	if ( waypointType == CONTROL_WAYPOINT_POINT_INDEX )
		parentObjective = wp.GetParent()

	while ( true )
	{
		WaitFrame()

		if ( !GetLocalClientPlayer().GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
		{
			RuiSetBool( wp.wp.ruiHud, "isHidden", true )
			continue
		}

		if ( waypointType == CONTROL_WAYPOINT_POINT_INDEX )
		{
			int owner = parentObjective.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )
			if ( AllianceProximity_GetAllianceFromTeam( GetLocalClientPlayer().GetTeam() ) == owner )
				RuiSetBool( wp.wp.ruiHud, "isHidden", false )
			else
				RuiSetBool( wp.wp.ruiHud, "isHidden", true )
		}

		if ( waypointType == CONTROL_WAYPOINT_PLAYER_INDEX )
		{
			entity playerOwner = wp.GetParent()
			if ( IsValid( playerOwner ) && IsAlive( playerOwner ) && BleedoutState_GetPlayerBleedoutState( playerOwner ) == BS_NOT_BLEEDING_OUT  )
				RuiSetBool( wp.wp.ruiHud, "isHidden", false )
			else
				RuiSetBool( wp.wp.ruiHud, "isHidden", true )
		}

		if ( waypointType == CONTROL_WAYPOINT_MRB_INDEX )
			RuiSetBool( wp.wp.ruiHud, "isHidden", false )
	}
}
#endif          

#if CLIENT
                                                            
void function Control_SendRespawnChoiceToServer( int respawnChoice, entity entityToSpawnOn )
{
	entity localPlayer = GetLocalClientPlayer()
	entity localViewPlayer = GetLocalViewPlayer()

	if ( !IsValid( localPlayer ) || !IsValid( localViewPlayer ) )
		return

	if ( localPlayer != localViewPlayer )
		return

	if ( !localPlayer.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
		return

	Remote_ServerCallFunction( "ClientCallback_Control_ProcessRespawnChoice", respawnChoice, entityToSpawnOn )
}
#endif          

#if CLIENT
void function ServerCallback_Control_ShowSpawnSelection()
{
	entity player = GetLocalClientPlayer()
	if ( IsValid( player ) && player.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
	{
		Control_UpdatePlayerExpPercentAmountsForSpawns( player )

		#if DEV
			printf( "CONTROL: opening spawn menu from connection callback" )
		#endif       

		thread Control_TriggerShowSpawnMenuOnUI_Thread( player, false )
		RunUIScript( "ControlSpawnMenu_SetLoadoutAndLegendSelectMenuIsEnabled", true )
		thread Control_CameraInputManager_Thread( player )
	}
}
#endif          

#if CLIENT
const float CONTROL_SPAWN_CHECK_INTERVAL = 0.1
const int CONTROL_MIN_EXPECTED_SPAWN_POINTS = 5
                                                                                                                                                  
void function Control_TriggerShowSpawnMenuOnUI_Thread( entity player, bool shouldCheckLastScoreboardOpened )
{
	Assert( IsNewThread(), "Must be threaded off" )

	if ( !IsValid( player ) )
		return

	                                                                                                               
	                                                                                                                                                                                                          
	player.Signal( "Control_RequestOpenSpawnMenuOnUI" )

	                                                                                                                                                        
	player.EndSignal( "Control_PlayerHasChosenRespawn" )
	player.EndSignal( "OnDestroy" )
	player.EndSignal( "Control_RequestOpenSpawnMenuOnUI" )

	                                                                       
	                                                                                                                              
	while ( file.spawnWaypoints.len() < CONTROL_MIN_EXPECTED_SPAWN_POINTS )
	{
		wait CONTROL_SPAWN_CHECK_INTERVAL
	}

	if ( IsValid( player ) )
	{
		int playerAlliance = AllianceProximity_GetAllianceFromTeam( player.GetTeam() )
		entity bestSpawnWaypoint = Control_GetBestSpawnLocationForAlliance( playerAlliance )
		int bestSpawnWaypointEHI = bestSpawnWaypoint.GetEncodedEHandle()
		RunUIScript( "UI_OpenControlSpawnMenu", shouldCheckLastScoreboardOpened, bestSpawnWaypointEHI )
		Control_SetWaveSpawnTimerTime()
	}
}
#endif          

#if CLIENT
                                                              
void function ServerCallback_Control_UpdateSpawnWaveTimerTime()
{
	Control_SetWaveSpawnTimerTime()
}
#endif          

#if CLIENT
void function UICallback_Control_OnResolutionChanged()
{
	entity player = GetLocalClientPlayer()
	if ( !IsValid( player ) )                                        
		return

	if ( !Control_IsModeEnabled() )
		return

	if ( !player.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
		return

	#if DEV
		printf( "CONTROL: opening spawn menu from resolution changed callback" )
	#endif       

	thread Control_TriggerShowSpawnMenuOnUI_Thread( player, false )
	thread Control_CameraInputManager_Thread( player )
}
#endif          

#if CLIENT
void function ServerCallback_Control_ProcessImmediatelyOpenCharacterSelect()
{
	file.shouldImmediatelyOpenCharacterSelectOnRespawn = true
}
#endif          

#if CLIENT
                                                      
void function ServerCallback_Control_PlayerJoinedMatchInProgress()
{
	EmitUISound( CONTROL_SFX_JOIN_MATCH_IN_PROGRESS )
}
#endif          

#if CLIENT
void function ServerCallback_Control_OnPlayerChoosingRespawnChoiceChanged( entity player, bool new )
{
	if ( !IsValid( player ) )
		return

	if ( player != GetLocalClientPlayer() )
		return

	if ( GetGameState() >= eGameState.WinnerDetermined )                                             
		return

	var gameStateRui = ClGameState_GetRui()

	if ( !new )                                       
	{
		RunUIScript( "UICodeCallback_CloseAllMenus" )
		Control_DeregisterModeButtonPressedCallbacks()
		Obituary_SetEnabled( true )                      
		RuiSetBool( gameStateRui, "isRespawning", false )
		player.Signal( "Control_PlayerHasChosenRespawn" )
	}

	if ( new )                                      
	{
		if ( !player.IsBot() )
		{
			player.Signal( "Control_PlayerStartingRespawnSelection" )
			player.Signal( "Bleedout_StopBleedoutEffects" )

			thread Control_CameraInputManager_Thread( player )
			thread Control_UIManager_Thread( player )
		}
	}
}
#endif          

#if CLIENT
void function CreateRespawnBlur()
{
	if(file.respawnBlurRui == null)
		file.respawnBlurRui = CreateFullscreenRui( $"ui/control_respawn_screen_blur.rpak" )
}
#endif          

#if CLIENT
void function DestroyRespawnBlur()
{
	if ( IsValid( file.respawnBlurRui  ) )
		RuiDestroyIfAlive( file.respawnBlurRui )

	file.respawnBlurRui = null
}
#endif          

#if CLIENT
void function UICallback_Control_UpdatePlayerInfo( var elem )
{
	thread Control_UpdatePlayerInfo_thread( elem )
}
#endif          

#if CLIENT
void function Control_UpdatePlayerInfo_thread( var elem )
{
	Assert( IsNewThread(), "Must be threaded off" )

	entity localPlayer = GetLocalClientPlayer()
	localPlayer.EndSignal( "Control_PlayerHasChosenRespawn" )

	while( IsValid( elem ) )
	{
		entity player = GetLocalClientPlayer()

		ItemFlavor character = LoadoutSlot_WaitForItemFlavor( ToEHI( player ), Loadout_Character() )

		var rui = Hud_GetRui( elem )

		if ( !IsValid( rui ) )
			break

		RuiSetImage( rui, "playerPortrait", CharacterClass_GetCharacterLockedPortrait( character ) )
		RuiSetString( rui, "playerName", player.GetPlayerName() )
		RuiSetInt( rui, "micStatus", GetPlayerMicStatus( player ) )

		WaitFrame()
	}
}
#endif          

#if CLIENT
void function ServerCallback_Control_TransferCameraData( vector cameraPosition, vector cameraAngles )
{
	entity player = GetLocalClientPlayer()
	file.cameraLocation = cameraPosition
	file.cameraAngles   = cameraAngles

	if ( IsValid( player ) )
	{
		player.Signal( "Control_NewCameraDataReceived" )

		if ( player.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
			thread Control_CameraInputManager_Thread( player )
	}
}
#endif          

#if CLIENT
void function ServerCallback_PlayMatchEndMusic_Control( int victoryCondition )
{
	                                                                                                                              
	                                                                                  

	entity clientPlayer = GetLocalClientPlayer()
	if ( !IsValid( clientPlayer ) )
		return

	if ( clientPlayer.GetTeam() == GetWinningTeam() )
	{
		EmitSoundOnEntity( clientPlayer, CONTROL_SFX_GAME_END_VICTORY )

		if ( victoryCondition == eWinReason.LOCKOUT )
		{
			EmitSoundOnEntity( clientPlayer, "Music_Ctrl_LockOut_Victory" )
		}
		else if ( victoryCondition == eWinReason.SCORE_LIMIT )
		{
			EmitSoundOnEntity( clientPlayer, "Music_Ctrl_RampUp_Victory" )
		}
	}
	else
	{
		EmitSoundOnEntity( clientPlayer, CONTROL_SFX_GAME_END_LOSS )

		if ( victoryCondition == eWinReason.LOCKOUT )
		{
			EmitSoundOnEntity( clientPlayer, "Music_Ctrl_LockOut_Loss" )
		}
		else
		{
			EmitSoundOnEntity( clientPlayer, "Music_Ctrl_RampUp_Loss" )
		}
	}
}
#endif          

#if CLIENT
void function ServerCallback_PlayPodiumMusic()
{
	entity clientPlayer = GetLocalClientPlayer()
	if ( IsValid( clientPlayer ) )
		EmitSoundOnEntity( clientPlayer, "Music_Ctrl_Podium" )
}
#endif          

#if CLIENT
void function ControlMenu_HandleInput( float x, float y, float zoom, bool shouldEase = true )
{
	float processedX = x
	float processedY = y
	float processedZoom = zoom

	                    
	                                         
	                                         

	if ( fabs( processedX ) < 0.15 )
		processedX = 0.0
	if ( fabs( processedY ) < 0.15 )
		processedY = 0.0
	if ( fabs( processedZoom ) < 0.15 )
		processedZoom = 0.0

	if ( shouldEase )
	{
		processedX    = Control_CubicEase( processedX )
		processedY    = Control_CubicEase( processedY )
		processedZoom = Control_CubicEase( processedZoom )
	}

	ControlMenu_ReceiveInputContext( processedX, processedY, processedZoom, shouldEase )
}
#endif          

#if CLIENT
float function Control_CubicEase( float val )
{
	return val * val * val
}
#endif          

#if CLIENT
void function ControlMenu_ReceiveInputContext( float xInput, float yInput, float zoomInput, bool shouldEase = true )
{
	if ( !IsValid( file.cameraMover ) )
		return

	float lateralBoundaryDelta = 4000
	float zoomBoundaryDelta
	if ( zoomInput > 0 )
		zoomBoundaryDelta = 14000
	else
		zoomBoundaryDelta = 4000

	vector defaultCameraPosition = file.cameraLocation
	vector currentCameraPosition = file.cameraMover.GetOrigin()

	vector cameraAngles = file.cameraMover.GetAngles()
	vector cameraForward = Normalize( file.cameraMover.GetForwardVector() )
	vector cameraRight = Normalize( file.cameraMover.GetRightVector() )
	vector cameraUp = Normalize( file.cameraMover.GetUpVector() )

	float rightScalar = 1.0
	float upScalar = 1.0
	float zoomScalar = 1.0

	float processedX = xInput
	float processedY = yInput

	if ( fabs( zoomInput ) > 0.0 )
	{
		                             
		vector cursorPosition = ConvertCursorToScreenPos()
		UISize screenSize     = GetScreenSize()
		vector cursorDelta    = <screenSize.width / 2.0, screenSize.height / 2.0, 0.0> - cursorPosition

		processedX += -9 * ( cursorDelta.x / screenSize.width ) * ( IsControllerModeActive() || zoomInput >= 0 ? 1.0 : -1.0 )
		processedY += -5 * ( cursorDelta.y / screenSize.height ) * ( IsControllerModeActive() || zoomInput >= 0 ? 1.0 : -1.0 )

		if ( IsControllerModeActive() )
		{
			processedX *= 0.6
			processedY *= 0.6
		}
	}

	                               
	vector deltaVector = currentCameraPosition - defaultCameraPosition

	float deltaOnRight = cameraRight.Dot( deltaVector )
	if ( fabs( deltaOnRight ) >= lateralBoundaryDelta && deltaOnRight * processedX > 0 )
		rightScalar = 0.0

	float deltaOnUp = cameraUp.Dot( deltaVector )
	if ( fabs( deltaOnUp ) >= lateralBoundaryDelta && -1 * deltaOnUp * processedY > 0)
		upScalar = 0.0

	float deltaOnForward = cameraForward.Dot( deltaVector )
	if ( fabs( deltaOnForward ) >= zoomBoundaryDelta && deltaOnForward * zoomInput > 0)
		zoomScalar = 0.0

	vector pos = currentCameraPosition
	pos += processedX * cameraRight * 500 * rightScalar
	pos += processedY * cameraUp * -500 * upScalar
	pos += zoomInput * cameraForward * 500 * zoomScalar

	file.cameraMover.NonPhysicsMoveTo( pos, 0.2, 0.0, 0.075 )
}
#endif          

#if CLIENT
void function UICallback_ControlMenu_MouseWheelUp()
{
	                                             
}
#endif          

#if CLIENT
void function UICallback_ControlMenu_MouseWheelDown()
{
	                                              
}
#endif          

#if CLIENT
void function Control_UIManager_Thread( entity player )
{
	Assert( IsNewThread(), "Must be threaded off" )

	player.EndSignal( "Control_PlayerHasChosenRespawn" )
	player.EndSignal( "OnDestroy" )

	var gameStateRui = ClGameState_GetRui()

	CreateRespawnBlur()
	Control_UpdatePlayerExpPercentAmountsForSpawns( player )

	if ( file.firstTimeRespawnShouldWait )
	{
		                                
		wait CONTROL_INTRO_DELAY
	}

	RunUIScript( "ControlSpawnMenu_SetLoadoutAndLegendSelectMenuIsEnabled", true )
	RuiSetBool( gameStateRui, "isRespawning", true )

	                                                        
	Obituary_ClearObituary()
	Obituary_SetEnabled( false )

	if ( file.firstTimeRespawnShouldWait )
	{
		file.firstTimeRespawnShouldWait = false

		                                                                     
		if ( IsUsingLoadoutSelectionSystem() )
			RunUIScript( "LoadoutSelectionMenu_OpenLoadoutMenu", false )
	}
	else if ( file.shouldImmediatelyOpenCharacterSelectOnRespawn || player.GetPlayerNetBool( "Control_IsLateJoinPlayerFirstSpawn" ) )
	{
		                                                                                            
		                                                                                   
		wait 0.1                                                                                                                                                          
		Control_OpenCharacterSelect( player.GetPlayerNetBool( "Control_IsLateJoinPlayerFirstSpawn" ) )
		file.shouldImmediatelyOpenCharacterSelectOnRespawn = false
	}
	else                                                                                                                                               
	{
		thread Control_TriggerShowSpawnMenuOnUI_Thread( player, false )
	}
}
#endif          

#if CLIENT
void function Control_CameraInputManager_Thread( entity player )
{
	Assert( IsNewThread(), "Must be threaded off" )

	player.EndSignal( "Control_NewCameraDataReceived" )
	player.EndSignal( "Control_PlayerStartingRespawnSelection" )
	player.EndSignal( "Control_PlayerHasChosenRespawn" )
	player.EndSignal( "Control_PlayerHideScoreboardMap" )

	file.isPlayerInMapCameraView = true

	vector cameraPosition = file.cameraLocation
	vector cameraAngles = file.cameraAngles

	entity cameraMover = CreateClientsideScriptMover( $"mdl/dev/empty_model.rmdl", cameraPosition, cameraAngles )
	entity camera      = CreateClientSidePointCamera( cameraPosition, cameraAngles, 70.0 )
	player.SetMenuCameraEntity( camera )
	camera.SetTargetFOV( 70.0, true, EASING_CUBIC_INOUT, 0.0 )
	camera.SetParent( cameraMover, "", false )

	file.cameraMover = cameraMover

	OnThreadEnd(
		function() : ( player, camera, cameraMover )
		{
			                                                  

			if ( IsValid( player ) )
				player.ClearMenuCameraEntity()
			file.cameraMover = null
			if ( IsValid( camera ) )
				camera.Destroy()
			                                       
			                               
			  	                     

			file.isPlayerInMapCameraView = false
		}
	)

	WaitForever()
}
#endif          

#if CLIENT
vector function ConvertCursorToScreenPos()
{
	vector mousePos   = GetCursorPosition()
	UISize screenSize = GetScreenSize()
	mousePos = < mousePos.x * screenSize.width / 1920.0, mousePos.y * screenSize.height / 1080.0, 0.0 >
	return mousePos
}
#endif          

#if CLIENT
void function UICallback_Control_LaunchSpawnMenuProcessThread()
{
	thread ProcessSpawnMenu( GetLocalClientPlayer() )
}
#endif          

#if CLIENT
void function ProcessSpawnMenu( entity player )
{
	Assert( IsNewThread(), "Must be threaded off" )

	#if DEV
		printf( "CONTROL: kicking off process spawn menu thread" )
	#endif       

	player.Signal( "OnValidSpawnPointThreadStarted" )

	player.EndSignal( "OnSpawnMenuClosed" )
	player.EndSignal( "OnValidSpawnPointThreadStarted" )
	player.EndSignal( "OnDestroy" )

	OnThreadEnd(
		function() : ()
		{
			if ( ClGameState_GetRui() != null )
				RuiSetBool( ClGameState_GetRui(), "isInSpawnMenu", false )
		}
	)

	if ( ClGameState_GetRui() != null )
		RuiSetBool( ClGameState_GetRui(), "isInSpawnMenu", true )

	while ( !IsAlive( player ) )
	{
		bool shouldShowWaypoints = player.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" )
		int localPlayerAlliance = AllianceProximity_GetAllianceFromTeam( player.GetTeam() )

		foreach( wp in file.spawnWaypoints )
		{
			bool shouldShowThisWaypoint = true
			int spawnWaypointTeamUsability = eControlSpawnWaypointUsage.FRIENDLY_TEAM

			if ( shouldShowWaypoints )
			{
				if ( IsValid( wp.GetParent() ) )
				{
					if ( wp.GetParent() == player )
					{
						shouldShowThisWaypoint = false                                        
						spawnWaypointTeamUsability = eControlSpawnWaypointUsage.NOT_USABLE
					}
					else if ( wp.GetParent().IsPlayer() && !wp.GetParent().GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
					{
						shouldShowThisWaypoint = true                                                         
						spawnWaypointTeamUsability = eControlSpawnWaypointUsage.FRIENDLY_TEAM
					}
					else if ( !wp.GetParent().IsPlayer() )
					{
						if ( wp.GetWaypointInt( INT_WAYPOINT_TYPE ) == CONTROL_WAYPOINT_POINT_INDEX )
						{
							shouldShowThisWaypoint = true

							int waypointOwner = wp.GetParent().GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )
							bool isYourWaypoint = waypointOwner == localPlayerAlliance
							bool isSpawnUsable = bool( wp.GetParent().GetWaypointBitfield() ) && waypointOwner != ALLIANCE_NONE

							spawnWaypointTeamUsability = isSpawnUsable ? ( isYourWaypoint ? eControlSpawnWaypointUsage.FRIENDLY_TEAM : eControlSpawnWaypointUsage.ENEMY_TEAM ) : eControlSpawnWaypointUsage.NOT_USABLE
						}
						else if ( wp.GetWaypointInt( INT_WAYPOINT_TYPE ) == CONTROL_WAYPOINT_MRB_INDEX )
						{
							int waypointOwner = wp.GetWaypointInt( CONTROL_WAYPOINT_ALLIANCE_OWNER_INDEX )
							bool isYourWaypoint = waypointOwner == localPlayerAlliance
							spawnWaypointTeamUsability = isYourWaypoint ? eControlSpawnWaypointUsage.FRIENDLY_TEAM : eControlSpawnWaypointUsage.ENEMY_TEAM
							shouldShowThisWaypoint = isYourWaypoint
						}
						else
						{
							shouldShowThisWaypoint = true                    
							spawnWaypointTeamUsability = wp.GetWaypointInt( INT_WAYPOINT_TYPE ) == localPlayerAlliance ? eControlSpawnWaypointUsage.FRIENDLY_TEAM : eControlSpawnWaypointUsage.NOT_USABLE                               
						}
					}
					else
					{
						shouldShowThisWaypoint = false                           
						spawnWaypointTeamUsability = eControlSpawnWaypointUsage.NOT_USABLE
					}
				}
				else
				{
					shouldShowThisWaypoint = false
					spawnWaypointTeamUsability = eControlSpawnWaypointUsage.NOT_USABLE
				}
			}
			else
			{
				shouldShowThisWaypoint = false
				spawnWaypointTeamUsability = eControlSpawnWaypointUsage.NOT_USABLE
			}

			SpawnMenu_ButtonUpdate(  wp, shouldShowThisWaypoint, spawnWaypointTeamUsability )
		}

		int lastLocalPingObjID = -1
		if ( IsValid( file.lastLocalObjectivePing ) )
		{
			entity objectiveWaypoint = file.lastLocalObjectivePing.GetOwner()
			if ( IsValid( objectiveWaypoint ) && objectiveWaypoint.GetWaypointType() == eWaypoint.CONTROL_OBJECTIVE )
				lastLocalPingObjID = objectiveWaypoint.GetWaypointInt( INT_OBJECTIVE_ID )

		}

		RunUIScript( "SetLastLocalPingObjIDForUI", lastLocalPingObjID )
		WaitFrame()
	}
}
#endif          

#if CLIENT
void function SpawnMenu_ButtonUpdate( entity wp, bool shouldShowWaypoint, int spawnWaypointTeamUsability )
{
	entity localPlayer = GetLocalViewPlayer()
	if ( !IsValid( localPlayer ) )
		return

	if ( shouldShowWaypoint )
	{
		int waypointEHI = wp.GetEncodedEHandle()
		int waypointType = wp.GetWaypointInt( INT_WAYPOINT_TYPE )

		float[2] screenPos = GetScreenSpace( wp.GetOrigin() )

		string nameInformation = ""
		float capturePercentage = 0
		switch( waypointType )
		{
			case CONTROL_WAYPOINT_BASE0_INDEX:
			case CONTROL_WAYPOINT_BASE1_INDEX:
				nameInformation = Localize( "#CONTROL_BASE" )
				break
			case CONTROL_WAYPOINT_PLAYER_INDEX:
				if ( IsValid( wp.GetParent() ) && wp.GetParent().IsPlayer() )
					nameInformation = wp.GetParent().GetPlayerName()
				break
			case CONTROL_WAYPOINT_POINT_INDEX:
				if ( IsValid( wp.GetParent() ) )
				{
					int objectiveID = wp.GetParent().GetWaypointInt( INT_OBJECTIVE_ID )
					nameInformation = Control_GetObjectiveNameFromObjectiveID_Localized( objectiveID )
				}
				break
			case CONTROL_WAYPOINT_MRB_INDEX:
				if ( IsValid( wp.GetParent() ) )
				{
					nameInformation = Localize( "#CONTROL_MRB_SPAWN_NAME" )
					                                                                                                                                                            
					capturePercentage = wp.GetWaypointFloat( CONTROL_MRB_SPAWN_WAYPOINT_ENDTIME )
				}
				break
			default:
				break
		}

		int yourTeamIndex = ( AllianceProximity_GetAllianceFromTeam( localPlayer.GetTeam() ) == 0 ) ? 0 : 1
		if ( waypointType == CONTROL_WAYPOINT_BASE0_INDEX || waypointType == CONTROL_WAYPOINT_BASE1_INDEX  )
		{
			RunUIScript( "SetWaypointDataForUI",
									waypointEHI,
									true,
									spawnWaypointTeamUsability,
									false,
									-1,
									waypointType,
									screenPos[0],
									screenPos[1],
									nameInformation,
									capturePercentage,
									ALLIANCE_NONE,
									ALLIANCE_NONE,
									ALLIANCE_NONE,
									yourTeamIndex,
									false,
									0
			)
		}
		else if ( waypointType == CONTROL_WAYPOINT_POINT_INDEX )
		{

			entity objective = wp.GetParent()
			int objID = objective.GetWaypointInt( INT_OBJECTIVE_ID )
			int currentControllingTeam = objective.GetWaypointInt( INT_TEAM_CAPTURING )
			int currentOwner = objective.GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )
			int neutralPointOwnership = objective.GetWaypointInt( CONTROL_INT_OBJ_NEUTRAL_TEAM_OWNER )
			capturePercentage = objective.GetWaypointFloat( FLOAT_CAP_PERC )
			bool hasEmphasis = objective.GetWaypointFloat( FLOAT_BOUNTY_AMOUNT ) > 0
			bool isFOB = Control_IsPointAnFOB( objID )

			int numTeamPings = 0
			int playerAlliance = AllianceProximity_GetAllianceFromTeam( localPlayer.GetTeam() )
			if( playerAlliance != ALLIANCE_NONE )
				numTeamPings = Control_GetPingCountForObjectiveForAlliance( objective, playerAlliance )

			RunUIScript( "SetWaypointDataForUI",
				waypointEHI,
				true,
				spawnWaypointTeamUsability,
				isFOB,
				objID,
				waypointType,
				screenPos[0],
				screenPos[1],
				nameInformation,
				capturePercentage,
				currentControllingTeam,
				currentOwner,
				neutralPointOwnership,
				yourTeamIndex,
				hasEmphasis,
				objective.GetWaypointInt( INT_TEAM0_PLAYERSONOBJ ),
				objective.GetWaypointInt( INT_TEAM1_PLAYERSONOBJ ),
				numTeamPings
			)
		}
		else if ( waypointType == CONTROL_WAYPOINT_MRB_INDEX )
		{

			int currentControllingTeam = wp.GetWaypointInt( CONTROL_WAYPOINT_ALLIANCE_OWNER_INDEX )
			int currentOwner = currentControllingTeam

			RunUIScript( "SetWaypointDataForUI",
				waypointEHI,
				true,
				spawnWaypointTeamUsability,
				false,
				-1,
				waypointType,
				screenPos[0],
				screenPos[1],
				nameInformation,
				capturePercentage,
				currentControllingTeam,
				currentOwner,
				ALLIANCE_NONE,
				yourTeamIndex,
				false
			)
		}
	}
	else
	{
		int waypointEHI = wp.GetEncodedEHandle()
		RunUIScript( "SetWaypointDataForUI", waypointEHI, false, spawnWaypointTeamUsability, false, -1, 0, -1, -1, "" )
	}
}
#endif          

#if CLIENT
void function UICallback_Control_ReportMenu_OnOpened()
{

}
#endif          

#if CLIENT
void function UICallback_Control_ReportMenu_OnClosed()
{
	entity player = GetLocalClientPlayer()
	if ( !IsValid( player ) )                                        
		return

	if ( !Control_IsModeEnabled() )
		return

	if ( !player.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
		return

	thread Control_TriggerShowSpawnMenuOnUI_Thread( player, true )
}
#endif          

#if CLIENT
void function UICallback_Control_OnMenuPreClosed()
{
	if ( IsValid( GetLocalClientPlayer() ) )
		GetLocalClientPlayer().Signal( "OnSpawnMenuClosed" )

	                          
	if ( IsValid( file.spawnHeader ) )
	{
		var rui = Hud_GetRui( file.spawnHeader )
		if ( IsValid( rui ) )
		{
			RuiSetBool( rui, "spawnSelected", false )
		}
	}

	file.spawnHeader = null
	file.uiVMUpdateTime = 0
}
#endif          

#if CLIENT
void function UICallback_Control_SpawnHeaderUpdated( var spawnHeader, float time )
{
	file.spawnHeader = spawnHeader
	file.uiVMUpdateTime = time
}
#endif          

#if CLIENT
void function UICallback_Control_SpawnButtonClicked( int waypointEHI )
{
	entity waypoint = GetEntityFromEncodedEHandle( waypointEHI )

	#if DEV
		if ( waypoint == null )
			printf( "CONTROL: tried to spawn on button with a waypoint that no longer exists" )
	#endif       

	Control_OnPlayerSentSpawnRequest( GetLocalClientPlayer(), waypoint )
}
#endif          

#if CLIENT
void function Control_OpenCharacterSelectMenu( var button )
{
	if ( GetGameState() != eGameState.Playing )
		return

	Control_OpenCharacterSelect()
}
#endif          

#if CLIENT
const float CONTROL_BUTTON_PRESS_BUFFER = 0.5                                                                                                          
void function Control_OpenCharacterSelect( bool isJiP = false )
{
	                                                                                                     
	if ( !Control_IsModeEnabled() )
		return

	                                                                                                                                                                            
	if ( file.characterSelectClosedTime + CONTROL_BUTTON_PRESS_BUFFER > Time() )
		return

	entity clientPlayer = GetLocalClientPlayer()

	if ( !IsValid( clientPlayer ) )
		return

	                                                                
	if ( !clientPlayer.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
		return

	DestroyRespawnBlur()

	                                                                                  
	if ( ClGameState_GetRui() != null )
		RuiSetBool( ClGameState_GetRui(), "isInSpawnMenu", false )

	const bool browseMode = true
	const bool showLockedCharacters = true
	HideScoreboard()

	OpenCharacterSelectNewMenu( browseMode, showLockedCharacters, isJiP )
}
#endif          

#if CLIENT
void function Control_OnCharacterSelectMenuClosed()
{
	file.characterSelectClosedTime = Time()
	entity player = GetLocalClientPlayer()

	if ( !player.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
		return

	CreateRespawnBlur()
	if ( !file.firstTimeRespawnShouldWait )
	{
		                                                    
		thread Control_TriggerShowSpawnMenuOnUI_Thread( player, false )
	}

	thread Control_CameraInputManager_Thread( player )

	                                                                                  
	if ( ClGameState_GetRui() != null )
		RuiSetBool( ClGameState_GetRui(), "isInSpawnMenu", true )
}
#endif          

#if CLIENT
                                                                                                                                                                                              
void function Control_SetWaveSpawnTimerTime()
{
	entity player = GetLocalClientPlayer()

	if ( !IsValid( player ) )
		return

	if ( !player.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
		return

	if ( player.GetPlayerNetBool( "Control_IsPlayerExemptFromWaveSpawn" ) )
		return

	if ( IsValid( file.spawnHeader ) )
	{
		var rui = Hud_GetRui( file.spawnHeader )

		if ( IsValid( rui ) )
		{
			float startTime = GetGlobalNetTime( "Control_WaveStartTime" )
			float endTime =  GetGlobalNetTime( "Control_WaveSpawnTime" )
			RuiSetGameTime( rui, "respawnStartTime", startTime )
			RuiSetGameTime( rui, "respawnEndTime", endTime )
		}
	}
}
#endif          

#if CLIENT
                                                                                                                                                                                          
void function ServerCallback_Control_UpdateSpawnWaveTimerVisibility( bool isVisible )
{
	entity player = GetLocalClientPlayer()

	if ( !IsValid( player ) )
		return

	if ( !player.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
		return

	                                                                                              
	if ( file.spawnHeader == null && ( !isVisible || player.GetPlayerNetBool( "Control_IsPlayerExemptFromWaveSpawn" ) ) )
		return

	Control_SetWaveSpawnTimerTime()
}
#endif          

#if CLIENT
                                                                                                                      
void function ServerCallback_Control_DisplaySpawnAlertMessage( int spawnAlertMessageCode )
{
	var rui
	if ( !IsValid( file.spawnHeader ) )
		return

	rui = Hud_GetRui( file.spawnHeader )
	if ( !IsValid( rui) )
		return

	RunUIScript( "Control_SetAllButtonsEnabled" )

	string message
	bool isMessageCodeValid = false
	switch ( spawnAlertMessageCode )
	{
		case eControlSpawnAlertCode.SPAWN_FAILED:
			message = "#CONTROL_FAILED_SPAWN"
			isMessageCodeValid = true
			break
		case eControlSpawnAlertCode.SPAWN_CANCELLED:
			message = "#CONTROL_CANCELLED_SPAWN"
			isMessageCodeValid = true
			break
		case eControlSpawnAlertCode.SPAWN_LOST_SPAWNPOINT:
			message = "#CONTROL_LOST_SELECTED_SPAWN"
			isMessageCodeValid = true
			break
		case eControlSpawnAlertCode.SPAWN_LOST_MRB:
			message = "#CONTROL_MRB_SPAWN_NOT_AVAIL"
			isMessageCodeValid = true
			break
		default:
			break
	}

	if ( isMessageCodeValid )
	{
		RuiSetString( rui, "spawnAlertMessage", message )
		RuiSetGameTime( rui, "alertTime", ClientTime() )
	}
}
#endif          

#if CLIENT
                                                                                                                                     
void function ServerCallback_Control_DisplayWaveSpawnBarStatusMessage( bool isShowingMessage, int spawnType )
{
	if ( !IsValid( file.spawnHeader ) )
		return

	var rui = Hud_GetRui( file.spawnHeader )
	if ( IsValid( rui ) )
	{
		if ( isShowingMessage )
		{
			RuiSetBool( rui, "spawnSelected", true )

			float startTime = GetGlobalNetTime( "Control_WaveStartTime" )
			float endTime =  GetGlobalNetTime( "Control_WaveSpawnTime" )
			RunUIScript("SetRespawnOverlayTime", startTime, endTime)

			string spawnChoice
			switch( spawnType )
			{
				case eControlPlayerRespawnChoice.SPAWN_AT_BASE:
					spawnChoice = "#CONTROL_BASE"
					break
				case eControlPlayerRespawnChoice.SPAWN_ON_POINT:
					spawnChoice = "#CONTROL_POINT"
					break
				case eControlPlayerRespawnChoice.SPAWN_ON_SQUAD:
					spawnChoice = "#CONTROL_SQUAD"
					break
				case eControlPlayerRespawnChoice.SPAWN_ON_MRB:
					spawnChoice = "#CONTROL_MRB"
					break
				default:
					spawnChoice = ""
					break
			}

			RuiSetString( rui, "spawnOptionSelected", spawnChoice )
		}
		else
		{
			RunUIScript("SetRespawnOverlayTime", RUI_BADGAMETIME, RUI_BADGAMETIME)
			RuiSetBool( rui, "spawnSelected", false )
		}
	}
}
#endif          

#if CLIENT
                                             
void function Control_ShowTeammateDeathIcon_3DMap_Thread( entity victimWP )
{
	Assert( IsNewThread(), "Must be threaded off" )

	entity localPlayer = GetLocalViewPlayer()
	if ( !IsValid( localPlayer ) )
		return

	if ( !IsFriendlyTeam( localPlayer.GetTeam(), victimWP.GetTeam() ) )
		return

	if ( !Control_ShouldDisplayFriendlyMapIcons( localPlayer ) )
		return

	var rui = CreateFullscreenRui(  $"ui/control_teammate_death_icon.rpak", CONTROL_TEAMMATE_ICON_SORTING )

	localPlayer.EndSignal( "Control_NewCameraDataReceived" )
	localPlayer.EndSignal( "Control_PlayerStartingRespawnSelection" )
	localPlayer.EndSignal( "Control_PlayerHasChosenRespawn" )
	localPlayer.EndSignal( "Control_PlayerHideScoreboardMap" )

	OnThreadEnd(
		function() : ( rui )
	{
		RuiDestroy( rui )
	}
	)

	entity victim = victimWP.GetWaypointEntity( CONTROL_PLAYERLOC_WAYPOINT_PLAYERENTITY_INDEX )
	if ( IsValid( victim ) )
	{
		vector deathLoc = victim.GetOrigin()
		bool isVictimSquadmate = localPlayer.GetTeam() ==  victim.GetTeam() ? true : false
		if ( isVictimSquadmate )
			RuiSetColorAlpha( rui, "deathIconColor", SrgbToLinear( GetTeammateIconColor( victim ) / 255.0 ), 1.0 )
		RuiSetGameTime( rui, "deathStartTime", Time() )
		RuiSetFloat3( rui, "deathLocation", deathLoc )

		wait CONTROL_TEAMMATE_DEATH_ICON_LIFETIME
	}

}
#endif          

#if CLIENT
                                                                                                                         
void function InstanceWPControlPlayerLoc( entity wp )
{
	entity player = GetLocalViewPlayer()

	if ( !IsValid( player ) || !IsValid( wp ) )
		return

	                                               
	if ( !IsFriendlyTeam( player.GetTeam(), wp.GetTeam() ) )
		return

	thread Control_TeamLocationWaypointThink_Thread( wp )
}
#endif          

#if CLIENT
vector function GetTeammateIconColor( entity player )
{
	return GetKeyColor( COLORID_MEMBER_COLOR0, player.GetTeamMemberIndex() )
}
#endif          

#if CLIENT
                                                 
void function Control_TeamLocationWaypointThink_Thread( entity wp )
{
	Assert( IsNewThread(), "Must be threaded off" )

	entity localPlayer = GetLocalViewPlayer()
	if ( !IsValid( localPlayer ) )
		return

	if ( !IsFriendlyTeam( localPlayer.GetTeam(), wp.GetTeam() ) )
		return

	var rui = CreateWaypointRui( $"ui/control_teammate_loc_icon.rpak", CONTROL_TEAMMATE_ICON_SORTING )

	wp.EndSignal( "OnDestroy" )
	localPlayer.EndSignal( "OnDestroy" )

	OnThreadEnd(
		function() : ( rui, wp )
		{
			entity localPlayer = GetLocalViewPlayer()
			if ( IsValid( localPlayer ) )
				thread Control_ShowTeammateDeathIcon_3DMap_Thread( wp )
			RuiDestroy( rui )
		}
	)

	entity teammate = wp.GetWaypointEntity( CONTROL_PLAYERLOC_WAYPOINT_PLAYERENTITY_INDEX )

	if ( IsValid( teammate ) )
	{
		bool isTeammateSquadmate = localPlayer.GetTeam() == teammate.GetTeam() ? true : false
		if ( isTeammateSquadmate )
			RuiSetColorAlpha( rui, "teammateIconColor", SrgbToLinear( GetTeammateIconColor( teammate ) / 255.0 ), 1.0 )
		RuiTrackFloat3( rui, "teammateLocation", teammate, RUI_TRACK_ABSORIGIN_FOLLOW )
		RuiTrackFloat3( rui, "teammateRotation", teammate, RUI_TRACK_CAMANGLES_FOLLOW )
		RuiSetFloat3( rui, "cameraLookDirection", file.cameraAngles )
		RuiSetGameTime( rui, "spawnStartTime", Time() )
		bool isDisplayingTeammateIcon = Control_ShouldDisplayFriendlyMapIcons( localPlayer )
		RuiSetBool( rui, "display", isDisplayingTeammateIcon )

		                                                                                                                                     
		while ( GetGameState() == eGameState.Playing && IsValid( localPlayer ) )
		{
			if ( Control_ShouldDisplayFriendlyMapIcons( localPlayer ) && !isDisplayingTeammateIcon )
			{
				isDisplayingTeammateIcon = true
				RuiSetBool( rui, "display", isDisplayingTeammateIcon )
			}

			if ( !Control_ShouldDisplayFriendlyMapIcons( localPlayer ) && isDisplayingTeammateIcon )
			{
				isDisplayingTeammateIcon = false
				RuiSetBool( rui, "display", isDisplayingTeammateIcon )
			}

			WaitFrame()

			localPlayer = GetLocalViewPlayer()
		}
	}
}
#endif          

#if CLIENT
                                                                                                                                         
bool function Control_ShouldDisplayFriendlyMapIcons( entity player )
{
	if ( IsValid( player ) && file.isPlayerInMapCameraView )
		return true

	return false
}
#endif          

#if CLIENT
void function ServerCallback_Control_DisplayIconAtPosition( vector position, int iconIndex, int colorID, float duration )
{
	asset icon = $""
	switch ( iconIndex )
	{
		case eControlIconIndex.DEATH_ICON:
			icon = TEAMMATE_DEATH_ICON
			break
		case eControlIconIndex.SPAWN_ICON:
			icon = TEAMMATE_SPAWN_ICON
			break
		default:
			break
	}

	thread DisplayIconAtPosition_Thread( position, icon, colorID, duration )
}
#endif          

#if CLIENT
void function DisplayIconAtPosition_Thread( vector position, asset icon, int colorID, float duration )
{
	Assert( IsNewThread(), "Must be threaded off" )

	entity player = GetLocalViewPlayer()
	if ( !IsValid( player ) )
		return

	vector iconColor = GetKeyColor( colorID ) * ( 1.0 / 255.0 )
	var minimapRui = Minimap_AddIconAtPosition( position, <0,90,0>, icon, 0.9, iconColor )
	var fullmapRui = FullMap_AddIconAtPos( position, <0,0,0>, icon, 6.0, iconColor )

	OnThreadEnd(
		function() : ( minimapRui, fullmapRui )
		{
			Minimap_CommonCleanup( minimapRui )
			Fullmap_RemoveRui( fullmapRui )
			RuiDestroy( fullmapRui )
		}
	)

	wait duration
}
#endif          

  
                                                                                                                                                                      
                                                                                                                                                                       
                                                                                                                                                                     
                                                                                                                                                                      
                                                                                                                                                                       
                                                                                                                                                                      

	                        
  
                                                                               
#if SERVER
                                                                                 
 
	                                               
	                                               
	                                                  
	                                       

	                                       
		           

	                                                               
	                                                                                                         
	 
		       
			                             
				                                                                                
		             

		           
	 

	                                                                                                 
	 
		       
			                             
				                                                                       
		             

		           
	 

	                                                                                                              
	 
		       
			                             
				                                                                                 
		             

		           
	 

	                                                                                                      
	 
		       
			                             
				                                                                        
		             

		           
	 

	                                                                                                              
	 
		       
			                             
				                                                                                 
		             

		           
	 

	                                                                                                                               
	 
		       
			                             
				                                                                     
		             

		           
	 

	            
 
#endif          

#if SERVER
                                                                                                                                                         
                                                                     
 
	                                           
	                                  

	                         
		                             

	                             

	                                                     
	                              
	 
		       
			                             
				                                                                                               
		             

		                       
	 

	                                                           
	                                                                  
	 
		       
			                             
				                                                                                           
		             

		                       
	 

	                                                         
	                                                                   
	 
		       
			                             
				                                                                                             
		             

		                       
	 

	                                                                       

                                                    
	                                                
	 
		       
			                             
				                                                                                           
		             

		                       
	 

	                                                             
	                        
	 
		                                                        
		                                          
		 
			       
				                             
					                                                                                                
			             

			                       
		 
	 

	                                                                            
	 
		       
			                                                                                          
		             

		                       
	 

	                                                      
	                                                                                      
	 
		       
			                             
				                                                                                               
		             

		                       
	 

	                                                    
	                                                                                                                     
	 
		       
			                             
				                                                                                                   
		             

		                       
	 

	                                          
	                             
	 
		       
			                             
				                                                                                               
		             

		                       
	 

	                                                                              
	                                                                                      
	 
		       
			                             
				                                                                                                   
		             

		                       
	 

	                                                
	                              
	 
		       
			                             
				                                                                                         
		             

		                       
	 

	                                                   
	                                                                             
	 
		       
			                             
				                                                                                                      
		             

		                       
	 

	                                                 
	                                             
	 
		       
			                             
				                                                                                         
		             

		                       
	 

	                                              
	                                                               
	 
		       
			                             
				                                                                                       
		             

		                       
	 

	                                           
	 
		       
			                             
				                                                                                                
		             

		                       
	 

	                                       
	                         
	 
		       
			                             
				                                                                                                
		             

		                                                                                                                                                      
		                                                                                             
		                                                                                        
		 
			                                                       
			                                                              
			                                  
				                                                                         
		 

		                       
	 

	                                                                       
	                       
		                                                                  

	                                                         
	                                                               
		                                                                                 

	                             
 
#endif          

#if SERVER || CLIENT
float function GetEffectiveDeltaSince( float timeThen )
{
	if ( timeThen <= 0.0001 )
		return 999999.0

	return (Time() - timeThen)
}
#endif                    


  
                                                               
                                                                
                                                             
                                                              
                                                               
                                                                


                                                                                            
                                                                                             
                                                                                          
                                                                                          
                                                                                          
                                                                                          

                   
  


#if SERVER || CLIENT
void function OnVehicleBaseSpawned( entity vehicleBase )
{
	if ( vehicleBase.GetScriptName() != "Control_SetUsableVehicleBase" )
		return
}
#endif                    

#if SERVER
                                                       
 
	                                                              
	                                                          
	 
		                                                      
		                                                        
		                                                                

		                                                           
		 
			                                                
			                        
		 
	 
	                                          

	                                                  
	 
		                                              
	 
 
#endif          

#if SERVER
                                                                         
 
	                                 
		      

	                                   
	                                                                   
	                            
	                            
	                                            
	                                                                      
	                                                                                            
	                                                              
	                                                                
	                                                                                                                    

	       
		                                  
			                                                                                                                                                     
	             

	                                                    
 
#endif          

#if SERVER
                                                                       
 
	                                                          
	                           
	                                                        
		                                        
	                                                                    
	                                                                           

	                             
	                          
	 
		                                                             
	 
	    
	 
		                                 
		                                          
	 

	                                        

	                                                   
	 
		                                         
		                                                      
	 

	                                                           
 
#endif          

#if SERVER
                                                                      
 
	                                               

	                          
		      

	                                

	            
		                                     
		 
			                                             
				                                               
		 
	 

	             
 
#endif          

#if SERVER
                                                               
 
	                                               

	                              
		      

	                        
	             

	                                                        

	                              
	                             
	                                
	                                

	              
	 
		                            
		                            
		                                        
		 
			                          
				        

			                                                                                                    
			 
				                      
				     
			 
		 

		                       
		 
			                        
			                        
			 
				                
				             
			 

			                                    
			                                                               
			                                                             
			                                                                                                
			 
				                                                                              
				                      
					                                                                                 
				    
					                                                                                                    
			 
		 
		                           
		 
			                        
			                     
				                                                                                                                                                                                                      
			                                                                     
		 

		           
	 
 
#endif          

#if SERVER
                                                                            
 
	                                                                       
	                                   
	 
		                                
		           
	 
	    
	 
		                                                               
		 
			                                                                                                                                           
			 
				                                                                      
				                                            
				           
			 
		 
	 

	            
 
#endif          

#if SERVER
                                                          
 
	                                             
	 
		                                                            
			                                                          

		                                                      
	 
 
#endif          


#if CLIENT
void function ServerCallback_Control_NoVehiclesAvailable()
{
	AnnouncementMessageRight( GetLocalClientPlayer(), Localize( "#CONTROL_NO_VEHICLES_AVAILABLE" ), "", ANNOUNCEMENT_RED, $"", CONTROL_MESSAGE_DURATION, "WXpress_Train_Update_Small" )
}
#endif          


  
                                                                                                                   
                                                                                                                    
                                                                                                                  
                                                                                                                   
                                                                                                                    
                                                                                                                   

                    
   

#if CLIENT
                                                                               
void function ServerCallback_Control_AirdropNotification( bool areMultipleAirdropsIncoming )
{
	entity player = GetLocalClientPlayer()
	if ( !IsValid( player ) )
		return

	string announcementText

	if ( areMultipleAirdropsIncoming )
	{
		announcementText = Localize( "#CONTROL_INCOMING_AIRDROPS" )
	}
	else
	{
		announcementText = Localize( "#CONTROL_INCOMING_AIRDROP" )
	}

	vector announcementColor = <0, 0, 0>
	Obituary_Print_Localized( announcementText, announcementColor )
	AnnouncementMessageRight( player, announcementText, "", SrgbToLinear( announcementColor / 255 ), $"", CONTROL_MESSAGE_DURATION, SFX_HUD_ANNOUNCE_QUICK, SrgbToLinear( announcementColor / 255 ) )
}
#endif          

#if CLIENT
                                                 
void function Control_UpdatePlayerExpHUD( entity player, int newExpTotal )
{
	if ( !IsValid( player ) )
		return

	if ( player != GetLocalViewPlayer() )
		return

	                            
	int expTier = Control_GetPlayerExpTier( player, false )
	float currentTierExp = float( Control_GetPlayerExpTotal( player, true, expTier ) )
	float expTierThreshold = float( Control_GetExpDifferenceBetweenLastTierAndTier( expTier + 1, player ) )
	bool isMaxTier = expTier >= CONTROL_MAX_EXP_TIER ? true : false
	var rui = ClGameState_GetRui()


	if ( GetGameState() == eGameState.Playing && IsValid( rui ) )
	{
		Control_SetRatingsVisibility( player )
		RuiSetBool( rui, "isMaxTier", isMaxTier )
		RuiSetInt( rui, "expTierColor", Control_GetPlayerExpTier( player ) )
		RuiSetFloat( rui, "expTotal", currentTierExp )
		RuiSetFloat( rui, "expTierThreshold", expTierThreshold )

		if ( player == GetLocalClientPlayer() )
			RuiSetBool( rui, "isUltimateFull", Control_IsPlayerUltReady( player ) )

		if ( currentTierExp > 0 )
			RuiSetGameTime( rui, "expGainedTime", Time() )
	}

	                                                  
	Control_UpdatePlayerExpPercentAmountsForSpawns( player )
}
#endif          

#if CLIENT
                                                                                                                                                       
void function Control_UpdatePlayerExpPercentAmountsForSpawns( entity player )
{
	if ( !IsValid( player ) )
		return

	if ( player != GetLocalClientPlayer() )
		return

	                                                  
	float playerExpPercentFromLastLife = Control_GetEXPPercentToNextTier( player )
	int recoveredExpPercentToAward = Control_GetRoundedPercentAsInt( playerExpPercentFromLastLife, 100 )

	                                                         
	int expPercentToAwardForPointSpawn = 0
	int expPercentToAwardForBaseSpawn = 0

	                                                                                               
	if ( Control_GetDefaultExpPercentToAwardForPointSpawn() < 0 )
		expPercentToAwardForPointSpawn = recoveredExpPercentToAward

	                                                                                            
	if ( Control_GetDefaultExpPercentToAwardForBaseSpawn() < 0 )
		expPercentToAwardForBaseSpawn = recoveredExpPercentToAward

	                                                                                                                                                                                                  
	if ( playerExpPercentFromLastLife > Control_GetDefaultExpPercentToAwardForPointSpawn() && Control_GetDefaultExpPercentToAwardForPointSpawn() > 0 && Control_ShouldUseRecoveredExpPercentIfGreaterThanDefaults() )
	{
		expPercentToAwardForPointSpawn = recoveredExpPercentToAward
	}
	else if ( Control_GetDefaultExpPercentToAwardForPointSpawn() > 0 )
	{
		expPercentToAwardForPointSpawn = Control_GetRoundedPercentAsInt( Control_GetDefaultExpPercentToAwardForPointSpawn(), 100 )
	}

	                                                                                                                                                                                               
	if ( playerExpPercentFromLastLife > Control_GetDefaultExpPercentToAwardForBaseSpawn() && Control_GetDefaultExpPercentToAwardForBaseSpawn() > 0 && Control_ShouldUseRecoveredExpPercentIfGreaterThanDefaults() )
	{
		expPercentToAwardForBaseSpawn = recoveredExpPercentToAward
	}
	else if ( Control_GetDefaultExpPercentToAwardForBaseSpawn() > 0 )
	{
		expPercentToAwardForBaseSpawn = Control_GetRoundedPercentAsInt( Control_GetDefaultExpPercentToAwardForBaseSpawn(), 100 )
	}

	RunUIScript( "Control_UI_SpawnMenu_SetExpPercentAmountsForSpawns", expPercentToAwardForPointSpawn, expPercentToAwardForBaseSpawn, player.GetPlayerNetBool( "Control_IsLateJoinPlayerFirstSpawn" ) )
}
#endif          

#if CLIENT
                                        
void function Control_PlayEXPGainSFX()
{
	entity player = GetLocalViewPlayer()
	if ( !IsValid( player ) )
		return

	EmitUISound( CONTROL_SFX_EXP_GAIN )
}
#endif          

#if CLIENT
string function Control_GetVictoryConditionForFlagset( int gameResultFlags )
{
	string victoryCondition
	switch( gameResultFlags )
	{
		case( CONTROL_VICTORY_FLAGS_SCORE ):
			victoryCondition = CONTROL_PIN_VICTORYCONDITION_SCORE
			break

		case( CONTROL_VICTORY_FLAGS_LOCKOUT ):
			victoryCondition = CONTROL_PIN_VICTORYCONDITION_LOCKOUT
			break
		default:
			victoryCondition = CONTROL_PIN_VICTORYCONDITION_UNKNOWN
			break
	}

	return victoryCondition
}
#endif          

#if CLIENT
void function Control_DeathScreenUpdate( var rui )
{
	SquadSummaryData squadData = GetSquadSummaryData()

	string titleString = squadData.squadPlacement == 1 ? "#SQUAD_PLACEMENT_GCARDS_TITLE" : "#SQUAD_HEADER_DEFEAT"
	string killsText   = "#CONTROL_DEATH_SCREEN_SUMMARY_KILLS_ALLIANCE"

	string victoryCondition = Control_GetVictoryConditionForFlagset( squadData.gameResultFlags )
	RuiSetString( rui, "victoryCondition", victoryCondition )
	RuiSetString( rui, "headerText", titleString )                                                                                                      
	RuiSetString( rui, "killsText", killsText )

	if ( victoryCondition == CONTROL_PIN_VICTORYCONDITION_SCORE )
	{
		RuiSetInt( rui, "losingScore", squadData.gameScoreFlags )
		RuiSetInt( rui, "winningScore", GetScoreLimit_FromPlaylist() )
	}
}
#endif          

#if CLIENT
void function Control_PopulateSummaryDataStrings( SquadSummaryPlayerData data )
{
	data.modeSpecificSummaryData[0].displayString = "#DEATH_SCREEN_SUMMARY_KILLS"
	data.modeSpecificSummaryData[1].displayString = "#DEATH_SCREEN_SUMMARY_ASSISTS"
	data.modeSpecificSummaryData[2].displayString = ""
	data.modeSpecificSummaryData[3].displayString = "#DEATH_SCREEN_SUMMARY_DAMAGE_DEALT"
	data.modeSpecificSummaryData[4].displayString = "#DEATH_SCREEN_SUMMARY_CONTROL_RATING"
	data.modeSpecificSummaryData[5].displayString = "#DEATH_SCREEN_SUMMARY_CONTROL_OBJECTIVES_CAPTURED"
	data.modeSpecificSummaryData[6].displayString = ""
}
#endif          

#if CLIENT
                                                                                                          
void function ServerCallback_Control_UpdatePlayerExpHUDWeaponEvo( bool isWeaponEvoPending, bool didGainNewExpTier )
{
	entity player = GetLocalViewPlayer()
	if ( !IsValid( player ) )
		return

	var rui = ClGameState_GetRui()
	if ( GetGameState() == eGameState.Playing && IsValid( rui ) )
	{
		                                                 
		if ( Control_GetShouldEvoWeaponsOnReload() )
			RuiSetBool( rui, "isEXPEvoPending", isWeaponEvoPending )

		if ( didGainNewExpTier )
			RuiSetGameTime( rui, "expTierGainedTime", Time() )
	}
}
#endif          

#if CLIENT
                                                         
void function ServerCallback_Control_NewEXPLeader( entity expLeader, int exp )
{
	EHI playerEHI = ToEHI( expLeader )

	                                                      
	if ( playerEHI == EHI_null )
		return

	if ( !IsValid( expLeader ) )
		return

	entity localPlayer = GetLocalViewPlayer()

	if ( !IsValid( localPlayer ) )
		return

	string playerName = GetPlayerNameFromEHI( playerEHI )
	vector playerNameColor = expLeader.GetTeam() == localPlayer.GetTeam() ? GetPlayerInfoColor( expLeader ) : GetKeyColor( COLORID_ENEMY )

	Obituary_Print_Localized( Localize( "#CONTROL_NEW_EXPLEADER_OBIT", playerName, exp ), playerNameColor )

	if ( localPlayer == expLeader )
	{
		AnnouncementData announcement = Announcement_Create( "" )
		Announcement_SetStyle( announcement, ANNOUNCEMENT_STYLE_RATING_LEADER )
		Announcement_SetPurge( announcement, true )
		Announcement_SetOptionalTextArgsArray( announcement, [Localize("#CONTROL_YOU_ARE_EXPLEADER"), Localize( "#CONTROL_EXPLEADER_EXP", exp, GetPlayerInfoColor( expLeader ) ), string( exp ) ] )
		Announcement_SetPriority( announcement, 200 )
		Announcement_SetSoundAlias( announcement, SOUND_NEW_KILL_LEADER )
		announcement.duration = CONTROL_MESSAGE_DURATION
		AnnouncementFromClass( localPlayer, announcement )
	}

	SquadLeader_UpdateAllUnitFramesRui()
}
#endif          

#if CLIENT
                                                                      
void function ServerCallback_Control_EXPLeaderKilled( entity attacker, entity expLeader )
{
	if ( !IsValid( attacker ) || !IsValid( expLeader ) )
		return

	entity localPlayer = GetLocalViewPlayer()

	if ( !IsValid( localPlayer ) )
		return

	EHI expLeaderEHI = ToEHI( expLeader )
	string expLeaderName = GetPlayerNameFromEHI( expLeaderEHI )
	vector expLeaderNameColor = expLeader.GetTeam() == localPlayer.GetTeam() ? GetPlayerInfoColor( expLeader ) : <255, 255, 255>

	SquadLeader_UpdateAllUnitFramesRui()
	Obituary_Print_Localized( Localize( "#CONTROL_EXPLEADER_OBIT", expLeaderName ), expLeaderNameColor )
	if ( localPlayer == attacker && attacker != expLeader )
		AnnouncementMessageSweep( localPlayer, "#CONTROL_YOUKILLED_EXPLEADER", expLeaderName, expLeaderNameColor )
}
#endif          

#if CLIENT
                                                          
void function ServerCallback_Control_PlayCaptureZoneEnterExitSFX( bool isEnteringZone )
{
	entity localPlayer = GetLocalViewPlayer()

	if ( !IsValid( localPlayer ) )
		return

	if ( isEnteringZone )
	{
		EmitUISound( CONTROL_SFX_CAPTURE_ZONE_ENTER )
	}
	else
	{
		EmitUISound( CONTROL_SFX_CAPTURE_ZONE_EXIT )
	}
}
#endif          

  
                                                                     
                                                                      
                                                                       
                                                                       
                                                                       
                                                                      

	          
  

#if CLIENT
void function Control_ScoreboardSetup()
{
	clGlobal.showScoreboardFunc = Control_ShowScoreboardOrMap_Teams
	clGlobal.hideScoreboardFunc = Control_HideScoreboardOrMap_Teams

	Teams_AddCallback_ScoreboardData( Control_GetScoreboardData )
	Teams_AddCallback_PlayerScores( Control_GetPlayerScores )
	Teams_AddCallback_SortScoreboardPlayers( Control_SortPlayersByScore )
	Teams_AddCallback_Header( Control_ScoreboardUpdateHeader )
	Teams_AddCallback_GetTeamColor( Control_ScoreboardGetTeamColor )
}
#endif          

#if CLIENT
void function Control_ShowScoreboardOrMap_Teams()
{
	entity player = GetLocalClientPlayer()
	entity localViewPlayer = GetLocalViewPlayer()
	HudInputContext inputContext
	
	                                                                                                                                                                    
	if ( !IsViewingDeathScreen() )
	{
		if ( IsValid( player ) )
			thread Control_CameraInputManager_Thread( player )

		Scoreboard_SetVisible( true )
		UpdateFullmapRuiTracks()
		Fullmap_ClearInputContext()

		if ( IsValid( localViewPlayer ) )
			UpdateMainHudVisibility( localViewPlayer )

		Control_OnInGameMapShow()

		inputContext.keyInputCallback = Control_HandleKeyInput
		inputContext.moveInputCallback = Control_ShowScoreboardOrMapHandleMoveInput
		inputContext.viewInputCallback = Control_ShowScoreboardOrMapHandleViewInput
	}
	HudInput_PushContext( inputContext )
}
#endif          

#if CLIENT
bool function Control_HandleKeyInput( int key )
{
	bool isSuccessful = false

	switch ( key )
	{
		case BUTTON_B:
			HideScoreboard()
			isSuccessful = true
			break
		case BUTTON_DPAD_UP:
		case KEY_F2:
			RunUIScript( "UI_OpenGameModeRulesDialog" )
			isSuccessful = true
			break
		default:
			isSuccessful = !IsViewingDeathScreen() && Fullmap_HandleKeyInput( key )                                                                  
			break
	}

	return isSuccessful
}
#endif          

#if CLIENT
bool function Control_ShowScoreboardOrMapHandleMoveInput( float x, float y )
{
	return Fullmap_HandleMoveInput( x, y )

	unreachable
}
#endif          

#if CLIENT
bool function Control_ShowScoreboardOrMapHandleViewInput( float x, float y )
{
	return Fullmap_HandleViewInput( x, y )

	unreachable
}
#endif          

#if CLIENT
void function Control_HideScoreboardOrMap_Teams()
{
	entity player = GetLocalClientPlayer()

	HudInput_PopContext()
	Scoreboard_SetVisible( false )

	HideFullmap()
	Control_OnInGameMapHide()

	if ( IsValid( player ) )
	{
		player.Signal( "Control_PlayerHideScoreboardMap" )
	}
}
#endif          

#if CLIENT
void function Control_OnInGameMapShow()
{
	if ( IsValid( file.inGameMapRui ) )
		return

	var rui = CreateTransientFullscreenRui( $"ui/control_teams_map.rpak", 0)
	RuiSetBool( rui, "showBottomBar", true )

	string playlist = GetCurrentPlaylistName()
	string playlistUiRules = GetPlaylistVarString( playlist, "ui_rules", "" )
	RuiSetBool( rui, "rulesEnabled", playlistUiRules != "" )

	Control_RefreshInGameMap_SpawnIcons( rui )
	file.inGameMapRui = rui

	thread Thread_Control_InGameMapData()
}
#endif          

#if CLIENT
const string NESTED_SPAWN_BUTTON_RUI_PREFIX = "spawn"
void function Control_RefreshInGameMap_SpawnIcons( var rui )
{
	if ( !IsValid( rui ) )
		return

	entity localPlayer = GetLocalViewPlayer()
	if ( !IsValid( localPlayer ) )
		return

	                                                                                          
	foreach ( index in file.inGameMapPointNestedRuiIndexes )
	{
		RuiDestroyNested( rui, NESTED_SPAWN_BUTTON_RUI_PREFIX + index )
	}
	file.inGameMapPointsToRuis.clear()
	file.inGameMapPointNestedRuiIndexes.clear()

	foreach( int idx, wp in file.spawnWaypoints )
	{
		int waypointType = wp.GetWaypointInt( INT_WAYPOINT_TYPE )

		if ( waypointType == CONTROL_WAYPOINT_BASE0_INDEX || waypointType == CONTROL_WAYPOINT_BASE1_INDEX || waypointType == CONTROL_WAYPOINT_POINT_INDEX || waypointType == CONTROL_WAYPOINT_MRB_INDEX )
		{
			var nestedRui = RuiCreateNested( rui, NESTED_SPAWN_BUTTON_RUI_PREFIX + idx, $"ui/control_spawn_button.rpak"  )
			file.inGameMapPointsToRuis[ wp ] <- nestedRui
			file.inGameMapPointNestedRuiIndexes.append( idx )

			if ( waypointType == CONTROL_WAYPOINT_POINT_INDEX )
			{
				entity objective = wp.GetParent()
				RuiTrackFloat( nestedRui, "capturePercentage", objective, RUI_TRACK_WAYPOINT_FLOAT, FLOAT_CAP_PERC )
				RuiTrackInt( nestedRui, "currentControllingTeam", objective, RUI_TRACK_WAYPOINT_INT, INT_TEAM_CAPTURING )
				RuiTrackInt( nestedRui, "currentOwner", objective, RUI_TRACK_WAYPOINT_INT, CONTROL_INT_OBJ_TEAM_OWNER )
				RuiTrackInt( nestedRui, "neutralPointOwnership", objective, RUI_TRACK_WAYPOINT_INT, CONTROL_INT_OBJ_NEUTRAL_TEAM_OWNER )
				RuiTrackInt( nestedRui, "team0PlayersOnObj", objective, RUI_TRACK_WAYPOINT_INT, INT_TEAM0_PLAYERSONOBJ )
				RuiTrackInt( nestedRui, "team1PlayersOnObj", objective, RUI_TRACK_WAYPOINT_INT, INT_TEAM1_PLAYERSONOBJ )
			}

			if ( waypointType == CONTROL_WAYPOINT_MRB_INDEX && IsValid( localPlayer ) )
			{
				if ( AllianceProximity_GetAllianceFromTeam( localPlayer.GetTeam() ) == wp.GetWaypointInt( CONTROL_WAYPOINT_ALLIANCE_OWNER_INDEX ) )
				{
					RuiSetImage( nestedRui, "centerImage", RESPAWN_BEACON_ICON_SMALL )
				}
				else
				{
					RuiSetBool( nestedRui, "isVisible", false )
				}
			}
		}
	}
}
#endif          

#if CLIENT
void function Thread_Control_InGameMapData()
{
	entity localPlayer = GetLocalViewPlayer()
	while( file.inGameMapRui != null && IsValid( localPlayer ) )
	{
		localPlayer = GetLocalViewPlayer()

		                                                                                                                      
		                                                                 
		if ( file.inGameMapPointNestedRuiIndexes.len() != file.spawnWaypoints.len() )
			Control_RefreshInGameMap_SpawnIcons( file.inGameMapRui )

		foreach( int idx, wp in file.spawnWaypoints )
		{
			if( wp in file.inGameMapPointsToRuis )
			{
				var nestedRui = file.inGameMapPointsToRuis[ wp ]
				int waypointType = wp.GetWaypointInt( INT_WAYPOINT_TYPE )

				float[2] screenPos = GetScreenSpace( wp.GetOrigin() )

				UISize screenSize = GetScreenSize()

				screenPos[0] =  screenPos[0] / screenSize.width
				screenPos[1] =  screenPos[1] / screenSize.height

				int playerTeam = localPlayer.GetTeam()
				int playerAlliance = AllianceProximity_GetAllianceFromTeam( playerTeam )
				int yourTeamIndex = ( playerAlliance == ALLIANCE_A ) ? 0 : 1

				string nameInformation = ""
				asset waypointImage = $""
				bool shouldShowObjective = true

				switch( waypointType )
				{
					case CONTROL_WAYPOINT_BASE0_INDEX:
					case CONTROL_WAYPOINT_BASE1_INDEX:
						nameInformation = ""
						waypointImage = CONTROL_WAYPOINT_BASE_ICON
						shouldShowObjective = false
						break
					case CONTROL_WAYPOINT_PLAYER_INDEX:
						if ( IsValid( wp.GetParent() ) && wp.GetParent().IsPlayer() )
							nameInformation = wp.GetParent().GetPlayerName()
						break
					case CONTROL_WAYPOINT_POINT_INDEX:
						if ( IsValid( wp.GetParent() ) )
						{
							int objectiveID = wp.GetParent().GetWaypointInt( INT_OBJECTIVE_ID )
							nameInformation = Control_GetObjectiveNameFromObjectiveID_Localized( objectiveID )
						}
						shouldShowObjective = true
						break
					case CONTROL_WAYPOINT_MRB_INDEX:
						nameInformation = Localize( "#CONTROL_MRB_SPAWN_NAME" )
						waypointImage = RESPAWN_BEACON_ICON
						shouldShowObjective = false
						break
					default:
						nameInformation = ""
						waypointImage = $""
						shouldShowObjective = false
						break
				}

				bool isSpawnWaypoint = waypointType == CONTROL_WAYPOINT_BASE0_INDEX || waypointType == CONTROL_WAYPOINT_BASE1_INDEX || waypointType == CONTROL_WAYPOINT_POINT_INDEX
				bool isValidNonHomeBaseSpawn = true

				if ( waypointType == CONTROL_WAYPOINT_MRB_INDEX )
				{
					isSpawnWaypoint = true
					isValidNonHomeBaseSpawn = false
					int waypointOwner = wp.GetWaypointInt( CONTROL_WAYPOINT_ALLIANCE_OWNER_INDEX )
					bool shouldShowMRBIcon = waypointOwner == playerAlliance || playerTeam == TEAM_SPECTATOR
					RuiSetBool( nestedRui, "isVisible", shouldShowMRBIcon )
					float endTime = wp.GetWaypointFloat( CONTROL_MRB_SPAWN_WAYPOINT_ENDTIME )
					RuiSetGameTime( nestedRui, "timerEndTime", endTime )
					RuiSetBool( nestedRui, "shouldShowTimer", shouldShowMRBIcon )
					RuiSetBool( nestedRui, "shouldDisplayMRBIconBacking", shouldShowMRBIcon )
				}

				if( isSpawnWaypoint )
				{
					RuiSetString( nestedRui, "objectiveName", nameInformation )
					RuiSetImage( nestedRui, "centerImage", waypointImage )
					RuiSetFloat2( file.inGameMapRui, "posSpawn" + idx, < screenPos[0], screenPos[1], 0.0 > )
					RuiSetInt( nestedRui, "yourTeamIndex", yourTeamIndex )
					RuiSetBool( nestedRui, "isDisabled", true )
					RuiSetBool( nestedRui, "shouldShowObjective", shouldShowObjective )
				}

				if ( waypointType == CONTROL_WAYPOINT_BASE0_INDEX || waypointType == CONTROL_WAYPOINT_BASE1_INDEX )
				{
					if ( waypointType == yourTeamIndex )
						RuiSetFloat2( file.inGameMapRui, "baseSpawnScreenspace", < screenPos[0], screenPos[1], 0.0 >  )
				}
				else if ( isValidNonHomeBaseSpawn )
				{
					int objID = wp.GetParent().GetWaypointInt( INT_OBJECTIVE_ID )
					int waypointOwner = wp.GetParent().GetWaypointInt( CONTROL_INT_OBJ_TEAM_OWNER )
					bool isFOB = Control_IsPointAnFOB( objID )
					bool isFOBForLocalPlayer = isFOB && ( ( objID == 0 && yourTeamIndex == 0) || (objID != 0 && yourTeamIndex !=  0) )
					bool isYourWaypoint = waypointOwner == playerAlliance && playerTeam != TEAM_SPECTATOR
					if ( isFOBForLocalPlayer )
					{
						RuiSetFloat2( file.inGameMapRui, "fobSpawnScreenspace", < screenPos[0], screenPos[1], 0.0 > )
						RuiSetBool( file.inGameMapRui, "canSpawnOnFOB", isYourWaypoint )
					}
					else if ( !isFOB )
					{
						RuiSetFloat2( file.inGameMapRui, "centralSpawnScreenspace", < screenPos[0], screenPos[1], 0.0 > )
						RuiSetBool( file.inGameMapRui, "canSpawnOnCentral", isYourWaypoint )
						RuiSetBool( file.inGameMapRui, "isSpawnOnCentralDisabled", !Control_IsSpawningOnObjectiveBAllowed() )
					}
					if(objID >= 0 && objID <= 2)
						RuiSetBool( GetFullmapGamestateRui(), "isOnObjective" + objID,  Control_Client_IsOnObjective( wp.GetParent(), localPlayer ) )
				}

				if( waypointType == CONTROL_WAYPOINT_POINT_INDEX )
				{
					if ( wp.GetParent().GetWaypointFloat( FLOAT_BOUNTY_AMOUNT ) > 0 )
						RuiSetBool( nestedRui,"hasEmphasis", true )
					else
						RuiSetBool( nestedRui,"hasEmphasis", false )
				}
			}
		}
		WaitFrame()
	}
}
#endif          

#if CLIENT
void function Control_OnInGameMapHide()
{
	Fullmap_SetVisible_MapOnly( false )

	if ( IsValid( file.inGameMapRui ) )
	{
		file.inGameMapPointsToRuis.clear()
		file.inGameMapPointNestedRuiIndexes.clear()
		RuiDestroy( file.inGameMapRui )
		file.inGameMapRui = null
	}

	                                                                                                      
	                                                                           
	RefreshSoundSystem();
}
#endif          

#if CLIENT
ScoreboardData function Control_GetScoreboardData()
{
	ScoreboardData data

	if ( Control_GetIsWeaponEvoEnabled() )
	{
		data.columnDisplayIcons.append( $"rui/hud/gametype_icons/control/control_ratings" )
		data.columnNumDigits.append( 5 )
		data.columnDisplayIconsScale.append( 1.0 )
	}

	data.columnDisplayIcons.append( $"rui/hud/gamestate/player_kills_icon" )
	data.columnNumDigits.append( 3 )
	data.columnDisplayIconsScale.append( 1.0 )

	data.columnDisplayIcons.append( $"rui/hud/gamestate/player_damage_dealt_icon" )
	data.columnDisplayIconsScale.append( 1.0 )
	data.columnNumDigits.append( 4 )

	data.numScoreColumns = data.columnDisplayIcons.len()

	return data
}
#endif          

#if CLIENT
array< string > function Control_GetPlayerScores( entity player )
{
	array< string > scores

	if ( Control_GetIsWeaponEvoEnabled() )
	{
		string points = string( player.GetPlayerNetInt( "control_personal_score" ) )
		scores.append( points )
	}

	string kills = string( player.GetPlayerNetInt( "kills" ) )
	scores.append( kills )

	string damage = string( player.GetPlayerNetInt( "damageDealt" ) )
	scores.append( damage )

	return scores
}
#endif          

#if CLIENT
array< entity > function Control_SortPlayersByScore( array< entity > teamPlayers, ScoreboardData gameData )
{
	teamPlayers.sort( int function( entity a, entity b )
		{
			array< string > aScores = Control_GetPlayerScores( a )
			array< string > bScores = Control_GetPlayerScores( b )

			if ( int (aScores[0] ) > int( bScores[0] ) ) return -1
			else if ( int( aScores[0] ) < int( bScores[0] ) ) return 1

			int aKills = a.GetPlayerNetInt( "kills" )
			int bKills = b.GetPlayerNetInt( "kills" )

			if ( aKills > bKills ) return -1
			else if ( aKills < bKills ) return 1

			int aDamage = a.GetPlayerNetInt( "damageDealt" )
			int bDamage = b.GetPlayerNetInt( "damageDealt" )

			if ( aDamage > bDamage ) return -1
			else if ( aDamage < bDamage ) return 1

			return 0
		}
	)

	return teamPlayers
}
#endif          

#if CLIENT
void function Control_ScoreboardUpdateHeader( var headerRui, var frameRui,  int team )
{
	bool isFriendly = team == AllianceProximity_GetAllianceFromTeam( GetLocalViewPlayer().GetTeam() )

	if( IsPrivateMatch() && GetLocalClientPlayer().IsObserver() && GetLocalClientPlayer().GetTeam() == TEAM_SPECTATOR )
	{
		isFriendly = team == ALLIANCE_A
	}
	else if( headerRui != null )
	{
		RuiSetString( headerRui, "headerText", Localize( isFriendly ? "#ALLIES" : "#ENEMIES" ) )
	}

	int winningTeam = -1
	if( ( GetAllianceTeamsScore( ALLIANCE_A ) + GetAllianceTeamsScore( ALLIANCE_B ) ) > 0 )
		winningTeam = GamemodeUtility_GetWinningAlliance()

	RuiSetBool( headerRui, "isWinning", ( winningTeam == team ) )

	if( team >= 0 )
	{
		ControlTeamData data = file.teamData[ team ]
		if( headerRui != null )
		{
			RuiSetInt( headerRui, "teamScoreFromPoints", data.teamScoreFromPoints )
			RuiSetInt( headerRui, "teamScoreFromBonus", data.teamScoreFromBonus )
			RuiSetInt( headerRui, "teamScorePerSec", data.teamScorePerSec )
		}
	}
}
#endif          

#if CLIENT
vector function Control_ScoreboardGetTeamColor( int team )
{
	bool isFriendly = team == AllianceProximity_GetAllianceFromTeam( GetLocalViewPlayer().GetTeam() )

	if( IsPrivateMatch() && GetLocalClientPlayer().IsObserver() && GetLocalClientPlayer().GetTeam() == TEAM_SPECTATOR )
	{
		isFriendly = team == ALLIANCE_A
	}

	vector color  = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED, true )
	if( !isFriendly )
		color  = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED, true )

	return color
}
#endif          

#if CLIENT
                                                                                         
void function ServerCallback_Control_UpdateExtraScoreBoardInfo( int alliance, int scoreFromPoints, int scoreFromBonuses )
{
	if ( !IsValid( GetLocalViewPlayer() ) )
		return

	ControlTeamData data
	data.teamScoreFromPoints = scoreFromPoints
	data.teamScoreFromBonus = scoreFromBonuses
	data.teamScorePerSec = file.teamData[alliance].teamScorePerSec

	file.teamData[alliance] = data
}
#endif          

#if CLIENT
bool function Control_IsPlayerInMapCameraView ( entity player )
{
	return file.isPlayerInMapCameraView
}

#endif          

#if SERVER
                                                                                                  
                                            
 
	                                                         
	 
		                                                                                                                                                                                              
		                                                                                                                                                                                              
	 
 
#endif          

  
		                                                         
		                                                          
		                                                        
		                                                         
		                                                          
		                                                         

		         
  


#if SERVER
                                                                                                    
                                                       
 
	                                                                        
 
#endif          

#if SERVER
                                          
                                                                
 
	                         
		      

	                                                                        
		      

	                                                                                                                                                                
	                                                                                     
		                                                                                                                                              
 
#endif          

#if SERVER
                                              
                                                                            
 
	                                               

	                         
		      

	                             
	                               

	            
		                       
		 
			                                                                                                                                    
			                                                                                                                                                                                                                        
			                                                       
		 
	 

	                              

	                                  
		                                                     
	                              
		                                              

	                                                   
	                                                                
		                                                  

	           

	                                                                                                                                                              
	                                                                                                     
	 
		                                                                                      
		 
			                                                    

			                                                       
		 
	 

	                                                                                                                                                                                                 
	                                                                                                  
	                                                              
	                                                                                                                  
	                                                                 

	                                                                                                                                                                                               
	                                      
	                                                                            
	                            
	                                                                                                 

	                                                                                                                     
	 
		                                
	 
	                                                                                                                                                                           
	 
		                                                              
		                                                            
			                                                       

		                                                                                                                                                                                               
		                                                                                                                                                                                                             
		 
			                                                       
		 
		                                                                 
		 
			                                                                              
		 

		                                               
	 
	                                      
	 
		                        
		                                                              
		                                                             
			                                                       

		                                                                                                                                                                                                 
		                                                                                                                                                                                                               
		 
			                                                       
		 
		                                                                  
		 
			                                                                               
		 
	 

	                                                                                      
	                                         
	                                                              
	                                                                                                         

	                                                                                                     
	                                              
	                                 

	                                  
	 
		                                                                        
		                                                                                                
	 

	                                                                                                        
	 
		                                                         
	 
	                                                                                                             
	 
		                                                                    
	 

	                                                                                                                                   

	                        
	                                                                                                           

	                                                                             
	                                      
	 
		                                                        
	 
	    
	 
		                 
		                                                                                                            
		                                                                          

		               
		                                                                                                
		                                                                                

		                   
		                                                                                                            
		                                                                             
	 

	                                                                        
	                                 
	 
		                                                                                                            
		                                                                           
		                                                                      
	 

	                                                                     
	                                

	                                                                                                                                       
	                                                                                                                    

	                     
	 
		                       
		 
			                                                                                 
		 
		    
		 
			                                                                             
		 
	 

	                                                                              
	                                           
 
#endif          

#if SERVER || CLIENT
                                                                                                                                                     
int function Control_GetRoundedPercentAsInt( float percentFrac, int percentageMultiplier )
{
	int expToAward = int( Round( percentageMultiplier * percentFrac, 1 ) )
	expToAward = percentFrac > 0 && expToAward < 1 ? 1 : expToAward
	return expToAward
}
#endif                    

#if CLIENT
                                                                                                                                                      
void function ServerCallback_Control_SetIsPlayerUsingLosingExpTiers( bool shouldUseLosingTeamTiers )
{
	entity player = GetLocalClientPlayer()
	if ( !IsValid( player ) )
		return

	if ( shouldUseLosingTeamTiers && !file.playersUsingLosingTeamExpTiersArray.contains( player ) )
	{
		file.playersUsingLosingTeamExpTiersArray.append( player )
	}
	else if ( !shouldUseLosingTeamTiers && file.playersUsingLosingTeamExpTiersArray.contains( player ) )
	{
		file.playersUsingLosingTeamExpTiersArray.fastremovebyvalue( player )
	}
}
#endif          

#if CLIENT
void function UICallback_Control_Loadouts_OnClosed()
{
	entity player = GetLocalClientPlayer()

	if ( !player.GetPlayerNetBool( "Control_IsPlayerOnSpawnSelectScreen" ) )
		return

	CreateRespawnBlur()
	thread Control_TriggerShowSpawnMenuOnUI_Thread( player, true )

	                                                                                             
	if( IsValid( player ) && !file.tutorialShown && GetStat_Int( player, ResolveStatEntry( CAREER_STATS.modes_games_played, GAMEMODE_CONTROL ), eStatGetWhen.CURRENT ) == 0 )
		RunUIScript( "UI_OpenGameModeRulesDialog" )

	file.tutorialShown = true

	if ( ClGameState_GetRui() != null )
		RuiSetBool( ClGameState_GetRui(), "isInSpawnMenu", true )
}
#endif          


  
		                            
		                             
		                          
		                          
		                          
		                          

		     
  

#if SERVER
                                                          
                                                     
 
	                          
		      

	                                                                  
	                                            
	 
		                                                                            
		                                                                              
		 
			                                                                  
			                                                       
		 
	 

	                                             
		                                   
 
#endif          

#if SERVER
                                                                                                                
                                               
                                                
                                                  
                                                  
                                         
 
	                                               

	                                             
	 
		                           
		                                     
	 
 
#endif          

#if SERVER
                                                                   
                                         
 
	                                            

	                        
	 
		                      
		 
			                                                  
			                                                                         
			
			                                                                      
			                                           
			 
				                                                                                                                                                                                                               
				 
					                                              
				 
				                                                                                        
				 
					                                                                                                                 
					 
						                                            
					 
					                                                                                                                           
					 
						                                              
					 
				 
				                                                                                                                                                                                                            
				 
					                                              
				 
			 

			                                                                         
			                                               
			 
				                                           
				              
			 
		 
	 
 
#endif          

  
	                                                       
	                                                        
	                                                   
	                                                   
	                                                       
	                                                        

	                      
  


#if CLIENT || SERVER
                                                     
int function Control_GetPlayerExpTotal( entity player, bool shouldRemoveInitialTierBoostEXP = false, int boostTier = -1 )
{
	int expTotal = 0
	if ( IsValid( player ) )
		expTotal = player.GetPlayerNetInt( "control_current_exp_total" )

	                                                                                                                            
	                                                                                                  
	if ( shouldRemoveInitialTierBoostEXP )
	{
		if ( boostTier == -1 )
			boostTier = Control_GetDefaultWeaponTier()

		int boostEXP = Control_GetExpThresholdForTier( boostTier, player )
		expTotal = maxint( ( expTotal - boostEXP ), 0 )
	}

	return expTotal
}
#endif                    

#if CLIENT || SERVER
                                   
int function Control_GetPlayerExpTier( entity player, bool useClampedValue = true )
{
	int expTier = Control_GetDefaultWeaponTier()

	if ( IsValid( player ) && player.GetPlayerNetInt( "control_current_exp_tier" ) >= expTier )
		expTier = player.GetPlayerNetInt( "control_current_exp_tier" )

	                                                                                                                         
	if ( useClampedValue )
		expTier = minint( expTier, CONTROL_MAX_EXP_TIER )

	return expTier
}
#endif                    

#if CLIENT || SERVER
                                                                    
int function Control_GetExpTierFromExpTotal( int expTotal, entity player, bool useClampedValue = true )
{
	int expTier = 1

	if ( !IsValid( player ) )
		return expTier

	int nextExpTier = 2
	int expThreshold = Control_GetExpThresholdForTier( nextExpTier, player )

	while ( expTotal >= expThreshold && expThreshold > 0 )
	{
		expTier++
		nextExpTier++
		expThreshold = Control_GetExpThresholdForTier( nextExpTier, player )
	}

	if ( useClampedValue )
		expTier = minint( expTier, CONTROL_MAX_EXP_TIER )

	return expTier
}
#endif                    

#if CLIENT || SERVER
                                                                        
int function Control_GetExpToNextExpTier( entity player )
{
	int currentExp = Control_GetPlayerExpTotal( player )
	int nextExpTier = Control_GetExpTierFromExpTotal( currentExp, player, false ) + 1
	int nextExpThreshold = Control_GetExpThresholdForTier( nextExpTier, player )
	int expNeeded = 0

	if ( nextExpThreshold > 0 )
		expNeeded = nextExpThreshold - currentExp

	return expNeeded
}
#endif                    

#if CLIENT || SERVER
                                                     
int function Control_GetExpThresholdForTier( int tier, entity player )
{
	int expThreshold = 999
	if ( !IsValid( player ) )
		return expThreshold

	string playlistVarModifier = ""
	bool shouldAdjustToLosingTeam = file.playersUsingLosingTeamExpTiersArray.contains( player ) ? true : false

	if ( shouldAdjustToLosingTeam )
		playlistVarModifier = "losingteam_"

	if ( tier <= CONTROL_MAX_EXP_TIER )
	{
		expThreshold = GetCurrentPlaylistVarInt( "exp_requirement_" + playlistVarModifier + "tier" + tier, 0 )
	}
	else
	{
		                                            
		int tiersPastMax = tier - CONTROL_MAX_EXP_TIER

		                                                        
		int expDifferenceToMaxTier = ( GetCurrentPlaylistVarInt( "exp_requirement_" + playlistVarModifier + "tier" + ( CONTROL_MAX_EXP_TIER + 1 ), 0 ) ) - ( GetCurrentPlaylistVarInt( "exp_requirement_" + playlistVarModifier + "tier" + CONTROL_MAX_EXP_TIER, 0 ) )

		expThreshold = GetCurrentPlaylistVarInt( "exp_requirement_" + playlistVarModifier + "tier" + CONTROL_MAX_EXP_TIER, 0 ) + ( tiersPastMax * expDifferenceToMaxTier )
	}
	return expThreshold
}
#endif                    

#if CLIENT || SERVER
                                                                        
int function Control_GetExpDifferenceBetweenLastTierAndTier( int tier, entity player )
{
	int expDifference = -1

	if ( !IsValid( player ) )
		return expDifference

	                                                                                                                                
	if ( tier > CONTROL_MAX_EXP_TIER )
	{
		expDifference = Control_GetExpThresholdForTier( CONTROL_MAX_EXP_TIER + 1, player ) - Control_GetExpThresholdForTier( CONTROL_MAX_EXP_TIER, player )
	}
	else if ( tier >= 2 )                                                                          
	{
		expDifference = Control_GetExpThresholdForTier( tier, player ) - Control_GetExpThresholdForTier( tier - 1, player )
	}

	Assert( expDifference >= 0, "Control_GetExpDifferenceBetweenLastTierAndTier getting a negative difference value which should never happen" )
	return expDifference
}
#endif                    

#if CLIENT || SERVER
                                                                           
float function Control_GetEXPPercentToNextTier( entity player )
{
	float expPercentToNextTier = 0.0

	if ( IsValid( player ) )
	{
		int expTier = Control_GetPlayerExpTier( player, false )
		float currentExp = float( Control_GetPlayerExpTotal( player, true, expTier ) )
		float nextExpThreshold = float( Control_GetExpDifferenceBetweenLastTierAndTier( expTier + 1, player ) )
		if ( nextExpThreshold > 0.0 )
			expPercentToNextTier = ( currentExp / nextExpThreshold )
	}

	return expPercentToNextTier
}
#endif                    

#if CLIENT || SERVER
                                          
bool function Control_IsPlayerUltReady( entity player )
{
	if ( !IsValid( player )  )
		return 	false

	entity ultimateWeapon = player.GetOffhandWeapon( OFFHAND_ULTIMATE )
	if ( !IsValid( ultimateWeapon ) )
		return 	false

	int currentUltCharge = ultimateWeapon.GetWeaponPrimaryClipCount()
	int maxUltCharge = ultimateWeapon.GetWeaponPrimaryClipCountMax()

	if ( currentUltCharge >= maxUltCharge )
		return true

	                                                                                         
	if ( ultimateWeapon.HasMod( MOBILE_HMG_ACTIVE_MOD ) || ultimateWeapon.HasMod( ULTIMATE_ACTIVE_MOD_STRING ) )
		return true

	                                                           
	if ( StatusEffect_HasSeverity( player, eStatusEffect.hunt_mode ) )
		return true

                  
                                                            
                                                                               
              
       

	return false
}
#endif                    

#if SERVER
                                                                    
                                                                                                                  
 
	                                                             
		      

	                                                            
	                                                                                 
	                                                             
	                                                 

	                     
	 
		                                                                                 
		                                                             

		                                          
		                                                            
		                                                             
		                                                                 
		                                                                       
		                                                                            
		                                                                                                                                                                          

		                                                                                                        
		                                                                                                                    
		                                                                                                                
		 
			                           
		 
		                                                                                                                                                                                                               
		 
			                                                               
				                                                     
			                                                                                                          
		 
	 

	                                               
	                                                                                          
 
#endif          

#if SERVER
                                                                                                                                    
                                                
 
	                                               
		      

	                                                                                                                                                  
	                                                                      

	                                                                  
	                                                                                                          

	                              
	                                                            
	                                                

	               
	                                                             
	                                                                 
	                                                                       
	                                                                            

	                                                                                     
	                                                                                         
	                                                                           

	                              
	                                        
		                                                                                            
 
#endif          

#if SERVER
                                                    
                                                                                                                                                                                                               
                                                                                                                 
                                                                                    
 
	                                               

	                         
		      

	                                                                     
	                             
	                               

	                                                                   
	 
		                               
		                                                         
	 


	            
		                       
		 
			                                                                                       
			 
				                              
				                                                                    
			 
		 
	 

	                                       
 
#endif          

#if SERVER
                                                            
                                                                                                                                                                 
                                                                                     
 
	                         
		      

	                                                           
	                       
		      

	                                                                    
	                                                                   
		      

	                                                                  
	                                                                
	                           
 
#endif          

#if SERVER
                                                                                               
                                                     
 
	                         
		      

	                                                                    
	                                                                   
		      

	                                                                  
	                                                                
	                           
 
#endif          

#if SERVER
                                                                                                                                 
                                                                                                                           
 
	                         
		      

	                                                                   
	                                 
		      

	                                         
		      

	                                                                            
	                                   
	                                                                                                                       
		                               

	                                                                                                              
	                                                                                                                                                                          
	                                                                                                                                                                                                 
	                         
	                                                                
	                        
	                                               
	                           
	
	                                                                                   
	 
		                                                                                                  
		                                                                         
		                                                                
		                                                                                   
		                                                                                                                                                                               
		                                                                 
		                                                               
			                                                                 
	 
	                                                                                                                               
	 
		                                                              
		                                     
		                        
		                                       

		                                                                                                                                          

		                                                          
		                                                                                                                                                          
		                                                                                                                             
		                                                                                                          
		                                                                                                                                                                            
		                                                                                                                                                                             
		                                                                                                                                                         
		                                                                                                                                                                               
		                                                                        
		 
			                                                                                                  
			                                                                                          
			                           
			 
				                                                                       
				                                                                
				                                                                                    
				                                          
				                  
				                       
			 
			    
			 
				     
			 
		 
	 

	                                                                                      
	                                                             
	                                                                     
 
#endif          

#if SERVER
                                                
                                                              
 
	                         
		      

	                                        
	                                                                   
	                                
	 
		                                                          
		                                                                
		                                
			                                                        
	 

	                                                                                                                  
	                                                                                                      
	 
		                                                                   
		                                
		 
			                                                          
			                                                                
			                                
				                                                        

			                                                          
		 
	 
 
#endif          

#if SERVER
                                              
                                                                               
 
	                            

	                                                                                                                                  
		                      

	                                                
		                      

	                                                                 

	                                      
		                                                                 

	                                                             
	                                                                                                         
	                                                                                             
	                                                                              
	                                                                                                                                     
	                                                                                                                                                                                                   

	                                                                     
	                     
	 
		                                                                                                                                                 
		                              

		                                
			                                                                                     

		                                                                    
		                                              
		                                           

		                                                                                                                                  
		 
			                                                                                                                                          
			                                     
			                      
			                                     
			 
				                                          
					        

				                                                               
				                                            
				 
					                         
					     
				 
			 

			                                                                                                                             
			                      

			                                      
			 
				                                                                                        
			 
			    
			 
				                                                                                            
				                                      
				                    
			 

			                           
			                                         
			 
				                                              
					        

				                                                                   
				                                               
				 
					                            
						                    
					    
						                             
					                    
					     
				 
			 

			                                             
			 
				                                  
			 

			                                     
			 
				                                      
				 
					                          
				 
			 

			                                                                                             
			                           
			                
			 
				                                               
			 

			                                                        
			                                                           
			                
			                                                                                              
			                                         

			                                                                    
			                                            

			                                                                                                         
			                                                                     
			                         

			                                                                                                                                            
			                                                                  
			                                                                                                                                                                        
			                                                                                                                  
			                                                         
				                                                                                                                                                        

			                                                                       

			                                                                    
			 
				                                             
				                             
				 
					                                                                                
					 
						                                                            
							                                                                              
					 
					    
					 
						                                                                               
					 
				 

				                                                                                  
				                
				 
					                                                            
					                                                             
					                                                      

					                                                                       
					                                                                        
						                                                  
				 

				                                                                                                                                                                                
				                                             
				 
					                                                                 
					 
						                                                                                                   
					 
					    
					 
						                                                                                                                        
					 
				 
			 
			                      
		 
	 
	                      
 
#endif          

#if SERVER
                                  
                                                                     
 
	                              
	                                                              
	                                        
	                                                            
	                                                                                                                              

	                                                               
		                        

	                        
 
#endif          

#if SERVER
                                  
                                                                                                 
 
	                                
		      

	                                                     
		      

	                                                                                                      
	                                                                                                                                     

	                                                                                                                    
	                                            
	                                                                  
	                                             
	 
		                         
			        

		                              
			        

		                                     
		                                                                     
			                                                                                                         
	 

 
#endif          

#if CLIENT
const float CONTROL_DEFAULT_WEAPON_EVO_VFX_DELAY = 0.5
                                                                  
void function ServerCallback_Control_PlayAllWeaponEvoUpgradeFX( entity player, int expTier, bool didWeaponEvo )
{
	if ( !IsValid( player ) )
		return

	if ( expTier <= 0 || expTier > CONTROL_MAX_EXP_TIER )
		return

	thread Control_PlayAllWeaponEvoUpgradeFX_Thread( player, expTier, didWeaponEvo )
}
#endif          

#if CLIENT
                                                                                
void function Control_PlayAllWeaponEvoUpgradeFX_Thread( entity player, int expTier, bool didWeaponEvo )
{
	Assert( IsNewThread(), "Must be threaded off" )

	int activeWeaponSlot = SURVIVAL_GetActiveWeaponSlot( player )
	entity activePrimaryWeapon = player.GetNormalWeapon( activeWeaponSlot )
	float timeToWait = CONTROL_DEFAULT_WEAPON_EVO_VFX_DELAY

	                                                                                                                                                                                                           
	if ( IsValid( activePrimaryWeapon ) )
		timeToWait += activePrimaryWeapon.GetWeaponSettingFloat( eWeaponVar.deploy_time )

	wait timeToWait

	if ( !IsValid( player ) )
		return

	                                                               
	switch ( expTier )
	{
		case 1:
			EmitUISound( CONTROL_SFX_WEAPON_EVO_LVL_1 )
			break

		case 2:
			EmitUISound( CONTROL_SFX_WEAPON_EVO_LVL_2 )
			break

		case 3:
			EmitUISound( CONTROL_SFX_WEAPON_EVO_LVL_3 )
			break

		case 4:
			EmitUISound( CONTROL_SFX_WEAPON_EVO_LVL_4 )
			break
		default:
			EmitUISound( CONTROL_SFX_WEAPON_EVO_LVL_1 )
			break
	}

	                                                                        
	activeWeaponSlot = SURVIVAL_GetActiveWeaponSlot( player )
	activePrimaryWeapon = player.GetNormalWeapon( activeWeaponSlot )

	if ( !IsValid( activePrimaryWeapon ) )
		return

	                                   
	vector tierColor = GetFXRarityColorForTier( expTier )
	int fxHandle = activePrimaryWeapon.PlayWeaponEffectReturnViewEffectHandle( FX_WEAPON_EVO_UPGRADE_FP, FX_EXP_LEVELUP_3P, "hcog", true )                 
	EffectSetControlPointVector( fxHandle, 1, tierColor )

}
#endif          

#if CLIENT
                                                                  
void function ServerCallback_Control_Play3PEXPLevelUpFX( entity player, int expTier )
{
	if ( !IsValid( player ) )
		return

	if ( player == GetLocalClientPlayer() )
		return

	if ( !player.DoesShareRealms( GetLocalClientPlayer() ) )
		return

	if ( expTier <= 0 || expTier > CONTROL_MAX_EXP_TIER )
		return

	thread Control_Play3PEXPLevelUpFX_Thread( player, expTier )
}
#endif          

#if CLIENT
                                                                
void function Control_Play3PEXPLevelUpFX_Thread( entity player, int expTier )
{
	Assert( IsNewThread(), "Must be threaded off" )

	int activeWeaponSlot = SURVIVAL_GetActiveWeaponSlot( player )
	entity activePrimaryWeapon = player.GetNormalWeapon( activeWeaponSlot )
	float timeToWait = CONTROL_DEFAULT_WEAPON_EVO_VFX_DELAY

	                                                                                                                                                                                                           
	if ( IsValid( activePrimaryWeapon ) )
		timeToWait += activePrimaryWeapon.GetWeaponSettingFloat( eWeaponVar.deploy_time )

	wait timeToWait

	if ( !IsValid( player ) )
		return

	                                                                        
	activeWeaponSlot = SURVIVAL_GetActiveWeaponSlot( player )
	activePrimaryWeapon = player.GetNormalWeapon( activeWeaponSlot )

	if ( !IsValid( activePrimaryWeapon ) )
		return

	                            
	vector tierColor = GetFXRarityColorForTier( expTier )
	int fxHandle = activePrimaryWeapon.PlayWeaponEffectReturnViewEffectHandle( $"", FX_EXP_LEVELUP_3P, "hcog", true )
	EffectSetControlPointVector( fxHandle, 1, tierColor )

}
#endif          


  
                                                                                 
                                                                                  
                                                                                
                                                                                 
                                                                                  
                                                                                 

               
  

#if SERVER || CLIENT
const float CONTROL_TOTALSCOREPERCENTAGE_THRESHOLD_FOR_TIMEDEVENTS = 0.75
                                                                
bool function Control_TimedEventStartValidation( float eventLength, bool testForLockout = true )
{
	int scoreLimit = GetScoreLimit_FromPlaylist()
	float timedEventLimit = scoreLimit * CONTROL_TOTALSCOREPERCENTAGE_THRESHOLD_FOR_TIMEDEVENTS
	bool isScoreUnderThreshold = GamemodeUtility_GetWinningTeamOrAllianceScore() < timedEventLimit

	return ( !file.isLockout || !testForLockout ) && isScoreUnderThreshold
}
#endif                    

#if SERVER
                                                                                                  
                                                                 
 
	                                                                           
	                                                                                                   
	                                                                                            

	                                                                                     
	                                                                                           
	 
		                                          
		 
			                                                                                                  
		 
		                                       
	 

	                                                                                                   
	                                                                                       
 
#endif          

#if SERVER || CLIENT
const int CONTROL_TIMEDEVENT_THRESHOLD_PTS_BUFFER = 80
const int CONTROL_OBJECTIVE_COUNT = 3
                                                                                                                                                             
bool function Control_isValidMatchStateForLockout( float eventLength, bool shouldTestForActiveLockout )
{
	int scoreLimit = GetScoreLimit_FromPlaylist()
	int scorePerSec = CONTROL_OBJECTIVE_COUNT * CONTROL_TEAMSCORE_PER_POINT
	int lockoutLimit = scoreLimit - ( CONTROL_TIMEDEVENT_THRESHOLD_PTS_BUFFER + int( scorePerSec * eventLength ) )
	bool isScoreUnderThreshold = GamemodeUtility_GetWinningTeamOrAllianceScore() < lockoutLimit

	return isScoreUnderThreshold && Control_TimedEventStartValidation( eventLength, shouldTestForActiveLockout )
}
#endif                    

#if CLIENT
                                                                   
void function ServerCallback_Control_DisplayLockoutUnavailableWarning()
{
	var scoreTrackerRui = file.scoreTrackerRui[1]
	var mapScoreTrackerRui = file.fullmapScoreTrackerRui[1]
	float currentTime = Time()

	if ( IsValid( scoreTrackerRui ) )
	{
		RuiSetGameTime( scoreTrackerRui, "lastLockoutBlockedMessageDisplayTime", currentTime )
	}

	if ( IsValid( mapScoreTrackerRui ) )
	{
		RuiSetGameTime( mapScoreTrackerRui, "lastLockoutBlockedMessageDisplayTime", currentTime )
	}
}
#endif          

#if SERVER
                                        
                                                                
 
	                                             
	                                                                               
	                                                                                                                                                       
	                                                                                          

	                                                                                        
	                                   
	                                                         
	 
		                              
		 
			                             
			     
		 
	 

	                                                                                                          
 
#endif          

#if SERVER
                                                                 
 
	                                                                                       
	                                                                  
	                                                                              
 
#endif          

#if SERVER
                                                                       
 
	                                                                                                 
 
#endif          

  
	                                                                                       
	                                                                                        
	                                                                                     
	                                                                                      
	                                                                                       
	                                                                                        

	                               
  

#if SERVER
                                                                         
 
	                                               

	                                                                     

	                                         
	                                                               

	                                                                                     
	                                                                                 
	                                                                                               
	                                                                                                                

	       
		                                                                                                                                              
	             

	                                                     

	                                     
	                                                                                                  

	                                      
	                                    
	                                               
	 
		                                                               
		                                     
			        

		                                                                                                                    
		 
			                           
		 
		                                                                                                                                                                                
		 
			                           
		 
	 

	                                        
	                                              
	 
		                                                                       
		            
			                                    
			 
				              
				                                              
					                                                                       

				                                            
			 
		 

		       
			                                                                                                          
		             

		                                                                                
		                                                                                  
		                                           
		                                            

		                                                 

		                                                                                      
		                      
		                                               
	 
	    
	 
		       
			                                                                              
		             

		                             
	 

	                                 
	                                                         

	                                     
	                                                 
		                                                                                                                               

	                                      

	                                            
	                                                             
	 
		                                           

		                             
	 
	    
	 
		                                                                         
		                                           
		                                                                
			           

		                                           

		                             
	 
 
#endif          

#if SERVER
                                                         
                                               
 
	                                           
	                                            
	                                        

	                                               
	                                                                                                              
 
#endif          

  
		                                             
		                                               
		                                            
		                                            
		                                            
		                                            

          
  

#if SERVER
                                                    
                                                                          
 
	                                               

	                                         
	                                                               

	                  
	                                 

	            
		                  
		 
			       
				                                                                   
			             

			                      

			                                 
			 
				                              
				                                                 
				                   
				      
			 
			    
			 
				                                                       
				                                                                 
			 

			                                            
			                    
			 
				                        
					                                                   
				                             
					                                                   
				                             
					                                                   
				                             
					                                                  
			 
			    
			 
				                              
				                                                 
			 
		 
	 

	                     
	                                                  

	                                                                                     
	                                                                                 

	                                                                             
	                                       
	 
		                                                        
		                                                                          
	 

	       
		                                                                                                                                                
	             

	                              
	                                                                                                                                             
	                                                                       
	                                         

	                                                                                      
	 
		                                                                                                                        
		                                                                                  
		                                                                                     
	 

	                                                       
	 
		                       
		 
			                                
			                        
			     
		 

		           
	 

	                        
	 
		       
			                                                
		             

		                                                     
	 
	    
	 
		                                          
	 

	                             
 
#endif          

#if SERVER
                                                   
 
	                                  
	                                                                   
	 
		                                                                

		                                               
			            

		             
		 
			                                        
		 
		    
		 
			                                                
				            
		 
	 

	           
 
#endif          

#if SERVER
                                                              
 
	                                                                       
	                                                        
	 
		                                              
			           
	 

	            
 
#endif          


  
			                                                  
		                                                       
		                                                     
	                                                          
	                                                           
	                                                          

	        
  

#if SERVER
                                       
                                                                                  
 
	                                               

	                                                                                       
	                                
	 
		       
			                                                                                       
		             

		                             
	 
	                                                                                         
	                        

	       
		                                                                                                                                                                                  
	             

	            
		                        
		 
			                             
		 
	 

	                                                                                                                       

	                                                          
	                         
	                                                         
	 
		                                                     

		                                             
		 
			                                                  
			                                                                

			                                  
				                                                     
		 
		                                                           
		 
			                                               
			                                                                              

			                                  
				                                                    
		 

		                    
		                                                                                           
		                     
		                                                                                            
	 

	                                                 
	 
		                                                                                                                       
		                                                             

		                                                                                  
		                                                                        
	 

	                                        
	                            
		                                  

	                                            
	 
		                                                                                                                  
	 

	                                              

	                                           
 
#endif          

#if SERVER
                                                                                                     
                                                              
                                                                                                     
 
	                                               
	                                                                                                    

	                                       
	                                                           
	                                                
	 
		                                                   
		                                              
		 
			                                            
		 
		    
		 
			             
			                                                                                                
			                                                       
			 
				                                                           
				                               
				 
					                                                   
					     
				 
				       
			 

			                                                                 
			                                                      
				                                            
		 
	 

	                                                                                    
	                                             
	 
		                                                                                                                                                                                                 
		                                                         
		                                                
		                                                     

		                                             
		 
			                                                                               
			                                                                                     

			                                             
				                                            
		 

		                                             
		 
			                                                                                     
			                                                                                    

			                                                  
				                                                 
		 

		                          
		                                                                                                 
		                                           
		 
			                                                              
			                                                                                                                          
			                                                       

			                             
			 
				                                              
				 
					                                                   
				 
			 
		 

		                                                                                                                   
		                                                
		 
			                                                 
			                                                                
			 
				                                                                                       
				                                                                 

				                                                    
				 
					                                                                            
				 
			 
		 
		                                                                                                                                                                                                      
		 
			                                                 
			                                                  
			                                                               
			 
				                                                                                       
				                                                                                     
				                                                                                     

				                                                    
				 
					                
					 
						                                                                            
					 
					    
					 
						                                                                           
					 
				 
			 
		 

		                                                                                                        
		                                                                                          
			                                    
	 

	                                                                                                           
	                                             
		                                      

	                                   
 
#endif          

#if SERVER
                                                                                                                                      
                                                                                                       
                                                                                                             
 
	                                       
	                                     

	                                                               

	                                        
	                                                      
	                                                         
	 
		             

		                                                                                                                          
		                               
		 
			                             
			 
				                                                           
				                                                    
			 

			                                                 
			                                         
				                              
		 

		                                                                                             
		 
			                                            
				                                  
		 
		                                                                                                                           
		 
			                                               
				                                  
		 
		                                                                                                                           
		 
			                                               
				                                  
		 

		                                           
	 

	                                
 
#endif          

#if SERVER
                        
                                                                    
 
	                             
	                            

	                                                                             
	                                      

	                                                                                                                                           
	                                                
	 
		                             
		                                     
		                                                                               
	 

	                                      
	                      
 
#endif          

#if SERVER
                     
                                                                                                                                                                   
                                                                                                                                                
 
	                                               

	                                                                     

	                                             
	                                                                                                                    
	                                    

	                  
	                                                                                                                                                                                                                                    
	                                                                               
		                                                     

	                                                                                         
	                                       
	                                              

	                                                        
	                 
	                      
	                   

	            
		                                                    
		 
			                     
			 
				                    
					                
			 

			                                 
				                         

			                              
				                      
		 
	 

	                                                                                                
	                                   
	                                                    
	                                            

	                                                                                                                               
	                                                                                             
	                   
	 
		                                     
		                                                  
		                                                                                                                               
		                                                                               
		                                                                                                    
		                      
		                                                                 
		                                                                                                                       

		                                                                            
		                                                                  
		                                                                                                      
		                    
		                                                                                              
		                                                               

		                                                                         
		                                                                         

		                       
		                                     
		 
			                              
			                             
			                           
			                               

			                                            
			 
				                                                                                                                                                                                                             
			 
		 

		                                                                                                                
		                                                       

		                                                                                                                                
		                                                         

		                    
		                                 

		                                                                                        
		                     
		 
			                    
				                
		 
		           

		                                 
			                         

		                              
			                      
	 

	                     
	                                                                                                       
	                                                                                               

	                                                                                                                                      
	                   
		                                                         
 
#endif          

#if SERVER
                                                                                                                              
                                                                            
 
	                                                                                         
	 
		                                                                                        
	 
	                                                 
	 
		                                                              
	 
 
#endif          

#if SERVER
                                                                                                                          
                                                                          
 
	                                                                                                                                  
	                                                                                                   
	                                                                                                                      
	                                                                                                       
	 
		                                   
			                                                           

		      
	 

	                
	                                                                                                                        

	                                             
		                                                 

	                                                             
	                                                            
	                          

	                                            
	                           
 
#endif          

#if SERVER
                                                   
                                                                      
 
	                                                                                                                        

	                                             
	 
		                                                  
		                    
		 
			                                                                    
			 
				                        

				                                            
				 
					                                                            
					                              
					                                                              
					                                                                             
				 
			 

			            
			                                             
			                                             
		 
	 
	                           
 
#endif          

#if SERVER
                                                                                   
 
	                  
	                   
	                    

	                              
	 
		                                                                                                                                
		                                                                                             
		                                                                                                                                
		                                                                                           
		                                                                               
		                                                       
		                                                         
		                                                           
	 
	    
	 
		                                          
		                                            
		                                              
	 

	                              
 
#endif          

#if CLIENT
                                                                                      
const float CONTROL_MRB_AIRDROP_ICON_ZOFFSET = 200.0
void function InstanceWPControlAirdrop( entity wp )
{
	if ( Control_ShouldShow2DMapIcons() )
	{
		int lootTier = wp.GetWaypointInt( AIRDROP_WAYPOINT_LOOTTIER_INT )
		thread Control_CreateAirdropIcon_Thread( wp, lootTier )
	}

	                                                   
	if ( Control_GetIsMRBTimedEventEnabled() && wp.GetWaypointBitfield() == CONTROL_MRB_ISMRBAIRDROP_BITFIELD )
	{
		thread Control_MRBTimedEvent_ManageMRBIcons_Thread( wp, false, CONTROL_MRB_AIRDROP_ICON_ZOFFSET )
	}
}
#endif          

#if CLIENT
                               
void function Control_CreateAirdropIcon_Thread( entity wp, int lootTier )
{
	Assert( IsNewThread(), "Must be threaded off" )

	FlagWait( "EntitiesDidLoad" )
	entity player = GetLocalViewPlayer()
	if ( !IsValid( player ) || !IsValid( wp ) )
		return

	player.EndSignal( "OnDestroy" )
	wp.EndSignal( "OnDestroy" )

	int airdropIconColorID
	switch( lootTier )
	{
		case -1:
			airdropIconColorID = COLORID_HUD_LOOT_TIER5
			break
		case 1:
			airdropIconColorID = COLORID_HUD_LOOT_TIER2
			break
		case 2:
			airdropIconColorID = COLORID_HUD_LOOT_TIER3
			break
		case 3:
			airdropIconColorID = COLORID_HUD_LOOT_TIER4
			break
		default:
			airdropIconColorID = COLORID_HUD_LOOT_TIER0
			break
	}

	vector iconColor = GetKeyColor( airdropIconColorID ) * ( 1.0 / 255.0 )
	var minimapRui = Minimap_AddIconAtPosition( wp.GetOrigin(), <0,90,0>, AIRDROP_LANDED_ICON, 1.0, iconColor )
	var fullmapRui = FullMap_AddIconAtPos( wp.GetOrigin(), <0,0,0>, AIRDROP_LANDED_ICON, 7.0, iconColor )

	OnThreadEnd(
		function() : ( minimapRui, fullmapRui )
		{
			Minimap_CommonCleanup( minimapRui )
			Fullmap_RemoveRui( fullmapRui )
			RuiDestroy( fullmapRui )
		}
	)

	WaitForever()
}
#endif          

  
	                                                                                                 
	                                                                                                  
	                                                                                               
	                                                                                               
	                                                                                               
	                                                                                               

	               
  

#if SERVER
                                                                                                                                                                     
                                                              
                                                   
 
	                                                
 
#endif          

#if CLIENT
                                              
                                                                                                                                                                                
                                                                                                                             
const float MRB_INSTRUCTIONS_UPDATE_INTERVAL = 0.5
const float MRB_PHASE_CHECK_INTERVALS = 1.0
void function Control_MRBTimedEvent_InfoOverride_Thread( entity wp, TimedEventLocalClientData data )
{
	Assert( IsNewThread(), "Must be threaded off" )
	EndSignal( wp, "OnDestroy" )

	                                                      
	if ( !IsValid( wp ) )
		return

	                                       
	                                                                                                                                                     
	Control_ObjectiveScoreTracker_PushAnnouncement( wp,
		true,
		"",
		Localize( data.eventName ),
		wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_END_TIME ) - wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_START_TIME ),
		TIMED_EVENT_DISPLAY_BUFFER,
		false,
		true,
		GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL ) )

	wait TIMED_EVENT_DISPLAY_BUFFER

	                                        
	data.eventName = "#EVENT_MRB_NAME"
	data.eventDesc = Localize( "#CONTROL_MRB_INSTRUCTIONS_INCOMING" )

	                                         
	while ( wp.GetWaypointInt( TIMEDEVENT_WAYPOINT_INT_EVENT_PHASE ) < eControlMRBTimeEventPhase.AIRDROP )
	{
		wait MRB_PHASE_CHECK_INTERVALS
	}

	                                                 
	float endTime = wp.GetWaypointGametime( TIMEDEVENT_WAYPOINT_EVENT_END_TIME )

	if ( wp.GetWaypointInt( TIMEDEVENT_WAYPOINT_INT_EVENT_PHASE ) == eControlMRBTimeEventPhase.AIRDROP && Time() < endTime )
	{
		data.eventDesc = Localize( "#CONTROL_MRB_INSTRUCTIONS_INCOMING" )
		EmitUISound( CONTROL_SFX_MRB_STATUS_UPDATE )
		data.shouldHideTimer = false
		float airdropDelayTimeRemaining = endTime - Time()
		wait airdropDelayTimeRemaining
	}

	                                                                                 
	data.eventDesc =Localize( "#CONTROL_MRB_INSTRUCTIONS_IDLE" )
	EmitUISound( CONTROL_SFX_MRB_STATUS_UPDATE )
	data.shouldHideTimer = true

	                                           
	while( wp.GetWaypointInt( TIMEDEVENT_WAYPOINT_INT_EVENT_PHASE ) < eControlMRBTimeEventPhase.MRB_IN_PLAY )
	{
		wait MRB_PHASE_CHECK_INTERVALS
	}

	int lastMRBState
	entity localClientPlayer = GetLocalClientPlayer()
	bool isLocalClientObserver = GamemodeUtility_IsPlayerOnTeamObserver( localClientPlayer )
	vector friendlyObjectiveCol = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED )
	vector enemyObjectiveCol = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED )
	vector neutralObjectiveCol = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.NEUTRAL )
	                                                           
	while( wp.GetWaypointInt( TIMEDEVENT_WAYPOINT_INT_EVENT_PHASE ) == eControlMRBTimeEventPhase.MRB_IN_PLAY )
	{
		                                                                                    
		if ( lastMRBState != file.mrbState )
		{
			data.shouldHideTimer = true
			switch( file.mrbState )
			{
				case eControlMRBTimeEventMRBState.IDLE:
					data.eventDesc =Localize( "#CONTROL_MRB_INSTRUCTIONS_IDLE" )
					EmitUISound( CONTROL_SFX_MRB_STATUS_UPDATE )
					data.colorOverride = neutralObjectiveCol
					break
				case eControlMRBTimeEventMRBState.PERSONAL_HELD:
					data.eventDesc = Localize( "#CONTROL_MRB_INSTRUCTIONS_YOU_HELD" )
					EmitUISound( CONTROL_SFX_MRB_STATUS_UPDATE )
					data.colorOverride = ( isLocalClientObserver )?neutralObjectiveCol :friendlyObjectiveCol
					break
				case eControlMRBTimeEventMRBState.FRIENDLY_HELD:
					data.eventDesc = ( isLocalClientObserver )? Localize( "#CONTROL_MRB_INSTRUCTIONS_YOU_HELD" ) :Localize( "#CONTROL_MRB_INSTRUCTIONS_TEAM_HELD" )
					EmitUISound( CONTROL_SFX_MRB_STATUS_UPDATE )
					data.colorOverride = ( isLocalClientObserver )? neutralObjectiveCol :friendlyObjectiveCol
					break
				case eControlMRBTimeEventMRBState.ENEMY_HELD:
					data.eventDesc = ( isLocalClientObserver )? Localize( "#CONTROL_MRB_INSTRUCTIONS_YOU_HELD" ) :Localize( "#CONTROL_MRB_INSTRUCTIONS_ENEMY_HELD" )
					EmitUISound( CONTROL_SFX_MRB_STATUS_UPDATE_ENEMY )
					data.colorOverride = ( isLocalClientObserver )? neutralObjectiveCol :enemyObjectiveCol
					break
				default:
					data.eventDesc = Localize( "#EVENT_MRB_DESC" )
					EmitUISound( CONTROL_SFX_MRB_STATUS_UPDATE )
					data.colorOverride = neutralObjectiveCol
					break
			}
			lastMRBState = file.mrbState
		}
		wait MRB_INSTRUCTIONS_UPDATE_INTERVAL
	}

	                              
	data.shouldHideTimer = true
	data.eventDesc = Localize( "#CONTROL_MRB_INSTRUCTIONS_LAUNCHED" )
	EmitUISound( CONTROL_SFX_MRB_STATUS_UPDATE )
	data.colorOverride = neutralObjectiveCol

	                                  
	while( wp.GetWaypointInt( TIMEDEVENT_WAYPOINT_INT_EVENT_PHASE ) < eControlMRBTimeEventPhase.MRB_DEPLOYED )
	{
		wait MRB_PHASE_CHECK_INTERVALS
	}

	int mrbSpawnOwner
	entity localPlayer = GetLocalViewPlayer()
	if ( !IsValid( localPlayer ) )
		return

	int localPlayerAlliance = AllianceProximity_GetAllianceFromTeam( localPlayer.GetTeam() )

	                                                                              
	bool didFindMRBSpawn = false
	foreach( point in file.spawnWaypoints )
	{
		if ( IsValid( point ) && point.GetWaypointInt( INT_WAYPOINT_TYPE ) == CONTROL_WAYPOINT_MRB_INDEX )
		{
			mrbSpawnOwner = point.GetWaypointInt( CONTROL_WAYPOINT_ALLIANCE_OWNER_INDEX )

			if ( mrbSpawnOwner == localPlayerAlliance )
			{
				data.eventDesc = Localize( "#CONTROL_MRB_INSTRUCTIONS_LIFETIME" )
				data.colorOverride = friendlyObjectiveCol
			}
			else
			{
				data.eventDesc = Localize( "#CONTROL_MRB_INSTRUCTIONS_LIFETIME_ENEMY" )
				data.colorOverride = enemyObjectiveCol
			}
			didFindMRBSpawn = true
			break
		}
	}

	data.shouldHideTimer = false
	                                                                        
	if ( !didFindMRBSpawn )
	{
		data.eventDesc = Localize( "#CONTROL_MRB_INSTRUCTIONS_LIFETIME" )
		data.colorOverride = neutralObjectiveCol
	}
	EmitUISound( CONTROL_SFX_MRB_STATUS_UPDATE )
}
#endif          

#if SERVER
                                   
                                                    
                                                    
                                                                                    
                                                                                                                
                                                                                                            
                                                                          
                                                                                 
 
	                                               

	       
		                                                        
	             

	                          
		      

	                                         
	                                                               

	                            
	                                                                                               

	            
		                        
		 
			       
				                                                     
			             

			                             

			                         
				                             
		 
	 

	                                         
	                                                 
		                                                                                                                               

	                                                                                                       

	                                                                                      
	                         
	                                             
	 
		                                                  
		                                                                

		                                  
			                                                    
	 
	                                                           
	 
		                                         
		                                                                              

		                                  
			                                                    
	 

	       
		                                                          
	             

	                    
	                                                                                             
	                     
	                                                                                                  

	                                                                                                                                                                     
	             
	                         
	 
		                                                                                    
		                                                                       
		                                                                          
		                                                                                                
	 

	                                            
	                                                      

	                         
		                                                                                                    

	                                          
	                                                       

	                         
		                                                                                                     

	                                                
	                                                       

	                                                                       
	                                                   
	 
		                                                                                    
		                         
		 
			                                                
			                                                                          
			                                                                                                     
		 

		                                  
	 
 
#endif          

#if SERVER
                                           
                                                                
 
	                                               
	                                         
	                                                                      

	            
		               
		 
			       
				                                                                                                        
			             

			                        
			                        
			                    
		 
	 

	                                                     
	                       
	
	                                                                             
	                                                  

	                                       
	 
		                                                                          
		                                                       

		                                        
		                                                 
			                                                                                                                                                                        
	 

	       
		                                                              
	             

	                                                              
	                                                       

	                                                                         
	                                                   
	 
		                                                                                 
		                                        
		 
			                                       
			                                                 
				                                                                                                                                      
		 

		                                                                            
		                                       
		 
			                                                                                                  
			 
				                                                                                                    
			 
		 

		       
			                                                                                                       
		             

		                                  

		       
			                                                                                    
		             

		                                        
		                                                 
			                                                                                                                                     
	 
 

#endif          

#if SERVER
                                                                                                                             
                                                                      
                                                                              
 
	                                                             

	                          
	                                                           
	                      
 
#endif          

#if SERVER
                                                  
                                                                                                                                                             
                                                           
 
	                                                                                                                      
	                       
		      

	                      
		      

	                              

	              
		      

	                                                       

	                                      
	 
		                       
		                                
		                                                                                            
		                                            
			                                                         

		                                                                                     
		                                                  

		                                                                              
		                                                                                                                                                                                     
		                                                                         
		                                     
		                              
		                                                       
		                                                    
	 
 
#endif          

#if CLIENT
                                                                                                      
void function InstanceWPControlMRB( entity wp )
{
	thread Control_MRBTimedEvent_ManageMRBIcons_Thread( wp, true, MRB_ICON_OFFSET )
}
#endif          

#if CLIENT
                                                                                  
void function Control_MRBTimedEvent_ManageMRBIcons_Thread( entity wp, bool shouldUpdateIconBasedOnMRBState, float defaultIconZOffset )
{
	Assert( IsNewThread(), "Must be threaded off" )

	if ( !IsValid( wp ) )
		return

	wp.EndSignal( "OnDestroy" )

	entity localPlayer = GetLocalViewPlayer()

	if ( !IsValid( localPlayer ) )
		return

	localPlayer.EndSignal( "OnDestroy" )

	bool shouldDisplayMapIcon = Control_ShouldDisplayFriendlyMapIcons( localPlayer )

	                                      
	var inWorldIconRui = CreateCockpitPostFXRui( $"ui/timed_event_objective_icon.rpak", FULLMAP_Z_BASE )
	Control_MRBTimedEvent_SetMRBIconValues( inWorldIconRui, eControlMRBTimeEventMRBState.IDLE, true, false )
	RuiTrackFloat3( inWorldIconRui, "worldPos", wp, RUI_TRACK_ABSORIGIN_FOLLOW )
	RuiSetFloat( inWorldIconRui, "zOffset", defaultIconZOffset )
	RuiSetBool( inWorldIconRui, "isVisible", !shouldDisplayMapIcon )
	RuiSetBool( inWorldIconRui, "shouldShowDistIndicator", true )
	RuiSetBool( inWorldIconRui, "isMapIcon", false )

	                                     
	var mapIconRui = CreateWaypointRui( $"ui/timed_event_objective_icon.rpak", CONTROL_TEAMMATE_ICON_SORTING )
	Control_MRBTimedEvent_SetMRBIconValues( mapIconRui, eControlMRBTimeEventMRBState.IDLE, true, true )
	RuiTrackFloat3( mapIconRui, "worldPos", wp, RUI_TRACK_ABSORIGIN_FOLLOW )
	RuiSetBool( mapIconRui, "isVisible", shouldDisplayMapIcon )
	RuiSetBool( mapIconRui, "shouldShowDistIndicator", false )
	RuiSetBool( mapIconRui, "isMapIcon", true )

	var mapIconEnemyRui = null
	                                                                                   
	if ( shouldUpdateIconBasedOnMRBState )
	{
		                                                                                                                                                                                                            
		vector enemyIconColor = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED, true )
		mapIconEnemyRui = CreateWaypointRui( $"ui/control_teammate_loc_icon.rpak", CONTROL_TEAMMATE_ICON_SORTING )
		RuiSetColorAlpha( mapIconEnemyRui, "teammateIconColor", enemyIconColor, 1.0 )
		RuiTrackFloat3( mapIconEnemyRui, "teammateLocation", wp, RUI_TRACK_ABSORIGIN_FOLLOW )
		RuiTrackFloat3( mapIconEnemyRui, "teammateRotation", wp, RUI_TRACK_CAMANGLES_FOLLOW )
		RuiSetFloat3( mapIconEnemyRui, "cameraLookDirection", file.cameraAngles )
		RuiSetGameTime( mapIconEnemyRui, "spawnStartTime", Time() )
		RuiSetBool( mapIconEnemyRui, "display", shouldDisplayMapIcon )
	}

	OnThreadEnd(
		function() : ( inWorldIconRui, mapIconRui, mapIconEnemyRui )
		{
			if ( IsValid( inWorldIconRui ) )
				RuiDestroy( inWorldIconRui )

			if ( IsValid( mapIconRui ) )
				RuiDestroy( mapIconRui )

			if ( IsValid( mapIconEnemyRui ) )
				RuiDestroy( mapIconEnemyRui )

			file.mrbState = eControlMRBTimeEventMRBState.IDLE
		}
	)

	int localPlayerTeam = localPlayer.GetTeam()
	entity ornull currentMRBOwner

	while ( GetGameState() == eGameState.Playing && IsValid( localPlayer ) )
	{
		currentMRBOwner = Control_MRBTimedEvent_GetCurrentMRBOwner()
		shouldDisplayMapIcon = Control_ShouldDisplayFriendlyMapIcons( localPlayer )

		if ( currentMRBOwner == null || !shouldUpdateIconBasedOnMRBState )                                                      
		{
			if ( IsValid( localPlayer ) && IsValid( wp ) )
			{
				Control_MRBTimedEvent_SetMRBIconVisibility( inWorldIconRui, mapIconRui, mapIconEnemyRui, eControlMRBTimeEventMRBState.IDLE, !shouldDisplayMapIcon, shouldDisplayMapIcon, defaultIconZOffset )
				           
				if ( shouldUpdateIconBasedOnMRBState )
					file.mrbState = eControlMRBTimeEventMRBState.IDLE
			}
		}
		else if ( IsValid( currentMRBOwner ) && IsValid( localPlayer ) )
		{
			expect entity( currentMRBOwner )

			if ( currentMRBOwner == localPlayer )                                                      
			{
				Control_MRBTimedEvent_SetMRBIconVisibility( inWorldIconRui, mapIconRui, mapIconEnemyRui, eControlMRBTimeEventMRBState.PERSONAL_HELD, false, shouldDisplayMapIcon, defaultIconZOffset )
				           
				if ( shouldUpdateIconBasedOnMRBState )
					file.mrbState = eControlMRBTimeEventMRBState.PERSONAL_HELD
			}
			else if ( IsFriendlyTeam( localPlayerTeam, currentMRBOwner.GetTeam() ) )                                                               
			{
				Control_MRBTimedEvent_SetMRBIconVisibility( inWorldIconRui, mapIconRui, mapIconEnemyRui, eControlMRBTimeEventMRBState.FRIENDLY_HELD, !shouldDisplayMapIcon, shouldDisplayMapIcon, MRB_ICON_OFFSET_CARRIED )
				           
				if ( shouldUpdateIconBasedOnMRBState )
					file.mrbState = eControlMRBTimeEventMRBState.FRIENDLY_HELD
			}
			else                                                         
			{
				Control_MRBTimedEvent_SetMRBIconVisibility( inWorldIconRui, mapIconRui, mapIconEnemyRui, eControlMRBTimeEventMRBState.ENEMY_HELD, !shouldDisplayMapIcon, shouldDisplayMapIcon, MRB_ICON_OFFSET_CARRIED )
				           
				if ( shouldUpdateIconBasedOnMRBState )
					file.mrbState = eControlMRBTimeEventMRBState.ENEMY_HELD
			}
		}

		WaitFrame()

		localPlayer = GetLocalViewPlayer()
	}
}
#endif          

#if CLIENT
                                                                       
void function Control_MRBTimedEvent_SetMRBIconVisibility( var inWorldIconRui, var mapIconRui, var mapIconEnemyRui, int mrbState, bool shouldShowInWorldIcon, bool shouldShowMapIcons, float zOffset )
{
	                
	if ( IsValid( inWorldIconRui ) )
	{
		Control_MRBTimedEvent_SetMRBIconValues( inWorldIconRui, mrbState, false, false )
		RuiSetBool( inWorldIconRui, "isVisible", shouldShowInWorldIcon )
		RuiSetFloat( inWorldIconRui, "zOffset", zOffset )
	}

	           
	if ( IsValid( mapIconRui ) )
	{
		Control_MRBTimedEvent_SetMRBIconValues( mapIconRui, mrbState, false, true )
		RuiSetBool( mapIconRui, "isVisible", shouldShowMapIcons )
	}

	                 
	if ( IsValid( mapIconEnemyRui ) )
	{
		if ( mrbState == eControlMRBTimeEventMRBState.ENEMY_HELD )
		{
			RuiSetBool( mapIconEnemyRui, "display", shouldShowMapIcons )
		}
		else
		{
			RuiSetBool( mapIconEnemyRui, "display", false )
		}
	}
}
#endif          

#if CLIENT
                                                                                 
const float MRB_MAP_ICON_SCALE_OVERALL = 0.6
const float MRB_ICON_DEFAULT_OBJECT_ALPHA = 0.75
const float MRB_ICON_DEFAULT_INNER_ALPHA = 0.6
const float MRB_ICON_DEFAULT_OUTLINE_ALPHA = 1.0
const float MRB_MAP_ICON_HELD_INNER_ALPHA = 1.0
const float MRB_ICON_DEFAULT_SHADOW_ALPHA = 0.2
void function Control_MRBTimedEvent_SetMRBIconValues( var rui, int mrbOwnershipState, bool shouldDoFullSetup, bool isMapIcon )
{
	vector defaultIconColor = SrgbToLinear( GetKeyColor( COLORID_DEFAULT ) / 255.0 )
	vector blackColor = SrgbToLinear( GetKeyColor( COLORID_COLORSWATCH_BLACK ) / 255.0 )
	vector greyColor = SrgbToLinear( <131, 134, 137> / 255.0 )
	vector whiteColor = SrgbToLinear( GetKeyColor( COLORID_COLORSWATCH_WHITE ) / 255.0 )
	vector friendlyIconColor = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED, true )
	vector enemyIconColor = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED, true )

	if ( shouldDoFullSetup )
	{
		RuiSetImage( rui, "objectIcon", CONTROL_MRB_INWORLD_ICON )
		RuiSetImage( rui, "objectBGIconOutline", CONTROL_MRB_DIAMOND_ICON_OUTLINE )
		RuiSetImage( rui, "objectBGIconShadow", CONTROL_MRB_DIAMOND_ICON_SHADOW )

		if ( isMapIcon )
			RuiSetFloat( rui, "overallElementScale", MRB_MAP_ICON_SCALE_OVERALL )
	}

	if ( isMapIcon )
	{
		switch( mrbOwnershipState )
		{
			case eControlMRBTimeEventMRBState.PERSONAL_HELD:
			case eControlMRBTimeEventMRBState.FRIENDLY_HELD:
			case eControlMRBTimeEventMRBState.ENEMY_HELD:
					RuiSetColorAlpha( rui, "objectColor", enemyIconColor, 0 )
					RuiSetImage( rui, "objectBGIconInner", CONTROL_MRB_HELD_OUTER_ICON )
					RuiSetColorAlpha( rui, "objectBGIconInnerColor", defaultIconColor, MRB_MAP_ICON_HELD_INNER_ALPHA )
					RuiSetColorAlpha( rui, "objectBGIconOutlineColor", friendlyIconColor, 0 )
					RuiSetColorAlpha( rui, "objectBGIconShadowColor", friendlyIconColor, 0 )
				break
			default:
				break
		}
	}

	switch( mrbOwnershipState )
	{
		case eControlMRBTimeEventMRBState.PERSONAL_HELD:
			break
		case eControlMRBTimeEventMRBState.FRIENDLY_HELD:
			if ( !isMapIcon )
			{
				RuiSetColorAlpha( rui, "objectBGIconInnerColor", friendlyIconColor, MRB_ICON_DEFAULT_INNER_ALPHA )
				RuiSetColorAlpha( rui, "objectBGIconOutlineColor", friendlyIconColor, MRB_ICON_DEFAULT_OUTLINE_ALPHA )
			}
			break
		case eControlMRBTimeEventMRBState.ENEMY_HELD:
			if ( !isMapIcon )
			{
				RuiSetColorAlpha( rui, "objectBGIconInnerColor", enemyIconColor, MRB_ICON_DEFAULT_INNER_ALPHA )
				RuiSetColorAlpha( rui, "objectBGIconOutlineColor", enemyIconColor, MRB_ICON_DEFAULT_OUTLINE_ALPHA )
			}
			break
		default:
			RuiSetColorAlpha( rui, "objectColor", defaultIconColor, MRB_ICON_DEFAULT_OBJECT_ALPHA )
			RuiSetImage( rui, "objectBGIconInner", CONTROL_MRB_DIAMOND_ICON )
			RuiSetColorAlpha( rui, "objectBGIconInnerColor", greyColor, MRB_ICON_DEFAULT_INNER_ALPHA )
			RuiSetColorAlpha( rui, "objectBGIconOutlineColor", whiteColor, MRB_ICON_DEFAULT_OUTLINE_ALPHA )
			RuiSetColorAlpha( rui, "objectBGIconShadowColor", blackColor, MRB_ICON_DEFAULT_SHADOW_ALPHA )
			break
	}
}
#endif          

#if SERVER
                                                
                                                                                                   
                                                                      
 
	                            
	 
		                                                                       
		                                                                                                           
		 
			                                                                                                                                     
			                                                                                     
		 

		                                                                                                 

		                                                                 
			                                                                    

		                                                                     
	 
 
#endif          

#if SERVER
                                                                                                                        
                                                                                   
 
	                                               

	                             
		      

	                                                                                        

	                                 
	                                   
	                                             
	                                                     

	            
		                                         
		 
			                            
				                                             
		 
	 

	                             
 
#endif          

#if CLIENT || SERVER
entity ornull function Control_MRBTimedEvent_GetCurrentMRBOwner()
{
	#if SERVER
		                          
	#endif          

	#if CLIENT
		return GetGlobalNetEnt( PLAYER_WITH_MRB_NET_NAME )
	#endif          
}
#endif                    

#if CLIENT
                                                                                       
void function ServerCallback_Control_MRBTimedEvent_OnMRBPickedUp()
{
	thread Control_ManageMRBUseReminder_Thread()
}
#endif          

#if CLIENT
                                                                                                                 
const float CONTROL_MRB_TIME_TO_USE_HINT = 45.0
const float CONTROL_MRB_FIRST_USE_HINT_DELAY = CONTROL_MESSAGE_DURATION
void function Control_ManageMRBUseReminder_Thread()
{
	Assert( IsNewThread(), "Must be threaded off" )

	entity localPlayer = GetLocalViewPlayer()

	if ( !IsValid( localPlayer ) )
		return

	localPlayer.EndSignal( "OnDestroy" )
	localPlayer.EndSignal( "OnDeath" )

	entity ornull mrbOwner

	wait CONTROL_MRB_FIRST_USE_HINT_DELAY

	localPlayer = GetLocalViewPlayer()

	                                                                                             
	while( IsValid( localPlayer ) )
	{
		                                                                
		mrbOwner = Control_MRBTimedEvent_GetCurrentMRBOwner()

		if ( mrbOwner == null || !IsValid( mrbOwner ) )
			return

		if ( localPlayer != mrbOwner )
			return

		                         
		if ( IsControllerModeActive() )
		{
			int useSurvivalSlotButton = GetConVarInt( "gamepad_toggle_survivalSlot_to_weaponInspect" )

			if ( useSurvivalSlotButton == 0 )                                         
				AnnouncementMessageRight( localPlayer, "#CONTROL_HINT_USE_MRB_CONSOLE" , "Void Ring Warning", <1, 1, 1> )
		}
		else
		{
			AnnouncementMessageRight( localPlayer, "#CONTROL_HINT_USE_MRB_PC" , "Void Ring Warning", <1, 1, 1> )
		}

		                                                          
		wait CONTROL_MRB_TIME_TO_USE_HINT

		localPlayer = GetLocalViewPlayer()
	}
}
#endif          

#if SERVER
                                                       
                                                     
                                                                                  
 
	                                               

	                                                                                      
	                                       
		      

	                                 
	                                   
	                                             
	                                                     

	                                                                             

	             
	 
		                                          
		                                                                                         
		                                                 
	 
 
#endif          

#if SERVER
                                                    
                                                                                 
 
	       
		                                           
	             

	                            
		                                           

	                          
	                                                 
	                                

	                                        
	 
		                                       
		                                                      
	 

	                                                        
 
#endif          

#if SERVER
                                                                                 
                                                                                                                                                           
 
	                         
		      

	                                             
		      

	                                                     

	                       
		      

	                                
	 
		                                        
		                            
		                                        
		 
			                                                       
			                                                                      
		 
		                                 

		                                                   
		                                             
	 
 
#endif          

#if SERVER
                                 
                                                                                                                
                                                                     
 
	                                               

	                      
		      

	                                             
		      

	                                       

	                   

	                     
	 
		       
			                                                              
		             

		                                                                                                                                                                                                                    
		                                      
		                                    
	 
 
#endif          

#if CLIENT || SERVER
const float MIN_DIST_FROM_FRIENDLY_HOMEBASE = 2000.0
const float MIN_DIST_FROM_ENEMY_HOMEBASE = 2400.0
const float MIN_DIST_FROM_OBJECTIVES = 1000.0
const bool SHOULD_DO_OBJECTIVE_TESTS = true                                                                                                                
const float POSITION_VALIDATION_FAILED_HINT_DURATION = 0.2
const float POSITION_VALIDATION_FAILED_HINT_FADEOUT_TIME = 0.25
const string [eControlMRBPlacementState._count] PLACEMENT_STATE_STRINGS = [
"",
"#CONTROL_MRB_PLACEMENT_FAIL_GENERIC",
"#CONTROL_MRB_PLACEMENT_FAIL_OBJECTIVE",
"#CONTROL_MRB_PLACEMENT_FAIL_HOMEBASE",
"#CONTROL_MRB_PLACEMENT_FAIL_HOMEBASE_ENEMY"]
                                                                                                                                                              
CarePackagePlacementInfo function Control_MRBTimedEvent_MRBDeployPositionValidation( entity player )
{
	CarePackagePlacementInfo placementInfo = GetCarePackagePlacementInfo( player )

	                                                                  
	if ( !IsValid( player ) )
	{
		#if DEV
			if ( CONTROL_DETAILED_DEBUG )
				printf( "CONTROL: MRB Event, MRB Deployment failing because player is Invalid" )
		#endif       
		return placementInfo
	}

	                                                                                       
	                                                                                                                                             
	int playerAlliance = AllianceProximity_GetAllianceFromTeam( player.GetTeam() )
	int placementState = eControlMRBPlacementState.SUCCESS

	                                                                              
	bool isEnemyHomebase = playerAlliance == ALLIANCE_A ? false : true
	float minDistFromHomeBase = isEnemyHomebase ? MIN_DIST_FROM_ENEMY_HOMEBASE : MIN_DIST_FROM_FRIENDLY_HOMEBASE
	placementState = Control_GetMRBPlacementStateFromHomeBasePositionChecks( placementState, isEnemyHomebase, minDistFromHomeBase, file.allianceABlockedHomeBasePositionsForMRB, placementInfo.origin )

	                                                                                          
	if ( placementState == eControlMRBPlacementState.SUCCESS )
	{
		isEnemyHomebase = playerAlliance == ALLIANCE_B ? false : true
		minDistFromHomeBase = isEnemyHomebase ? MIN_DIST_FROM_ENEMY_HOMEBASE : MIN_DIST_FROM_FRIENDLY_HOMEBASE
		placementState = Control_GetMRBPlacementStateFromHomeBasePositionChecks( placementState, isEnemyHomebase, minDistFromHomeBase, file.allianceBBlockedHomeBasePositionsForMRB, placementInfo.origin )
	}

	                                                          
	if ( placementState != eControlMRBPlacementState.SUCCESS )
		placementInfo.failed = true

	                                                                                              
	if ( SHOULD_DO_OBJECTIVE_TESTS && placementState == eControlMRBPlacementState.SUCCESS )
	{
		foreach ( point in file.spawnWaypoints )
		{
			if ( IsValid( point ) )
			{
				int waypointType = point.GetWaypointInt( INT_WAYPOINT_TYPE )
				if ( waypointType == CONTROL_WAYPOINT_POINT_INDEX )
				{
					#if DEV
						if ( CONTROL_DISPLAY_DEBUG_DRAWS )
							DebugDrawSphere( point.GetOrigin(), MIN_DIST_FROM_OBJECTIVES, COLOR_RED, true, 1.0 )
					#endif       
					if ( IsPositionWithinRadius( MIN_DIST_FROM_OBJECTIVES, point.GetOrigin(), placementInfo.origin ) )                                             
					{
						placementInfo.failed = true
						placementState = eControlMRBPlacementState.NEAR_OBJECTIVE
						#if DEV
							if ( CONTROL_DETAILED_DEBUG )
								printf( "CONTROL: MRB Event, MRB Deployment failing because of proximity to an Objective" )
						#endif       
						break
					}
				}
			}
		}
	}

	                                                                                                     
	if ( placementInfo.failed && placementState == eControlMRBPlacementState.SUCCESS )
	{
		#if DEV
			if ( CONTROL_DETAILED_DEBUG )
				printf( "CONTROL: MRB Event, MRB Deployment failing regular Airdrop tests" )
		#endif       
		placementState = eControlMRBPlacementState.BAD_POSITION
	}

	#if CLIENT
		                                                    
		if ( placementState != eControlMRBPlacementState.SUCCESS )
			AddPlayerHint( POSITION_VALIDATION_FAILED_HINT_DURATION,POSITION_VALIDATION_FAILED_HINT_FADEOUT_TIME, $"", PLACEMENT_STATE_STRINGS[ placementState ] )
	#endif          

	return placementInfo
}
#endif                    

#if CLIENT || SERVER
                                                                        
int function Control_GetMRBPlacementStateFromHomeBasePositionChecks( int currentPlacementState, bool isEnemyHomebase, float minDistFromHomeBase, array< vector > homebasePositions, vector mrbPosition )
{
	int placementState = currentPlacementState
	                                                                   
	foreach ( position in homebasePositions )
	{
		#if DEV
			if ( CONTROL_DISPLAY_DEBUG_DRAWS )
				DebugDrawSphere( position, minDistFromHomeBase, COLOR_RED, true, 1.0 )
		#endif       

		if ( IsPositionWithinRadius( minDistFromHomeBase, position, mrbPosition ) )                                           
		{
			placementState = isEnemyHomebase ? eControlMRBPlacementState.NEAR_HOMEBASE_ENEMY : eControlMRBPlacementState.NEAR_HOMEBASE

			#if DEV
				if ( CONTROL_DETAILED_DEBUG )
				{
					string debugHomeBaseString = isEnemyHomebase ? "Enemy" : "Friendly"
					printf( "CONTROL: MRB Event, MRB Deployment failing because of proximity to " + debugHomeBaseString + " Homebase, Base Pos: " + position )
				}
			#endif       
			break
		}
	}

	return placementState
}
#endif                    

#if SERVER
                                                                         
                                                                                              
                                                                              
 
	                                            
	 
		                             
		 
			                                                                                            

			                                                 
			                                      
			 
				                                                                                                                                   
				                                                  
			 
		 
		                                                                                                
		 
			                                                                                                                                                                      
			                                           
		 

		                          
		                                                 
		                                 

		                                        
		 
			                                
			                             
		 

		                                                                            
		                                                   
	 
 
#endif          

#if SERVER
                                                                                                                                
                                                     
 
	                                                                                
	 
		                                                            
		                                                   
		 
			                    
			                                                                                                  
			                          
			                                                                 
			                                                                       
			                                                                                   
			                                           
		 

		                                                   
	 
 
#endif          

#if SERVER
                                                                 
                                                             
 
	                              
	                                                                                              
	                           
	                                     

	                                                                       
	                                                                         

	              
 
#endif          

#if SERVER
                                                        
                                  
 
	                              
	                                                                              
	                                      
	 
		                                                                                                                               
			                                                                                                             
	 

	                        
		                

	                     
	                          
	                                                 
	                                           

	                                        
	 
		                                
		                             
	 

	                                            
		                                 
 
#endif          

  
	                                   
	                                    
	                                   
	                                    
	                                    
	                                    

	                  
  

#if DEV && SERVER
                                              
                                                                                           
 
	                       
	 
		                                                 
		 
			                                                       
				                                                                                 
		 
	 
	    
	 
		                                   
		                                             
			                                                                            
	 
 
#endif                 

#if DEV && SERVER
                                                                         
                                                                          
 
	                     

	                        
	 
		                                                 
		 
			                                                       
			 
				                                                          
				                                                                                     
			 
		 
	 
	    
	 
		                                   
		                                             
		 
			                                                     
			                                                                                
		 
	 
 
#endif                 

#if DEV && SERVER
                  
                                                                           
 
	                                                                
	                                                       
	 
		                                   
		                         
		 
			                                                                                                                                                      
			      
		 
		                                                                    
	 

	                                                        
	 
		                                  
		                             
		                                                                    
		                                  
	 
 
#endif                 

#if DEV && SERVER
                        
                                             
 
	                                                      
	 
		                                                                                                            
	 

	                                                             
 
#endif                 

#if DEV && SERVER
                             
                                                                                                 
 
	                                                      
	 
		                                                                                         
	 

	                               
	                                                        
	 
		                                                  
		 
			                      
			     
		 
	 

	                                         
	 
		                                                                                                                           
		                                                       
		 
			                                                        
			 
				                                                                                   
			 
			    
			 
				                                   
				                         
				 
					                                                                                                                                                          
					      
				 
				                                                                    
			 
		 

		                                           
		                                      
		                                                                             
		                                           
	 
	    
	 
		                                                                                                       
	 
 
#endif                 

#if DEV && SERVER
                                
                                                                      
 
	                                                      
	 
		                                                                                               
	 

	                               
	                                                        
	 
		                                                  
		 
			                      
			     
		 
	 

	                                         
	 
		                                                
		                                      
		                                                                             
		                                                
	 
	    
	 
		                                                                                                          
	 
 
#endif                 

#if DEV && SERVER
                                     
                                                                                              
 
	                
	 
		                                                                                    
		      
	 

	                                                       
	 
		                                   
		                         
		 
			                                                                                                                                                            
			      
		 
		                                                                    
	 

	                                                            
	                                           
 
#endif                 

#if DEV && SERVER
                                       
                                                     
 
	                                                          
 
#endif                 

#if DEV && SERVER
                        
                                                                                                                             
 
	                                                                    
	 
		                                                                                                                                                                                                                                                  
		      
	 

	                                                                
	                                                                     
	 
		                                   
		                         
		 
			                                                                                                                                                    
			      
		 
		                                                                           
	 

	                                                          
	                                                      
 
#endif                 

#if DEV && SERVER
                                                                                                                         
                                                                                  
 
	                     

	                        
	 
		                                
	 
	    
	 
		                                           
	 

	                             
	 
		                                                                 
	 
 
#endif                 

#if DEV && SERVER
                                                                                                                                         
                                                                               
 
	                                               

	                         
		      

	                                                          
	                               
	                                                                      

	                                    
	 
		                        
		 
			                                                                              
			                                                                     

			                                                                                                
			 
				                                                                                                     
				                                                                                    
			 
		 
	   

	                                    
	                        
		            

	                                                                                                    
	                                                                        
		             
 
#endif                 

#if DEV && SERVER
                                                                                                                                                     
                                                                                                                                                         
                                                                              
 
	                                             
	                                                                                                  

	                          
		                                                                                                                                                           
 
#endif                 

                             
