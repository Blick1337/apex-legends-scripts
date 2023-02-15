                       

global function FreeDM_GamemodeInitShared
global function FreeDM_GetOtherTeam
global function FreeDM_IsActiveGameMode
global function FreeDM_RegisterNetworking
global function FreeDM_SetAudioEvent

#if DEV
#if SERVER
                                         
                                   
#endif

#if CLIENT
global function DEV_ScoreTrackAnimateIn
#endif
#endif

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
global function FreeDM_GetScoreboardData
global function FreeDM_SortPlayersByScore
global function FreeDM_GetPlayerScores
global function ServerCallback_FreeDM_AirdropNotification
global function ServerCallback_FreeDM_AnnounceRoundWonLost
global function ServerCallback_FreeDM_ChampionSounds
global function UICallback_FreeDM_OpenCharacterSelect
global function FreeDM_CloseCharacterSelect
global function ServerCallback_SetRespawnOverlay
#endif          

const string FREEDM_SECONDARY_SCORE_NAME = "FreeDM_SecondaryPoints"
global const float FREEDM_MESSAGE_DURATION = 5.0
const float FREEDM_ROUND_WIN_ANNOUNCMENT_TIME = 2.0
const float FREEDM_POST_ROUND_SCOREBOARD_TIME = 3.0
const float FREEDM_COUNTDOWN_TIMER_SHRINK = 3.0

const float FREEDM_INTRO_MUSIC_TIME            = 5.0
const float FREEDM_POST_ROUND_MUSIC_STOP_DELAY = 2.0
const int FREEDM_MUSIC_START_ON_KILLS_LEFT     = 5

const string FREEDM_MUSIC_GAMEPLAY = "Music_GunGame_Gameplay"
const string FREEDM_MUSIC_VICTORY  = "Music_GunGame_Victory"
const string FREEDM_MUSIC_LOSS     = "Music_GunGame_Loss"
const string FREEDM_MUSIC_PODIUM   = "Music_GunGame_Podium"
const string FREEDM_FIREBALL_SFX_PODIUM   = "TDM_Podium_Pyro_FlameBurst_Sequence"
const string FREEDM_SPARKS_SFX_PODIUM   = "TDM_Podium_Pyro_Sparklers"

const float FREEDM_SCORE_VO_BC_DELAY = 6.0                                     
const int FREEDM_NEAR_ENDSCORE_DELTA = 5

const string FREEDM_VICTORY_SOUND = "UI_InGame_GunGame_Victory"
const string FREEDM_DEFEAT_SOUND = "UI_InGame_GunGame_Defeat"


const string FDM_PODIUM_FX_SPARKS_L1 = "sparks_L1"
const string FDM_PODIUM_FX_SPARKS_L2 = "sparks_L2"
const string FDM_PODIUM_FX_SPARKS_R1 = "sparks_R1"
const string FDM_PODIUM_FX_SPARKS_R2 = "sparks_R2"
const string FDM_PODIUM_FX_FIREBALL_L1 = "Fireball_L1"
const string FDM_PODIUM_FX_FIREBALL_L2 = "Fireball_L2"
const string FDM_PODIUM_FX_FIREBALL_R1 = "Fireball_R1"
const string FDM_PODIUM_FX_FIREBALL_R2 = "Fireball_R2"
const string FDM_PODIUM_FX_CONFETTI = "confetti_burst"

const string FDM_PODIUM_SCRIPT_FIREBALL = "script_fireballs"
const string FDM_PODIUM_SCRIPT_SPARKS = "script_sparks"

#if SERVER
                                                                                                                                
#endif          

#if CLIENT
const string FREEDM_SFX_MATCH_TIME_LIMIT = "Ctrl_Match_End_Warning_1p"
const string GUNGAME_COUNTDOWN_SOUND = "UI_InGame_GunGame_Countdown"
const string TDM_VICTORY_SOUND = "TDM_UI_Victory"
const string TDM_LOSS_SOUND = "TDM_UI_Loss"
const string TDM_COUNTDOWN_SOUND = "TDM_UI_InGame_Countdown"
const string TDM_ROUND_WON = "TDM_UI_RoundWon"
const string TDM_ROUND_LOSS = "TDM_UI_RoundLoss"
const string TDM_ROUND_START = "TDM_UI_StartRoundHUD"
#endif          

