global function WinterExpress_Init
global function WinterExpress_RegisterNetworking
global function WinterExpress_IsNarrowWin

#if SERVER
                                                  
                                              
                                            
                                                             
#endif

#if CLIENT
global function ServerCallback_CL_GameStartAnnouncement

global function ServerCallback_CL_RoundEnded
global function ServerCallback_CL_WinnerDetermined
global function ServerCallback_CL_ObjectiveStateChanged
global function ServerCallback_CL_SquadOnObjectiveStateChanged
global function ServerCallback_CL_SquadEliminationStateChanged
global function ServerCallback_CL_RespawnAnnouncement
global function ServerCallback_CL_ObserverModeSetToTrain
global function ServerCallback_CL_CameraLerpFromStationToHoverTank
global function ServerCallback_CL_CameraLerpTrain

global function UICallback_WinterExpress_OpenCharacterSelect
global function ServerCallback_CL_UpdateOpenMenuButtonCallbacks_Gameplay
global function ServerCallback_CL_DeregisterModeButtonPressedCallbacks
global function ServerCallback_CL_UpdateCurrentLoadoutHUD

global function WinterExpress_GetTeamScore
global function WinterExpress_IsTeamWinning

#endif

#if UI
global function UI_UpdateOpenMenuButtonCallbacks_Spectate
#endif


                                  
#if SERVER && DEV
                                                      
                                 
                        
                                  
                                              
                               
                                 
                         
                                            
                                           
                                            
                                                  
                                              
                                             
                          
                          
                                     
                                       

                                                                

#endif

#if CLIENT && DEV
global function PickCommentaryLineFromBucket_WinterExpressCustom
#endif


global enum eWinterExpressRoundState
{
	OBJECTIVE_ACTIVE,
	ABOUT_TO_CHANGE_STATIONS,
	CHANGING_STATIONS,
	ABOUT_TO_UNLOCK_STATION,
}

global enum eWinterExpressRoundEndCondition
{
	OBJECTIVE_CAPTURED,
	LAST_SQUAD_ALIVE,
	TIMER_EXPIRED,
	NO_SQUADS_ALIVE,
	OVERTIME_EXPIRED,
}

global enum eWinterExpressObjectiveState
{
	UNCONTROLLED,
	CONTESTED,
	CONTROLLED,
	INACTIVE,
}


const SPAWN_DIST = 3000
const SKY_DIVE_SPAWN_DIST = 10000
const SKY_DIVE_SPAWN_HEIGHT = 11000
const SKY_DIVE_CIRCLE_SPAWN_DIST = 10000
const SKY_DIVE_CIRCLE_SPAWN_HEIGHT = 7800
const SPAWN_MIN_RADIUS = 64
const SPAWN_MAX_RADIUS = 320
const SPAWN_MAX_TRY_COUNT = 40
const SPAWN_MAX_ARC = 45.0
const GRACE_PERIOD_SPAWN_DELAY = 5.0
const CHARACTER_SELECT_MIN_TIME = 5.0                                                          

const float WINTER_EXPRESS_TRAIN_MAX_SPEED = 500
const float WINTER_EXPRESS_TRAIN_ACCELERATION = 50
const float WINTER_EXPRESS_LEAVE_BUFFER = 12
const float WINTER_EXPRESS_FIRST_STATION_UNLOCK_DELAY = 10

             
const float CONTESTED_LINE_DEBOUNCE = 10.0
const float HOLDING_LINE_DEBOUNCE = 10.0
const float REROLL_CHANCE = 50.0
global const array<string> WINTER_EXPRESS_DISABLED_BATTLE_CHATTER_EVENTS = [    "bc_anotherSquadAttackingUs",
	"bc_engagingEnemy",
	"bc_squadsLeft2 ",
	"bc_squadsLeft3 ",
	"bc_squadsLeftHalf",
	"bc_twoSquaddiesLeft",
	"bc_championEliminated",
	"bc_killLeaderNew",
	"bc_scatteredNag" ]

global const array<string> LONG_OR_FLAVORFUL_LINES = [    "Host_Mirage_SquadWinRoundByElim_03b_01",
	"Host_Mirage_SquadWinRoundByElim_03b_02",
	"Host_Mirage_TrainMoving_02b_01",
	"Host_Mirage_TrainMoving_02b_02",
	"Host_Mirage_TrainMoving_02b_03",
	"Host_Mirage_TrainMoving_04b_01",
	"Host_Mirage_TrainMoving_04b_02",
	"Host_Mirage_TrainMoving_04b_03",
	"Host_Mirage_WinnerCloseTimer_03b_01",
	"Host_Mirage_WinnerCloseTimer_03b_02",
	"Host_Mirage_WinnerFoundPointsNarrow_01b_01",
	"Host_Mirage_WinnerFoundPointsNarrow_01b_02",
	"Host_Mirage_WinnerFoundPointsWide_02b_01",
	"Host_Mirage_WinnerFoundPointsWide_02b_02",
	"Host_Mirage_PhoneLost_01b_01",
	"Host_Mirage_PhoneLost_01b_02",
	"Host_Mirage_PhoneLost_02b_01",
	"Host_Mirage_PhoneLost_02b_02",
	"Host_Mirage_PhoneLost_04b_01",
	"Host_Mirage_PhoneLost_04b_02",
	"Host_Mirage_TrainStop_03_01",
	"Host_Mirage_TrainStop_03_02",
	"Host_Mirage_TrainStop_03_03" ]



const vector OBJECTIVE_GREEN = <118, 224, 221>
const vector OBJECTIVE_RED = <164, 62, 62>
const vector OBJECTIVE_ORANGE = <240, 104, 64>
const vector OBJECTIVE_YELLOW = <245, 231, 110>

const string GAME_START_ANNOUNCEMENT = "#PL_GAME_START_ANNOUNCEMENT"
const string GAME_START_ANNOUNCEMENT_SUB = "#PL_GAME_START_ANNOUNCEMENT_SUB"

const string CAPTURED_THE_TRAIN = "#PL_CAPTURED_THE_TRAIN"
const string LOST_THE_TRAIN = "#PL_LOST_THE_TRAIN"
const string CONTESTING_THE_TRAIN = "#PL_CONTESTING_THE_TRAIN"
const string PL_OBJECTIVE_LOCKED = "#PL_INACTIVE_OBJECTIVE"

const string ROUND_END_OBJECTIVE_CAPTURED = "#PL_ROUND_END_OBJECTIVE_CAPTURED"
const string ROUND_END_OBJECTIVE_CAPTURED_SUB = "#PL_ROUND_END_OBJECTIVE_CAPTURED_SUB"
const string ROUND_END_LAST_SQUAD_ALIVE = "#PL_ROUND_END_LAST_SQUAD_ALIVE"
const string ROUND_END_LAST_SQUAD_ALIVE_SUB = "#PL_ROUND_END_LAST_SQUAD_ALIVE_SUB"
const string ROUND_END_TIMER_EXPIRED = "#PL_ROUND_END_TIMER_EXPIRED"
const string ROUND_END_OVERTIME_EXPIRED = "#PL_ROUND_END_OVERTIME_EXPIRED"
const string ROUND_END_OVERTIME_EXPIRED_SUB = "#PL_ROUND_END_OVERTIME_EXPIRED_SUB"
const string ROUND_END_TIMER_EXPIRED_SUB = "#PL_ROUND_END_TIMER_EXPIRED_SUB"
const string ROUND_END_NO_SQUADS = "PL_ROUND_END_NO_SQUADS"
const string ROUND_END_NO_SQUADS_SUB = "PL_ROUND_END_NO_SQUADS_SUB"

const string PL_ROUND_STARTED = "#PL_ROUND_STARTED"
const string PL_ROUND_STARTED_SUB = "#PL_ROUND_STARTED_SUB"

const string PL_OBJECTIVE_MOVING = "#PL_OBJECTIVE_MOVING"
const string PL_OBJECTIVE_MOVING_SUB = "#PL_OBJECTIVE_MOVING_SUB"

const string ROUND_STATE_ACTIVE = "#PL_ROUND_STATE_ACTIVE"
const string ROUND_STATE_CHANGING = "#PL_ROUND_STATE_CHANGING"
const string ROUND_ACTIVE_OBJECTIVE = "#PL_ROUND_ACTIVE_OBJECTIVE"
const string ROUND_CHANGING_OBJECTIVE = "#PL_ROUND_CHANGING_OBJECTIVE"
const string CURRENT_OBJECTIVE = "#PL_CURRENT_OBJECTIVE"
const string RESPAWNING_ALLOWED = "#PL_RESPAWNING_ALLOWED"
const string RESPAWNING_DISABLED = "#PL_RESPAWNING_DISABLED"

const string LOSER_ANNOUNCEMENT = "#PL_LOSER_ANNOUNCEMENT"
const string LOSER_ANNOUNCEMENT_SUB = "#PL_LOSER_ANNOUNCEMENT_SUB"

const asset CHAIR_GLOW_FX = $"P_item_bluelion"
const string TRAIN_MOVER_NAME = "desertlands_train_mover"
const string SOUND_THROW_ITEM = "weapon_sentryfragdrone_throw_1p"
const asset RESPAWN_BEACON_MOBILE_MODEL = $"mdl/props/pathfinder_beacon_radar/pathfinder_beacon_radar_animated.rmdl"

                   
const float  HOLIDAY_HOVERTANK_ALT_CHECK 	= 0

struct {
	int           scoreLimit
	int           roundLimit
	entity        trainRef
	array<entity> trainTriggers

	table<int, int>             objectiveScore
	table< int, bool > 			isTeamOnMatchPoint
	table< int, bool > 			hasTeamGottenMatchPointAnnounce

