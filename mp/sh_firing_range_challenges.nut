              

#if SERVER || CLIENT
global function ShFiringRangeChallenges_Init
global function FRC_RegisterChallenge
global function FRC_IsEnabled
#endif

#if SERVER
       
                                        
      

                                 
                               
                               

                                                
                                          
                                     
#endif

#if CLIENT
global function FRC_StartChallengeTimer
global function ServerCallback_FRC_UpdateState
global function ServerCallback_FRC_SetChallengeScore
global function ServerCallback_FRC_SetChallengeKey
global function ServerCallback_FRC_UpdateOutofBounds
global function ServerCallback_FRC_PostGameStats
global function ServerCallback_FRC_MemoriesEffect
#endif

const asset GUNRACK_MODEL = $"mdl/industrial/gun_rack_arm_down.rmdl"
const asset GUNRACK_BASE_MODEL = $"mdl/props/explosivehold_container_01/explosivehold_gunrackcap_01.rmdl"
const vector BASE_ORIGIN_OFFSET = <-10, 0, 0>
const vector BASE_ANGLE_OFFSET = <0, 180, 0>

const float POST_CHALLENGE_WAIT_TIME = 10.0
const int ACTIVE_CHALLENGE_WEAPON_FLAGS = WPT_TACTICAL | WPT_ULTIMATE | WPT_MELEE

const asset FRC_BORDER01_MDL = $"mdl/canyonlands/firingrange_perimetermarker_01.rmdl"
const asset FRC_BORDER02_MDL = $"mdl/canyonlands/firingrange_perimetermarker_02.rmdl"

const string S12E04_STORY_EVENT_NAME = "calevent_s12e04_s12e04_story_challenges"

global enum eFiringRangeChallengeState
{
	FR_CHALLENGE_INACTIVE,
	FR_CHALLENGE_PENDING,
	FR_CHALLENGE_ACTIVE,
	FR_CHALLENGE_POST
}

global enum eFiringRangeChallengeType
{
	FR_CHALLENGE_TYPE_TARGETS_HIT,
	FR_CHALLENGE_TYPE_BEST_DAMAGE,
	FR_CHALLENGE_TYPE_BEST_TIME
}

global struct FiringRangeChallengeRegistrationData
{
	string           challengeName
	string           challengeInteractStr
	string		     challengeStartHint
	string           challengeKey
	vector           gunRackOrigin
	vector           gunRackAngles
	string           gunRackScriptName
	string           weaponRef
	array < string > weaponMods
	asset            weaponMdl
	asset		 	 rewardTracker
	asset		 	 storyRewardTracker

	int   challengeType
	float challengeTime = 0.0
	string borderName = ""
	int borderType = 0
	string outOfBoundsTriggerScriptName = ""

	StatTemplate& statTemplate

	vector playerTeleportPosition
	array <vector> squadSafePosition

	array < string > postGameStats

	void functionref( entity ) challengeSetupFunc
	void functionref( entity ) challengeStartFunc
	void functionref( int ) challengeCleanUpFunc
	void functionref( entity, bool ) challengePostFunc

	            
	int    storyChallengeChapter = -1
	string storyChallengeItemFlav = ""
}

struct FiringRangeChallengeRealmData
{
	int score = 0
	int challengeState = eFiringRangeChallengeState.FR_CHALLENGE_INACTIVE
	string challengeKey = ""
	array < entity > entsToClean
#if SERVER
	                          
	                       
	                        

	                           
	                         
	               
	                              
	                             
	   	                  

	                       
	                  
	              
	                
	                    
#endif

	int target = 0

}

struct
{
	table < string, FiringRangeChallengeRegistrationData > registeredFiringRangeChallenges
	table< int,  FiringRangeChallengeRealmData > firingRangeChallengeDataByRealmTable
	table < string, vector > borderOriginByScriptNameTable

	#if CLIENT
		int score = 0
		int challengeState = eFiringRangeChallengeState.FR_CHALLENGE_INACTIVE
		string challengeKey = ""
		var challengeRui = null
		array< string > registeredChallengeWeaponScriptName
	#endif
} file


                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
  
                               
                            
                            
                            
                            
                            
                            
  
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    