global enum eFreeDMAudioEvents
{
	Gameplay_Music,
	Victory_Music,
	Loss_Music,
	Podium_Music,
	Podium_Fireball_SFX,
	Podium_Sparks_SFX,
	Victory_Sound,
	Defeat_Sound,

	Count
}

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

#if SERVER
                    
 
	                               
	                               
 
#endif

struct {
#if SERVER
	                                            
	                       
	                   


	                                                                                       
	                                                                          

	                                          
	                          

	                                                   
	                                                                         
	                                                                                                      

	                                      
	                               
#endif          

#if CLIENT
	bool                          isScoreText = false
	var        					  introCountdownRUI = null
	asset functionref( int team ) getCustomIndicatorCallback = null
	void functionref()			  displayScoreThread = null
	void functionref()			  scoreboardSetupFunc = null
	var							  scoreTrackerHUDRui = null
#endif          

	        
	table< int, string > audioEvents
} file

void function FreeDM_GamemodeInitShared()
{
	SetScoreEventOverrideFunc( FreeDM_SetScoreEventOverride )
	GamemodeSurvivalShared_Init()

#if SERVER
	                                                                                         
	                                                            
	                                   
	                                   
	                                   
	                                   
	                                    
	                                    
	                                    
	                                    
	                                 
	                                                                              

#endif

	RegisterNetworkedVariable( FREEDM_SECONDARY_SCORE_NAME, SNDC_PLAYER_GLOBAL, SNVT_BIG_INT, 0 )

	Remote_RegisterClientFunction( "ServerCallback_FreeDM_AirdropNotification")
	Remote_RegisterClientFunction( "ServerCallback_FreeDM_AnnounceRoundWonLost", "int", 0, 128)
	Remote_RegisterClientFunction( "ServerCallback_FreeDM_ChampionSounds", "int", 0, 128)
	Remote_RegisterClientFunction( "FreeDM_CloseCharacterSelect")
	Remote_RegisterClientFunction( "ServerCallback_SetRespawnOverlay" )

	#if CLIENT
		FreeDM_SetDisplayScoreThread( DisplayScore )
		AddCallback_OnPlayerLifeStateChanged( FreeDM_OnPlayerLifeStateChanged )

		SetCustomScreenFadeAsset($"ui/screen_fade_teamdeathmatch.rpak")
		FreeDM_SetScoreboardSetupFunc( FreeDM_BaseScoreboardSetup )
		HudTargetInfo_Enable( false )
		SetShowUnitFrameAmmoTypeIcons(false)
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

	FreeDM_SetAudioEvent( eFreeDMAudioEvents.Gameplay_Music, FREEDM_MUSIC_GAMEPLAY )
	FreeDM_SetAudioEvent( eFreeDMAudioEvents.Victory_Music, FREEDM_MUSIC_VICTORY )
	FreeDM_SetAudioEvent( eFreeDMAudioEvents.Loss_Music, FREEDM_MUSIC_LOSS )
	FreeDM_SetAudioEvent( eFreeDMAudioEvents.Podium_Music, FREEDM_MUSIC_PODIUM )
	FreeDM_SetAudioEvent( eFreeDMAudioEvents.Podium_Fireball_SFX, FREEDM_FIREBALL_SFX_PODIUM )
	FreeDM_SetAudioEvent( eFreeDMAudioEvents.Podium_Sparks_SFX, FREEDM_SPARKS_SFX_PODIUM )
	FreeDM_SetAudioEvent( eFreeDMAudioEvents.Victory_Sound, FREEDM_VICTORY_SOUND )
	FreeDM_SetAudioEvent( eFreeDMAudioEvents.Defeat_Sound, FREEDM_DEFEAT_SOUND )

                          
                 
       
                     
            
       
                         
		GunGame_Init()
       
                     
		TDM_Init()
       
                     
            
       
                     
            
       
}

#if SERVER
                                         
 
	                                                           
	                       

	                                                               

	                                                                 

	                           
	                          
	                                                        

	                                                 
	                                                     
	                                                        
	                                                    
	                                                          
	                                                      

	                                                                                                              
	                                                     

	                                                                                                
	                                                                                                     
	                                              


	                                                                                  
	                                                                                
	                                                                                    
	                                                                        

	                                                                              
	                            
	                                                                                                                 
	                                                                             
	                                                                             
	                                                                                   
	                                                                                         
	                                                                                     
	                                                                                  
	                                                                                 
	                                                                                  
	                                                                                   
	                                                                                   
	                                                                                 
	                                                                                  
	                                                                                  
	                                                                                  
	                                                                            
	                                                                       

	                                      
	 
		                                                                        
		                                                                          
	 

	                               
 