	#if SERVER
		                   			          
		                           	                    
		              				                  

		                   
		                    
		                          

		                                             
		                                                  
		                                                

		                                                       

		                                                           
		                         

		                               
		                                

		                                                 
		                                               
		                                                

		                                           

		                                            
		   			                      
		                              

		                                                                
		                                                           
		                                                             

		                            

		                                     
		                                  
		                                       
		                         

		                                                   
		                                                        
		                                                      

		                           

		                                
		                                                                 
			                                  
			                                
			                               
			                               
	#endif

	#if CLIENT
		table<int, var> scoreElements
		table<int, var> scoreElementsFullmap
		table<int, var> squadOnObjectiveElements

		bool gameStartRuiCreated = false

		int    bestSquadIndex = -1
		entity trainWaypoint

		var gameStartRui = null
		var activeSpectateMusic = null
		bool OpenMenuGameplayButtonCallbackRegistered = false
		var legendSelectMenuPromptRui = null

	#endif
} file



void function WinterExpress_Init()
{
	if ( !WinterExpress_IsModeEnabled() )
		return

	file.scoreLimit = GetCurrentPlaylistVarInt( "winter_express_score_limit", 100 )
	file.roundLimit = GetCurrentPlaylistVarInt( "winter_express_round_limit", 30 )


	Remote_RegisterServerFunction( "ClientCallback_WinterExpress_TryRespawnPlayer" )

	#if SERVER
		                                                                

		                                                        
		                                                                                            
		                      

		                                                
		                                                  
		                                                        
		                                                                                      
		                                                                    
		                                                                             
		                                                      
		                                                      
		                                                    
		                                                       
		                                                                         

		                                                                

		                                                                                         
		                                                                           
		                                                                                 
		                                                                           

		                                        
		                                                  
		                                                      

		                                                                                       
		                                      
		 
			                                                                               
			                                                                                 
			                                                                  
		 



		                                                           
		                                           
		                                           

		                                                     
		                                                    
		                                                       
		                                                   
		                                     
		                                              

		                             
		                                           


		       
			                                    
		      

		                                                                                 
		 
			                                     
			                                                          
		 

		                                     
		                                                                                                               
		                                                                             
		                                                                                   
		                                                                                         
		                                                                                     
		                                                                           
		                                                                                  
		                                                                                 
		                                                                                  
		                                                                                   
		                                                                                   
		                                                                                 
		                                                                                  
		                                                                                  
		                                                                                  

		                                                                                    
	#endif

	#if CLIENT
		SetCustomScreenFadeAsset( $"ui/screen_fade_winter_express.rpak" )

		CircleAnnouncementsEnable( false )
		SetMapFeatureItem( 300, "#WINTER_EXPRESS_TRAIN_OBJECTIVE", "#WINTER_EXPRESS_TRAIN_DESC", $"rui/hud/gametype_icons/sur_train_minimap" )                                                      

		AddCallback_OnPlayerLifeStateChanged( WinterExpress_OnPlayerLifeStateChanged )

		SetHeaderBannerOverrideFunc( WinterExpress_DeathScreenHeaderOverride )

		AddCreateCallback( PLAYER_WAYPOINT_CLASSNAME, OnWaypointCreated )
		AddCallback_GameStateEnter( eGameState.WaitingForPlayers, OnWaitingForPlayers_Client )
		AddCallback_GameStateEnter( eGameState.PickLoadout, OnPickLoadout )
		AddCallback_GameStateEnter( eGameState.Resolution, WinterExpress_OnResolution )
		AddCallback_GameStateEnter( eGameState.WinnerDetermined, Client_OnWinnerDetermined )
		AddCallback_OnPlayerChangedTeam( Client_OnTeamChanged )

		AddCallback_OnScoreboardCreated( FinishGamestateRui )
		AddCallback_EntitiesDidLoad( OnEntitiesDidLoad_Client )
		AddCallback_OnCharacterSelectMenuClosed( WinterExpress_OnCharacterSelectMenuClosed )
		Survival_SetVictorySoundPackageFunction( GetVictorySoundPackage )

		RegisterDisabledBattleChatterEvents( WINTER_EXPRESS_DISABLED_BATTLE_CHATTER_EVENTS )

		Obituary_SetVerticalOffset( 60 )
		SmartAmmo_SetVerticalOffset( 30 )
		SURVIVAL_SetGameStateAssetOverrideCallback( WinterExpressOverrideGameState )

		FlagInit( "WinterExpress_ObjectiveStateUpdated", false )
		FlagInit( "WinterExpress_ObjectiveOwnerUpdated", false )

		SetAllowGladCard( false )

	#endif
}


void function WinterExpress_RegisterNetworking()
{
	if ( !WinterExpress_IsModeEnabled() )
		return

	Remote_RegisterClientFunction( "ServerCallback_CL_GameStartAnnouncement" )

	Remote_RegisterClientFunction( "ServerCallback_CL_RoundEnded", "int", 0, 128, "int", -2, 10000, "int", 0, 10000 )
	Remote_RegisterClientFunction( "ServerCallback_CL_ObjectiveStateChanged", "int", 0, 128, "int", -1, 128 )
	Remote_RegisterClientFunction( "ServerCallback_CL_SquadOnObjectiveStateChanged", "int", 0, 128, "bool" )
	Remote_RegisterClientFunction( "ServerCallback_CL_WinnerDetermined", "int", -1, 128 )
	Remote_RegisterClientFunction( "ServerCallback_CL_SquadEliminationStateChanged", "int", -1, 128, "bool" )
	Remote_RegisterClientFunction( "ServerCallback_CL_RespawnAnnouncement" )
	Remote_RegisterClientFunction( "ServerCallback_CL_ObserverModeSetToTrain" )
	Remote_RegisterClientFunction( "ServerCallback_CL_CameraLerpFromStationToHoverTank", "entity", "entity", "entity", "entity", "bool" )
	Remote_RegisterClientFunction( "ServerCallback_CL_CameraLerpTrain", "entity", "vector", -32000.0, 32000.0, 32, "entity", "bool" )
	Remote_RegisterClientFunction( "ServerCallback_CL_UpdateOpenMenuButtonCallbacks_Gameplay", "bool" )
	Remote_RegisterClientFunction( "ServerCallback_CL_DeregisterModeButtonPressedCallbacks" )
	Remote_RegisterClientFunction( "ServerCallback_CL_UpdateCurrentLoadoutHUD" )

	RegisterNetworkedVariable( "WinterExpress_RoundState", SNDC_GLOBAL, SNVT_INT, -1 )
	RegisterNetworkedVariable( "WinterExpress_RoundEnd", SNDC_GLOBAL, SNVT_TIME, -1 )
	RegisterNetworkedVariable( "WinterExpress_ObjectiveState", SNDC_GLOBAL, SNVT_INT, eWinterExpressObjectiveState.INACTIVE )
	RegisterNetworkedVariable( "WinterExpress_ObjectiveOwner", SNDC_GLOBAL, SNVT_INT, -1 )
	RegisterNetworkedVariable( "WinterExpress_UnlockDelayEndTime", SNDC_GLOBAL, SNVT_TIME, -1 )
	RegisterNetworkedVariable( "WinterExpress_CaptureEndTime", SNDC_GLOBAL, SNVT_TIME, -1 )
	RegisterNetworkedVariable( "WinterExpress_TrainArrivalTime", SNDC_GLOBAL, SNVT_TIME, -1 )
	RegisterNetworkedVariable( "WinterExpress_TrainTravelTime", SNDC_GLOBAL, SNVT_TIME, -1 )
	RegisterNetworkedVariable( "WinterExpress_WaveRespawnTime", SNDC_GLOBAL, SNVT_TIME, -1 )
	RegisterNetworkedVariable( "WinterExpress_RoundRespawnTime", SNDC_GLOBAL, SNVT_TIME, -1 )
	RegisterNetworkedVariable( "WinterExpress_IsOvertime", SNDC_GLOBAL, SNVT_BOOL, false )
	RegisterNetworkedVariable( "WinterExpress_RoundCounter", SNDC_GLOBAL, SNVT_INT, 0 )
	RegisterNetworkedVariable( "WinterExpress_NarrowWin", SNDC_GLOBAL, SNVT_BOOL, false )
	RegisterNetworkedVariable( "WinterExpress_HasGracePeriodPermit", SNDC_PLAYER_GLOBAL, SNVT_BOOL, false )
	RegisterNetworkedVariable( "WinterExpress_IsPlayerAllowedLegendChange", SNDC_PLAYER_EXCLUSIVE, SNVT_BOOL, false )

	#if CLIENT
		RegisterNetVarIntChangeCallback( "WinterExpress_RoundState", OnServerVarChanged_RoundState )
		RegisterNetVarIntChangeCallback( "WinterExpress_ObjectiveState", OnServerVarChanged_ObjectiveState )
		RegisterNetVarIntChangeCallback( "WinterExpress_ObjectiveOwner", OnServerVarChanged_ObjectiveOwner )
		RegisterNetVarIntChangeCallback( "connectedPlayerCount", OnServerVarChanged_ConnectedPlayers )
		RegisterNetVarTimeChangeCallback( "WinterExpress_TrainArrivalTime", OnServerVarChanged_TrainArrival )
		RegisterNetVarTimeChangeCallback( "WinterExpress_TrainTravelTime", OnServerVarChanged_TrainTravelTime )
		RegisterNetVarBoolChangeCallback( "WinterExpress_IsOvertime", OnServerVarChanged_OvertimeChanged )
	#endif
}

bool function WinterExpress_IsNarrowWin()
{
	return GetGlobalNetBool( "WinterExpress_NarrowWin" )
}