#if SERVER || CLIENT
void function ShFiringRangeChallenges_Init()
{
	if ( GetMapName() != "mp_rr_canyonlands_staging" )                                                  
		return

	if ( !IsFiringRangeGameMode() )
		return

	AddCallback_EntitiesDidLoad( EntitiesDidLoad )

	if ( !FRC_IsEnabled() )
		return

	#if SERVER
		                                                            
		                                                 
		                                               
		                              
		                                    
		                                  
		                                  
		       
			                                  
		      

		                                           
		                                               
	#endif

	#if CLIENT
		RegisterSignal("FRChallengeStarted")
		RegisterSignal("FRChallengeEnded")
		AddLocalPlayerDidDamageCallback( OnLocalPlayerDidDamage )
		AddCreateCallback( "prop_script", FRChallenge_GunCreated )
		AddCinematicEventFlagChangedCallback( CE_FLAG_HIDE_MAIN_HUD_INSTANT, OnFirstDrawCinematicFlagChanged )
		RegisterSignal("FRChallengedEndMemoriesEffect")
		PrecacheParticleSystem( $"P_adrenaline_screen_CP" )
	#endif

	RegisterSignal("FRC_BackInBounds")
	RegisterSignal( "FRChallengeEnded" )

}

bool function FRC_IsEnabled()
{
	return GetCurrentPlaylistVarBool( "s12e04_EnableFRChallenges", false )
}

void function FRC_RegisterChallenge( string challengeKey, FiringRangeChallengeRegistrationData data )
{
	Assert( !(challengeKey in file.registeredFiringRangeChallenges) , "Another firing range challenge with key " + challengeKey + " already registered." )

	                                                                              
	file.registeredFiringRangeChallenges[ challengeKey ] <- data

	#if CLIENT
	file.registeredChallengeWeaponScriptName.append(challengeKey)
	#endif
}

void function EntitiesDidLoad()
{
	#if SERVER
	                                                                 
	 
		                                                                                                                            
		                                                        
		                    

		                                                                                                                                                                              
		                                    
		                                                                      
	 

	                                                                                       
	                                      
	 
		                                                                                   
		                
	 

	                                                                                       
	                                      
	 
		                                                                                   
		                
	 

	                                                                                       
	                                      
	 
		                                                                                   
		                
	 

	                                                             
	                                             
	 
		                                  
		                                                        
		                                               
	 

	                   
	#endif
}
#endif                    

