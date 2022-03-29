#if SERVER || CLIENT
global function TropicsStoryEvents_Init
#endif

              
global function S12E05_GetPhase

#if CLIENT
global function ServerCallback_S12E05CreateScreenRUI
#endif

#if DEV
global function DEV_S12E05_ForceMapIntroScreen
#endif

const array < vector > S12_LEVIATHAN_1_ORIGINS = [ <-64000, 64000, -5000>, <-59019.1, 54491.3, -200>, <-58038.27, 44982.57, -200> ]
const array < vector > S12_LEVIATHAN_2_ORIGINS = [ <-64266, 45000, -5000>, <-64266, 35790, -200>, <-64266.3, 26580.1, -200> ]
const array < vector > S12_LEVIATHAN_1_ANGLES = [ <0, -80, 0>, <0, -80, 0>, <0, -90, 0> ]
const array < vector > S12_LEVIATHAN_2_ANGLES = [ <0, -45, 0>, <0, -45, 0>, <0, -45, 0> ]

const asset LEVIATHAN_MODEL = $"mdl/Creatures/leviathan/leviathan_kingscanyon_animated.rmdl"
const string LEVIATHAN_1_NAME = "tropic_leviathan1"
const string LEVIATHAN_2_NAME = "tropic_leviathan2"

const string S12E05_SCREEN_1_SCRIPTNAME = "s12e05_screen_1"              
const string S12E05_SCREEN_2_SCRIPTNAME = "s12e05_screen_2"               
const string S12E05_SCREEN_3_SCRIPTNAME = "s12e05_screen_3"             
const string S12E05_SCREEN_4_SCRIPTNAME = "s12e05_screen_4"                  

const string S12E05_BONES_SCRIPTNAME = "s12e05_bones"

const asset INTERACTIVE_SCREEN_MODEL = $"mdl/imc_base/monitor_hood_imc_03.rmdl"
const string INTERACTIVE_SCREEN_SCRIPTNAME = "s12e05_interactive_screen"
const vector INTERACTIVE_SCREEN_ORIGIN = <19319, 20206, 12009>
const vector INTERACTIVE_SCREEN_ANGLES = <0, 135, 0>

const vector S12E05_RSCREEN_ORIGIN = <19150.5938, 20574, 12175.2813>
const vector S12E05_CSCREEN_ORIGIN = <19330.0938, 20172, 12175.875>
const vector S12E05_LSCREEN_ORIGIN = <19719.2813, 19994.2813, 12175.2813>


global enum eS12E05State
{
	S12E05_INACTIVE,
	S12E05_PHASE1,		                     
	S12E05_PHASE2,		                   
	S12E05_PHASE3,		                         
	S12E05_PHASE4,		                        
	S12E05_PHASE5,		                                 
}
      

struct
{
              
#if CLIENT
	float lastLevAnimCycleChosen = -1.0
	bool interactRuiCreated = false
	array<bool> infoRuiCreated = [ false, false, false ]
#endif
entity rightScreen
entity centerScreen
entity leftScreen
      
} file


                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
  
                               
                            
                            
                            
                            
                            
                            
  
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    

#if SERVER || CLIENT
void function TropicsStoryEvents_Init()
{
	AddCallback_EntitiesDidLoad( EntitiesDidLoad )

              
		if ( !Control_IsModeEnabled() && !IsPrivateMatch() )
		{
			PrecacheModel( LEVIATHAN_MODEL )
			PrecacheModel( INTERACTIVE_SCREEN_MODEL )
			#if CLIENT
				AddTargetNameCreateCallback( LEVIATHAN_1_NAME, OnLeviathanMarkerCreated )
				AddTargetNameCreateCallback( LEVIATHAN_2_NAME, OnLeviathanMarkerCreated )
				AddCreateCallback( "prop_script", S12E05_InteractiveScreenCreated )
				AddCallback_GameStateEnter( eGameState.WaitingForPlayers, OnWaitingForPlayers_Client )
			#endif

			#if SERVER
				                                                         
				                                                                  
			#endif
		}
      

}
#endif                    

void function EntitiesDidLoad()
{
              
	if ( Control_IsModeEnabled() || IsPrivateMatch() )
		return

	#if SERVER
		                      
		                    
		                  
		                              
	#endif
      
}


              
int function S12E05_GetPhase()
{
	int currentUnixTime  = GetUnixTimestamp()

	if ( currentUnixTime >= expect int( GetCurrentPlaylistVarTimestamp( "s12e05_phase5", UNIX_TIME_FALLBACK_2038 ) ) )
	{
		return eS12E05State.S12E05_PHASE5
	}
	else if ( currentUnixTime >= expect int( GetCurrentPlaylistVarTimestamp( "s12e05_phase4", UNIX_TIME_FALLBACK_2038 ) ) )
	{
		return eS12E05State.S12E05_PHASE4
	}
	else if ( currentUnixTime >= expect int( GetCurrentPlaylistVarTimestamp( "s12e05_phase3", UNIX_TIME_FALLBACK_2038 ) ) )
	{
		return eS12E05State.S12E05_PHASE3
	}
	else if ( currentUnixTime >= expect int( GetCurrentPlaylistVarTimestamp( "s12e05_phase2", UNIX_TIME_FALLBACK_2038 ) ) )
	{
		return eS12E05State.S12E05_PHASE2
	}
	else if ( currentUnixTime >= expect int( GetCurrentPlaylistVarTimestamp( "s12e05_phase1", UNIX_TIME_FALLBACK_2038 ) ) )
	{
		return eS12E05State.S12E05_PHASE1
	}

	return eS12E05State.S12E05_INACTIVE
}