#if SERVER
                                 
 
	                                                                     
	                                 
	 
		                                                           
	 

	                                                             
	                                         

	                                                                           
	 
		                                    
		                                                         
		                                                         
		                                     
		                 
	 

	  	                                                                                                                      

	                                                              
	                                                                     
	                                                                                                                                                                       
	                                           
	                                                                        

	                                                        

	                                                                                     
	                                                                                                    
	                                 

	                                                                                          
	                               
	                                                                               

	                                                             

	                                                                         

	                                  
 

                                           
 
	                         
		      

	                                                                                                 

	                                                                          
		                                                                                           
 

#endif

#if CLIENT
void function Client_OnTeamChanged( entity player, int oldTeam, int newTeam )
{
	                               
	foreach ( entity p in GetPlayerArray() )
	{
		if ( !IsValid( p ) )
			continue

		SetCustomPlayerInfo( p )
	}
}
#endif

#if CLIENT
void function OnEntitiesDidLoad_Client()
{
	                    
	int uiTeam = TEAM_IMC
	file.scoreElements[uiTeam] <- RuiCreateNested( ClGameState_GetRui(), "squadScore", $"ui/winter_express_squad_score_element.rpak" )
	file.scoreElementsFullmap[uiTeam] <- RuiCreateNested( GetFullmapGamestateRui(), "squadScore", $"ui/winter_express_squad_score_element.rpak" )
	file.squadOnObjectiveElements[uiTeam] <- RuiCreateNested( ClGameState_GetRui(), "squadOnObjective", $"ui/winter_express_squad_on_objective.rpak" )
	RuiSetBool( file.squadOnObjectiveElements[uiTeam], "isMySquad", true )
	RuiSetBool( file.squadOnObjectiveElements[uiTeam], "teamValid", true )

	int mySquadIndex      = Squads_GetArrayIndexForTeam( uiTeam )
	asset squadIcon  = Squads_GetSquadIcon( mySquadIndex )

	RuiSetAsset( file.squadOnObjectiveElements[uiTeam], "squadImage",  squadIcon)
	RuiSetAsset( file.scoreElements[uiTeam], "squadImage", squadIcon )
	RuiSetColorAlpha( file.scoreElements[uiTeam], "teamColor", Squads_GetSquadColor( mySquadIndex ) , 1.0 )

	RuiSetAsset( file.scoreElementsFullmap[uiTeam], "squadImage", squadIcon )
	RuiSetColorAlpha( file.scoreElementsFullmap[uiTeam], "teamColor", Squads_GetSquadColor( mySquadIndex ) , 1.0 )


	             
	foreach ( int i, int team in GetAllEnemyTeams( uiTeam ) )
	{
		int squadIndex = Squads_GetArrayIndexForTeam( team )

		file.scoreElements[team] <- RuiCreateNested( ClGameState_GetRui(), "enemyScore" + i, $"ui/winter_express_enemy_score_element.rpak" )
		file.scoreElementsFullmap[team] <- RuiCreateNested( GetFullmapGamestateRui(), "enemyScore" + i, $"ui/winter_express_enemy_score_element.rpak" )
		RuiSetInt( file.scoreElements[team], "teamOrderIndex", i )
		RuiSetInt( file.scoreElementsFullmap[team], "teamOrderIndex", i )

		file.squadOnObjectiveElements[team] <- RuiCreateNested( ClGameState_GetRui(), "enemyOnObjective" + i, $"ui/winter_express_squad_on_objective.rpak" )
		RuiSetInt( file.squadOnObjectiveElements[team], "teamOrderIndex", i )

		if ( GetPlayerArrayOfTeam( team ).len() == 0 )
		{
			RuiSetBool( file.scoreElements[team], "teamValid", false )
			RuiSetBool( file.scoreElementsFullmap[team], "teamValid", false )
			RuiSetBool( file.squadOnObjectiveElements[team], "teamValid", false )
		}
		else
		{
			RuiSetBool( file.scoreElements[team], "teamValid", true )
			RuiSetBool( file.scoreElementsFullmap[team], "teamValid", true )
			RuiSetBool( file.squadOnObjectiveElements[team], "teamValid", true )
		}

		squadIcon = Squads_GetSquadIcon(squadIndex)
		RuiSetAsset( file.squadOnObjectiveElements[team], "squadImage",  squadIcon)
		RuiSetAsset( file.scoreElements[team], "squadImage", squadIcon )
		RuiSetColorAlpha( file.scoreElements[team], "teamColor", Squads_GetSquadColor( squadIndex ), 1.0 )

		RuiSetAsset( file.scoreElementsFullmap[team], "squadImage", squadIcon )
		RuiSetColorAlpha( file.scoreElementsFullmap[team], "teamColor", Squads_GetSquadColor( squadIndex ), 1.0 )
	}

	SurvivalCommentary_SetHost( eSurvivalHostType.MIRAGE )
}

void function FinishGamestateRui()
{
	RuiSetFloat( ClGameState_GetRui(), "overtimeTimeLimit", GetCurrentPlaylistVarFloat( "winter_express_overtime_limit", 15 ) )
	RuiSetFloat( ClGameState_GetRui(), "captureTimeRequired", GetCurrentPlaylistVarFloat( "winter_express_cap_time", 10 ) )
	RuiSetFloat( ClGameState_GetRui(), "trainTravelTime", 10.0 )

	RuiTrackInt( ClGameState_GetRui(), "roundState", null, RUI_TRACK_SCRIPT_NETWORK_VAR_GLOBAL_INT, GetNetworkedVariableIndex( "WinterExpress_RoundState" ) )
	RuiTrackInt( ClGameState_GetRui(), "roundCounter", null, RUI_TRACK_SCRIPT_NETWORK_VAR_GLOBAL_INT, GetNetworkedVariableIndex( "WinterExpress_RoundCounter" ) )
	RuiTrackFloat( ClGameState_GetRui(), "unlockEndTime", null, RUI_TRACK_SCRIPT_NETWORK_VAR_GLOBAL, GetNetworkedVariableIndex( "WinterExpress_UnlockDelayEndTime" ) )
	RuiSetInt( ClGameState_GetRui(), "roundLimit", file.roundLimit )
}

void function OnServerVarChanged_ConnectedPlayers( entity player, int new )
{
	foreach ( team in GetAllTeams() )
	{
		int uiTeam = Squads_GetTeamsUIId( team )
		if ( !(uiTeam in file.scoreElements) )
			continue

		if ( GetPlayerArrayOfTeam( team ).len() == 0 )
		{
			RuiSetBool( file.scoreElements[uiTeam], "teamValid", false )
			RuiSetBool( file.scoreElementsFullmap[uiTeam], "teamValid", false )
			RuiSetBool( file.squadOnObjectiveElements[uiTeam], "teamValid", false )
		}
		else
		{
			RuiSetBool( file.scoreElements[uiTeam], "teamValid", true )
			RuiSetBool( file.scoreElementsFullmap[uiTeam], "teamValid", true )
			RuiSetBool( file.squadOnObjectiveElements[uiTeam], "teamValid", true )
		}
	}

	foreach ( entity p in GetPlayerArray() )
	{
		if ( !IsValid( p ) )
			continue

		SetCustomPlayerInfo( p )
	}

	entity localPlayer = GetLocalViewPlayer()
	if ( !IsValid( localPlayer ))
		return

	int myTeam = localPlayer.GetTeam()
	if ( myTeam == TEAM_SPECTATOR )
		return

	if ( ClGameState_GetRui() != null )
	{
		int squadIndex = Squads_GetSquadUIIndex( myTeam )
		RuiSetInt( ClGameState_GetRui(), "squadSize", GetPlayerArrayOfTeam( myTeam ).len())
		RuiSetImage( ClGameState_GetRui(), "squadIcon",  Squads_GetSquadIcon(squadIndex))
		RuiSetColorAlpha( ClGameState_GetRui(), "squadColor", Squads_GetSquadColor( squadIndex ) , 1.0 )
		RuiSetString( ClGameState_GetRui(), "squadString", Squads_GetSquadName(squadIndex) )
	}
}

string function WinterExpress_DeathScreenHeaderOverride()
{
	if ( GetGameState() != eGameState.Playing )
		return ""

	entity player            = GetLocalClientPlayer()
	float arrivalTime        = GetGlobalNetTime( "WinterExpress_TrainArrivalTime" )

	if ( Time() < arrivalTime && player.GetPlayerNetBool( "WinterExpress_HasGracePeriodPermit" ) )
		return "#WINTER_EXPRESS_DIED_IN_GRACE_PERIOD"

	return "#WINTER_EXPRESS_WAITING_TO_RESPAWN"
}

void function WinterExpress_OnResolution()
{
	if ( GetNetWinningTeam() != TEAM_UNASSIGNED )
		return

	                                                             

	Assert( !IsSquadDataPersistenceEmpty( GetLocalClientPlayer() ), "Persistence didn't get transmitted to the client in time!" )
	SetSquadDataToLocalTeam()                                                                                   

	ShowDeathScreen( eDeathScreenPanel.SQUAD_SUMMARY )
	EnableDeathScreenTab( eDeathScreenPanel.SPECTATE, false )
	EnableDeathScreenTab( eDeathScreenPanel.DEATH_RECAP, !IsAlive( GetLocalClientPlayer() ) )
	SwitchDeathScreenTab( eDeathScreenPanel.SQUAD_SUMMARY )
}
#endif

