                       

global function FreeDM_GamemodeInitShared
global function FreeDM_GetScoreLimit
global function FreeDM_GetOtherTeam
global function FreeDM_IsActiveGameMode
global function FreeDM_RegisterNetworking

#if SERVER
                                         
                                              
                                   
                                     
                                                   
                                              
                                                      
                                  
                                             
#endif          

#if CLIENT
global function FreeDM_GamemodeInitClient
global function FreeDM_ScoreboardSetup
global function FreeDM_SetScoreboardSetupFunc
global function FreeDM_SetIsScoreText
global function FreeDM_SetDisplayScoreThread
global function FreeDM_SetCustomIndicatorCallBack
global function FreeDM_SetCharacterInfo
global function ServerCallback_FreeDM_AirdropNotification
global function ServerCallback_FreeDM_AnnounceRoundWonLost
global function UICallback_FreeDM_OpenCharacterSelect
global function FreeDM_CloseCharacterSelect
global function ServerCallback_FreeDM_DisplayMatchTimeLimitWarning
#endif          

const string FREEDM_SECONDARY_SCORE_NAME = "FreeDM_SecondaryPoints"
global const float FREEDM_MESSAGE_DURATION = 5.0
const float FREEDM_MATCH_TIME_LIMIT_WARNING_TIME = 300.0                                                                       

#if SERVER
                                                                                                                                
#endif          

#if CLIENT
const string FREEDM_SFX_MATCH_TIME_LIMIT = "Ctrl_Match_End_Warning_1p"
#endif          

global const array<string> FREEDM_DISABLED_BATTLE_CHATTER_EVENTS = [
"bc_anotherSquadAttackingUs",
"bc_squadsLeft2",
"bc_squadsLeft3",
"bc_squadsLeftHalf",
"bc_twoSquaddiesLeft",
"bc_championEliminated",
"bc_killLeaderNew",
"bc_podLeaderLaunch",
"bc_imJumpmaster",
"bc_returnFromRespawn",
]

global const array<int> FREEDM_DISABLED_COMMS_ACTIONS = [
                         
eCommsAction.INVENTORY_NO_AMMO_BULLET,
eCommsAction.INVENTORY_NO_AMMO_ARROWS,
eCommsAction.INVENTORY_NO_AMMO_HIGHCAL,
eCommsAction.INVENTORY_NO_AMMO_SHOTGUN,
eCommsAction.INVENTORY_NO_AMMO_SNIPER,
eCommsAction.INVENTORY_NO_AMMO_SPECIAL,
      
]

#if SERVER
                     
 
	                            
	                         
	                           
	                                    
	                          
 
#endif

struct {
#if SERVER
	                                            
	                       
	                   

	                                                                                       
	                                                                          

	                                          
	                          
#endif          

#if CLIENT
	bool                          isScoreText = false
	asset functionref( int team ) getCustomIndicatorCallback = null
	void functionref()			  displayScoreThread = null
	void functionref()			  scoreboardSetupFunc = null
#endif          
} file

void function FreeDM_GamemodeInitShared()
{
	SetScoreEventOverrideFunc( FreeDM_SetScoreEventOverride )
	GamemodeSurvivalShared_Init()

	RegisterNetworkedVariable( FREEDM_SECONDARY_SCORE_NAME, SNDC_PLAYER_GLOBAL, SNVT_BIG_INT, 0 )

	Remote_RegisterClientFunction( "ServerCallback_FreeDM_AirdropNotification")
	Remote_RegisterClientFunction( "ServerCallback_FreeDM_AnnounceRoundWonLost", "int", 0, 128)
	Remote_RegisterClientFunction( "FreeDM_CloseCharacterSelect")
	Remote_RegisterClientFunction( "ServerCallback_FreeDM_DisplayMatchTimeLimitWarning", "bool" )

	#if CLIENT
		FreeDM_SetDisplayScoreThread( DisplayScore )
		AddCallback_OnPlayerLifeStateChanged( FreeDM_OnPlayerLifeStateChanged )

		SetCustomScreenFadeAsset($"ui/screen_fade_teamdeathmatch.rpak")
		FreeDM_SetScoreboardSetupFunc( FreeDM_BaseScoreboardSetup )
		HudTargetInfo_Enable( false )
	#endif

#if SERVER
	                                                                                         
#endif

	                                       
	if ( GetFreeDMAreAirdropsEnabled() )
	{
		TimedEventData airdropData

		#if SERVER
			                                   
			                                            
			                                                                   
			                               
			                              
			                            
			                                                                             
			                                  
		#endif

		#if CLIENT
			airdropData.colorOverride = COLOR_WHITE
			airdropData.eventName = "#EVENT_AIRDROP_NAME"
			airdropData.eventDesc = "#EVENT_AIRDROP_DESC"
		#endif

		TimedEvents_RegisterTimedEvent( airdropData )
	}

                          
                 
       
                     
            
       
                         
		GunGame_Init()
       
                     
            
       
                     
            
       
                     
            
       
}

