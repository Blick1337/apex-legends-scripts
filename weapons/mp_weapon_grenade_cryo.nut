global function MpWeaponGrenadeCryo_Init
global function OnProjectileCollision_weapon_grenade_cryo
global function OnProjectileExplode_weapon_grenade_cryo

const int GRENADE_CRYO_RADIUS = 400

global int COCKPIT_GRENADE_CRYO_SCREEN_FX
const int GRENADE_CRYO_NUM_SNOW_MODELS = 300
const int GRENADE_CRYO_NUM_ICE_MODELS_PER_LINE = 20
const int ICE_MAX_HEALTH = 150

const asset GRENADE_CRYO_VIEW_FX = $"P_cryo_1P"
const asset GRENADE_AOE_FX = $"P_wpn_cryo_grenade_aoe"
const asset GRENADE_CRYO_ICE_MODEL_PLAYER = $"mdl/fx/ferro_shard_01.rmdl"
const asset GRENADE_CRYO_ICE_MODEL_LOOT_BIN = $"mdl/fx/ferro_shard_02_large.rmdl"                                                                      
const asset GRENADE_CRYO_ICE_MODEL_LOOT_BIN_OPEN = $"mdl/fx/ferro_shard_02_large.rmdl"                                                                           
const asset GRENADE_CRYO_ICE_MODEL_PROP_DOOR = $"mdl/fx/ferro_shard_02_large.rmdl"                                                                      
const asset GRENADE_CRYO_ICE_MODEL_DEATH_BOX = $"mdl/fx/ferro_shard_01.rmdl"                                                                      
const asset GRENADE_CRYO_ICE_MODEL_AIR_DROP = $"mdl/fx/ferro_shard_01.rmdl"                                                                     

const float GRENADE_CRYO_STICK_DELAY = 0.05
const float GRENADE_CRYO_ENVIRONMENT_FROZEN_DURATION = 15.0
const float GRENADE_CRYO_ICE_DURATION = 60.0
const float GRENADE_PLAYER_FROZEN_DURATION = 6.0
const float GRENADE_PLAYER_FROZEN_MOVE_SLOW_SEVERITY = 0.4                       
const float GRENADE_PLAYER_FROZEN_TURN_SLOW_SEVERITY = 0.5                       
const float GRENADE_PLAYER_FROZEN_SLOW_EASEOUT_START_SCALE = 0.6                                                                                                            
const float GRENADE_CRYO_FADE_TIME = 2.0
const float GRENADE_CRYO_STICK_TIME = 0.2
const float GRENADE_CRYO_LOOT_BIN_ICE_RIGHT_OFFSET = 90
const float GRENADE_CRYO_DEATH_BOX_ICE_RIGHT_OFFSET = 45
const float GRENADE_CRYO_AIR_DROP_ICE_RIGHT_OFFSET = 0
const float GRENADE_CRYO_DOOR_UP_ICE_OFFSET = 10
const float GRENADE_CRYO_HALF_DOOR_WIDTH = 30

const vector GRENADE_CRYO_PROJECTILE_TRACE_OFFSET = <0, 0, 0>
const vector GRENADE_CRYO_ICE_DOOR_Z_OFFSET = <0, 0, 15>
const vector GRENADE_CRYO_ICE_LOOTBIN_Z_OFFSET = <0, 0, 50 >
const vector GRENADE_CRYO_ICE_DEATH_BOX_Z_OFFSET = <0, 0, 20>
const vector GRENADE_CRYO_AIR_DROP_BOX_Z_OFFSET = <0, 0, 0>
const vector GRENADE_CRYO_ICE_TO_PLAYER_OFFSET = <0, 0, -55>
#if DEV
const bool GRENADE_CRYO_DEBUG = false
#endif      
const string CRYO_SOUND_AMBIENT = "explo_cryogrenade_impact_3p"
const string CRYO_SOUND_COOK = "weapon_cryogrenade_pulse_3p"
const string CRYO_SOUND_DETONATE = "explo_cryogrenade_impact_3p"
const string CRYO_SOUND_FREEZE_1P = "CryoGrenade_Freeze_1p"
const string CRYO_SOUND_FREEZE_3P = "CryoGrenade_Freeze_3p"
const string CRYO_SOUND_ICE_IMPACT = "CryoGrenade_Ice_Block_Impact"
const string CRYO_SOUND_ICE_BREAK = "CryoGrenade_Ice_Block_Break"
const string CRYO_SOUND_ICE_DISSOLVE = "CryoGrenade_Ice_Block_Dissolve"

