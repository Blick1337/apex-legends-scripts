                    

                                  
                  
                                       
                                       

global function TDM_Init
global function GetTDMIsActive
global function TDM_IsSWATLoadout
global function TDM_SetIsRoundTransition
global function TDM_GetIsRoundTransition

struct
{
	bool isRoundTransition = false
}
file

void function TDM_Init()
{
	if( !GetTDMIsActive() )
		return

	#if SERVER
		                                                                    
			                     

		                                                                                      
		                                                                                                  

		                                            
		                          
			                                                                              
		    
			                                                                             
	#endif

	#if CLIENT
		PakHandle pakHandle = RequestPakFile( "ui_arenas", TRACK_FEATURE_UI )
		FreeDM_SetScoreboardSetupFunc( TDM_ScoreboardSetup() )
	#endif
}

#if SERVER
                                                                              
 
	                               
		      

	                                             
		                                             

	                                            
 
#endif          


bool function GetTDMIsActive()
{
	return GetCurrentPlaylistVarBool( "freedm_tdm_active", false)
}

bool function TDM_IsSWATLoadout()
{
	return GetCurrentPlaylistVarBool( "tdm_is_swat_loadout", false)
}

void function TDM_SetIsRoundTransition( bool isRoundTransition = false )
{
	file.isRoundTransition = isRoundTransition
}

bool function TDM_GetIsRoundTransition()
{
	return file.isRoundTransition
}

array< array<string> > function SWAT_OverrideAbilityCarePackage(entity player)
{
	array<string> left = ["armor_pickup_lv1"]
	array<string> right = ["armor_pickup_lv1"]
	array<string> center = ["armor_pickup_lv1"]

	return ([ left, center, right ])
}

array< array<string> > function TDM_OverrideAbilityCarePackage(entity player)
{
	array<string> left = ["armor_pickup_lv3"]
	array<string> right = ["armor_pickup_lv3"]
	array<string> center = ["armor_pickup_lv3"]

	return ([ left, center, right ])
}

#if CLIENT
void function TDM_ScoreboardSetup()
{
	clGlobal.showScoreboardFunc = ShowScoreboardOrMap_Teams
	clGlobal.hideScoreboardFunc = HideScoreboardOrMap_Teams

	Teams_AddCallback_ScoreboardData( FreeDM_GetScoreboardData )
	Teams_AddCallback_Header( TDM_ScoreboardUpdateHeader )
	Teams_AddCallback_PlayerScores( FreeDM_GetPlayerScores )
	Teams_AddCallback_SortScoreboardPlayers( FreeDM_SortPlayersByScore )
	Teams_AddCallback_GetTeamColor( TDM_ScoreboardGetTeamColor )
	Teams_AddCallback_ScoreboardTitle( TDM_SetScoreboardTitle )
	Teams_AddCallback_IsEnabled(TDM_SetScoreboardEnabled)
}
#endif          

#if CLIENT
void function TDM_ScoreboardUpdateHeader( var headerRui, var frameRui, int team )
{
	if( headerRui != null )
	{
		entity player = GetLocalViewPlayer()
		bool isEndOfMatch = GetGameState() >= eGameState.Resolution
		bool isObserver = GamemodeUtility_IsPlayerOnTeamObserver( player ) || IsSpectatorSpectatingPlayer( player )
		int maxScore = GetCurrentPlaylistVarInt( "scorelimit", 30 )

		int localTeam = team + TEAM_IMC

		                                                                                                                         
		                                                                                    
		                                                                             
		bool isAllies = isObserver ? true : team == AllianceProximity_GetAllianceFromTeam( localTeam )

		              
		int alliesCurrentScore = GetAllianceTeamsScore( team )
		int alliesRoundsWon = GameRules_GetTeamScore2( localTeam )

		               
		int enemiesCurrentScore = GetAllianceTeamsScore( AllianceProximity_GetOtherAlliance( team ) )
		int enemiesRoundsWon = GameRules_GetTeamScore2(FreeDM_GetOtherTeam( localTeam ) )

		                                                                                                                             
		if (isEndOfMatch)
		{
			if (GetWinningTeam() == localTeam)
				alliesRoundsWon += 1

			if (GetWinningTeam() == FreeDM_GetOtherTeam( localTeam ) )
				enemiesRoundsWon += 1
		}

		                                                                         
		if (!isObserver)
		{
			RuiSetString( headerRui, "headerText", Localize( team == AllianceProximity_GetAllianceFromTeam( player.GetTeam() ) ? "#ALLIES" : "#ENEMIES" ) )
		}
		RuiSetInt( headerRui, "score", isAllies ? alliesCurrentScore : enemiesCurrentScore )
		RuiSetInt( headerRui, "maxScore", maxScore )
		RuiSetInt( headerRui, "roundsWon", isAllies ? alliesRoundsWon : enemiesRoundsWon )
		RuiSetBool( headerRui, "isWinning", TDM_GetIsRoundTransition() || isEndOfMatch ? ( alliesRoundsWon > enemiesRoundsWon ) : false )
		RuiSetInt( headerRui, "gameState", TDM_GetIsRoundTransition() ? eGameState.Playing : GetGameState() )
	}
}
#endif          

#if CLIENT
vector function TDM_ScoreboardGetTeamColor( int team )
{
	entity player = GetLocalViewPlayer()
	bool isObserver = GamemodeUtility_IsPlayerOnTeamObserver( player ) || IsSpectatorSpectatingPlayer( player )
	bool isAllies = team == AllianceProximity_GetAllianceFromTeamWithObserverCorrection( player.GetTeam() )

	if ( isObserver )
		isAllies = team == ALLIANCE_A

	vector color  = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.FRIENDLY_OWNED, true )
	if( !isAllies )
		color  = GamemodeUtility_GetColorVectorForCaptureObjectiveState( eGamemodeUtilityCaptureObjectiveColorState.ENEMY_OWNED, true )

	return color
}
#endif          

#if CLIENT
string function TDM_SetScoreboardTitle()
{
	return Localize( "#GAMESTATE_ROUND_N", GetRoundsPlayed() + (GetGameState() >= eGameState.WinnerDetermined ? 0 : 1) ).toupper()
}
#endif          

#if CLIENT
bool function TDM_SetScoreboardEnabled()
{
	return !TDM_GetIsRoundTransition()
}
#endif          

      