bool function S12E05_IsRoarActive()
{
	int currentUnixTime  = GetUnixTimestamp()

	if ( currentUnixTime < expect int( GetCurrentPlaylistVarTimestamp( "s12e05_phase5", UNIX_TIME_FALLBACK_2038 ) ) )
	{
		return false
	}
	else if( currentUnixTime > ( expect int( GetCurrentPlaylistVarTimestamp( "s12e05_phase5", UNIX_TIME_FALLBACK_2038 ) ) + ( SECONDS_PER_DAY *2 ) ) )
	{
		return false
	}

	return true
}

#if SERVER
                                    
 
	              
	                            
	 
		                                
			         
			     
		                                
			         
			     
		                                
			         
			     
		        
			     
	 

	                  
		      

	                                                                                                                   
	                                                                                                                   
 

                                                       
 
	                                                      
		      

	                          
		      

	                                                                                              
	                                    
		      

	                                             
		      

	                                                                               
 

                                                                                                 
 
	                                                                                             
	                                
	                    
 

                                  
 
	                                                                              
	                             
	 
		                                                                                            
		 
			                   
			     
		 
	 
 

                                
 
	                                                      
	 
		                                                                         
		                         
		 
			                      
				              
		 
	 
 

                                            
 
	                                                      
		      

	                                                                                                                                                             
	                             
	                                                                
	                             
	                                                                                                                
	                                                          
	                                                                                                     
	                        

	                                                     
	                                                                
	                                                   
	                             
	                                                            
	                           

	                                  
	                                                                                        
 

                                                                                                         
 
	                               

	                                                                         

	                                                                              
	                             
	 
		                         
			        

		                                                                   
		 
			                   
		 
		    
		 
			                   
		 

		                                                               
		                                                           
		                                                
		                                                          
		                                   
	 

	                                                                              
	                             
	 
		                         
			        

		                                                                       
		 
			                   
		 
		    
		 
			                   
		 

		                                                               
		                                                           
		                                                
		                                                          
		                                   
	 

	                                                                              
	                             
	 
		                         
			        

		                                                                      
		 
			                   
		 
		    
		 
			                   
		 

		                                                               
		                                                           
		                                                
		                                                          
		                                   
	 

	                                              
	                                     
	 
		                                  
			                                                                                        
	 
 
#endif

#if DEV
bool function DEV_S12E05_ForceMapIntroScreen()
{
	return GetCurrentPlaylistVarBool( "s12e04_forcemapintro", false )
}
#endif

#if CLIENT
void function OnLeviathanMarkerCreated( entity marker )
{
	entity leviathan = CreateClientSidePropDynamic( marker.GetOrigin(), marker.GetAngles(), LEVIATHAN_MODEL )
	leviathan.SetScriptName( "tropic_lev" )
	thread LeviathanThink( marker, leviathan )
}

void function LeviathanThink( entity marker, entity leviathan )
{
	marker.EndSignal( "OnDestroy" )
	leviathan.EndSignal( "OnDestroy" )

	OnThreadEnd(
		function () : ( leviathan )
		{
			if ( IsValid( leviathan ) )
			{
				leviathan.Destroy()
			}
		}
	)

	leviathan.Anim_Play( "ACT_IDLE"  )

	                                                 
	const float CYCLE_BUFFER_DIST = 0.3
	Assert( CYCLE_BUFFER_DIST < 0.5, "Warning! Impossible to get second leviathan random animation cycle if cycle buffer distance is 0.5 or greater!" )

	float randCycle
	if ( file.lastLevAnimCycleChosen < 0 )
		randCycle = RandomFloat( 1.0 )
	else
	{
		                                                                                                    
		                                                                                                   
		float randomRoll = RandomFloat( 1.0 - ( CYCLE_BUFFER_DIST * 2 ) )
		float adjustedRandCycle = ( file.lastLevAnimCycleChosen + CYCLE_BUFFER_DIST + randomRoll ) % 1.0
		randCycle = adjustedRandCycle
	}

	file.lastLevAnimCycleChosen = randCycle

	leviathan.SetCycle( randCycle )

	vector headOrigin = leviathan.GetBoneOrigin(  leviathan.LookupBone( "def_c_head" ) )
	if( marker.GetTargetName() == LEVIATHAN_1_NAME )
	{
		entity ambientGeneric = CreateClientSideAmbientGeneric( headOrigin, "Tropics_S12E05_Leviathan_ShortRoar", 0 )
		ambientGeneric.SetEnabled( true )
	}
	else
	{
		entity ambientGeneric = CreateClientSideAmbientGeneric( headOrigin, "Tropics_S12E05_Leviathan_LongRoar", 0 )
		ambientGeneric.SetEnabled( true )
	}


	WaitForever()
}