const string CRYO_TRIGGER_START_TIME_NETVAR = "CryoTriggerStartTime"
const string CRYO_TRIGGER_END_TIME_NETVAR = "CryoTriggerEndTime"
const string CRYO_TRIGGER_UI_STOP_SIGNAL = "CryoTriggerStopUI"
const float CRYO_TRIGGER_TIME_TO_FREEZE = 3.0
const float CRYO_TRIGGER_TIME_FROZEN = 6.0

const float CRYO_CLOUD_EXPOSURE_TIME_WINDOW = 0.2
const float CRYO_DEFAULT_DEBOUNCE_TIME = 0.5
const float CRYO_POST_FREEZE_DEBOUNCE_TIME = 3.0

void function MpWeaponGrenadeCryo_Init()
{

	RegisterSignal( "GrenadeCryo_StopScreenEffect" )
	RegisterSignal( "GrenadeCryo_StopSlip" )
	RegisterSignal( CRYO_TRIGGER_UI_STOP_SIGNAL )

	PrecacheModel( GRENADE_CRYO_ICE_MODEL_PLAYER )
	PrecacheModel( GRENADE_CRYO_ICE_MODEL_LOOT_BIN )
	PrecacheModel( GRENADE_CRYO_ICE_MODEL_LOOT_BIN_OPEN )
	PrecacheModel( GRENADE_CRYO_ICE_MODEL_PROP_DOOR )
	PrecacheModel( GRENADE_CRYO_ICE_MODEL_DEATH_BOX )
	PrecacheModel( GRENADE_CRYO_ICE_MODEL_AIR_DROP )
	PrecacheParticleSystem( GRENADE_AOE_FX )
	COCKPIT_GRENADE_CRYO_SCREEN_FX = PrecacheParticleSystem( GRENADE_CRYO_VIEW_FX )

	RegisterNetworkedVariable( CRYO_TRIGGER_START_TIME_NETVAR, SNDC_PLAYER_EXCLUSIVE, SNVT_TIME )
	RegisterNetworkedVariable( CRYO_TRIGGER_END_TIME_NETVAR, SNDC_PLAYER_EXCLUSIVE, SNVT_TIME )

	#if SERVER
		                                                                                          
	#endif

	#if CLIENT
		StatusEffect_RegisterEnabledCallback( eStatusEffect.cryo_frozen, Cryo_StartVisualEffect )
		StatusEffect_RegisterDisabledCallback( eStatusEffect.cryo_frozen, Cryo_StopVisualEffect )
		StatusEffect_RegisterEnabledCallback( eStatusEffect.cryo_trigger, CryoTrigger_UIStart )
		StatusEffect_RegisterDisabledCallback( eStatusEffect.cryo_trigger, CryoTrigger_UIStop )
	#endif         
}

void function OnProjectileCollision_weapon_grenade_cryo( entity projectile, vector pos, vector normal, entity hitEnt, int hitBox, bool isCritical, bool passthrough )
{
	if ( hitEnt.IsPlayer() )
		return

	DeployableCollisionParams collisionParams
	collisionParams.pos = pos
	collisionParams.normal = normal
	collisionParams.hitEnt = hitEnt
	collisionParams.hitBox = hitBox
	collisionParams.isCritical = isCritical

	bool result = PlantStickyEntityOnWorldThatBouncesOffWalls( projectile, collisionParams, 0.7 )

	if ( !result )
	{
#if SERVER
		                                                      
#endif         
		return
	}

	if ( projectile.GrenadeHasIgnited() )
		return

	projectile.GrenadeExplode( normal )

#if SERVER
		                                                      
		                                           
#endif         
}

void function OnProjectileExplode_weapon_grenade_cryo( entity projectile )
{
	#if SERVER
		                                                                            
		                                    
		                                    
		                                            
		                                  
		                                                    
		                                                                                                                   

		                                                                    
		                                              
		                                                 
		                                                   
		                                                   

		                                             
		                                              
	#endif         
}