#if CLIENT
void function Client_OnWinnerDetermined( )
{
	int winningTeam = GetWinningTeam()
	if ( winningTeam != TEAM_UNASSIGNED)
	{
		int squadIndex = Squads_GetSquadUIIndex( GetWinningTeam() )
		SetVictoryScreenTeamName( Localize( Squads_GetSquadNameLong( squadIndex ) ) )
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

#if SERVER || CLIENT
string function PickCommentaryLineFromBucket_WinterExpressCustom( int commentaryBucket )
{
	string line = PickCommentaryLineFromBucket( commentaryBucket )

	if ( LONG_OR_FLAVORFUL_LINES.contains( line ) && RandomInt( 100 ) < REROLL_CHANCE )
		line = PickCommentaryLineFromBucket( commentaryBucket )

	return line
}
#endif

                                 
                                 
                                 

#if UI
void function UI_UpdateOpenMenuButtonCallbacks_Spectate( int newLifeState, bool shouldCloseMenu )
{
	if ( GetGameState() > eGameState.WinnerDetermined || uiGlobal.isLevelShuttingDown )
		return

	if ( newLifeState == LIFE_ALIVE )
	{
		if ( shouldCloseMenu )
			RunClientScript( "CloseCharacterSelectNewMenu" )


		if ( IsUsingLoadoutSelectionSystem() )
		{
			if ( shouldCloseMenu && LoadoutSelectionMenu_IsLoadoutMenuOpen())
				LoadoutSelectionMenu_CloseLoadoutMenu()
		}
	}
}

void function WinterExpress_UI_OpenCharacterSelect( var button )
{
	var deathScreenMenu = GetMenu( "DeathScreenMenu" )
	if ( GetActiveMenu() != deathScreenMenu )
		return

	if ( GetGameState() != eGameState.Playing )
		return

	RunClientScript( "UICallback_WinterExpress_OpenCharacterSelect" )
}

void function WinterExpress_TryRespawn( var button )
{
	var characterSelectMenu = GetMenu( "CharacterSelectMenuNew" )
	if ( GetActiveMenu() == characterSelectMenu )
		return

	Remote_ServerCallFunction( "ClientCallback_WinterExpress_TryRespawnPlayer" )
}

                                  
void function WinterExpress_UI_OpenLoadoutSelect( var button )
{
	var deathScreenMenu = GetMenu( "DeathScreenMenu" )
	if ( GetActiveMenu() != deathScreenMenu )
		return

	if ( GetGameState() != eGameState.Playing )
		return

	LoadoutSelectionMenu_OpenLoadoutMenu( true )
}

#endif

#if CLIENT
                                                                
void function ServerCallback_CL_DeregisterModeButtonPressedCallbacks()
{
	                                                                                                                         
	RunUIScript( "UI_UpdateOpenMenuButtonCallbacks_Spectate", LIFE_ALIVE, true )

	                                                                                             
	WinterExpress_UpdateOpenMenuButtonCallbacks_Gameplay( false )
}

void function ServerCallback_CL_UpdateOpenMenuButtonCallbacks_Gameplay( bool isLegendSelectAvailable )
{
	WinterExpress_UpdateOpenMenuButtonCallbacks_Gameplay( isLegendSelectAvailable )
}


                                                                                                                                    
void function WinterExpress_UpdateOpenMenuButtonCallbacks_Gameplay( bool isLegendSelectAvailable )
{
	entity player = GetLocalClientPlayer()
	if ( !IsValid( player ) )
		return

	if ( !isLegendSelectAvailable && file.OpenMenuGameplayButtonCallbackRegistered )
	{
		DeregisterConCommandTriggeredCallback( "+offhand1", WinterExpress_CL_TryOpenCharacterSelect )

		if( CharacterSelect_MenuIsOpen() )
			CloseCharacterSelectNewMenu()

		if ( file.legendSelectMenuPromptRui != null )
		{
			RuiDestroy( file.legendSelectMenuPromptRui )
			file.legendSelectMenuPromptRui = null
		}

		if ( IsUsingLoadoutSelectionSystem() )
		{
			DeregisterConCommandTriggeredCallback( "+offhand4", WinterExpress_CL_TryOpenLoadoutSelect )
			RunUIScript( "LoadoutSelectionMenu_CloseLoadoutMenu" )

		}

		file.OpenMenuGameplayButtonCallbackRegistered = false
	}

	if ( isLegendSelectAvailable && !file.OpenMenuGameplayButtonCallbackRegistered && player.GetPlayerNetBool( "WinterExpress_IsPlayerAllowedLegendChange" ) )
	{
		RegisterConCommandTriggeredCallback( "+offhand1", WinterExpress_CL_TryOpenCharacterSelect )

		var rui = CreateFullscreenRui( $"ui/winter_express_change_prompt_screen.rpak", 100 )
		file.legendSelectMenuPromptRui = rui

		if ( IsUsingLoadoutSelectionSystem() )
		{
			RegisterConCommandTriggeredCallback( "+offhand4", WinterExpress_CL_TryOpenLoadoutSelect )
		}

		WinterExpress_UpdateCurrentLoadoutHUD()
		file.OpenMenuGameplayButtonCallbackRegistered = true
	}
}



                                                     
void function WinterExpress_CL_TryOpenCharacterSelect( var button )
{
	entity player = GetLocalClientPlayer()

	if ( !IsValid( player ) )
		return

	if ( GetGameState() != eGameState.Playing )
		return

	UICallback_WinterExpress_OpenCharacterSelect()
}

                                                                                                                                        
void function WinterExpress_OnCharacterSelectMenuClosed()
{
	thread WinterExpress_OnCharacterSelectMenuClosed_Thread()
}

void function WinterExpress_OnCharacterSelectMenuClosed_Thread()
{
	entity clientPlayer = GetLocalClientPlayer()
	clientPlayer.EndSignal( "OnDestroy" )

	OnThreadEnd(
		function() : ( clientPlayer )
		{
			if ( IsValid( clientPlayer ) )
				WinterExpress_UpdateCurrentLoadoutHUD()
		}
	)

	wait 0.3
}

                                                                              
void function ServerCallback_CL_UpdateCurrentLoadoutHUD()
{
	WinterExpress_UpdateCurrentLoadoutHUD()
}

                                                                        
void function WinterExpress_UpdateCurrentLoadoutHUD()
{
	entity player = GetLocalClientPlayer()

	if ( !IsValid( player ) )
		return

	var legendSelectPromptRui = file.legendSelectMenuPromptRui

	                        
	if ( IsUsingLoadoutSelectionSystem() )
	{
		int currentLoadout = LoadoutSelection_GetSelectedLoadoutSlotIndex_CL_UI()

		if ( legendSelectPromptRui != null )
		{
			RuiSetBool( legendSelectPromptRui, "hasLoadoutSelect", true )
			RuiSetString( legendSelectPromptRui, "currentLoadoutHeaderText", LoadoutSelection_GetLocalizedLoadoutHeader( currentLoadout ) )
			RuiSetImage( legendSelectPromptRui, "weapon0Icon", LoadoutSelection_GetItemIcon( currentLoadout, 0, -1 ) )
			RuiSetInt( legendSelectPromptRui, "weapon0LootTier", LoadoutSelection_GetWeaponLootTeir( currentLoadout, 0) )
			RuiSetImage( legendSelectPromptRui, "weapon1Icon", LoadoutSelection_GetItemIcon( currentLoadout, 1, -1 ) )
			RuiSetInt( legendSelectPromptRui, "weapon1LootTier", LoadoutSelection_GetWeaponLootTeir( currentLoadout, 1) )
			RuiSetImage( legendSelectPromptRui, "consumable0Icon", LoadoutSelection_GetItemIcon( currentLoadout, -1, 0 ) )
			RuiSetImage( legendSelectPromptRui, "consumable1Icon", LoadoutSelection_GetItemIcon( currentLoadout, -1, 1 ) )
			RuiSetImage( legendSelectPromptRui, "consumable2Icon", LoadoutSelection_GetItemIcon( currentLoadout, -1, 2 ) )
			RuiSetBool( GetCompassRui(), "isVisible", false )
			file.legendSelectMenuPromptRui = legendSelectPromptRui
		}
		else
			RuiSetBool( GetCompassRui(), "isVisible", true )
	}

	                          
	if ( legendSelectPromptRui != null && LoadoutSlot_IsReady( ToEHI( player ), Loadout_Character() ) )
	{
		ItemFlavor character = LoadoutSlot_GetItemFlavor( ToEHI( player ), Loadout_Character() )
		RuiSetBool( legendSelectPromptRui, "hasLegendSelect", true )
		RuiSetImage( legendSelectPromptRui, "legendIcon", CharacterClass_GetGalleryPortrait( character ) )

		file.legendSelectMenuPromptRui = legendSelectPromptRui
	}
}

                                  
void function WinterExpress_CL_TryOpenLoadoutSelect( var button )
{
	if ( !IsUsingLoadoutSelectionSystem() )
		return

	entity player = GetLocalClientPlayer()

	if ( !IsValid( player ) )
		return

	if ( GetGameState() != eGameState.Playing )
		return

	RunUIScript( "LoadoutSelectionMenu_OpenLoadoutMenu", false )
}


void function OnWaitingForPlayers_Client()
{
	                                                                                          
	if ( file.gameStartRuiCreated )
		return

	SurvivalCommentary_SetHost( eSurvivalHostType.MIRAGE )

	file.gameStartRui = RuiCreate( $"ui/winter_express_game_start.rpak", clGlobal.topoFullScreen, RUI_DRAW_POSTEFFECTS, 1 )
	RuiSetString( file.gameStartRui, "gameModeString", GetCurrentPlaylistVarString( "name", "#PLAYLIST_UNAVAILABLE" ) )
	RuiSetString( file.gameStartRui, "mapNameString", GetCurrentPlaylistVarString( "map_name", "#PLAYLIST_UNAVAILABLE" ) )
	RuiSetImage( file.gameStartRui , "gameModeIcon", GetGamemodeLogoFromImageMap( GetCurrentPlaylistVarString( "gamemode_logo", "BATTLE_ROYALE" )) )

	EmitSoundOnEntity( GetLocalClientPlayer(), GetAnyDialogueAliasFromName( PickCommentaryLineFromBucket_WinterExpressCustom( eSurvivalCommentaryBucket.MATCH_INTRO ) ) )

	file.gameStartRuiCreated = true
}

void function OnPickLoadout()
{
	if ( file.gameStartRui != null )
		RuiDestroy( file.gameStartRui )
	file.gameStartRui = null
}

void function OnWaypointCreated( entity wp )
{
	thread SetupObjectiveWaypoint( wp )
}

void function SetupObjectiveWaypoint( entity wp )
{
	if ( !IsValid( wp ) )
		return

	while ( IsValid( wp ) && wp.wp.ruiHud == null )
		WaitFrame()

	if ( !IsValid( wp ) )
		return

	if ( wp.GetWaypointType() == eWaypoint.OBJECTIVE )
	{
		file.trainWaypoint = wp
		RuiTrackInt( file.trainWaypoint.wp.ruiHud, "roundState", null, RUI_TRACK_SCRIPT_NETWORK_VAR_GLOBAL_INT, GetNetworkedVariableIndex( "WinterExpress_RoundState" ) )
		RuiSetBool( file.trainWaypoint.wp.ruiHud, "useWinterExpressColors", true )
	}
}


void function WinterExpress_OnPlayerLifeStateChanged( entity player, int oldState, int newState )
{
	entity clientPlayer = GetLocalClientPlayer()
	if ( player != clientPlayer || !IsValid( GetLocalClientPlayer() ))
		return

	switch( newState )
	{
		case LIFE_ALIVE:
			RunUIScript( "UI_UpdateOpenMenuButtonCallbacks_Spectate", newState, true )
			StopSoundOnEntity( GetLocalClientPlayer(), "Music_LTM32_SpectateCam" )
			break

		case LIFE_DEAD:
			thread WinterExpress_ManageCharacterSelectAvailability_Thread()
			if ( GetGameState() == eGameState.Playing && (file.activeSpectateMusic == null || !IsSoundStillPlaying( file.activeSpectateMusic )))
			{
				file.activeSpectateMusic = EmitSoundOnEntity( GetLocalClientPlayer(), "Music_LTM32_SpectateCam" )
			}
			break
	}
}

                                                                                                                                                   
void function WinterExpress_ManageCharacterSelectAvailability_Thread()
{
	entity clientPlayer = GetLocalClientPlayer()
	OnThreadEnd(
		function() : ( clientPlayer )
		{
			if ( IsValid( clientPlayer ) )
			{
				RunUIScript( "UI_UpdateOpenMenuButtonCallbacks_Spectate", LIFE_ALIVE, true )
			}
		}
	)

	                                                                                                     
	if ( !WinterExpress_IsModeEnabled() )
		return

	                                          
	float timeUntilSpawn = WinterExpress_GetTimeUntilSpawn()
	float gracePeriod = GetGlobalNetTime( "WinterExpress_TrainArrivalTime" ) - Time()
	bool inGracePeriod = timeUntilSpawn < 0 && gracePeriod > 0
	if ( inGracePeriod )
		wait gracePeriod

	                              
	if ( IsAlive( clientPlayer ) )
		return

	                                               
	timeUntilSpawn = WinterExpress_GetTimeUntilSpawn()
	if ( timeUntilSpawn > 0 && timeUntilSpawn < CHARACTER_SELECT_MIN_TIME )
		return

	RunUIScript( "UI_UpdateOpenMenuButtonCallbacks_Spectate", LIFE_DEAD, false )

	                                                 
	while ( timeUntilSpawn < 0 )
	{
		if ( IsAlive( clientPlayer ) )
		{
			return
		}
		else
		{
			timeUntilSpawn = WinterExpress_GetTimeUntilSpawn()
			wait 1.0                                                                                                                                              
		}
	}

	clientPlayer.EndSignal( "OnDestroy" )                                                                                                                                                                       
	                                                                                                                                                                 
	wait timeUntilSpawn - CHARACTER_SELECT_MIN_TIME
}

                                                                                                                                                    
float function WinterExpress_GetTimeUntilSpawn()
{
	float roundRespawnTime = GetGlobalNetTime( "WinterExpress_RoundRespawnTime" )
	float timeUntilSpawn = roundRespawnTime - Time()
	return timeUntilSpawn
}

void function UICallback_WinterExpress_OpenCharacterSelect()
{
	entity clientPlayer = GetLocalClientPlayer()
	entity viewPlayer = GetLocalViewPlayer()

	                                                                                                     
	if ( !WinterExpress_IsModeEnabled() )
		return

	const bool browseMode = true
	const bool showLockedCharacters = true
	HideScoreboard()
	OpenCharacterSelectNewMenu( browseMode, showLockedCharacters )
}

bool function WinterExpress_ShouldShowDeathScreen()
{
	return false
}

int function GetTeamRemappedForRui( int rawIndex )
{
	int myTeam = GetLocalViewPlayer().GetTeam()
	if( rawIndex == myTeam )
		return 0

	int i = 1
	foreach ( team in GetAllEnemyTeams( myTeam ) )
	{
		if ( team == rawIndex )
			return i

		i++
	}

	return -1
}


void function ServerCallback_CL_GameStartAnnouncement()
{
	AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( GAME_START_ANNOUNCEMENT ), Localize( GAME_START_ANNOUNCEMENT_SUB ), < 214, 214, 214 >, "WXpress_Train_Update", 7.0, $"", $"", $"", true, false )
}

void function ServerCallback_CL_RoundEnded( int endCondition, int winningTeam, int newScore )
{
	string winningSquad      = ""
	vector announcementColor = <1, 1, 1>

	int uiWinningTeam     = Squads_GetTeamsUIId( winningTeam )
	int squadWinningIndex = -1
	if	(winningTeam >= TEAM_IMC)
	{
		squadWinningIndex  = Squads_GetSquadUIIndex( winningTeam )
	}


	asset borderIcon         = $""
	string soundAlias        = "WXpress_Train_Update"

	if ( squadWinningIndex < 0)
	{
		borderIcon = $"rui/hud/gametype_icons/winter_express/icon_announcement_fail"
	}
	else if ( uiWinningTeam == TEAM_IMC )                  
	{
		winningSquad = Localize( "#PL_YOUR_SQUAD" )
		announcementColor = Squads_GetNonLinearSquadColor( squadWinningIndex )
		borderIcon = $"rui/hud/gametype_icons/winter_express/legend_icon_round_won"
		soundAlias = "WXpress_Train_Capture"
	}
	else                     
	{
		int winningSquadRuiIndex = GetTeamRemappedForRui( winningTeam )
		winningSquad = Localize( Squads_GetSquadNameLong( squadWinningIndex ) )
		announcementColor = Squads_GetNonLinearSquadColor( squadWinningIndex )
		borderIcon = winningSquadRuiIndex == 1 ? $"rui/hud/gametype_icons/winter_express/icon_announcement_fail" : $"rui/hud/gametype_icons/winter_express/icon_announcement_fail_alt"
		soundAlias = "WXpress_Train_Capture_Enemy"
	}

	if ( endCondition == eWinterExpressRoundEndCondition.OBJECTIVE_CAPTURED )
	{
		AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( ROUND_END_OBJECTIVE_CAPTURED, winningSquad ), Localize( ROUND_END_OBJECTIVE_CAPTURED_SUB, "`1" + winningSquad + "`0", newScore, Localize( newScore > 1 ? "#PL_ROUND_MULTIPLE" : "#PL_ROUND_SINGULAR" ) ), announcementColor, soundAlias, 5.0, $"", borderIcon, borderIcon, false )
		Obituary_Print_Localized( Localize( ROUND_END_OBJECTIVE_CAPTURED, "`1" + winningSquad + "`0" ), announcementColor )
	}
	else if ( endCondition == eWinterExpressRoundEndCondition.LAST_SQUAD_ALIVE )
	{
		AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( ROUND_END_LAST_SQUAD_ALIVE, winningSquad ), Localize( ROUND_END_LAST_SQUAD_ALIVE_SUB , "`1" + winningSquad + "`0", newScore, Localize( newScore > 1 ? "#PL_ROUND_MULTIPLE" : "#PL_ROUND_SINGULAR" ) ), announcementColor, soundAlias, 5.0, $"", borderIcon, borderIcon, false )
		Obituary_Print_Localized( Localize( ROUND_END_LAST_SQUAD_ALIVE, "`1" + winningSquad + "`0" ), announcementColor )
	}
	else if ( endCondition == eWinterExpressRoundEndCondition.TIMER_EXPIRED )
	{
		AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( ROUND_END_TIMER_EXPIRED ), Localize( ROUND_END_TIMER_EXPIRED_SUB ), announcementColor, soundAlias, 5.0, $"", borderIcon, borderIcon, true )
		Obituary_Print_Localized( Localize( ROUND_END_TIMER_EXPIRED ), announcementColor )
	}
	else if ( endCondition == eWinterExpressRoundEndCondition.OVERTIME_EXPIRED )
	{
		AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( ROUND_END_OVERTIME_EXPIRED ), Localize( ROUND_END_OVERTIME_EXPIRED_SUB ), announcementColor, soundAlias, 5.0, $"", borderIcon, borderIcon, true )
		Obituary_Print_Localized( Localize( ROUND_END_OVERTIME_EXPIRED ), announcementColor )
	}
	else
	{
		AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( ROUND_END_NO_SQUADS ), Localize( ROUND_END_NO_SQUADS_SUB ), announcementColor, soundAlias, 5.0, $"", borderIcon, borderIcon, true )
		Obituary_Print_Localized( Localize( ROUND_END_NO_SQUADS ), announcementColor )
	}

	CL_ScoreUpdate( winningTeam, newScore )
}