#if SERVER
                                 
 
	                                                                                        
	                                   
	 
		                                                                       
		                                                                       
	 

	                                                                                        
	                                   
	 
		                                                                       
		                                                                       
	 

	                                                                                        
	                                   
	 
		                                                                       
		                                                                       
	 
 

                                                                 
 
	                                                                 
	 
		                                                                      
		                                                                                                                               
	 
 

                                                              
 
	                                                                                       
	                                      
		             

	                                                                                       
	                                      
		             

	                                                                                       
	                                      
		             
 

                                                                                                                          
 
	                                       
	                                                              
	                                                                                 
		                                                    

	                                                              

	                                                                            
	                         
	                       
	                                 
	                               
	                                         

	                                                                      
	                               
		                                                            
	    
		                                                                   

	                               
 

                                                                                       
 
	                                                 
 

                                                                       
 
	                                 

	                         
		      

	                      
		      

	                                         
	                         
		      

	                 

	                                                              
		      

	                                 

	                                                            
		      

	                                                                            
	                                                                      
	                                                                        
	                                                                                                                                 

	                                                                                                            
	                                                
	 
		                                                                   
		                                                                                                        
		                                                                            
		                                              
		 
			                                          
		 
	 
	    
	 
		        
	 

	                                                                
	                                                                                                                                                    

	                                                                    
	                                     
	 
		                             
			        

		                                           
	 

	        

	                                     
	 
		                             
			        

		                                                 
	 

	                                   
	                                                                                           
	                                                                                                                                                       

	        

	                                                                                                                                                                                                                                                    
	                                                                                      

	        

	                                     
	 
		                             
			        

		                                          
	 

	                                                                                                                                                                                                                            
	                                   
 

                                                                                                                                
 
	                         
		      

	                               
	                                                          
	                                  
	                               
	                                                                                       

	                                           
		                                      

	                   
	 
		                              
		                        
		                                                    

		                                                         
		                                                      

		                                               
		                                                   
		                               

		                                          
		                                
		                                
		                                  
		                                  
		      
	 
	    
	 
		         
		                                                                    
		                            
		 
			                             
			                           
			                           
			                               
			                             
			                          
			                               
			                         
			                                        

			                                     
			 
				                             
					        

				                           
					        

				                                                                                           
				                                               
					                                          

				                                        

				                                                          
				                                      
				   
			 
		 
	 
 

                                                                                                                
 
	                         
		      

	                                                        

	                                                                 
	                                                                                                  
	                  
	 
		                                     
	 

	                                           
	                                              
	                         

	                                                                         
	                                                     
	 
		                                                                         
	 
 

                                                        
 
	                                                            
		      

	                                                                          
 

                                                                         
 
	                                                            
		      

	                                                                           
 

                                                   
 
	                                                            
		      

	                                                                                     
	 
		                     
			             
	 

	                                                                    
 

                                                       
 
	                         
		      

	                                 

	                                                            
		      

	                                                                                                                                                          
	 
		                                                                           
	 
 

                                                                                  
 
	                         
		      

	                                 

	                                                            
		      

	                                                                                                                                                          
	 
		                                                                           
	 
 

                                                                                                       
 
	                        
		      

	                                 
	                                                              
		      

	                                                                                                                                                              
		      

	                                                                                                                        
	 
		                                                                           
	 
 

                                                                     
 
	           

	                                                    
		      

	                             
	                       
		      

	                                
	                                                              
		      

	                                                                                                                          
	 
		                                                                                         
		                                                                              
			      

		                                                                             
			      

		                                                                          
	 
 

                                                  
 
	                                                              
		      

	                                                                                                                          
		      

	                                                                                     
	                                                                                 
	 
		                                                                                
	 
	    
	 
		                                       
	 

	                                

	                                                                    
	                                                          
	                                                                  
	                                                                                                                  
	                                                           
	                                                                       
	                                                                    
	                                                              
	                                                                         
	                                                                       
	                                                               
	                                                             
	                                                           
	                                                                 

	                                                                
	                                                                                   

	                                                        
	                                     
	 
		                             
			        

		                                                            
			                                                        

		                                           
	 

	        

	                             
	 
		                                                              
		                                    
		                                                               
		                                                                                                   
		                                                                                            
		                                              
	 

	                                                
	                                  
	                                  
	                           
	                                  
	                                      
	                                   

 	         
	                                     
	 
		                             
			        

		                    
		                                          

		                                                            
		 
			                                                                                               
			                                                                                          
			   
		 
	 

	                                                                    
	                                                                    
 

                                                                              
 
	                       
		      

	                                                          
		      

	                                                              

	                      
	 
		                                                                                  
		                            
		                          
		                                  
	 
	    
	 
		                                                                                  
		                            
		                          
		                                  
	 
 

                                                     
 
	                                
	                                      
	                                       
 

                                          
 
	                          
		            

	                                 

	                                                            
		            

	                                                                                     

	                                                              
		            

	                                                                                                                                                                         
	                                                                                                                   

	                                                                                                                            
	 
		                                                                                    
		                                                                                           
		           
	 
	    
	 
		                                                                                     
		                                                                                        
		            
	 

	           
 

                                            
 
	                          
		      

	                                 

	                                                            
		      

	                                
	 
		                                                                                     
		                                                                                                                       
		                                                                    
			      

		                                                                                                                 

		                      
		                                                                    
		 
			                                                     
			                            
			                       
			                                            
			                                            
		 
	 
 


                                                         
 
	                        
		      

	                                 
	                                                            
		      

	                                                                                     
	                                                                            
		      

	                                                              
		      

	                
	 
		                                                      
			                                       
			                                    
			     
		                                                     
			     
		                                                    
			                                                                               
			                                     
			                                                                                         
			     
		                                                  
			                                        
			                                    
			     
	 

	                                                                       
	                         
		                                                                                

	                                                           
	                                                              
		                                     
 

                                                              
 
	                         
		      

	                                                            
		      

	                                                                                             
	                                                                      
	                              
	 
		                                    
			                                                        
	 
 

                                                      
 
	                                    
	                       

	                                 
	                                                         
	 
		                                                                          
			                                                            
			                                                        
			                                                          
			                                                             
		 
	 

	                                                     
	 
		                                                                              
		      
	 

	                             
	                                                                            
 

                                                                        
 
	                          
		      

	                                 
	                                                            
		      

	                                                                                                                        
		      

	                                                                                                                                
	 
		                                                           
	 
	                                                                                                                                     
	 
		                                                                
	 

	                                                           
	                                                                 

	                                     
	 
		                                                               
	 
 

                                                               
 
	                                    
 

                                                  
 
	                         
		      

	                                 
	                       
		      

	                                
	                                       
	                                

	                                        
		                                    

	                   
	                                                                    

	            
		                                         
		 
			                        
			 
				                                                    

				                                             

				                                                            
				                                                         

				                                              
				                                                  
				                              

				                       
				                      
			 
		 
	 

	                                                   
		           
 

                                                     
 
	                                                            
		            

	                                                                   
 

                                                
 
	                                                            
		            

	                                                                                                                            
 