#if SERVER

                                                                      
 
	                                               
	                                       
	                                                        

	                            
		      

	                         
		      

	                       
		      

	                         
		      

	                                          
		      

	                                                                             
		      

	                                                              
		      

	                                                                                            
	                                                                                  
		      

	                                  

	                 
		                                    
 

                                                 
 
	                                                
	                                

	                                                                               
	            
		                                
		 
			                        
			 
				                                   
				                                                      
			 
		 
	 

	                          
	                        
	                        
	                                                       
	              
	 
		                            	                                    
		                       		 	                            

		                     
		                                                              
			                 


		                                 
		 
			                                      
			                                                 
			                                                                    
			                                                                
		 
		                                      
		 
			                                      
			                                                 
			                                                                    
			                                                                
		 

		                         

		                
		 
			                                 
			                       
			 
				                                   
				      
			 

		 
		    
		 
			                         
				      
		 

		           
	 
 

                                                           
 
	                                                 

	                                                
	                                    
	                                              

	                                                                                                                                    
	                                                             
	                                         

	       
	                         
		                                                                       
	      

	                                        
	                                                                 

	                                                                     

	                         
	                               
		                              
		                               
		                               
		                                
		                                
		                                
		                                
		                               
	 

	                                                             
	                                                        
	                                      
	                                                  

	                                       
	 
		                                       
		                                                                  
	 

	            
		                                  
		 
			                                   
				                           
		 
	 

	                           
	 
		                                           
		 
			                             
			                                  

			                                      
			                                           
			                                               
			                                  

			                                                                                                                           
			                           
			 
				                                                                                                                  
				                   
				                           
				                           
			 

			                                            
			 
				                                                       
				                           
			 

			       
			                         
				                                                                                                      
			      

			             
				             										         
				                    								           
				                  										            
				    												         
				    												                   
				       												              
				       												              
				                               						        
				    												                       
				    												                 
				                                 					                    
				                                      				                               
		 
		           
	 
 

                                                 
 
	                                
	                              

	                                                                                    
	                         
	                                                    
	                                                   
	                      
		                               

	                                                                                                                                                
	                                              
	                             
	                                                    

	            
		                                           
		 
			                        
			 
				                                         
				                                                    
				                                  
				                                                          
				                        
				                                                    
				                                                   
				                      
					                                  
			 

			                     
			 
				             
			 
		 
	 


	                                                 
	                          
	 
		                                                                       
		           
	 
 

                                                                                 
 
	                                          
	                                                                                                           

	                                       
	 
		                                                                           
		 
			                
			        
		 

		                                        
		                                                                                              

		       
		                         
		 
			                                                                                              
		 
		            

		                                               
		                                  

		                                                                                       

		                              
		 
			                                              

			                                            
			                              
			 
				                                                      
			 
		 
	 
 

                                                                                    
 
	                                            
	                                                                                                                 

	                                             
	 
		                                                                              
		 
			                
			        
		 

		                                              
		                                                                                              

		       
			                         
			 
				                                                                                                 
			 
		            

		                                                  
		                                  

		                                                                                          

		                                   
		 
			                                                                     
		 
	 
 

                                                                                      
 
	                                                   
	                                                                                                                     

	                                                
	 
		                                                                               
		 
			                
			        
		 

		                                                     
		                                                                                              

		       
			                         
			 
				                                                                                                  
			 
		            

		                                                   
		                                  

		                                                                                            

		                                   
		 
			                                                                       
		 
	 
 

                                                                                      
 
	                                               
	                                                                                                                 

	                                             
	 
		                                                                              
		 
			                
			        
		 

		                                                    
		                                                                                              

		       
			                         
			 
				                                                                                                 
			 
		            

		                                                  
		                                  

		                                                                                          

		                                   
		 
			                                                                     
		 
	 
   


                                                                                                                
 
	                                           
	 
		                                                                                             
		                                                                       
		 
			        
		 

		                                        
		                                                                                              
		                                         
		                                  

		                                                                                   

		       
			                         
			 
				                                                                                
				                                                                                              
				                                                                                                                    
			 
		            

		                              
		 
			                                                    
			                                                                     

			                                                                            
			 
				       
					                         
					 
						                                                                                      
					 
				            
				                                                                       
				                                                                     

				                                                                                                                                                                                                                                  
				                                                                                                                                                                                                                                                                    
				                                                                                                                                                                                                                   
				                                          
			 

			                                                                            
			 
				       
					                         
					 
						                                                                                      
					 
				            

				                                                                                                                                                                                                                                  
				                                                                                                                                                                                                                                                                    
				                                                                                                                                                                                                                   
			 

			                                                                              
			 
				       
					                         
					 
						                                                                                                    
					 
				            
				                                                                                                     
			 
		 
	 
 

                                                            
 
	                                                

	        

	                            
		                    
 

                                                       
 
	                             
		      

	                                   

	                                         
	                                                                                   

	                                                
 

                                                          
 
	                                                
	                                        

	                                                                                 
	                                                                       
	                                                 
	                       
	                                                                      

	                                           
	                                                                                    
	                                                                            

	                           

	                  
 

                                                
 
	                                                
	                                     

	                                                               

	                                                                                                               
	                              
	                                                      
	                                                       
	                                                                   
	                                                                       

	                            
	                                            

	            
		                                    
		 
			                            
			 
				                                                   
			 

			                        
			 
				                    
			 
		 
	 

	                                             
 

                                                                 
 
	                                                

	                             

	                                
	                          
	                      
	                                                                                                                             

	                                                                                     

	                                              

	                     

	                            

	            
		                                      
		 
			                     
			 
				             
			 

			                      
			 
				                
				 
					                                                  
				 

				    
				 
					                                               
				 

				                       
			 
		 
	 

	                                                    

	                                                                      
	                
	                                    
	                           
 

                                                                                          
 
	                                                
	                                

	                                   
	                                                                                   
	                      
	                                                                                                                        

	                                                                                                                                                                                                                             
	                            
	                        

	                        
	                                                                      
	                                                   
	 
		                     
		                            
	 

	            
		                                                     
		 
			                     
			 
				             
			 

			                         
			 
				                                                  
				                                                                
			 

			                                        
			 
				                         
				 
					                   
				 
			 

		 
	 

	                                                                               
	 
		                                                                  
	 

	                                                    

	                              
 

                                                                                            
 
	                                                
	                                 

	                                    
	                                                                                    
	                      

	                                                                                                                                                                                                                                                          
	                            
	                         

	            
		                                          
		 
			                     
			 
				             
			 

			                          
			 
				                                                   
				                                                                 
			 
		 
	 

	                                                                                
	 
		                                                                   
	 

	                                                    
	                              
 

                                                                                          
 
	                                                
	                                

	                                   
	                          
	                      

	                                                                                                                                                                                                            
	                            

	                        

	                                                                               

	            
		                                         
		 
			                     
			 
				             
			 

			                         
			 
				                
				 
					                                                     
				 

				    
				 
					                                                  
				 

				                                                                

				                                                                         
			 
		 
	 

	                                                                               
	 
		                                                                  
	 

	                                                    

	                                                                      
	                
	                                                        
	                           
 

                                                        
 
	                                                
	                               

	                                                                                                                                
	                            

	            
		                             
		 
			                     
			 
				             
			 

			                        
			 
				                                                    
			 
		 
	 

	                       

	                                                                              
	 
		           
	 
 

                                                                                          
   
  	                                                
  	                               
  
  	                      
  
  	                                                                              
  	 
  		                                                                 
  	 
  
  	                                                                                               
  
  	                                                                                                                                
  	                             
  
  	            
  		                                        
  		 
  			                     
  			 
  				             
  			 
  
  			                        
  			 
  				                
  				 
  					                                                    
  				 
  				    
  				 
  					                                                 
  				 
  
  				                                                               
  				                                  
  			 
  		 
  	 
  
  	                                                                       
  	                                                                     
  
  	                                               
  
  	                                                
  
  	                                                                 
  	                
  	                                    
  	                           
   

                                                                                
 
	                                                                                 
	                                   
	                                 
	                                     
	                                  
	                               
	                               
	           

	          
 

                                                                      
   
  	                                                
  	                                
  	                             
  
  	                                                                                                       
  	                           
  	 
  		                                                                            
  		 
  			                                                               
  		 
  
  		                              
  		 
  			                                                                       
  			           
  		 
  
  		                                                                       
  	 
  
  	                                                             
  
  	                                               
  	                    
   

                                                        
 
	                                                 

	                 
	 
		                                                                       
	 
 
#endif         
#if CLIENT
                                                                                                            