void function CL_ScoreUpdate( int team, int score )
{
	int uiTeam     = Squads_GetTeamsUIId( team )
	file.objectiveScore[uiTeam] <- score

	                          
	if ( file.objectiveScore[uiTeam] == file.scoreLimit - 1 )
		file.isTeamOnMatchPoint[uiTeam] <- true

	if ( !(uiTeam in file.scoreElements) )
		return

	RuiSetInt( file.scoreElements[uiTeam], "score", score )
	RuiSetInt( file.scoreElementsFullmap[uiTeam], "score", score )
}

int function WinterExpress_GetTeamScore( int uiTeam )
{
	if ( !( uiTeam in file.objectiveScore ) )
		return 0

	return  file.objectiveScore[ uiTeam ]
}

bool function WinterExpress_IsTeamWinning( int uiTeamToCheck )
{
	if ( !( uiTeamToCheck in file.objectiveScore ) )
		return false

	int teamToCheckScore = file.objectiveScore[ uiTeamToCheck ]
	bool isWinning = true

	foreach ( uiTeam, score in file.objectiveScore)
	{
		if ( teamToCheckScore < score )
		{
			isWinning = false
			break
		}
	}

	return isWinning
}

void function OnServerVarChanged_RoundState( entity player, int new )
{
	if ( GetGameState() != eGameState.Playing )
		return

	printf( "WINTER EXPRESS: server var changed: " + new )

	if ( new == eWinterExpressRoundState.OBJECTIVE_ACTIVE )
		thread DisplayRoundStart()
	else if ( new == eWinterExpressRoundState.CHANGING_STATIONS )
		thread DisplayRoundChanging()
	else if ( new == eWinterExpressRoundState.ABOUT_TO_CHANGE_STATIONS )
		thread DisplayRoundFinished()
	else if ( new == eWinterExpressRoundState.ABOUT_TO_UNLOCK_STATION )
		thread DisplayUnlockDelay()
}

