                                

global function AprilFools_S12_Mode_Init
global function AprilFools_S12_Map_Init
global function IsAprilFoolsNessieSwap
global function ShGameMode_AprilFools_S12_RegisterNetworking

#if CLIENT
global function ServerToClient_OnEnterNessieTrigger
global function ServerToClient_OnLeaveNessieTrigger
#endif

#if DEV
#if SERVER
                                       
#endif
#endif

global const string APRIL_FOOLS_12_PLAYLIST_VAR = "is_april_fools_s12"
global const string APRIL_FOOLS_SPIDER_LIFETIME_PLAYLIST_VAR = "april_fools_spider_lifetime"
global const string APRIL_FOOLS_WATTSON_LAUGH_PLAYLIST_VAR = "april_fools_wattson_laugh"

const string APRIL_FOOLS_NESSIE_AUDIO_PLAYLIST_VAR = "use_nessie_schedule_audio"
const string APRIL_FOOLS_NESSIE_SWAP_PLAYLIST_VAR = "april_fools_nessie"
const string APRIL_FOOLS_SPAWN_EGGS_PLAYLIST_VAR = "april_fools_spawn_eggs"
const string APRIL_FOOLS_ALLOW_NESSIE_CHARMS_PLAYLIST_VAR = "april_fools_allow_nessie_charms"
const string APRIL_FOOLS_DISABLE_MAPS_PLAYLIST_VAR = "april_fools_disable_maps"
const string APRIL_FOOLS_SPAWN_ALL_EGGS_PLAYLIST_VAR = "april_fools_debug_all_eggs"
const string APRIL_FOOLS_CONFETTI_ENABLED_PLAYLIST_VAR = "april_fools_enable_confetti"

const string SIG_NESSIE_OUT_OF_RANGE = "NessieOutOfRange"
const string SIG_NESSIE_STATE_CHANGED = "NessieStateChanged"

global const asset APRIL_FOOLS_NESSIE_MDL = $"mdl/props/nessie/nessie_april_fools.rmdl"

const asset VFX_APRIL_FOOLS_NESSIE_DEATH = $"ball_confetti"

global const float APRIL_FOOLS_NESSIE_SPIDER_SCALE = 2.4      
const vector APRIL_FOOLS_NESSIE_SPIDER_OFFSET = <0, 0, 0>             
const vector APRIL_FOOLS_NESSIE_SPIDER_ANGLES = <0, 0, 0>

const float APRIL_FOOLS_NESSIE_PROWLER_SCALE = 5    
const vector APRIL_FOOLS_NESSIE_PROWLER_OFFSET = <0, 0, 0>            
const vector APRIL_FOOLS_NESSIE_PROWLER_ANGLES = <0, 0, 0>

const int APRIL_FOOLS_SHOTGUN_EGG_COUNT = 8
const vector APRIL_FOOLS_EGG_BEAM_OFFSET = <3, 20, 0>

const float NESSIE_SPIDER_WALK_SPEED = 50
const float NESSIE_SPIDER_RUN_SPEED = 150
const float NESSIE_PROWLER_WALK_SPEED = 35
const float NESSIE_PROWLER_RUN_SPEED = 150

const int NESSIE_SCHEDULE_WAKEUP_DIST = 2600
const int NESSIE_SCHEDULE_WAKEUP_SEC = 5

const string NESSIE_SPIDER_SCRIPT_NAME = "nessie_spider_script"
const string NESSIE_PROWLER_SCRIPT_NAME = "nessie_prowler_script"
const string NESSIE_TRIGGER_SCRIPT_NAME = "nessie_trigger_script"

const string APRIL_FOOLS_SHOTGUN = "mp_weapon_shotgun_pistol_april_fools"
const string CHARACTER_WATTSON = "character_wattson"

        
const string SFX_EGG_LOOP = "AFLTM_Egg_AttractLoop"
const string SFX_EGG_AF_EXPLODE = "AFLTM_EggBurst"