void function Cryo_StartVisualEffect( entity ent, int statusEffect, bool actuallyChanged )
{
	if ( !actuallyChanged && GetLocalViewPlayer() == GetLocalClientPlayer() )
		return

	if ( ent != GetLocalViewPlayer() )
		return

	entity viewPlayer = GetLocalViewPlayer()

	int fxHandle = StartParticleEffectOnEntityWithPos( viewPlayer, COCKPIT_GRENADE_CRYO_SCREEN_FX, FX_PATTACH_ABSORIGIN_FOLLOW, ATTACHMENTID_INVALID, viewPlayer.EyePosition(), <0,0,0> )
	EffectSetIsWithCockpit( fxHandle, true )

	thread CryoScreenFX_Thread( viewPlayer, fxHandle )
}

void function Cryo_StopVisualEffect( entity ent, int statusEffect, bool actuallyChanged )
{
	if ( !actuallyChanged && GetLocalViewPlayer() == GetLocalClientPlayer() )
		return

	if ( ent != GetLocalViewPlayer() )
		return

	ent.Signal( "GrenadeCryo_StopScreenEffect" )
}

void function CryoScreenFX_Thread( entity player, int fxHandle )
{
	Assert ( IsNewThread(), "Must be threaded off" )
	player.EndSignal( "GrenadeCryo_StopScreenEffect" )
	player.EndSignal( "OnDeath" )
	player.EndSignal( "OnDestroy" )

	OnThreadEnd(
		function() : ( fxHandle )
		{
			if ( !EffectDoesExist( fxHandle ) )
				return

			EffectStop( fxHandle, false, true )
		}
	)

	player.WaitSignal( "GrenadeCryo_StopScreenEffect" )
}