#endif

#if CLIENT
void function ServerCallback_FRC_UpdateState( int state )
{
	switch ( state )
	{
		case eFiringRangeChallengeState.FR_CHALLENGE_INACTIVE:
			entity player = GetLocalViewPlayer()
			Signal( player, "FRChallengeEnded" )
			file.score = 0
			EnableEmoteProjector ( true )
			break
		case eFiringRangeChallengeState.FR_CHALLENGE_PENDING:
			thread FRC_CreatePendingChallengeUI()
			EnableEmoteProjector ( false )
			break
		case eFiringRangeChallengeState.FR_CHALLENGE_ACTIVE:
			thread FRC_StartChallengeTimer()
			break
		case eFiringRangeChallengeState.FR_CHALLENGE_POST:
			                                          
			                    
			break
	}

	file.challengeState = state
}

void function ServerCallback_FRC_SetChallengeKey( string challengeKey )
{
	file.challengeKey = challengeKey
}

void function ServerCallback_FRC_SetChallengeScore( int score )
{
	RuiSetInt( file.challengeRui, "challengeProgress", score )
}

void function ServerCallback_FRC_UpdateOutofBounds( bool outOfBounds, float timer )
{
	entity player = GetLocalViewPlayer()
	if ( !IsValid ( player ) )
		return

	if ( !outOfBounds )
		Signal( player, "FRC_BackInBounds" )
	else
	{
		thread function() : ( outOfBounds, timer, player )
		{
			EndSignal( player, "OnDestroy" )
			EndSignal( player, "FRChallengeEnded")
			EndSignal( player, "FRC_BackInBounds" )

			OnThreadEnd(
				function() : ()
				{
					if ( IsValid( file.challengeRui ) )
						RuiSetFloat( file.challengeRui, "oOBTimer", -1 )
				}
			)

			if ( IsValid( file.challengeRui ) )
				RuiSetFloat( file.challengeRui, "oOBTimer", timer )

			wait timer
		}()
	}
}

void function ServerCallback_FRC_PostGameStats( int shotsFired, int damageDone, int shotsHit, int critShotsHit )
{
	if ( file.challengeRui == null )
		return

	float accuracy = ( shotsFired > 0 )? float (shotsHit) / float(shotsFired) * 100.0: 0.0
	RuiSetInt( file.challengeRui, "totalStatRows", 4)                               

	var nestedRui = RuiCreateNested( file.challengeRui, "stat" + 0 + "NestedHandle", $"ui/fr_challenge_stat_float.rpak" )
	RuiSetString( nestedRui, "label", Localize("#FR_CHALLENGE_PG_STAT_1") )
	RuiSetFloat( nestedRui, "value", accuracy )

	nestedRui = RuiCreateNested( file.challengeRui, "stat" + 1 + "NestedHandle", $"ui/fr_challenge_stat_int.rpak" )
	RuiSetString( nestedRui, "label", Localize("#FR_CHALLENGE_PG_STAT_4") )
	RuiSetInt( nestedRui, "value", shotsHit )

	nestedRui = RuiCreateNested( file.challengeRui, "stat" + 2 + "NestedHandle", $"ui/fr_challenge_stat_int.rpak" )
	RuiSetString( nestedRui, "label", Localize("#FR_CHALLENGE_PG_STAT_3") )
	RuiSetInt( nestedRui, "value", damageDone )

	nestedRui = RuiCreateNested( file.challengeRui, "stat" + 3 + "NestedHandle", $"ui/fr_challenge_stat_int.rpak" )
	RuiSetString( nestedRui, "label", Localize("#FR_CHALLENGE_PG_STAT_2") )
	RuiSetInt( nestedRui, "value", critShotsHit )
}