void function DisplayRoundStart()
{
	asset borderIcon = $"rui/hud/gametype_icons/winter_express/objective_gold_left"

	if ( IsWaveRespawn() )
		AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( PL_ROUND_STARTED ), "", < 214, 214, 214 >, "WXpress_Train_Update", 5.0 )
	if ( IsRoundBasedRespawn() )
		AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( PL_ROUND_STARTED ), Localize( PL_ROUND_STARTED_SUB ), < 214, 214, 214 >, "WXpress_Train_Update", 5.0, $"", borderIcon, borderIcon, true, false )
	else
		AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( PL_ROUND_STARTED ), Localize( PL_ROUND_STARTED_SUB ), < 214, 214, 214 >, "WXpress_Train_Update", 5.0, $"", borderIcon, borderIcon, true, false )

	RuiSetGameTime( ClGameState_GetRui(), "roundStateChangedTime", Time() )
	RuiSetGameTime( ClGameState_GetRui(), "roundEndTime", GetGlobalNetTime( "WinterExpress_RoundEnd" ) )
	RuiSetInt( ClGameState_GetRui(), "roundState", eWinterExpressRoundState.OBJECTIVE_ACTIVE )

	foreach ( team, rui in file.squadOnObjectiveElements )
		RuiSetInt( rui, "roundState", eWinterExpressRoundState.OBJECTIVE_ACTIVE )
}

void function DisplayRoundFinished()
{
	RuiSetGameTime( ClGameState_GetRui(), "roundStateChangedTime", Time() )
	RuiSetInt( ClGameState_GetRui(), "roundState", eWinterExpressRoundState.ABOUT_TO_CHANGE_STATIONS )

	foreach ( team, rui in file.squadOnObjectiveElements )
		RuiSetInt( rui, "roundState", eWinterExpressRoundState.ABOUT_TO_CHANGE_STATIONS )
}

void function DisplayRoundChanging()
{
	RuiSetGameTime( ClGameState_GetRui(), "roundStateChangedTime", Time() )
	RuiSetInt( ClGameState_GetRui(), "roundState", eWinterExpressRoundState.CHANGING_STATIONS )

	foreach ( team, rui in file.squadOnObjectiveElements )
		RuiSetInt( rui, "roundState", eWinterExpressRoundState.CHANGING_STATIONS )

	  	        

	asset borderIcon = $"rui/hud/gametype_icons/winter_express/icon_announcement_changing_stations"
	AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( PL_OBJECTIVE_MOVING ), "", < 214, 214, 214 >, "WXpress_Train_Update", 5.0, $"", borderIcon, borderIcon, true, false )
}

void function DisplayUnlockDelay()
{
	RuiSetGameTime( ClGameState_GetRui(), "roundStateChangedTime", Time() )
	RuiSetInt( ClGameState_GetRui(), "roundState", eWinterExpressRoundState.ABOUT_TO_UNLOCK_STATION )

	bool shouldShowMatchPoint
	int uiMatchTeam = -1
	foreach( uiTeam, value in file.isTeamOnMatchPoint )
	{
		if ( uiTeam == TEAM_INVALID )
			continue

		if ( value )
		{
			if ( uiTeam in file.hasTeamGottenMatchPointAnnounce && file.hasTeamGottenMatchPointAnnounce[uiTeam] )
				continue

			shouldShowMatchPoint = true
			file.hasTeamGottenMatchPointAnnounce[uiTeam] <- true
			uiMatchTeam          = uiTeam
			break
		}
	}

	if ( shouldShowMatchPoint )
	{
		int uiSquadIndex  = Squads_GetArrayIndexForTeam( uiMatchTeam )
		string matchSquad = uiSquadIndex == 0 ? "#PL_YOUR_SQUAD" : Localize( Squads_GetSquadNameLong( uiSquadIndex ) )
		matchSquad = "`3" + Localize( matchSquad ) + "`0"

		vector announcementColor = Squads_GetSquadColor( uiSquadIndex )
		AnnouncementMessageRight( GetLocalClientPlayer(), Localize( "#PL_MATCH_POINT", matchSquad ), "", announcementColor, $"", 4, "WXpress_Train_Update_Small", announcementColor )
	}
}

void function OnServerVarChanged_ObjectiveState( entity player, int new )
{
	FlagSet( "WinterExpress_ObjectiveStateUpdated" )

	printf( "WINTER EXPRESS: Setting your train status to: " + new )
	RuiSetInt( ClGameState_GetRui(), "yourTrainStatus", new )
	if ( file.trainWaypoint != null && file.trainWaypoint.wp.ruiHud != null )
		RuiSetInt( file.trainWaypoint.wp.ruiHud, "yourObjectiveStatus", new )

	if ( new == eWinterExpressObjectiveState.CONTROLLED )
	{
		RuiSetGameTime( ClGameState_GetRui(), "captureEndTime", GetGlobalNetTime( "WinterExpress_CaptureEndTime" ) )
		RuiSetFloat( ClGameState_GetRui(), "captureTimeRequired", GetCurrentPlaylistVarFloat( "winter_express_cap_time", 10 ) )
	}
	else
	{
		RuiSetGameTime( ClGameState_GetRui(), "captureEndTime", GetGlobalNetTime( "WinterExpress_CaptureEndTime" ) - Time() )
	}

	if ( file.trainWaypoint != null && file.trainWaypoint.wp.ruiHud != null )
	{
		if ( new == eWinterExpressObjectiveState.CONTROLLED )
		{
			RuiSetGameTime( file.trainWaypoint.wp.ruiHud, "captureEndTime", GetGlobalNetTime( "WinterExpress_CaptureEndTime" ) )
			RuiSetFloat( file.trainWaypoint.wp.ruiHud, "captureTimeRequired", GetCurrentPlaylistVarFloat( "winter_express_cap_time", 10 ) )
		}
		else
		{
			RuiSetGameTime( file.trainWaypoint.wp.ruiHud, "captureEndTime", GetGlobalNetTime( "WinterExpress_CaptureEndTime" ) - Time() )
		}
	}
}

void function OnServerVarChanged_ObjectiveOwner( entity player, int new )
{
	FlagSet( "WinterExpress_ObjectiveOwnerUpdated" )

	entity viewPlayer = GetLocalViewPlayer()
	if ( !IsValid( viewPlayer ) )
		return

	int localTeam  = viewPlayer.GetTeam()
	int squadIndex = new >=0 ? Squads_GetSquadUIIndex( new ) : 0

	var gamestateRui = ClGameState_GetRui()
	if ( gamestateRui == null )
		return

	RuiSetInt( gamestateRui, "yourTeamIndex", GetTeamRemappedForRui( localTeam ) )
	RuiSetInt( gamestateRui, "currentControllingTeam", GetTeamRemappedForRui( new ) )

	RuiSetString( gamestateRui, "currentControllingTeamName", Squads_GetSquadNameLong( squadIndex ) )
	RuiSetColorAlpha( gamestateRui, "currentControllingTeamColor", Squads_GetSquadColor( squadIndex ) , 1.0 )

	printf( "WINTER EXPRESS: Setting current controlling team to: " + new )

	if ( file.trainWaypoint != null && file.trainWaypoint.wp.ruiHud != null )
	{
		RuiSetInt( file.trainWaypoint.wp.ruiHud, "yourTeamIndex", GetTeamRemappedForRui( localTeam ) )
		RuiSetInt( file.trainWaypoint.wp.ruiHud, "currentControllingTeam", GetTeamRemappedForRui( new ) )
		RuiSetColorAlpha( file.trainWaypoint.wp.ruiHud, "currentControllingTeamColor", Squads_GetSquadColor( squadIndex ) , 1.0 )
	}
}