void function S12E05_InteractiveScreenCreated( entity ent )
{
	if ( ent.GetScriptName() == INTERACTIVE_SCREEN_SCRIPTNAME )
	{
		if ( !file.interactRuiCreated )
			CreateRUIForInteractScreen ( ent )
	}
}

void function OnWaitingForPlayers_Client()
{
	if ( !S12E05_IsRoarActive() )
		return

	entity player = GetLocalViewPlayer()
	if ( !IsValid ( player ) )
		return

	if ( DistanceSqr(player.GetOrigin(), < -41922, 13201.7, 1357.47 >) > 0.1)
		return

	thread function() : ()
	{
		float endTime = GetNV_PreGameStartTime()
		if ( endTime > 0.0 )
		{
			float remainingTime = endTime - Time()
			if ( remainingTime < 3.0 )                                  
				return
		}

		wait 1.0

		EmitSoundAtPosition (0, < -41922, 13201.7, 1357.47 > , "Tropics_S12E05_SeaCreature_Roar")

		wait 0.45

		ClientScreenShake( 1.5, 20, 10.0, <0, 0, 0 > )
	}()
}

void function ServerCallback_S12E05CreateScreenRUI()
{
	array <entity> screen1 = GetEntArrayByScriptName( S12E05_SCREEN_1_SCRIPTNAME )
	foreach ( screen in screen1 )
	{
		if ( !IsValid( screen ) )
			continue

		if (DistanceSqr( screen.GetOrigin(), S12E05_LSCREEN_ORIGIN ) < 0.1)
		{
			if ( !file.infoRuiCreated[0] )
			{
				CreateRUIForScreen( screen )
				file.infoRuiCreated[0] = true
			}
		}
	}

	array <entity> screen2 = GetEntArrayByScriptName( S12E05_SCREEN_2_SCRIPTNAME )
	foreach ( screen in screen2 )
	{
		if ( !IsValid( screen ) )
			continue

		if ( (DistanceSqr( screen.GetOrigin(), S12E05_CSCREEN_ORIGIN ) < 0.1) )
		{
			if ( !file.infoRuiCreated[1] )
			{
				CreateRUIForScreen( screen )
				file.infoRuiCreated[1] = true
			}
		}
	}

	array <entity> screen3 = GetEntArrayByScriptName( S12E05_SCREEN_3_SCRIPTNAME )
	foreach ( screen in screen3 )
	{
		if ( !IsValid( screen ) )
			continue

		if ( (DistanceSqr(screen.GetOrigin(), S12E05_RSCREEN_ORIGIN ) < 0.1) )
		{
			if ( !file.infoRuiCreated[2] )
			{
				CreateRUIForScreen( screen )
				file.infoRuiCreated[2] = true
			}
		}

	}
}

void function CreateRUIForInteractScreen( entity screen )
{
	vector origin = OffsetPointRelativeToVector( screen.GetOrigin(), <7.5, 0, 7.3>, screen.GetForwardVector() )
	var topo = CreateRUITopology_Worldspace( origin ,  screen.GetAngles() + <22.5, 90, 0>, 12, 9.5 )
	var rui = RuiCreate( $"ui/tropic_commandcenter_interact.rpak", topo, RUI_DRAW_WORLD, 0 )
	file.interactRuiCreated = true
}


void function CreateRUIForScreen( entity screen )
{
	vector origin = OffsetPointRelativeToVector( screen.GetOrigin(), <-9, 58, -3>, screen.GetForwardVector() )
	var topo = CreateRUITopology_Worldspace( origin ,  screen.GetAngles() + <0, -90, 0>, 90, 65 )
	var rui = RuiCreate( $"ui/tropic_commandcenter.rpak", topo, RUI_DRAW_WORLD, 0 )

	switch ( screen.GetScriptName() )
	{
		case S12E05_SCREEN_1_SCRIPTNAME:
			thread TypingTextThread( rui, "#S12E05_SCREEN1_LINE1", "#S12E05_SCREEN1_LINE2", "#S12E05_SCREEN1_LINE3", 9.0 )
			break
		case S12E05_SCREEN_2_SCRIPTNAME:
			thread TypingTextThread( rui, "#S12E05_SCREEN2_LINE1", "#S12E05_SCREEN2_LINE2", "#S12E05_SCREEN2_LINE3", 0.0 )
			break
		case S12E05_SCREEN_3_SCRIPTNAME:
			thread TypingTextThread( rui, "#S12E05_SCREEN3_LINE1", "#S12E05_SCREEN3_LINE2", "#S12E05_SCREEN3_LINE3", 18.0 )
			break
	}
}

void function TypingTextThread( var rui, string line1, string line2, string line3, float waitToStart )
{
	RuiSetString( rui, "screenLine", line1 )
	RuiSetString( rui, "screenLine2", line2 )
	RuiSetString( rui, "screenLine3", line3 )

	wait waitToStart

	RuiSetBool( rui, "start", true )
}
#endif
      