void function FRC_CreatePendingChallengeUI()
{
	entity player = GetLocalViewPlayer()
	EndSignal( player, "OnDestroy" )
	EndSignal( player, "FRChallengeEnded")

	var rui = CreateFullscreenRui( $"ui/tutorial_hint_line.rpak" )
	RuiSetString( rui, "buttonText", "" )
	RuiSetString( rui, "gamepadButtonText", "")
	RuiSetString( rui, "hintText", "#CHALLENGE_START_HINT" )
	RuiSetInt( rui, "hintOffset", 0 )
	RuiSetBool( rui, "hideWithMenus", true )

	if ( file.challengeKey in file.registeredFiringRangeChallenges )
	{
		RuiSetString( rui, "hintText", file.registeredFiringRangeChallenges[file.challengeKey].challengeStartHint )

		bool isStoryEventChallenge = false
		int currentBest = FRC_GetChallengeStat( player, file.registeredFiringRangeChallenges[file.challengeKey].statTemplate )
		if ( FRC_IsStoryEventActive() )
		{
			string humanReadableItemFlav = file.registeredFiringRangeChallenges[file.challengeKey].storyChallengeItemFlav
			ItemFlavor flavor = GetItemFlavorByHumanReadableRef( humanReadableItemFlav )
			if ( !Challenge_IsComplete( player, flavor ) )
			{
				currentBest = Challenge_GetGoalVal( flavor, 0 )
				isStoryEventChallenge = true
			}
		}

		if ( currentBest > 0 )
		{
			string hint = ""
			switch ( file.registeredFiringRangeChallenges[file.challengeKey].challengeType )
			{
				case eFiringRangeChallengeType.FR_CHALLENGE_TYPE_BEST_DAMAGE:
					hint = ( isStoryEventChallenge ) ? format( Localize("#FR_CHALLENGE_SC_DMG_GOAL_HINT"), string(currentBest) ) : format( Localize("#FR_CHALLENGE_DMG_GOAL_HINT"), string(currentBest) )
					break
				case eFiringRangeChallengeType.FR_CHALLENGE_TYPE_TARGETS_HIT:
					hint = ( isStoryEventChallenge ) ? format( Localize("#FR_CHALLENGE_SC_TARGET_GOAL_HINT"), string(currentBest) ) : format( Localize("#FR_CHALLENGE_TARGET_GOAL_HINT"), string(currentBest) )
					break
				default:
					break
			}
			RuiSetString( rui, "subText", hint )
		}
	}
	else
	{
		RuiSetString( rui, "hintText", "#FR_CHALLENGE_TARGET_HINT" )
	}

	OnThreadEnd(
		function() : ( rui )
		{
			if ( IsValid( rui ) )
				RuiDestroyIfAlive( rui )
		}
	)

	WaitSignal( player, "FRChallengeStarted")

	RuiSetBool( rui, "hintCompleted", true )

	wait 1.0
}

void function FRC_StartChallengeTimer()
{
	entity player = GetLocalViewPlayer()
	EndSignal( player, "OnDestroy" )
	Signal( player, "FRChallengeStarted" )
	file.challengeRui    = CreateCockpitPostFXRui( $"ui/fr_challenge_timer.rpak", 0 )

	if ( !(file.challengeKey in file.registeredFiringRangeChallenges) )
		return

	float challengeTime = file.registeredFiringRangeChallenges[file.challengeKey].challengeTime

	switch ( file.registeredFiringRangeChallenges[file.challengeKey].challengeType )
	{
		case eFiringRangeChallengeType.FR_CHALLENGE_TYPE_BEST_DAMAGE:
			RuiSetString( file.challengeRui,  "challengeScoreText", "#CHALLENGE_TARGETS_DAMAGE" )
			break
		case eFiringRangeChallengeType.FR_CHALLENGE_TYPE_TARGETS_HIT:
			RuiSetString( file.challengeRui,  "challengeScoreText", "#CHALLENGE_TARGETS_HIT" )
			break
		case eFiringRangeChallengeType.FR_CHALLENGE_TYPE_BEST_TIME:
		default:
			RuiSetString( file.challengeRui,  "challengeScoreText", "" )
			break
	}

	int currentBest = FRC_GetChallengeStat( player, file.registeredFiringRangeChallenges[file.challengeKey].statTemplate )
	if ( FRC_IsStoryEventActive() )
	{
		string humanReadableItemFlav = file.registeredFiringRangeChallenges[file.challengeKey].storyChallengeItemFlav
		ItemFlavor flavor = GetItemFlavorByHumanReadableRef( humanReadableItemFlav )
		if ( !Challenge_IsComplete( player, flavor ) )
		{
			currentBest = Challenge_GetGoalVal( flavor, 0 )
			RuiSetBool( file.challengeRui,  "isStoryChallenge", true )
		}
	}

	if ( file.registeredFiringRangeChallenges[file.challengeKey].challengeName != "" )
	{
		RuiSetString( file.challengeRui, "altIconText", file.registeredFiringRangeChallenges[file.challengeKey].challengeName )
		RuiSetString( file.challengeRui, "challengeTitle", file.registeredFiringRangeChallenges[file.challengeKey].challengeName )
	}

	RuiSetGameTime( file.challengeRui, "countdownGoalTime", Time() + challengeTime )
	RuiSetFloat( file.challengeRui, "timeOutTime", POST_CHALLENGE_WAIT_TIME )
	RuiSetInt( file.challengeRui, "target", currentBest )

	OnThreadEnd(
		function() : ()
		{
			RuiDestroyIfAlive( file.challengeRui )
			file.challengeRui = null
		}
	)

	WaitSignal( player, "FRChallengeEnded")
}