#if SERVER
                                         
 
	                                                           
	                       

	                   

	                                                                 

	                           
	                          
	                                                        

	                                                 
	                                                     
	                                                        
	                                                    
	                                                          
	                                                      

	                                                                                                              
	                                                     

	                                                                                                

	                                              

	                                                                                  
	                                                                                

	                                                                              

	                            
	                                                                                                                 
	                                                                             
	                                                                             
	                                                                                   
	                                                                                         
	                                                                                     
	                                                                                  
	                                                                                 
	                                                                                  
	                                                                                   
	                                                                                   
	                                                                                 
	                                                                                  
	                                                                                  
	                                                                                  
	                                                                            
	                                                                       

	                                      
	 
		                                                                        
		                                                                          
	 

	                  

	                   
	                               
 
#endif          

void function FreeDM_RegisterNetworking()
{
	Remote_RegisterClientFunction( "ServerCallback_FreeDMScoreEvent", "int", INT_MIN, INT_MAX)
}

#if SERVER
                                 
 
	                                  
	                                    
	                                                 
	                                      

	                                     
	                                              
	                                           
	                                                    

	                                
	                                    

	                                     
	                                                

	                                                           
	                                        

                   
		                                        
                         
 
#endif          

                                                                                        
float function GetMinJIPTime()
{
	return GetCurrentPlaylistVarFloat( "min_jip_time", 30.0 )
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

const string FREEDM_AIRDROP_ANIMATION = "droppod_loot_drop_lifeline"

#if SERVER
                     
                                                                                                                                                                   
                                                                                                                                                            
 
	                                               

	                 

	                                                              
	                                                                   
	                                                                                                            
	                                                                                                
	                  
	                    

	            
		                     
		 
			                     
			 
				                    
					                
			 
		 
	 

	                              
	                             
	                           
	                               

	                                            
	 
		                                                                                                                                                                                                                
	 

	                                                                                                       

	                                   
	                                                   
	                                            

	                                                                                                  
 
#endif          

#if SERVER
                                                                                                                                                                                                                           
                                                         
                                                           
	                                     
	                                     
	                                     
	                                     
                                                                                                                                                
                                                                          
                                                                    
                                                                                        
 
	                                                   
		      

	                                                                           
	                                                                                                    
		      

	                                
	 
		                                              
		                                                                               
		                   
		 
			                                                                                                                                      
			                                                                                      
			 
				                                                                                                                              

				                                 
				 
					                                                                           
					                                                                                                                                  
				 
			 
		 
	 
 
#endif                                     

#if CLIENT
                                                                               
void function ServerCallback_FreeDM_AirdropNotification()
{
	entity player = GetLocalViewPlayer()
	if ( !IsValid( player ) || player.GetTeam() == TEAM_SPECTATOR)
		return

	string announcementText

	announcementText = Localize( "#FREEDM_INCOMING_AIRDROPS" )

	vector announcementColor = <0, 0, 0>
	Obituary_Print_Localized( announcementText, announcementColor )
	AnnouncementMessageRight( player, announcementText, "", SrgbToLinear( announcementColor / 255 ), $"", FREEDM_MESSAGE_DURATION, SFX_HUD_ANNOUNCE_QUICK, SrgbToLinear( announcementColor / 255 ) )
}
#endif          

#if SERVER
                                                                
 
	                   
	                                                                                                                                                                                                                          

	                                                   
	                                                                                                                                                                                                            
 
#endif          

const string FREEDM_DEFAULT_AIRDROP_CONTENTS = "arenas_red_airdrop_weapons arenas_gold_airdrop_weapons arenas_gold_airdrop_weapons"

#if SERVER
                        
                                                 
 
	                             
	                            
	                                                    

	                                                                             
	                                      

	                                                                                                                                           
	                                                
	 
		                             
		                                     
		                                                                               
	 

	                                      
	                      
 
#endif          

void function FreeDM_SetScoreEventOverride()
{
	ScoreEvent_SetGameModeRelevant( GetScoreEvent( "KillPilot" ) )
}

int function FreeDM_GetScoreLimit()
{
	                                                                                                  
	return GetScoreLimit_FromPlaylist()
}

#if CLIENT
void function FreeDM_GamemodeInitClient()
{
	SetGameModeSuddenDeathAnnouncementSubtext( "#GAMEMODE_ANNOUNCEMENT_SUDDEN_DEATH_TDM" )
	SURVIVAL_SetGameStateAssetOverrideCallback( FreeDM_OverrideGameState )

	                                                           
	ClGamemodeSurvival_Init()

	AddCallback_GameStateEnter( eGameState.Playing, Client_OnGameStatePlaying )
}
#endif          

#if CLIENT
void function FreeDM_OnPlayerLifeStateChanged( entity player, int oldState, int newState )
{

}
#endif

#if CLIENT
void function Client_OnGameStatePlaying()
{
	HudTargetInfo_Enable( true )

	if( file.displayScoreThread != null )
		thread file.displayScoreThread()
	else
		Warning( "FreeDM displayScoreThread is null! No score HUD will be displayed" )
}
#endif          

#if CLIENT
void function DisplayScore()
{
	var rui = RuiCreate( $"ui/freedm_score_tracker.rpak", clGlobal.topoFullscreenHudPermanent, RUI_DRAW_HUD, MINIMAP_Z_BASE + 10 )

	while( GetGameState() < eGameState.WinnerDetermined )
	{
		WaitFrame()

		entity localPlayer = GetLocalViewPlayer()
		if( !IsValid( localPlayer ) )
			continue

		int myTeam = localPlayer.GetTeam()
		if( myTeam == TEAM_SPECTATOR )
			continue

		RuiSetInt( rui, "scoreLimit", GetCurrentPlaylistVarInt( "scorelimit", 30 ) )
		RuiSetBool( rui, "roundsEnabled", IsRoundBased() )

		if ( AllianceProximity_IsUsingAlliances() )
		{
			for ( int allianceIndex = 0; allianceIndex < AllianceProximity_GetMaxNumAlliances() ; allianceIndex++ )
			{
				int myAlliance = AllianceProximity_GetAllianceFromTeam(myTeam)
				int allianceScore = GetAllianceTeamsScore(allianceIndex)

				int uiAllianceId = AllianceProximity_GetUIAlliance( allianceIndex  )
				if ( uiAllianceId == 0 )
				{
					RuiSetInt( rui, "teamScoreIMC", allianceScore )
					RuiSetInt( rui, "teamRoundsWon0", GameRules_GetTeamScore2(myTeam) )
				}
				else
				{
					RuiSetInt( rui, "teamScoreMilitia", allianceScore )
					array<entity> players = AllianceProximity_GetAllPlayersInAlliance(allianceIndex, false)
					if (players.len() > 0 )
						RuiSetInt( rui, "teamRoundsWon1", GameRules_GetTeamScore2(players[0].GetTeam()) )
				}
			}
		}
		else
		{
			RuiSetInt( rui, "teamScoreIMC", GameRules_GetTeamScore( TEAM_IMC ) )
			RuiSetInt( rui, "teamScoreMilitia", GameRules_GetTeamScore( TEAM_MILITIA ) )
		}

		RuiSetImage( rui, "customIndictorIMCTeam", GetCustomIndicator( TEAM_IMC ) )
		RuiSetImage( rui, "customIndictorMilitiaTeam", GetCustomIndicator( TEAM_MILITIA ) )
	}

	RuiDestroy( rui )
}
#endif          

#if CLIENT
void function FreeDM_ScoreboardSetup()
{
	if( file.scoreboardSetupFunc != null )
		file.scoreboardSetupFunc()
}
#endif          

#if CLIENT
void function FreeDM_SetScoreboardSetupFunc( void functionref() scoreBoardFunc )
{
	file.scoreboardSetupFunc = scoreBoardFunc
}
#endif

#if CLIENT
void function FreeDM_BaseScoreboardSetup()
{
	clGlobal.showScoreboardFunc = ShowScoreboardOrMap_Teams
	clGlobal.hideScoreboardFunc = HideScoreboardOrMap_Teams
	Teams_AddCallback_ScoreboardData( FreeDM_GetScoreboardData )
	Teams_AddCallback_Header( FreeDM_ScoreboardUpdateHeader )
	Teams_AddCallback_PlayerScores( FreeDM_GetPlayerScores )
	Teams_AddCallback_SortScoreboardPlayers( FreeDM_SortPlayersByScore )
}
#endif          

#if CLIENT
ScoreboardData function FreeDM_GetScoreboardData()
{
	ScoreboardData data
	data.numScoreColumns = 3

	data.columnDisplayIcons.append( $"rui/hud/gamestate/player_kills_icon" )
	data.columnDisplayIconsScale.append( 1.0 )
	data.columnNumDigits.append( 2 )

	data.columnDisplayIcons.append( $"rui/hud/gamestate/assist_count_icon2" )
	data.columnDisplayIconsScale.append( 0.8 )
	data.columnNumDigits.append( 2 )

	data.columnDisplayIcons.append( $"rui/hud/gamestate/player_damage_dealt_icon" )
	data.columnDisplayIconsScale.append( 1.0 )
	data.columnNumDigits.append( 4 )

	return data
}
#endif          

#if CLIENT
array< string > function FreeDM_GetPlayerScores( entity player )
{
	array< string > scores

	string eliminations = string( player.GetPlayerNetInt( "kills" ) )
	scores.append( eliminations )

	string assists = string( player.GetPlayerNetInt( "assists" ) )
	scores.append( assists )

	string damage = string( player.GetPlayerNetInt( "damageDealt" ) )
	scores.append( damage )

	return scores
}
#endif          


#if CLIENT
array< entity > function FreeDM_SortPlayersByScore( array< entity > teamPlayers, ScoreboardData gameData )
{
	teamPlayers.sort( int function( entity a, entity b )
	{
		                               
		int aScore = a.GetPlayerNetInt( "kills" )
		int bScore = b.GetPlayerNetInt( "kills" )

		if ( aScore > bScore ) return -1
		else if ( aScore < bScore ) return 1
		return 0
	}
	)

	return teamPlayers
}
#endif          

#if CLIENT
void function FreeDM_ScoreboardUpdateHeader( var headerRui, var frameRui, int team )
{

}
#endif          

#if CLIENT
void function ServerCallback_FreeDM_AnnounceRoundWonLost(int winningTeam)
{
	entity localPlayer = GetLocalViewPlayer()
	int myTeam = localPlayer.GetTeam()
	if( myTeam == TEAM_SPECTATOR )
		return

	if( myTeam == winningTeam || ( AllianceProximity_IsUsingAlliances() && AllianceProximity_GetTeamsInSameAllianceAsTeam( winningTeam ).contains( myTeam )))
		AnnouncementMessageSweep( localPlayer, Localize( "#GAMEMODE_ROUND_WIN"))
	else
		AnnouncementMessageSweep( localPlayer, Localize( "#GAMEMODE_ROUND_LOSS"))
}
#endif          

#if CLIENT
void function AnnouncementMessageWarning( entity player, string messageText, vector titleColor, string soundAlias, float duration )
{
	AnnouncementData announcement = Announcement_Create( messageText )
	Announcement_SetHeaderText( announcement, " " )
	Announcement_SetSubText( announcement, " " )
	Announcement_SetStyle( announcement, ANNOUNCEMENT_STYLE_GENERIC_WARNING )
	Announcement_SetSoundAlias( announcement, soundAlias )
	Announcement_SetPurge( announcement, true )
	Announcement_SetPriority( announcement, 200 )                                                        
	Announcement_SetDuration( announcement, duration )

	Announcement_SetTitleColor( announcement, titleColor )
	Announcement_SetVerticalOffset( announcement, 140 )
	AnnouncementFromClass( player, announcement )
}
#endif          

#if CLIENT
                                                                                                 
void function ServerCallback_FreeDM_DisplayMatchTimeLimitWarning( bool isFinalWarning )
{
	entity player = GetLocalViewPlayer()
	if ( !IsValid( player ) )
		return

	                                                                                                 
	if ( FREEDM_MATCH_TIME_LIMIT_WARNING_TIME < 60 )
		return

	                                                 
	string message = Localize( "#CONTROL_MATCH_TIMELIMIT_WARNING", FREEDM_MATCH_TIME_LIMIT_WARNING_TIME/ 60 )
	if ( isFinalWarning )
		message = Localize( "#CONTROL_MATCH_TIMELIMIT_GAMEEND" )

	AnnouncementMessageWarning( player, message, <255, 95, 58>, FREEDM_SFX_MATCH_TIME_LIMIT, FREEDM_MESSAGE_DURATION )
}
#endif          

#if CLIENT
void function UICallback_FreeDM_OpenCharacterSelect()
{
	                                                                                                     
	if ( !FreeDM_IsActiveGameMode() )
		return

	HideScoreboard()
	OpenCharacterSelectNewMenu( true, true )
}
#endif          

#if CLIENT
void function FreeDM_CloseCharacterSelect()
{
	if ( !FreeDM_IsActiveGameMode() )
		return

	HideScoreboard()
	CloseCharacterSelectNewMenu()
}
#endif          

#if CLIENT
void function FreeDM_OverrideGameState()
{
	                                                    
	ClGameState_RegisterGameStateAsset( $"ui/gamestate_freedm_mode.rpak" )
	ClGameState_RegisterGameStateFullmapAsset( $"ui/gamestate_info_fullmap_freedm.rpak" )
}
#endif          

#if CLIENT
void function FreeDM_SetIsScoreText( bool val )
{
	file.isScoreText = val
}
#endif          

#if CLIENT
bool function IsScoreText( )
{
	return file.isScoreText
}
#endif          

#if CLIENT
void function FreeDM_SetDisplayScoreThread( void functionref() displayFunc )
{
	file.displayScoreThread = displayFunc
}
#endif

#if CLIENT
void function FreeDM_SetCustomIndicatorCallBack( asset functionref( int team) func )
{
	file.getCustomIndicatorCallback = func
}
#endif          

#if CLIENT
asset function GetCustomIndicator( int team )
{
	return file.getCustomIndicatorCallback == null ? $"" : file.getCustomIndicatorCallback( team )
}
#endif          

#if CLIENT
void function FreeDM_SetCharacterInfo( var rui, int infoIndex, entity player )
{
	if( !IsValid( player ) )
		return

	ItemFlavor character = LoadoutSlot_GetItemFlavor( ToEHI( player ), Loadout_Character() )

	RuiSetImage( rui, "portraitImage_" + infoIndex, CharacterClass_GetGalleryPortrait( character ) )
	RuiSetBool( rui, "portraitImageVisible_" + infoIndex, true )
	RuiSetColorAlpha( rui, "portraitBorderColor_" + infoIndex, SrgbToLinear( GetPlayerInfoColor( player ) / 255.0 ), 1.0 )
}
#endif          

int function FreeDM_GetNumTeams()
{
	int teams = 0;
	if ( AllianceProximity_IsUsingAlliances() )
		teams = AllianceProximity_GetMaxNumAlliances()
	else
		teams = GetNumTeamsExisting()
	return teams
}

int function FreeDM_GetOtherTeam( int team )
{
	return -team + ( TEAM_IMC + TEAM_MILITIA )
}

int function FreeDM_GetCratesPerAirDrop()
{
	return GetCurrentPlaylistVarInt( "freedm_airdrops_crates_per_airdrop", 1 )
}

bool function FreeDM_IsActiveGameMode()
{
    return GameRules_GetGameMode() == GAMEMODE_FREEDM
}

float function GetDroppedLootLifetime()
{
	return GetCurrentPlaylistVarFloat( "freedm_dropped_loot_persist_time", -1.0 )
}

bool function GetFreeDMAreAirdropsEnabled()
{
	return GetCurrentPlaylistVarBool( "freedm_airdrops_enabled", false )
}
float function GetFreeDMAirdropTimeDelay()
{
	return GetCurrentPlaylistVarFloat( "freedm_airdrops_time_delay", 30 )
}

float function GetDroppedLootCleanupScanPeriod()
{
	return GetCurrentPlaylistVarFloat( "freedm_dropped_loot_cleanup_scan_period", 0.0 )
}

bool function GetShouldShuffleLoadoutsRounds()
{
	return GetCurrentPlaylistVarBool( "round_shuffle_loadouts", false )
}
      