const string SFX_NESSIE_WALK_LOOP = "AFLTM_FootstepCluster_Wander"
const string SFX_NESSIE_RUN_LOOP = "AFLTM_FootstepCluster_Chase"
const string SFX_NESSIE_ATTACK_A = "AFLTM_Vocal_AttackTell"
const string SFX_NESSIE_ATTACK_B = "AFLTM_Vocal_AttackTell_VoxOnly"
const string SFX_NESSIE_ATTACK_C = "AFLTM_Vocal_AttackTell_Charge"
const string SFX_NESSIE_DEFAULT_SQUEAK = "AFLTM_Vocal_Wander"
const string SFX_NESSIE_DEATH = "AFLTM_Vocal_Death"

enum eNessieState {
	IDLE,
	ATTACK,
	RANGED_ATTACK,
	LUNGE,
	ROAR,
	WALK,
	RUN,
	SKIP
}

#if SERVER
                                                                                                                          
                                                                                              
#endif

struct{
	#if SERVER
		                  
		                                                    
		       
			                     
		      
	#endif
}file

bool function IsAprilFools()
{
	return GetCurrentPlaylistVarBool( APRIL_FOOLS_12_PLAYLIST_VAR, false )
}

bool function IsAprilFoolsNessieSwap()
{
	return IsAprilFools() && IsNessieSwap()
}

bool function IsNessieSwap()
{
	return GetCurrentPlaylistVarBool( APRIL_FOOLS_NESSIE_SWAP_PLAYLIST_VAR, true )
}

bool function UseEventScheduleAudio()
{
	return GetCurrentPlaylistVarBool( APRIL_FOOLS_NESSIE_AUDIO_PLAYLIST_VAR, true )
}

bool function DebugAllEggs()
{
	return GetCurrentPlaylistVarBool( APRIL_FOOLS_SPAWN_ALL_EGGS_PLAYLIST_VAR, false )
}

bool function IsValidGameMode()
{
	return !IsRankedGame()
}

bool function IsValidMap( string map )
{
	array<string> disabledMaps = split( GetCurrentPlaylistVarString( APRIL_FOOLS_DISABLE_MAPS_PLAYLIST_VAR, "" ), "," )
	return !disabledMaps.contains( map )
}

void function AprilFools_S12_Map_Init(bool areSpidersAlreadyLoaded)
{
	#if SERVER
		                    
		                               
		 
			                           

			                                                                 
			                                        
			                                              
			                                                     
		 

		                                       
		                                                                                   
		 
			                                          
		 
	#endif
}

void function AprilFools_S12_Mode_Init()
{
	if ( !IsAprilFools() )
		return

	if ( !IsValidGameMode() )
		return

	#if CLIENT
		if ( IsNessieSwap() )
		{
			RegisterSignal( SIG_NESSIE_OUT_OF_RANGE )
			RegisterSignal( SIG_NESSIE_STATE_CHANGED )
		}
	#endif

	#if SERVER
		                     
		 
			                                                  
			                                                         
			                                                    
			                                         
		 

		                                                                             
		 
			                                                                                      
			 
				                                                         
			 
			                                 
			 
				                                             
				                                                                              
				                        
			 
		 
	#endif
}

void function ShGameMode_AprilFools_S12_RegisterNetworking()
{
	Remote_RegisterClientFunction( "ServerToClient_OnEnterNessieTrigger", "entity" )
	Remote_RegisterClientFunction( "ServerToClient_OnLeaveNessieTrigger", "entity" )
}

#if SERVER
                                          
 
	                                   
	 
		                                      
	 
 
#endif

             
#if SERVER
                                            
 
	                                                                                                                                                                             
 


                                             
 
	                                                                                                                                                                            
 


                                                                                                                          
 
	                         
		           

	                                                                                                                           

	                                           
	                             
	                                  

	                                 
	                                
	                         

	            
	                         
	                                            
	                                 

	                                         
	                                                  
	                     

	                                                  

	                                                   
	                                                        

	                                                    
	                                    
	                                    
	                                    
	                              
	                        
	                                      
	                        

	                                                      
	                                                      
	                                                              
	                                                   

	                     
	                                               

	             
 

                                                           
 
	                                                                  


	                                                                                   
	 
		                                                                    
		                                                                 
	 

	                                             
	 
		                                                                                                                
		 
			                                      
		 
	 
 

                                                        
 
	                                           
 

                                                                         
 
	                               
		      

	                                             
	 
		                                                     
	 
	    
	 
		                                  
		                                               
	 

	                                         
	                                                                                  
 

                                                                         
 
	                               
		      

	                                                                                                        
	 
		                                                                
	 

	                                         
	                                                                                   
 

                                                   
 
	                          
 