void function OnLocalPlayerDidDamage( entity attacker, entity victim, vector damagePosition, int damageType, float damageAmount )
{
	if ( file.challengeState == eFiringRangeChallengeState.FR_CHALLENGE_ACTIVE )
	{
		if ( !(file.challengeKey in file.registeredFiringRangeChallenges) )
			return

		if ( victim.GetScriptName() != file.challengeKey )
			return

		int challengeType = file.registeredFiringRangeChallenges[file.challengeKey].challengeType

		if ( challengeType == eFiringRangeChallengeType.FR_CHALLENGE_TYPE_BEST_DAMAGE )
		{
			file.score += int(damageAmount)
		}
		else if ( challengeType == eFiringRangeChallengeType.FR_CHALLENGE_TYPE_TARGETS_HIT )
		{
			file.score += 1
		}
		else
		{
			return
		}

		RuiSetInt( file.challengeRui, "challengeProgress", file.score )
	}
}

void function OnFirstDrawCinematicFlagChanged( entity player )
{
	int ceFlags = player.GetCinematicEventFlags()
	if ( ceFlags & CE_FLAG_HIDE_MAIN_HUD_INSTANT )
	{
		Crosshair_SetState( CROSSHAIR_STATE_HIDE_ALL )
		ServerCallback_SetCommsDialogueEnabled( 0 )
	}
	else
	{
		Crosshair_SetState( CROSSHAIR_STATE_SHOW_ALL )
		ServerCallback_SetCommsDialogueEnabled( 1 )
	}
}

void function FRChallenge_GunCreated( entity ent )
{
	if ( file.registeredChallengeWeaponScriptName.find( ent.GetScriptName() ) != -1 )
	{
		AddEntityCallback_GetUseEntOverrideText( ent, FRC_ChallengeGunTextOverride )
	}
}

string function FRC_ChallengeGunTextOverride( entity gun )
{
	entity player = GetLocalViewPlayer()
	if ( !IsValid(player) )
		return ""

	string challengeKey = gun.GetScriptName()
	if ( !(challengeKey in file.registeredFiringRangeChallenges) )
		return ""

	string interactStr = file.registeredFiringRangeChallenges[challengeKey].challengeInteractStr

	if ( !FRC_IsStoryEventActive() )
		return interactStr

	if ( file.registeredFiringRangeChallenges[challengeKey].storyChallengeChapter == -1 )
		return interactStr

	ItemFlavor event = GetItemFlavorByHumanReadableRef( S12E04_STORY_EVENT_NAME )
	string challengeItemFlavStr = file.registeredFiringRangeChallenges[challengeKey].storyChallengeItemFlav
	if (  challengeItemFlavStr == "" )
	{
		return interactStr
	}

	ItemFlavor challengeFlavor = GetItemFlavorByHumanReadableRef( challengeItemFlavStr )
	bool isChallengeAvailable = StoryChallengeEvent_IsChallengeAvailableForPlayer( event, challengeFlavor, player )

	if ( isChallengeAvailable )
	{
		if ( Challenge_IsComplete(player, challengeFlavor ) )
			return  interactStr

		int activeChapter = StoryEvent_GetActiveChapter(player, event)
		bool challengeChapterAfterActive = file.registeredFiringRangeChallenges[challengeKey].storyChallengeChapter > activeChapter
		if ( challengeChapterAfterActive )
		{
			return ( activeChapter == 0 ) ?  "#CHALLENGE_START_PROLOGUE_REQ" : "#CHALLENGE_START_STEP_REQ"
		}
	}
	else
	{
		return "#CHALLENGE_START_LOCKED_REQ"
	}

	if ( !FRC_Story_IsBangalore( player ) )
		return "#CHALLENGE_START_BANGALORE_REQ"

	if ( GetPlayerArrayOfTeam_Connected( player.GetTeam() ).len() > 1 )
		return "#CHALLENGE_START_ALONE_REQ"

	return interactStr
}
#endif