void function ClearObjectiveUpdate()
{
	FlagClear( "WinterExpress_ObjectiveStateUpdated" )
	FlagClear( "WinterExpress_ObjectiveOwnerUpdated" )
}

void function OnServerVarChanged_TrainArrival( entity player, float new )
{
	RuiSetGameTime( ClGameState_GetRui(), "trainArrivalTime", new )
}

void function OnServerVarChanged_TrainTravelTime( entity player, float new )
{
	RuiSetFloat( ClGameState_GetRui(), "trainTravelTime", new )
}

void function OnServerVarChanged_OvertimeChanged( entity player, bool new )
{
	if ( new == true )
	{
		asset borderIcon = $"rui/hud/gametype_icons/winter_express/objective_gold_left"
		EmitSoundOnEntity( GetLocalClientPlayer(), "WXpress_Train_Capture_Overtime" )
		AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( "#PL_OVERTIME_OBJECTIVE_CHANGED" ), "", < 214, 214, 214 >, "WXpress_Train_Update", 5.0, $"", borderIcon, borderIcon, true, false )
	}
}

void function ServerCallback_CL_SquadOnObjectiveStateChanged( int team, bool isOnObjective )
{
	int uiTeam = Squads_GetTeamsUIId( team )
	RuiSetBool( file.squadOnObjectiveElements[uiTeam], "isSquadOnObjective", isOnObjective )
}

void function ServerCallback_CL_SquadEliminationStateChanged( int team, bool eliminationState )
{
	int uiTeam = Squads_GetTeamsUIId( team )
	RuiSetBool( file.squadOnObjectiveElements[uiTeam], "isEliminated", eliminationState )
}

void function ServerCallback_CL_ObjectiveStateChanged( int newState, int team )
{
	if ( GetLocalViewPlayer().GetTeam() == team )
	{
		if ( newState == eWinterExpressObjectiveState.CONTROLLED )
		{
			AnnouncementMessageRight( GetLocalClientPlayer(), Localize( CAPTURED_THE_TRAIN ), "", OBJECTIVE_GREEN, $"", 2, "WXpress_Train_Update_Small" )
		}

		if ( newState == eWinterExpressObjectiveState.UNCONTROLLED )
		{
			AnnouncementMessageRight( GetLocalClientPlayer(), Localize( LOST_THE_TRAIN ), "", OBJECTIVE_RED, $"", 2, "WXpress_Train_Update_Small" )
		}

		if ( newState == eWinterExpressObjectiveState.CONTESTED )
		{
			AnnouncementMessageRight( GetLocalClientPlayer(), Localize( CONTESTING_THE_TRAIN ), "", OBJECTIVE_YELLOW, $"", 2, "WXpress_Train_Update_Small" )
		}

		if ( newState == eWinterExpressObjectiveState.INACTIVE )
		{
			AnnouncementMessageRight( GetLocalClientPlayer(), Localize( PL_OBJECTIVE_LOCKED ), "", < 214, 214, 214 >, $"", 2, "WXpress_Train_Update_Small" )
		}
	}
}

void function ServerCallback_CL_WinnerDetermined( int team )
{
	RunUIScript( "UI_UpdateOpenMenuButtonCallbacks_Spectate", LIFE_ALIVE, true )
	StopSoundOnEntity( GetLocalClientPlayer(), "Music_LTM32_SpectateCam" )
	SetSummaryDataDisplayStringsCallback( WinterExpress_PopulateSummaryDataStrings )
	CL_ScoreUpdate( team, 3 )
}


void function ServerCallback_CL_RespawnAnnouncement()
{
	AnnouncementMessageSweepWinterExpress( GetLocalClientPlayer(), Localize( "#WINTER_EXPRESS_RESPAWN_MSG" ), "", <255, 255, 255>, "WXpress_Mode_Update_Respawn", 5.0 )
}

void function ServerCallback_CL_ObserverModeSetToTrain()
{
	if ( !IsValid( GetLocalClientPlayer() ) )
		return

	UpdateMainHudVisibility( GetLocalClientPlayer() )
	DeathScreen_SpectatorTargetChanged( GetLocalClientPlayer(), null, null )
}


void function AnnouncementMessageSweepWinterExpress( entity player, string messageText, string subText, vector titleColor, string soundAlias, float duration, asset icon = $"", asset leftIcon = $"", asset rightIcon = $"", bool useColorOnText = false, bool useColorOnHeader = true )
{
	AnnouncementData announcement = Announcement_Create( messageText )
	announcement.drawOverScreenFade = true
	Announcement_SetSubText( announcement, subText )
	Announcement_SetHideOnDeath( announcement, true )
	Announcement_SetDuration( announcement, duration )
	Announcement_SetPurge( announcement, true )
	Announcement_SetStyle( announcement, ANNOUNCEMENT_STYLE_SWEEP )
	Announcement_SetSoundAlias( announcement, soundAlias )
	Announcement_SetTitleColor( announcement, titleColor )
	Announcement_SetIcon( announcement, icon )
	Announcement_SetLeftIcon( announcement, leftIcon )
	Announcement_SetRightIcon( announcement, rightIcon )
	                                                    
	Announcement_SetUseColorOnAnnouncementText( announcement, useColorOnHeader )
	Announcement_SetUseColorOnSubtext( announcement, useColorOnText )
	AnnouncementFromClass( player, announcement )
}

#endif         

#if SERVER || CLIENT || UI
float function GetWaveRespawnInterval()
{
	return GetCurrentPlaylistVarFloat( "winter_express_wave_respawn_intreval", -1 )
}

bool function IsWaveRespawn()
{
	Assert ( !GetCurrentPlaylistVarBool( "winter_express_wave_respawn", false ) || (GetCurrentPlaylistVarBool( "winter_express_wave_respawn", false ) && GetWaveRespawnInterval() > 0) )

	return GetCurrentPlaylistVarBool( "winter_express_wave_respawn", false )
}

bool function IsRoundBasedRespawn()
{
	return GetCurrentPlaylistVarBool( "winter_express_round_based_respawn", false )
}
#endif                         




                                                
                                                
                                                

#if SERVER
                                                                                    
 
	                                           
		           

	                                              
	 
		                                                            
		 
			                                                   
			                                                
		 
		           
	 

	                                                                           
 

                                                                                             
 
	                                                             
	                                                                                 

	                                    
	 
		                                                                                  
	 

	           
 

                                    
 
	                                                                                        
									                                                           
									                                                        
									                                                            
									                                                          
									                                                            
									                                                
									                                                              
									                                                    
									                                                                

	                                                                           
								                                                   
								                                              
								                                                   
								                                                
								                                                    
								                                      
								                                                    
								                                         
								                                                       
 

                                      
 
	                         
	                                  
	                                                              
	 
		                                                                                       
		                                               
		 
			                
			                          
		 
	 

	                   
 

                             
 
	                                              
	                                                      
		             

	                
 

                                                      
 
	                                           
	                                        

	                                                                    
 

                                                   
 
	                                  
	                                        

	                                                                    
 

                                                          
 
	           

	                                                                   

	                                      
	 
		                         
			        

		                                            
			        

		                                                                                                                         

		                    
		                                                                                                                                                                                          
		                                      
		                                                                                   
	 
 
#endif

#if CLIENT
void function WinterExpressOverrideGameState()
{
	ClGameState_RegisterGameStateAsset( $"ui/gamestate_info_winter_express.rpak" )
	ClGameState_RegisterGameStateFullmapAsset( $"ui/gamestate_info_fullmap_winter_express.rpak" )
}


VictorySoundPackage function GetVictorySoundPackage()
{
	VictorySoundPackage victorySoundPackage

	string winAlias = ""
	if ( WinterExpress_IsNarrowWin() )
	{
		winAlias = GetAnyDialogueAliasFromName( PickCommentaryLineFromBucket( eSurvivalCommentaryBucket.NARROW_WINNER ) )
	}
	else
	{
		winAlias = GetAnyDialogueAliasFromName( PickCommentaryLineFromBucket( eSurvivalCommentaryBucket.WIDE_WINNER ) )
	}

	victorySoundPackage.youAreChampPlural = winAlias
	victorySoundPackage.youAreChampSingular = winAlias
	victorySoundPackage.theyAreChampPlural = winAlias
	victorySoundPackage.theyAreChampSingular = winAlias

	return victorySoundPackage
}
#endif



















                                                                                                                   
                                                                                                                   
                                                                                                                   