#endif          

void function FreeDM_RegisterNetworking()
{
	Remote_RegisterClientFunction( "ServerCallback_FreeDMScoreEvent", "int", INT_MIN, INT_MAX)
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

void function FreeDM_SetAudioEvent( int event, string eventString )
{
	if( event < 0 || event >= eFreeDMAudioEvents.Count )
	{
		printf( "[FREEDM] - FreeDM_SetMusicEvent invalid event %d", event )
		return
	}

	file.audioEvents[ event ] <- eventString
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

#if CLIENT
void function FreeDM_OnPlayerLifeStateChanged( entity player, int oldState, int newState )
{

}
#endif

#if CLIENT
void function FreeDM_GamemodeInitClient()
{
	SetGameModeSuddenDeathAnnouncementSubtext( "#GAMEMODE_ANNOUNCEMENT_SUDDEN_DEATH_TDM" )
	SURVIVAL_SetGameStateAssetOverrideCallback( FreeDM_OverrideGameState )

	                                                           
	ClGamemodeSurvival_Init()
	AddCallback_GameStateEnter( eGameState.Playing, Client_OnGameStatePlaying )
	AddCallback_GameStateEnter( eGameState.Prematch, Client_OnPrematchInit )
	AddCallback_GameStateEnter( eGameState.WinnerDetermined, Client_OnWinnerDetermined )
	AddCallback_GameStateEnter( eGameState.Resolution, Client_OnResolution )
}
#endif          

#if CLIENT
void function Client_OnPrematchInit()
{
	if ( GameRules_GetTeamScore2( GetLocalViewPlayer().GetTeam() ) >= GetRoundScoreLimit_FromPlaylist() )
		return

	float roundStartTime = GetCurrentPlaylistVarFloat( "freedm_prematch_intro_time", 0.0 )

	                                                                                                                   
	RunUIScript( "UICodeCallback_CloseAllMenus" )

                     
		if ( GetTDMIsActive())
		{
			file.introCountdownRUI = CreateFullscreenPostFXRui( $"ui/freedm_countdown_timer.rpak" )
			RuiSetGameTime( file.introCountdownRUI, "timerStartTime", GetGameStartTime() - roundStartTime )
			RuiSetGameTime( file.introCountdownRUI, "timerEndTime", GetGameStartTime() )
			RuiSetGameTime( file.introCountdownRUI, "shrinkEndTime", GetGameStartTime() + FREEDM_COUNTDOWN_TIMER_SHRINK )
			RuiSetInt( file.introCountdownRUI, "currentRound", GetRoundsPlayed() + 1 )
		}
		else
		{
			file.introCountdownRUI = CreateFullscreenPostFXRui( $"ui/gun_game_intro.rpak" )
			RuiSetFloat( file.introCountdownRUI, "gameStartTime", GetGameStartTime() )
		}
      
                                                                                 
                                                                            
       

	RunUIScript("SetRespawnOverlayTime", Time(), Time() + roundStartTime)
	RunUIScript("SetRespawnOverlayString", Localize( "#ROUND_NUM_IN", GetRoundsPlayed() + 1))
	thread _CountdownIntroSoundThread()
}
#endif          

#if CLIENT
void function _CountdownIntroSoundThread()
{
	                                              
	float countdownTime = 3.0
	wait GetGameStartTime() - Time() - countdownTime

	string countdownSound = GUNGAME_COUNTDOWN_SOUND
                     
		countdownSound = GetTDMIsActive() ? TDM_COUNTDOWN_SOUND : GUNGAME_COUNTDOWN_SOUND
       

	                                                           
	for( int i = 0; i < 3; ++i )
	{
		EmitSoundOnEntity( GetLocalViewPlayer(), countdownSound )
		wait 1.0
	}
}
#endif          


#if CLIENT
void function Client_OnGameStatePlaying()
{
	entity localPlayer = GetLocalViewPlayer()
	if ( IsValid( localPlayer ) )
		localPlayer.ClearMenuCameraEntity()

	HudTargetInfo_Enable( true )
	if( file.displayScoreThread != null )
		thread file.displayScoreThread()
	else
		Warning( "FreeDM displayScoreThread is null! No score HUD will be displayed" )

	thread _DelayedDestroyCountdownRUI( )
}
#endif          

#if CLIENT
void function ServerCallback_SetRespawnOverlay( )
{
	float respawnTime = GetCurrentPlaylistVarFloat( "respawn_cooldown", 5.0 )
	RunUIScript( "SetRespawnOverlayTime", Time(), Time() + respawnTime )
	RunUIScript( "SetRespawnOverlayString", "#RESPAWNING_IN" )
}
#endif          

#if CLIENT
                                                                                             
void function _DelayedDestroyCountdownRUI( )
{
	wait FREEDM_COUNTDOWN_TIMER_SHRINK / 2

	if( file.introCountdownRUI != null )
	{
		RuiDestroyIfAlive( file.introCountdownRUI )
		file.introCountdownRUI = null
	}
}
#endif          

#if CLIENT
void function Client_OnWinnerDetermined( )
{
	int winningTeam = GetWinningTeam()

                     
		                                                                                            
		                                                                      
		if ( !GetTDMIsActive() )
			ServerCallback_FreeDM_ChampionSounds( winningTeam )
                           

	if( !AllianceProximity_IsUsingAlliances() )
	{
		int squadIndex = Squads_GetSquadUIIndex( winningTeam )
		SetVictoryScreenTeamName( Localize( Squads_GetSquadNameLong( squadIndex ) ) )
	}
}
#endif          

#if CLIENT
void function Client_OnResolution( )
{
	entity localPlayer = GetLocalViewPlayer()
	if ( IsValid( localPlayer ) )
		EmitSoundOnEntity( localPlayer, file.audioEvents[eFreeDMAudioEvents.Podium_Music] )
}
#endif          

#if CLIENT
void function DisplayScore()
{
                     
		EmitSoundOnEntity( GetLocalViewPlayer(), TDM_ROUND_START )
                           
	
	wait FREEDM_COUNTDOWN_TIMER_SHRINK / 2
	file.scoreTrackerHUDRui = CreateCockpitPostFXRui ( $"ui/freedm_score_tracker.rpak",MINIMAP_Z_BASE + 10 )
	RuiSetGameTime( file.scoreTrackerHUDRui, "fadeInStartTime", ClientTime())

	thread FreeDM_RoundNStartingAnnouncement( FREEDM_COUNTDOWN_TIMER_SHRINK / 2 )

	while( GetGameState() < eGameState.WinnerDetermined )
	{
		WaitFrame()

		entity localPlayer = GetLocalViewPlayer()
		if( !IsValid( localPlayer ) )
			continue

		int myTeam = localPlayer.GetTeam()

		RuiSetInt( file.scoreTrackerHUDRui, "scoreLimit", GetCurrentPlaylistVarInt( "scorelimit", 30 ) )
		RuiSetBool( file.scoreTrackerHUDRui, "roundsEnabled", IsRoundBased() )
		RuiSetInt( file.scoreTrackerHUDRui, "currentRound", GetRoundsPlayed() + 1 )

		if ( AllianceProximity_IsUsingAlliances() )
		{
			for ( int allianceIndex = 0; allianceIndex < AllianceProximity_GetMaxNumAlliances() ; allianceIndex++ )
			{
				int myAlliance = AllianceProximity_GetAllianceFromTeamWithObserverCorrection( myTeam )
				int otherAlliance = AllianceProximity_GetOtherAlliance( myAlliance )

				int allianceScore = GetAllianceTeamsScore(myAlliance )
				int otherAllianceScore = GetAllianceTeamsScore( otherAlliance )

				RuiSetInt( file.scoreTrackerHUDRui, "teamScoreIMC", allianceScore )
				RuiSetInt( file.scoreTrackerHUDRui, "teamScoreMilitia", otherAllianceScore )
				RuiSetInt( file.scoreTrackerHUDRui, "teamRoundsWon0", GameRules_GetTeamScore2(myTeam) )
				RuiSetInt( file.scoreTrackerHUDRui, "teamRoundsWon1", GameRules_GetTeamScore2(AllianceProximity_GetRepresentativeTeamForAlliance( otherAlliance )) )
			}
		}
		else
		{
			RuiSetInt( file.scoreTrackerHUDRui, "teamScoreIMC", GameRules_GetTeamScore( TEAM_IMC ) )
			RuiSetInt( file.scoreTrackerHUDRui, "teamScoreMilitia", GameRules_GetTeamScore( TEAM_MILITIA ) )
		}

		RuiSetImage( file.scoreTrackerHUDRui, "customIndictorIMCTeam", GetCustomIndicator( TEAM_IMC ) )
		RuiSetImage( file.scoreTrackerHUDRui, "customIndictorMilitiaTeam", GetCustomIndicator( TEAM_MILITIA ) )
	}

	RuiDestroy( file.scoreTrackerHUDRui )
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
		                               
		int aKills = a.GetPlayerNetInt( "kills" )
		int bKills = b.GetPlayerNetInt( "kills" )
		int aAssists = a.GetPlayerNetInt( "assists" )
		int bAssists = b.GetPlayerNetInt( "assists" )
		int aDamage = a.GetPlayerNetInt( "damageDealt" )
		int bDamage = b.GetPlayerNetInt( "damageDealt" )

		if ( aKills > bKills ) return -1
		else if ( aKills < bKills ) return 1
		else
		{
			if ( aAssists > bAssists ) return -1
			else if ( aAssists < bAssists ) return 1
			else
			{
				if ( aDamage > bDamage ) return -1
				else if ( aDamage < bDamage ) return 1
				return 0
			}
		}
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
vector function FreeDM_ScoreboardGetTeamColor( int team )
{
	return < 0,0,0 >
}
#endif          

#if CLIENT
void function ServerCallback_FreeDM_AnnounceRoundWonLost( int winningTeamOrAlliance )
{
	entity localPlayer = GetLocalViewPlayer()
	int localPlayerTeam = localPlayer.GetTeam()
	int localPlayerAlliance = AllianceProximity_GetAllianceFromTeam( localPlayerTeam )
	bool isObserver = GamemodeUtility_IsPlayerOnTeamObserver( localPlayer )

	bool isLocalPlayerOnWinningTeamOrAlliance = AllianceProximity_IsUsingAlliances() ? localPlayerAlliance == winningTeamOrAlliance : localPlayerTeam == winningTeamOrAlliance

	if ( !IsAlive(localPlayer) )
		RunUIScript( "UICodeCallback_CloseAllMenus" )

	if ( isObserver )
	{
		AnnouncementMessageSweep( localPlayer, Localize( "#GAMEMODE_ROUND_WIN") )
	}
	else
	{
		if ( isLocalPlayerOnWinningTeamOrAlliance )
		{
                       
				if ( GetTDMIsActive())
					TDMAnnouncementRoundWon(Localize( "#GAMEMODE_ROUND_WIN"))
				else
					AnnouncementMessageSweep( localPlayer, Localize( "#GAMEMODE_ROUND_WIN"))
        
                                                                            
                             
		}
		else
		{
			AnnouncementMessageSweep( localPlayer, Localize( "#GAMEMODE_ROUND_LOSS"))
                       
				EmitSoundOnEntity( GetLocalViewPlayer(), TDM_ROUND_LOSS )
                             
		}
	}
	thread FreeDM_DelayedShowScoreboard()
}
#endif          

#if CLIENT
void function FreeDM_RoundNStartingAnnouncement( float delay = 0.0 )
{
	wait delay

	if (IsRoundBased())
	{
		wait FREEDM_COUNTDOWN_TIMER_SHRINK / 2
		AnnouncementData announcement = Announcement_Create( Localize( "#GAMESTATE_ROUND_N", GetRoundsPlayed() + 1 ) )
		Announcement_SetStyle( announcement, ANNOUNCEMENT_STYLE_CIRCLE_WARNING )
		Announcement_SetPurge( announcement, true )
		Announcement_SetOptionalTextArgsArray( announcement, [ "true" ] )
		Announcement_SetPriority( announcement, 200 )
		announcement.duration = FREEDM_MESSAGE_DURATION
		AnnouncementFromClass( GetLocalViewPlayer(), announcement )
	}
}
#endif

#if CLIENT
void function TDMAnnouncementRoundWon( string message, string subText = "", float duration = 2.0 )
{
	AnnouncementData announcement = Announcement_Create( message )
	bool displayNow = InitializeAnnouncement_ShouldDisplayNow( announcement, message )
	announcement.subText = subText
	announcement.announcementStyle = ANNOUNCEMENT_STYLE_TDM_ROUND_WON
	announcement.duration = duration
	announcement.drawOverScreenFade = true
	announcement.priority = 1000
	announcement.purge = true

	if ( displayNow )
	{
		thread AnnouncementMessage_Display( GetLocalClientPlayer(), announcement )
		EmitSoundOnEntity( GetLocalViewPlayer(), TDM_ROUND_WON )
	}
}
#endif

#if CLIENT
void function FreeDM_DelayedShowScoreboard()
{
	wait FREEDM_ROUND_WIN_ANNOUNCMENT_TIME

                     
		if (GetTDMIsActive())
		{
			wait FREEDM_POST_ROUND_SCOREBOARD_TIME
			RunUIScript( "TDM_ShowScoreboard" )
			wait FREEDM_POST_ROUND_SCOREBOARD_TIME
			RunUIScript( "TDM_HideScoreboard" )
		}
       
}
#endif          

#if CLIENT
void function ServerCallback_FreeDM_ChampionSounds( int winningTeam )
{
	entity localPlayer = GetLocalViewPlayer()

	if( winningTeam == localPlayer.GetTeam() )
	{
		SetChampionScreenSound( file.audioEvents[eFreeDMAudioEvents.Victory_Sound] )
                      
			EmitSoundOnEntity( localPlayer, TDM_VICTORY_SOUND )
                            
		EmitSoundOnEntity( localPlayer, file.audioEvents[eFreeDMAudioEvents.Victory_Music] )
	}
	else
	{
		SetChampionScreenSound( file.audioEvents[eFreeDMAudioEvents.Defeat_Sound] )
                      
			EmitSoundOnEntity( localPlayer, TDM_LOSS_SOUND )
                            
		EmitSoundOnEntity( localPlayer, file.audioEvents[eFreeDMAudioEvents.Loss_Music] )
	}
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


#if DEV
#if SERVER
                                                                      
 
	                                               
 

                                                    
 
	                      
	                                                            
 
#endif
#endif

#if DEV
#if CLIENT
void function DEV_ScoreTrackAnimateIn()
{
	float roundStartTime = GetCurrentPlaylistVarFloat( "freedm_prematch_intro_time", 0.0 )

	if (file.introCountdownRUI == null)
	{
		                      
		RuiSetGameTime( file.scoreTrackerHUDRui, "fadeInStartTime", RUI_BADGAMETIME )

		                                          
		file.introCountdownRUI = CreateFullscreenPostFXRui( $"ui/freedm_countdown_timer.rpak" )
		RuiSetGameTime( file.introCountdownRUI, "timerStartTime", ClientTime() )
		RuiSetGameTime( file.introCountdownRUI, "timerEndTime", ClientTime() + roundStartTime )
		RuiSetGameTime( file.introCountdownRUI, "shrinkEndTime", ClientTime() + roundStartTime + FREEDM_COUNTDOWN_TIMER_SHRINK )
		wait roundStartTime + FREEDM_COUNTDOWN_TIMER_SHRINK / 2

		                           
		RuiSetGameTime( file.scoreTrackerHUDRui, "fadeInStartTime", ClientTime() )
		wait FREEDM_COUNTDOWN_TIMER_SHRINK / 2

		                          
		RuiDestroyIfAlive(file.introCountdownRUI)
		file.introCountdownRUI = null

		if (IsRoundBased())
		{
			AnnouncementData announcement = Announcement_Create( Localize( "#GAMESTATE_ROUND_N", GetRoundsPlayed() + 1 ) )
			Announcement_SetStyle( announcement, ANNOUNCEMENT_STYLE_CIRCLE_WARNING )
			Announcement_SetPurge( announcement, true )
			Announcement_SetOptionalTextArgsArray( announcement, [ "true" ] )
			Announcement_SetPriority( announcement, 200 )
			announcement.duration = FREEDM_MESSAGE_DURATION
			AnnouncementFromClass( GetLocalViewPlayer(), announcement )
		}
	}
}
#endif
#endif

                               