#endif

#if CLIENT
void function ServerToClient_OnEnterNessieTrigger( entity npc )
{
	if ( IsValid( npc ) )
		thread Nessie_Sound_Thread( npc )
}

void function ServerToClient_OnLeaveNessieTrigger( entity npc )
{
	if ( IsValid( npc ) )
		Signal( npc, SIG_NESSIE_OUT_OF_RANGE )
}


void function Nessie_Sound_Thread( entity npc )
{
	npc.EndSignal( "OnDestroy" )
	npc.EndSignal( "OnDeath" )
	npc.EndSignal( SIG_NESSIE_OUT_OF_RANGE )

	string currSequence = ""
	int prevState = -1
	while ( IsValid( npc ) )
	{
		if ( npc.GetCurrentSequenceName() != currSequence )
		{
			currSequence = npc.GetCurrentSequenceName()
			int currState = GetCurrentNessieState ( currSequence )
			if ( currState != prevState )
			{
				Signal( npc, SIG_NESSIE_STATE_CHANGED )
			}
			switch( currState )
			{
				case eNessieState.ATTACK:               
				EmitSoundOnEntity( npc, SFX_NESSIE_ATTACK_A )
				break

				case eNessieState.LUNGE:               
				EmitSoundOnEntity( npc, SFX_NESSIE_ATTACK_C )
				break

				case eNessieState.ROAR:       
				EmitSoundOnEntity( npc, SFX_NESSIE_ATTACK_B )
				break

				case eNessieState.RANGED_ATTACK:              
				EmitSoundOnEntity( npc, SFX_NESSIE_ATTACK_B )
				break

				          

				case eNessieState.RUN:
					thread NessieMovementSound_Thread( npc, SFX_NESSIE_RUN_LOOP )
					thread GenericNessieVocals_Thread( npc )
					break
				case eNessieState.WALK:
					thread NessieMovementSound_Thread( npc, SFX_NESSIE_WALK_LOOP )
					thread GenericNessieVocals_Thread( npc )
					break

				case eNessieState.IDLE:                 
					thread GenericNessieVocals_Thread( npc )
				break;

				case eNessieState.SKIP:                                                            
					break;

				default:                                         
				EmitSoundOnEntity( npc, SFX_NESSIE_DEFAULT_SQUEAK )
				break;
			}
			prevState = currState
		}
		WaitFrame()
	}
}

int function GetCurrentNessieState( string sequence )
{
	if(sequence.find("spdr_idle") >= 0)
		return eNessieState.IDLE

	if(sequence.find("spdr_traverse") >= 0)
		return eNessieState.RUN

	if ( sequence.find( "attack" ) >= 0 )
	{
		                                    
		if ( sequence.find( "success" ) >= 0)
			return eNessieState.SKIP
		if ( sequence.find( "failure" ) >= 0)
			return eNessieState.SKIP

		if ( sequence.find( "lunge" ) >= 0 )
			return eNessieState.LUNGE
		if ( sequence.find( "idle" ) >= 0)
			return eNessieState.ROAR

		return eNessieState.ATTACK
	}

	if ( sequence.find( "ranged_spit" ) >= 0 )
		return eNessieState.RANGED_ATTACK

	if ( sequence.find( "melee" ) >= 0 )
		return eNessieState.ATTACK

	if ( sequence.find( "taunt" ) >= 0 )
		return eNessieState.ROAR

	if ( sequence.find( "threat" ) >= 0 )
		return eNessieState.ROAR

	if ( sequence.find( "run" ) >= 0)
		return eNessieState.RUN

	if ( sequence.find( "sprint" ) >= 0)
		return eNessieState.RUN

	if ( sequence.find( "walk" ) >= 0)
		return eNessieState.WALK

	if ( sequence.find( "trot" ) >= 0)
		return eNessieState.WALK

	return -1
}