void function CryoTrigger_UIStartThread( entity player )
{
	player.EndSignal( CRYO_TRIGGER_UI_STOP_SIGNAL )
	player.EndSignal( "OnDestroy" )
	                               


	var rui = CreateFullscreenRui( $"ui/cryo_freeze_progress.rpak" )
	RuiSetBool( rui, "isVisible", true )
	RuiSetImage( rui, "icon", $"rui/hud/gametype_icons/survival/dna_station" )
	RuiSetString( rui, "hintKeyboardMouse", "#CRYO_TRIGGER_HINT" )
	RuiSetString( rui, "hintController", "#CRYO_TRIGGER_HINT" )
	var soundHandle = EmitSoundOnEntity( player, "Survival_RespawnBeacon_Linking_loop" )

	OnThreadEnd(
		function() : (  rui, soundHandle )
		{
			StopSound( soundHandle )
			printt( "Cryo cloud end = " +  Time() )
			RuiDestroy( rui )
		}
	)

	printt( "Cryo cloud start = " +  Time() )
	while ( true )
	{
		float startTime = player.GetPlayerNetTime( CRYO_TRIGGER_START_TIME_NETVAR )
		float endTime = player.GetPlayerNetTime( CRYO_TRIGGER_END_TIME_NETVAR )

		RuiSetGameTime( rui, "startTime", startTime )
		RuiSetGameTime( rui, "endTime", endTime )

		float progress = 0.0
		if( startTime < endTime )
			progress = GraphCapped( Time(), startTime, endTime, 0.0, 1.0 )
		else
			progress = GraphCapped( Time(), endTime, startTime, 1.0, 0.0 )
		                                                                      
		RuiSetFloat( rui, "progress", progress )

		if ( StatusEffect_GetTimeRemaining( player, eStatusEffect.cryo_frozen ) > 0 || progress == 1.0 )
			RuiSetBool( rui, "isVisible", false )
		else
			RuiSetBool( rui, "isVisible", true )

		WaitFrame()
	}
}

void function CryoTrigger_UIStart( entity ent, int statusEffect, bool actuallyChanged )
{
	if ( !actuallyChanged && GetLocalViewPlayer() == GetLocalClientPlayer() )
		return

	if ( ent != GetLocalViewPlayer() )
		return

	entity viewPlayer = GetLocalViewPlayer()

	thread CryoTrigger_UIStartThread( viewPlayer )
}

void function CryoTrigger_UIStop( entity ent, int statusEffect, bool actuallyChanged )
{
	if ( !actuallyChanged && GetLocalViewPlayer() == GetLocalClientPlayer() )
		return

	if ( ent != GetLocalViewPlayer() )
		return

	entity viewPlayer = GetLocalViewPlayer()

	                                                                            

	ent.Signal( CRYO_TRIGGER_UI_STOP_SIGNAL )
}
#endif         