#if SERVER
                                                                          
 
	                                       
		      

	                              
	                                                            
		      

	                                                                                                                        
		      

	                                                                           
		      

	                                                                                                    
		      

	                                                             
 

                                                                          
 
	                                       
		      

	                              
	                                                            
		      

	                                                                                                                        
		      

	                                                                           
		      

	                                                                                                    
		      

	                                                            
 


                                                                                                   
 
	                              
	                                                                                     

	                                                                          
	 
		                                                                                                  
		                                                                            

		                                               
		                                                                
			                          

		                                           

		                                                                   

		                                                                     
	 
	                                                                               
	 
		                                

		                                                                                                                                            
		                                                                   
	 

	                                                                             
 

                                                                                     
 
	                                
	                                       
	                                       

	                                                                                                            

	            
		                       
		 
			                        
				                                                                                         
		 
	 

	                        

	                                                                            
		      

	                                                                                                                                        
		      

	                                                                                  
 

                                                                                                                                       
 
	                         
		      

	                                 

	                                                            
		      

	                                                                                                                        
		      

	                                    
	                                                                                                 
	 
		                                                              
	 

	                              
	                                                             
 
#endif

#if SERVER || CLIENT
int function FRC_GetChallengeStat( entity player, StatTemplate template )
{
	if ( !IsValid ( player ) )
		return 0

	return GetStat_Int( player, ResolveStatEntry( template ) )
}
#endif

#if SERVER || CLIENT
bool function FRC_IsStoryEventActive()
{
	#if DEV
		if( FRC_FakeSkipEvent() )
			return false
	#endif

	ItemFlavor event = GetItemFlavorByHumanReadableRef( S12E04_STORY_EVENT_NAME )
	int now = GetUnixTimestamp()
	if ( !CalEvent_IsActive( event, now ) )
		return false

	return true
}

bool function FRC_CanPickUpWeaponPlayerStatusCheck ( entity player )
{
	if ( player.Anim_IsActive() )
		return false
	if ( player.ContextAction_IsBusy() )
		return false
	if ( player.ContextAction_IsActive() )
		return false
	if ( !player.IsOnGround() )
		return false
	if ( player.IsCrouched() )
		return false
	if ( player.IsSliding() )
		return false
	if ( player.IsTraversing() )
		return false
	if ( player.IsMantling() )
		return false
	if ( player.IsWallRunning() )
		return false
	if ( player.IsWallHanging() )
		return false
	if ( player.IsPhaseShifted() )
		return false
	if ( player.Player_IsSkywardFollowing() )
		return false
	if ( player.Player_IsSkywardLaunching() )
		return false
	if ( StatusEffect_GetSeverity( player, eStatusEffect.placing_phase_tunnel ) )
		return false
	if ( player.GetParent() != null )
		return false
	if ( player.GetPlayerNetBool( "isHealing" ) )
		return false
	if ( player.IsUsingOffhandWeapon( eActiveInventorySlot.mainHand ) )
		return false
	if ( player.IsUsingOffhandWeapon( eActiveInventorySlot.altHand ) )
		return false
	if ( !IsAlive( player ) )
		return false
	if( Bleedout_IsBleedingOut( player ) )
		return false

	return true
}

bool function FRC_GenericCanPickUpWeapon( entity player, entity weapon, int useFlags)
{
	if ( !IsValid ( player ) )
		return false

	if ( !FRC_CanPickUpWeaponPlayerStatusCheck( player ) )
		return false

	return true
}