void function NessieMovementSound_Thread( entity npc, string loop )
{
	npc.EndSignal( "OnDestroy" )
	npc.EndSignal( "OnDeath" )
	EndSignal( npc, SIG_NESSIE_OUT_OF_RANGE )
	EndSignal( npc, SIG_NESSIE_STATE_CHANGED )
	StopSoundOnEntityByName( npc, SFX_NESSIE_WALK_LOOP )
	StopSoundOnEntityByName( npc, SFX_NESSIE_RUN_LOOP )

	OnThreadEnd(
		function() : ( npc )
		{
			StopSoundOnEntityByName( npc, SFX_NESSIE_WALK_LOOP )
			StopSoundOnEntityByName( npc, SFX_NESSIE_RUN_LOOP )
		}
	)

	EmitSoundOnEntity( npc, loop )
	while( true )
	{
		WaitFrame()
	}
}

void function GenericNessieVocals_Thread( entity npc )
{
	npc.EndSignal( "OnDestroy" )
	npc.EndSignal( "OnDeath" )
	EndSignal( npc, SIG_NESSIE_OUT_OF_RANGE )
	EndSignal( npc, SIG_NESSIE_STATE_CHANGED )

	while( true )
	{
		EmitSoundOnEntity( npc, SFX_NESSIE_DEFAULT_SQUEAK )
		wait RandomIntRange( 1, 3 )
	}
}
#endif

        
#if SERVER
       
                                                    
 
	                           
	                        
 
      

                               
 
	                   
	                   
	                     
	                       

	                       
	 
		                 
			               
			      

		                           
			                   
			      

		                         
			                   
			      

		                             
			                       
			      
	 
 

                             
 
	                                                               
 

                                 
 
	    
	                           
		                                           
		                                          
		                                         
	 

	    
	                           
		                                          
		                                         
	 

	   
	                           
		                                           
		                                              
		                                           
	 

	                                                     
 

                                 
 
	    
	                           
		                                             
		                                            
		                                            
	 

	    
	                           
		                                            
		                                           
		                                          
	 

	   
	                           
		                                           
		                                            
		                                            
	 

	                                                     
 

                                     
 
	    
	                           
		                                           
		                                          
		                                          
	 

	   
	                           
		                                         
		                                          
		                                           
	 

	    
	                           
		                                         
		                                            
		                                          
	 

	                                                     
 

                                                               
 
	       
		                              
		 
			                          
		 

		                                            
		 
			                                 
		 
	      
	                          
 

                                                                                                             
 
	                     
	 
		                                
		                          
		                          
		                    
	 
	    
	 
		                                
		                                
		                                
	 
 

                                                           
 
	                                                
	                               
	                                  
	                                         
	                               
 

                                             
 
	                              
	 
		                             
	 
 

                                              
 
	                                           
	                    
 

                                                         
 
	                                                 
	                                                
	                             
	                                      
	                                                                                               
	                             
	                             
	                          

	                           
	                        
	                                        
	                                       
	                                         
	                                  

	                                                                                                                                     
	                                            
	                                            
	                                           
	                                           

	                                
	                                                           

	            
	                            

	       
	                                                 

	                                                    

	                             

	                
 

                                                                                      
 
	                                                            
	                                                                                                                                                  
	                                                    

	                            
	                                     

	                            
	                          

	            
		                       
		 
			                    
		 
	 

	             
 

                                                       
 
	                              
	                                                       
	                                                                                       

	                                   

	                                                                    
	                                                                 

	                                                                                    

	                                  
 

                                                                             
 
	                                                                              

	                                                                               
 

                                                                                                  
 
	                                                             
	                                               

	                      
	                                      
	                                      
	                                  
	                                    
	                                    
	                                    

	                                              
 

                                                                                                                                                
 
	                                 
	 
		                                                    
		 
			                                                                            
			 
				                                                                  
				                                                                   
				                                            
			 
		 
		                          
	 
 

                                               
 
	                                                                                
	 
		                        
		 
			                                                                                                                                
			                                               
			 
				                                                                                               
			 
		 
	 
 
#endif

      