#if SERVER
                                                
 
	                                  
 

                                                
 
	                             
	                               

	                                                                                            
		           

	                                              
	 
		                                                                             
		                                               
	 

	                                      

	                                                                
		                                                  

	                                                     

	                                                    
		                                            
	    
		                                              

	                                             
 

                                                
 
	                 
 


                               
 
	                                                                
		      

	                                                                       

	                                                
	 
		                        
		                                         
			                       
		                                                
			                        

		                                                                    
		                             

		                                                     
		                                   
		                                                   
	 
 


                                                     
 
	                                                            
	                                                          

	                                  
	 
		                                                                                                                               
		                                          
	 

	                                                                                      
	                                                                               
 

                                                                              
 

	                                                 
	                                                                                      
	                                                            

	                                        
	                                       
 








                                                         
 
	                                   

	                                   
	                                         
	                         
	                      

	                                                   

	                               
	 

		                                                                                      
		                                              
		           
	 

	                                                 
 


                                                        
 
	                                   
	                                      

	              
	 
		                                 
		                                  
	 
 


                                                                         
 
	                                                            
	                                                                                    
	                                                                         		               
	                                               
	                                        
	                                                                                                               
	                                      
	                                        		                

	                                                      
 


                                                                 
 
	                                                                      
	                                                                

	                                          
	                                                
		                  

	                                                                                                                                               
	                                                          
 


                                                                       
 
	                                                 
 


                                                                                                     
 
	                                                     
	                        

	                                 
	 
		                                    
		 
			                                                         
				                         
		 
	 

	                                 

	                             
	 
		                                   
		 
			                                                                  
				                                  
		 
	 

	                                           
	                                      
	 
		                                                                                             
			                  
	 

	                  
 


                                                               
 
	                                                     
	                                                  
		                                        
	                                                                                                                                
 

                                                                                                             
 
	                             
	                               
	                                                

	                                                                                                                             

	                                                                                                     
	                                                                                                           
		           

	                                                                                                                                                                                                        
	                                                                                                   
	                                                                      
	 
		                                   
		                                             
		                        
		                                        

		                                                                 
		                                                                      
		                                                                      
		 
			                                                             
			                                                                              
			                                                                                                         
		 
	 
 

                                                                       
 
	                                                    
	                                                 
		                                                   
	                                                         
 

                                                                       
 
	                             
	                               

	            
		                       
		 
			                        
			 
				                                             
				                          
				                                            
				                                  
				                                                                                                                            
				                                                                                              
				                       
				                                                                 

				                                                                
					                                                  

				                                                                                        
				                                                                                                          

				                                                 
			 
		 
	 

	                                                                   
	                                                                     
		           
 

                                                                
 
	                       
	                                                               
	                                                
	 
		                                                           
		                                                                                                                              
			                               
	 

	                       
 

                                                             
 
	                                 
		           

	                                         
 
#endif


#if CLIENT

void function WinterExpress_PopulateSummaryDataStrings( SquadSummaryPlayerData data )
{
	data.modeSpecificSummaryData[0].displayString = "#DEATH_SCREEN_SUMMARY_KILLS"
	data.modeSpecificSummaryData[1].displayString = "#DEATH_SCREEN_SUMMARY_ASSISTS"
	data.modeSpecificSummaryData[2].displayString = ""
	data.modeSpecificSummaryData[3].displayString = "#DEATH_SCREEN_SUMMARY_DAMAGE_DEALT"
	data.modeSpecificSummaryData[4].displayString = ""
	data.modeSpecificSummaryData[5].displayString = ""
	data.modeSpecificSummaryData[6].displayString = ""
}

#endif

#if CLIENT
void function ServerCallback_CL_CameraLerpFromStationToHoverTank( entity player, entity stationNode, entity hoverTankMover, entity trainMover, bool isGameStartLerp )
{
	vector stationLookPosition = stationNode.GetOrigin() + <1500, 1500, 2000>
	vector stationLookAngles = VectorToAngles( stationNode.GetOrigin() - stationLookPosition )

	float randomVal1 = RandomFloatRange( -750.0, -500.0 )
	float randomVal2 = RandomFloatRange( 500.0, 750.0 )

	vector playerLookAtOpt1 = player.GetOrigin() + < randomVal1, randomVal2, 650>
	vector playerLookAtOpt2 = player.GetOrigin() + < -1 * randomVal1, randomVal2, 650>
	vector playerLookAtOpt3 = player.GetOrigin() + < randomVal1, -1 * randomVal2, 650>
	vector playerLookAtOpt4 = player.GetOrigin() + < -1 * randomVal1, -1 * randomVal2, 650>

	array<vector> lookAtOptions
	lookAtOptions.append( playerLookAtOpt1 )
	lookAtOptions.append( playerLookAtOpt2 )
	lookAtOptions.append( playerLookAtOpt3 )
	lookAtOptions.append( playerLookAtOpt4 )

	vector closestLookAt = lookAtOptions[0]
	foreach( opt in lookAtOptions )
	{
		if ( Distance( stationLookPosition, opt ) < Distance( stationLookPosition, closestLookAt ) )
			closestLookAt = opt
	}

	vector playerLookAngles = VectorToAngles( player.GetOrigin() - closestLookAt )

	thread CameraLerpHovertankThread( player, stationLookPosition, stationLookAngles, closestLookAt, playerLookAngles, hoverTankMover, trainMover, isGameStartLerp )
}

void function CameraLerpHovertankThread( entity player, vector stationPos, vector stationAng, vector endPos, vector endAng, entity hoverTankMover, entity trainMover, bool isGameStartLerp )
{
	player.EndSignal( "OnDeath" )
	player.EndSignal( "OnDestroy" )

	vector startPos = trainMover.GetOrigin() + <1500, 1500, 1500>
	vector startAng = VectorToAngles( trainMover.GetOrigin() - startPos )

	entity cameraMover = CreateClientsideScriptMover( $"mdl/dev/empty_model.rmdl", startPos, startAng )
	entity camera      = CreateClientSidePointCamera( startPos, startAng, 100 )
	player.SetMenuCameraEntity( camera )
	camera.SetTargetFOV( 100, true, EASING_CUBIC_INOUT, 0.0 )
	camera.SetParent( cameraMover, "", false )

	OnThreadEnd(
		function() : ( player, camera, cameraMover )
		{
			if ( IsValid( camera ) )
			{
				if ( IsValid( player ) )
					player.ClearMenuCameraEntity()
				camera.Destroy()
				cameraMover.Destroy()
			}
		}
	)

	wait 1.5

	if ( isGameStartLerp )
	{
		player.SetMenuCameraEntity( camera )
		wait 1.5
	}

	if ( RandomInt( 100 ) > 97 )
		EmitSoundOnEntity( GetLocalClientPlayer(), GetAnyDialogueAliasFromName( PickCommentaryLineFromBucket_WinterExpressCustom( eSurvivalCommentaryBucket.PHONE_LOST ) ) )

	float camera_move_duration = 8
	vector predictedEndLocation = endPos + ( hoverTankMover.GetVelocity() * ( camera_move_duration * 2.5 )  )
	vector predictedEndAng = VectorToAngles( player.GetOrigin() - predictedEndLocation )

	cameraMover.NonPhysicsMoveTo( stationPos, camera_move_duration / 2.0, camera_move_duration / 4.0, camera_move_duration / 4.0 )
	cameraMover.NonPhysicsRotateTo( stationAng, camera_move_duration / 2.0, camera_move_duration / 4.0, camera_move_duration / 4.0 )

	wait camera_move_duration / 2.0
	wait 1.5

	cameraMover.NonPhysicsMoveTo( predictedEndLocation, camera_move_duration / 2.0, camera_move_duration / 4.0, camera_move_duration / 4.0 )
	cameraMover.NonPhysicsRotateTo( predictedEndAng, camera_move_duration / 2.0, camera_move_duration / 4.0, camera_move_duration / 4.0 )
	camera.SetTargetFOV( 100, true, EASING_CUBIC_INOUT, camera_move_duration / 2.0 )

	wait (camera_move_duration / 2.0) + 1.5

	wait 0.5

	float maxDistance = Distance( cameraMover.GetOrigin(), player.GetOrigin() )
	while ( Distance( cameraMover.GetOrigin(), player.GetOrigin() ) > 100 )
	{
		float currDistance = Distance( cameraMover.GetOrigin(), player.GetOrigin() )
		float percToLerp = ( maxDistance - ( currDistance * 0.8 ) ) / maxDistance

		vector endLocation = LerpVector( cameraMover.GetOrigin(), player.EyePosition(), percToLerp )
		vector endAngles = LerpVector( cameraMover.GetAngles(), player.EyeAngles(), percToLerp )

		cameraMover.NonPhysicsMoveTo( endLocation, 0.15, 0.0, 0.0 )
		cameraMover.NonPhysicsRotateTo( endAngles, 0.15, 0.0, 0.0 )

		wait 0.15
	}
}

void function ServerCallback_CL_CameraLerpTrain(  entity player, vector estimatedCameraStart, entity trainMover, bool isGameStartLerp  )
{
	thread CameraLerpTrainThread( player, estimatedCameraStart, trainMover, isGameStartLerp )
}

void function CameraLerpTrainThread( entity player, vector estimatedCameraStart, entity trainMover, bool isGameStartLerp )
{
	player.EndSignal( "OnDeath" )
	player.EndSignal( "OnDestroy" )

	vector startAng = VectorToAngles( trainMover.GetOrigin() - estimatedCameraStart )

	entity cameraMover = CreateClientsideScriptMover( $"mdl/dev/empty_model.rmdl", estimatedCameraStart, startAng )
	entity camera      = CreateClientSidePointCamera( estimatedCameraStart, startAng, 100 )
	player.SetMenuCameraEntity( camera )
	camera.SetTargetFOV( 100, true, EASING_CUBIC_INOUT, 0.0 )
	camera.SetParent( cameraMover, "", false )

	OnThreadEnd(
		function() : ( player, camera, cameraMover )
		{
			if ( IsValid( camera ) )
			{
				if ( IsValid( player ) )
					player.ClearMenuCameraEntity()
				camera.Destroy()
				cameraMover.Destroy()
			}
		}
	)

	wait 1.5

	if ( isGameStartLerp )
	{
		player.SetMenuCameraEntity( camera )
		wait 1.5
	}

	if ( RandomInt( 100 ) > 97 )
		EmitSoundOnEntity( GetLocalClientPlayer(), GetAnyDialogueAliasFromName( PickCommentaryLineFromBucket_WinterExpressCustom( eSurvivalCommentaryBucket.PHONE_LOST ) ) )


	wait 1
}

#endif