bool function FRC_CanPickUpWeapon( entity player, entity weapon, int useFlags )
{
	if ( !IsValid ( player ) )
		return false

	if ( !FRC_CanPickUpWeaponPlayerStatusCheck( player ) )
		return false

	if ( !FRC_IsStoryEventActive() )
		return true

	string challengeKey = weapon.GetScriptName()
	if ( challengeKey == "" )
		return true

	if ( !(challengeKey in file.registeredFiringRangeChallenges) )
		return true

	if ( file.registeredFiringRangeChallenges[challengeKey].storyChallengeChapter == -1 )
		return true

	                                       
	ItemFlavor event = GetItemFlavorByHumanReadableRef( S12E04_STORY_EVENT_NAME )
	int activeChapter = StoryEvent_GetActiveChapter(player, event)
	if ( file.registeredFiringRangeChallenges[challengeKey].storyChallengeChapter > activeChapter )
		return false

	string challengeItemFlavStr = file.registeredFiringRangeChallenges[challengeKey].storyChallengeItemFlav
	if (  challengeItemFlavStr == "" )
		return true

	ItemFlavor challengeFlavor = GetItemFlavorByHumanReadableRef( challengeItemFlavStr )
	if ( Challenge_IsComplete( player, challengeFlavor ) )
		return true


	if ( !FRC_Story_IsBangalore( player ) )
		return false

    if ( GetPlayerArrayOfTeam_Connected( player.GetTeam() ).len() > 1 )
		return false

	return true
}

bool function FRC_IsStoryActive( entity player, string challengeKey )
{
	if ( !FRC_IsStoryEventActive() )
		return false

	if ( !(challengeKey in file.registeredFiringRangeChallenges) )
		return false

	if ( file.registeredFiringRangeChallenges[challengeKey].storyChallengeChapter == -1 )
		return false

	ItemFlavor event = GetItemFlavorByHumanReadableRef( S12E04_STORY_EVENT_NAME )
	int activeChapter = StoryEvent_GetActiveChapter(player, event)
	if ( file.registeredFiringRangeChallenges[challengeKey].storyChallengeChapter != activeChapter )
		return false

	string challengeItemFlavStr = file.registeredFiringRangeChallenges[challengeKey].storyChallengeItemFlav
	if (  challengeItemFlavStr == "" )
		return false

	ItemFlavor challengeFlavor = GetItemFlavorByHumanReadableRef( challengeItemFlavStr )
	if ( Challenge_IsComplete( player, challengeFlavor ) )
		return false

	if ( !FRC_Story_IsBangalore( player ) )
		return false

	if ( GetPlayerArrayOfTeam_Connected( player.GetTeam() ).len() > 1 )
		return false

	return true
}

bool function FRC_Story_IsBangalore( entity player )
{
	if ( !IsValid( player ) )
		return false

	ItemFlavor character = LoadoutSlot_GetItemFlavor( ToEHI( player ), Loadout_Character() )
	string characterRef  = ItemFlavor_GetHumanReadableRef( character ).tolower()

	if ( characterRef == "character_bangalore" )
		return true

	return false
}
#endif

#if CLIENT
void function ServerCallback_FRC_MemoriesEffect( bool enable )
{
	entity player = GetLocalViewPlayer()
	if ( !IsValid ( player ) )
		return

	if ( enable )
	{
		thread function() : ( player )
		{
			EndSignal ( player, "OnDestroy" )
			EndSignal ( player, "FRChallengedEndMemoriesEffect" )
			int fxHandle = StartParticleEffectOnEntityWithPos( player, PrecacheParticleSystem( $"P_adrenaline_screen_CP" ), FX_PATTACH_ABSORIGIN_FOLLOW, -1, player.EyePosition(), <0,0,0> )
			EffectSetIsWithCockpit( fxHandle, true )

			OnThreadEnd(
				function() : ( fxHandle )
				{
					ServerCallback_SetCommsDialogueEnabled( 1 )

					if ( !EffectDoesExist( fxHandle ) )
						return

					EffectStop( fxHandle, false, true )
				}
			)

			ServerCallback_SetCommsDialogueEnabled( 0 )

			EffectSetControlPointVector( fxHandle, 1.0, <1,999,0> )

			WaitForever()
		}()
	}
	else
	{
		Signal( player, "FRChallengedEndMemoriesEffect" )
	}
}
#endif

#if DEV
#if CLIENT || SERVER
bool function FRC_FakeSkipEvent()
{
	return GetCurrentPlaylistVarBool( "s12e04_skipevent", false )
}
#endif

#if SERVER
                                                                                               
 
	                          
		      

	                         
	                           
	 
		       
			                                              
			     
		       
			                                              
			     
		       
			                                              
			     
		        
			      
			     
	 

	                                                              
	                                             
		      

	                                                
	                                                                          
 
#endif
#endif

      

