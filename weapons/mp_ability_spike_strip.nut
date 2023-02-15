global function MpAbilitySpikeStrip_Init
global function OnWeaponActivate_ability_spike_strip
global function OnWeaponDeactivate_ability_spike_strip
global function OnProjectileCollision_ability_spike_strip
global function OnWeaponTossReleaseAnimEvent_ability_spike_strip
global function OnWeaponPrimaryAttack_ability_spike_strip

#if SERVER
                                                  
                                                 
                                
#endif

#if CLIENT
global function OnClientAnimEvent_ability_spike_strip
#endif

        
const asset SPIKE_STRIP_MUZZLE_FLASH_FP = $"P_wpn_mflash_bang_rocket_FP"
const asset SPIKE_STRIP_MUZZLE_FLASH_3P = $"P_wpn_mflash_bang_rocket"
const asset SPIKE_STRIP_ARM_FP = $"P_EMPTY_ferro"
const asset SPIKE_STRIP_CREATE_FX = $"P_EMPTY_ferro"
const asset SPIKE_STRIP_DESTROY_FX = $"P_ferro_tac_death_exp_SM"
const asset SPIKE_STRIP_SPIKE_DORMANT = $"mdl/fx/ferrofluid_tac_calm_side_01.rmdl"
const asset SPIKE_STRIP_SPIKE_L_CORNER_DORMANT = $"mdl/fx/ferrofluid_tac_calm_side_L.rmdl"
const asset SPIKE_STRIP_SPIKE_R_CORNER_DORMANT = $"mdl/fx/ferrofluid_tac_calm_side_R.rmdl"
const asset SPIKE_STRIP_SPIKE_L_CORNER_ACTIVE = $"mdl/fx/ferrofluid_tac_spike_side_L.rmdl"
const asset SPIKE_STRIP_SPIKE_R_CORNER_ACTIVE = $"mdl/fx/ferrofluid_tac_spike_side_R.rmdl"
const asset SPIKE_STRIP_SPIKE_ACTIVE = $"mdl/fx/ferrofluid_tac_spike_side_01.rmdl"
const asset SPIKE_STRIP_SPIKE_CORE_DORMANT = $"mdl/fx/ferrofluid_tac_calm_core_01.rmdl"
const asset SPIKE_STRIP_SPIKE_CORE_ACTIVE = $"mdl/fx/ferrofluid_tac_spike_core_01.rmdl"
const asset SPIKE_STRIP_CORE_DORMANT_FX = $"P_ferro_spike_main"
const asset SPIKE_STRIP_CORE_ACTIVE_FX = $"P_ferro_spike_main_active"
const asset SPIKE_STRIP_SPIKE_FX = $"P_EMPTY_ferro"
const asset SPIKE_STRIP_ORB_IDLE_3P_FX = $"P_ferro_tac_orb_idle_3p"

        
const string SPIKE_STRIP_GO_ACTIVE_SFX = "Catalyst_Tactical_Activate_FerroSpikes_3p"
const string SPIKE_STRIP_GO_DORMANT_SFX = "Catalyst_Tactical_Activate_BackToCalm_3p"
const string SPIKE_STRIP_ACTIVE_IDLE_SFX = "Catalyst_Tactical_Idle_HarmfulStage_3p"
const string SPIKE_STRIP_DORMANT_IDLE_SFX = "Catalyst_Tactical_Idle_CalmStage_3p"
const string SPIKE_STRIP_EXPLOSION_SFX = "Catalyst_Tactical_Land_Explo_3p"
const string SPIKE_STRIP_PLAYER_DAMAGE_1P = "flesh_catalyst_Tac_ferrospikes_damage_1p"
const string SPIKE_STRIP_PLAYER_DAMAGE_3P = "flesh_catalyst_Tac_ferrospikes_damage_3p"
const string SPIKE_STRIP_DISSOLVE_3P = "Catalyst_Tactical_Dissolve_3p"
const string SPIKE_STRIP_DESTROY_3P = "Catalyst_Tactical_Destroy_3p"
const float SPIKE_STRIP_SFX_Z_OFFSET = 20.0

const float SPIKE_STRIP_IDLE_SFX_SEEK_SHIFT = 0.5
const float SPIKE_STRIP_IDLE_SFX_SEEK_VARIANCE = 0.15
const float SPIKE_STRIP_ACTIVE_IDLE_SFX_REPEAT_TIME = 18.0                                      
const float SPIKE_STRIP_DORMANT_IDLE_SFX_REPEAT_TIME = 18.0          

               
global const string SPIKE_STRIP_CORE_SPIKE_NAME = "core_spike_target_name"
const string SPIKE_STRIP_USE_ENTITY_NAME = "core_spike_use_entity"
const string KILL_CLIENT_THREAD_SIGNAL = "spike_strip_kill_client_thread"
global const string SPIKE_STRIP_WEAPON_NAME = "mp_ability_spike_strip"
const string SPIKE_STRIP_EXPLOSION_IMPACT_TABLE = "exp_ferro_tac_SM"

          
const int SPIKE_STRIP_MAX_TRAPS = 3
const float SPIKE_STRIP_SPIKE_HEALTH = 300
const float SPIKE_STRIP_SPIKE_DURATION = -1
const bool SPIKE_STRIP_DEBUG = false
const float SPIKE_STRIP_PRE_SPIKE_FX_OPACITY = 0.0
const float SPIKE_STRIP_PRE_SPIKE_RADIUS = 75
const vector SPIKE_STRIP_PRE_SPIKE_FX_COLOR = < 0, 0, 0>
const float SPIKE_STRIP_SPIKE_DAMAGE_DEBOUNCE_TIME = 1.0
const float SPIKE_STRIP_SPIKE_DAMAGE = 15
const float SPIKE_STRIP_SPIKE_SLOW_SCALER = 0.5
const float SPIKE_STRIP_SPIKE_SLOW_NPC_SCALER = 0.8
const int SPIKE_STRIP_NUM_SPIKES_IN_SPIKE_STRIP_LINE = 4
const int SPIKE_STRIP_NUM_SPIKES_IN_SPIKE_STRIP_EXTRA_WIDTH = 1
const int SPIKE_STRIP_DISTANCE_BETWEEN_SPIKES = 47
const int SPIKE_STRIP_DISTANCE_BETWEEN_ROWS = 30
const float SPIKE_STRIP_MAIN_SPIKE_HEALTH = 300
const float SPIKE_STRIP_SPIKE_CORE_DORMANT_RADIUS = 350
const float SPIKE_STRIP_SPIKE_DELAY = 2.0
const float SPIKE_STRIP_SPIKE_SCALE_DORMANT = 1.0
const float SPIKE_STRIP_SPIKE_SCALE_ACTIVE = 1.0
const float SPIKE_STRIP_SPIKE_SCALE_STABBING = 1.0
const float SPIKE_STRIP_DELAY_BEFORE_EXPANDING = 0.3
const float SPIKE_STRIP_DISTANCE_FROM_CORE_THRESHOLD = 250
const float SPIKE_STRIP_DISTANCE_FROM_CORE_THRESHOLD_SQR = SPIKE_STRIP_DISTANCE_FROM_CORE_THRESHOLD * SPIKE_STRIP_DISTANCE_FROM_CORE_THRESHOLD
const vector SPIKE_STRIP_USE_BOUNDING_MINS = < -15, -15, 0 >
const vector SPIKE_STRIP_USE_BOUNDING_MAXS = < 15, 15, 40 >
const float SPIKE_STRIP_VO_DEBOUNCE_TIME = 10.0

const vector FRIENDLY_SPIKE_COLOR = <80, 150, 255>
const vector ENEMY_SPIKE_COLOR = <255, 32, 10>
const float FRIENDLY_OUTLINE_COLOR = 0.1
const float ENEMY_OUTLINE_COLOR = 1.0

const int SPIKE_STRIP_PIECE_RADIUS = 32
const int SPIKE_STRIP_PIECE_HEIGHT = 50

const int SPIKE_STRIP_TRIGGER_HEIGHT = 150

const array< vector > SPIKE_STRIP_TEST_OFFSETS = [ < 0, 0, 25 >, < 60, 60 , 25 >, < -60, 60 , 25 >, < 60, -60 , 25 >, < -60, -60 , 25 > , < 60, 0 , 25 >, < -60, 0 , 25 >, < 0, -60 , 25 >, < 0, 60 , 25 > ]

struct SpikeData
{
	vector startPos
	entity moveParent
	vector angles
	asset model = SPIKE_STRIP_SPIKE_DORMANT
	bool valid
}

struct MoveSlowData
{
	int handle
	int refCount
}

struct
{
#if CLIENT
	var hud
#endif
	#if SERVER
		                                        
		                                          
		                                   
		                               
	#endif

	int 		maxTraps
	float 		maxHealth
	int			numPiecesLength
	int 		numPiecesExtraWidth
	float		activationDelay
	float		detectionRadius
	float		detectionHeight
	float		pieceRadius
	float		pieceHeight

} file

void function MpAbilitySpikeStrip_Init()
{
	PrecacheModel( SPIKE_STRIP_SPIKE_CORE_DORMANT )
	PrecacheModel( SPIKE_STRIP_SPIKE_CORE_ACTIVE )
	PrecacheModel( SPIKE_STRIP_SPIKE_DORMANT )
	PrecacheModel( SPIKE_STRIP_SPIKE_L_CORNER_DORMANT )
	PrecacheModel( SPIKE_STRIP_SPIKE_R_CORNER_DORMANT )
	PrecacheModel( SPIKE_STRIP_SPIKE_L_CORNER_ACTIVE )
	PrecacheModel( SPIKE_STRIP_SPIKE_R_CORNER_ACTIVE )
	PrecacheModel( SPIKE_STRIP_SPIKE_ACTIVE )
	PrecacheParticleSystem( SPIKE_STRIP_CREATE_FX )
	PrecacheParticleSystem( SPIKE_STRIP_DESTROY_FX )
	PrecacheParticleSystem( SPIKE_STRIP_ARM_FP )
	PrecacheParticleSystem( SPIKE_STRIP_CORE_DORMANT_FX )
	PrecacheParticleSystem( SPIKE_STRIP_CORE_ACTIVE_FX )
	PrecacheParticleSystem( SPIKE_STRIP_SPIKE_FX )
	PrecacheParticleSystem( SPIKE_STRIP_ORB_IDLE_3P_FX )
	PrecacheImpactEffectTable( SPIKE_STRIP_EXPLOSION_IMPACT_TABLE )
	RegisterSignal( KILL_CLIENT_THREAD_SIGNAL )

	Remote_RegisterServerFunction( "ClientCallback_TryPickupSpikeStrip", "entity" )

	#if SERVER
		                                                                                         
		                                                                                    
		                                                                                             
		                                                                                             

		                                                                
	#endif

	#if CLIENT
		AddTargetNameCreateCallback( SPIKE_STRIP_CORE_SPIKE_NAME, MainSpikeCreated )
		AddTargetNameCreateCallback( SPIKE_STRIP_USE_ENTITY_NAME, UseEntityCreated )
		RegisterConCommandTriggeredCallback( "+scriptCommand5", OnCharacterButtonPressed )
		AddCallback_UseEntGainFocus( SpikeStrip_OnGainFocus )
		AddCallback_UseEntLoseFocus( SpikeStrip_OnLoseFocus )
		AddCallback_MinimapEntShouldCreateCheck_Targetname( SPIKE_STRIP_CORE_SPIKE_NAME, Minimap_DontCreateRuisForEnemies )
		RegisterDefaultMinimapPackage( "prop_ferro_prop", $"", void function( entity ent, var rui ) {} )
		RegisterMinimapPackage( "prop_ferro_prop", eMinimapObject_prop_script.SPIKE_STRIP, MINIMAP_OBJECT_RUI, MinimapPackage_SpikeStrip, FULLMAP_OBJECT_RUI, MinimapPackage_SpikeStrip )
	#endif

	file.maxTraps 					= GetCurrentPlaylistVarInt( "catalyst_spikes_maxTraps", SPIKE_STRIP_MAX_TRAPS )
	file.maxHealth 					= GetCurrentPlaylistVarFloat( "catalyst_spikes_maxHealth", SPIKE_STRIP_MAIN_SPIKE_HEALTH )
	file.numPiecesLength 			= GetCurrentPlaylistVarInt( "catalyst_spikes_numPiecesLength", SPIKE_STRIP_NUM_SPIKES_IN_SPIKE_STRIP_LINE )
	file.numPiecesExtraWidth		= GetCurrentPlaylistVarInt( "catalyst_spikes_numPiecesExtraWidth", SPIKE_STRIP_NUM_SPIKES_IN_SPIKE_STRIP_EXTRA_WIDTH )
	file.activationDelay			= GetCurrentPlaylistVarFloat( "catalyst_spikes_activationDelay", SPIKE_STRIP_SPIKE_DELAY )
	file.detectionRadius			= GetCurrentPlaylistVarFloat( "catalyst_spikes_detectionRadius", SPIKE_STRIP_SPIKE_CORE_DORMANT_RADIUS )
	file.detectionHeight			= GetCurrentPlaylistVarFloat( "catalyst_spikes_detectionHeight", SPIKE_STRIP_TRIGGER_HEIGHT )
	file.pieceRadius				= GetCurrentPlaylistVarFloat( "catalyst_spikes_pieceRadius", SPIKE_STRIP_PIECE_RADIUS )
	file.pieceHeight				= GetCurrentPlaylistVarFloat( "catalyst_spikes_pieceHeight", SPIKE_STRIP_PIECE_HEIGHT )
}


void function OnWeaponActivate_ability_spike_strip( entity weapon )
{
}

void function OnWeaponDeactivate_ability_spike_strip( entity weapon )
{
	#if CLIENT
		if( weapon.GetOwner() == GetLocalViewPlayer() )
			weapon.Signal( KILL_CLIENT_THREAD_SIGNAL )
	#endif
	#if SERVER
	 
		                                               
	 
	#endif

}


var function OnWeaponPrimaryAttack_ability_spike_strip( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	#if SERVER
		                                
		                                                                                                                                         
		                              
	#endif          

	#if CLIENT
		if( weapon.GetOwner() == GetLocalViewPlayer() )
			weapon.Signal( KILL_CLIENT_THREAD_SIGNAL )
	#endif
	return Grenade_OnWeaponTossReleaseAnimEvent( weapon, attackParams )
}


var function OnWeaponTossReleaseAnimEvent_ability_spike_strip( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	#if SERVER
		                                
		                                                                                                                                         
		                              
		                                               
	#endif          

	#if CLIENT
		if( weapon.GetOwner() == GetLocalViewPlayer() )
			weapon.Signal( KILL_CLIENT_THREAD_SIGNAL )
	#endif

	return Grenade_OnWeaponTossReleaseAnimEvent( weapon, attackParams )
}


void function OnProjectileCollision_ability_spike_strip( entity projectile, vector pos, vector normal, entity hitEnt, int hitBox, bool isCritical, bool isPassthrough )
{
	entity owner = projectile.GetOwner()

	if( !IsValid( owner ) || !IsAlive( owner ) )
	{
#if SERVER
		                    
#endif
		return
	}

	if ( projectile.GrenadeHasIgnited() )
		return

	vector targetPos = pos
	vector targetNormal = normal
	vector upVector = hitEnt.GetUpVector()

	projectile.proj.projectileBounceCount++
	int maxBounceCount = projectile.GetProjectileWeaponSettingInt( eWeaponVar.projectile_ricochet_max_count )
	bool destroyIfNotPlanted = ( projectile.proj.projectileBounceCount > maxBounceCount )



	bool projectileIsOnGround = normal.Dot( <0,0,1> ) > 0.75
	if ( !projectileIsOnGround )
	{
#if SERVER
		                                                         
		                         
			                                               
#endif
		return
	}

	if( !CanDeployOnEnt( hitEnt, pos ) )
	{
		#if SERVER
			                         
				                                               
		#endif
		return
	}

	DeployableCollisionParams collisionParams
	collisionParams.pos = targetPos
	collisionParams.normal = targetNormal
	collisionParams.hitEnt = hitEnt
	collisionParams.hitBox = hitBox
	collisionParams.isCritical = isCritical

	bool result = PlantStickyEntity( projectile, collisionParams, <90, 0, 0> )
	if( !result )
	{
		#if SERVER
			                         
				                                               
		#endif
		return
	}

	#if SERVER
		          
			    
			      
			      
			 	 
			  
			  
			  
			  
			    
			  
			                      
			                                       
			                    
		                                                                           

		                                                                                                                    
		                                                
		                                                                     
		                                                               
		                                              
		                                         
		                               
		                 
		                        
		                                                                                                   
	#endif
}

bool function CanDeployOnEnt( entity ent, vector pos )
{
	if ( IsValid( ent ) )
	{
		if ( ent.IsPlayer() || ent.IsNPC() || IsDeathboxFlyer( ent ) )
			return false

		if ( ent.GetScriptName() == CRYPTO_DRONE_SCRIPTNAME  )
			return false

		if( ent.GetScriptName() == BUBBLE_SHIELD_SCRIPTNAME )
			return false

		if ( ent.IsProjectile() )
			return false

		entity lootBin = GetLootBinForHitEnt( ent )
		if( IsValid( lootBin ) && !LootBin_IsBusy( lootBin ) )
			return true

		if( ent.GetNetworkedClassName() == "phys_bone_follower" )
			return false
	}

	return true
}

#if SERVER
                                         
 
		                                                                   
 

                                                          
 
	                                   

	            
		                           
		 
			                          
				                   
		 
	 

	           

	             
	 
		                                        
		                          
		 
			                                                 
			                                          
			 
				      
			 
		 
		           
	 
 

                                                                           
 
	                                                             
	                          
		                                   
	                    
 
                                                                     
 
	                                                                
	                        
		      

	                                               
	                                                             
	                                                                                                                                                                
	                                                                            
	                          
	                             
 

                                                                               
 
	                                                
		      

	                                                           
	                                                                                  
		      

	                                                                                
		      

	                                     
	                                                        
		      

	                                                  
		      

	                                           

	                     
		                                
	                                                                                                                      
	               
 

                                                                                                                                      
 
	                                                                       
	                                                                                                                                                                 
	                           
	                                           
	                                                                                                                         
	                           
		                    
	                                                           
	                                       
 

                                                             
 
	                               
	                                 
	                                     
	                               
	                                        

	                            
	                                                                   

	                                                                                                                                                                 
	                                                                    
	                                                            
	                               

	                                                                                                                               
	                                                              
	                                                      
	                            

	                                                                                                                                         
	                           
	                    
	                                                                                            
	                                                       
	                            
	                     
	                                                                 
	                                                  

	                                                   
	                             
	                                        
	                                                 
	                                              
	                                             
	                                      
	                                      
	                         
	                                   
	                                   
	                                      
	                                        
	                        
	                          

	                                                        

	                                                   
	                                                                     
	                                                                      
	                                        
	                                                                          
	                                     
	                                               
	                                    

	                               

	                                                 
	                                                                                                                                   
	                                  
	                                             
	                               

	                                          
	 
		                                             
			                                      

		                                                           
		 
			                                         
			 
				                               
			 
		 

		                                                   
		 
			                                              
			                             
			 
				                                                                                                                                   
				                                                                                                                                 
				                     
			 
		 
	 

	            
		                                                     
		                              
		 
			                             
				                          

			                          
				                       

			                               
			                                                          
			 
				                                                      
				                            
				 
					                  
						           
				 
				             
					               
			 

			                       
			 
				                                            
				 
					                                                           
					 
						                                      
						 
							                               
						 
					 
				 
			 
		 
	 
	             
 

                                                                                     
 
	                   
	                                                                     
	                                             
	 
		                                                                                                                                                      
		                                      
		                            
			                                                                
		      
	 
 

                                                                                                      
 
	                                   

	                                       

	                                         
	                           
	                                                

	                                                 
	                                                    
	                                
	                                    
	                                         
	                                      
	 
		                                     
		                                     
		 
			              
			                                 
		 
		                                          
	 

	                               
	                                        
	                         
	                                                                                                                                                                                                                  
	                                           
	 
		                                   
		                                                              
		                    
		 
			                                                                
			                     
			                                     
			                                                                                  
			                                          
		 
	 
	                                                                                                                                                                                                    
	                                           
	 
		                                   
		                                                              
		                    
		 
			                                                                
			                     
			                                                                             
			                                                                                 
			                                          
		 
	 

	                                                
	 
		                                                       
		                                                                                                                                                                          
		                                   

		                                                      
		                
		 
			                                                        
			                     
			                                 
			                                                                                  
			                                      
		 

		                                                                                                                                                                                                                                
		                                              
		 
			                                                                                                                                                 
			                                       
			                                                              
			                    
			 
				                                                                    
				                     
				                                     
				                                                                                  
				                                          
				                      
			 
		 
		                                                                                                                                                                                                                 
		                                              
		 
			                                                                                                                                                 
			                                       
			                                                              
			                    
			 
				                                                                    
				                     
				                                     
				                                                                                  
				                                          
				                      
			 
		 

		                                                                                                                                                                             
		                         
		                                                      
		                
		 
			                                                        
			                     
			                                 
			                                                                                
			                                      
		 

		                                                                                                                                                                                                               
		                                              
		 
			                                                                                                                                                 
			                                       
			                                                              
			                    
			 
				                                                                    
				                     
				                                     
				                                                                                
				                                          
				                      
			 
		 
		                                                                                                                                                                                                                 
		                                              
		 
			                                                                                                                                                 
			                                       
			                                                              
			                    
			 
				                                                                    
				                     
				                                     
				                                                                                
				                                          
				                      
			 
		 
	 

	                                                     
	                                             
	                              
	 
		                                                
		 
			                        
			                         
			                                    
			 
				                                                                                            
				 
					                        
				 
				                                                                                            
				 
					                       
				 
			 

			                                    
			 
				                                                                          
				 
					                      

					                                     
					 
						                                 
						                    
						                         
						 
							                                                
								     

						 
						            
						 
							                
							     
						 
					 
					                
						                                             
				 

				                                                                         
				 
					                      
					                                    
					 
						                                 
						                    
						                         
						 
							                                                
								     

						 
						            
						 
							                
							     
						 
					 
					                
						                                             
				 
			 
		 
	 


	                                      
	 
		                                     
		 
			                                        
			                
			 
				                                                                                                     
			 
		 
	 
	           
 

                                                                                                                                                                                                                             
 
	             
	                        
	                              

	         
	                      
	                                            
	               
	                                  

	                                                                                           
	                                                                                                                                                                              

	                                               
	                                          

	                                     
	 
		                       

		                                          
		                       

		                                                                                                                                              



		                              
		                 
		                                   
		                               


		                        
		                                                                      
		                          
		 
			                                                 
			                                            
			 
				                    
			 
		 
		                                                                                                                                                                                                                                                                                  
		 
			                            
				                                                              
			      
			        
		 


		                   
		                              
		 
			                                                                                                                                          
			                               
			 
				             
				     
			 
		 

		             
		 
			                            
				                                                               
			      
			        
		 

		                            
			                                                                 
		      

		                    
		                                   
		                                                                      

		                         
		                                  
		 
			                                  
			 
				                                     
				                                                                                    
				                                                                                        
			 
		 
		                                                     
		 
			                                  
			 
				                                     
				                                                                                    
				                                                                                        
			 
		 
		                                 
	 

	                                            
		                         

	                    
 


                                                                                                                                                                   
 
	                                                                                                                                         
 

                                                                                                                                                                             
 
	             
	                        
	                              

	         
	                      
	                                            
	               
	                                  

	                                                                                           
	                                                                                                                                                                              

	                                     
	 
		                       

		                   
		                  
			                       

		                       
		                             
		                            

		                                               
		                                          

		                  
		 
			                                   

			                      
			 
				                                                                                                                                       

				                            
					                                                                         
				      

				                               
			 

			                                                       
			                                                                                                                                                                                          
		 

		                            
			                                                                   
		      

		                                                                                                                                                   
		                                  
		 
			                                              
			                 
				                                                

			                                                                                                                                                                          

			                            
				                                                                           
			      

			                                
				     

			                 
			                   
			                                
			                                   
			                        
			                                                                                            
			                                                                      

			                         
			                                  
			 
				                                  
				 
					                                     
					                                                                                    
					                                                                                  
					                                                                                      
				 
			 
			                                                     
			 
				                                  
				 
					                                     
					                                                                                    
					                                                                                  
					                                                                                      
				 
			 

			                                                                             
			                               

			                                                                      
				     

			                              
			                         

			        
		 

		                                        
		 
			     
		 

		                                    
		 
			                                                                                                                                                

			                            
				                                                                         
			      

			                                 
				        
		 

		                                                                                                                                                       

		                            
			                                                                 
		      

		                                       
		 
			                                                                                                                                
				     
		 
		    
		 
			                                                                           
			                                                                                                                                                                            

			                            
				                                                                                  
			      

			                                
				     

			                 
			                   
			                                
			                                   
			                                                                        
			                                                                                            
			                                                                      

			                         
			                                  
			 
				                                  
				 
					                                     
					                                                                         
					                                                                                  
					                                                                                      
				 
			 

			                                                                             
			                               

			                                                                     
				     

			                              
			                         
		 
	 

	                                            
		                         

	                    
 



                                                                                                                                                                                                   
 
	                                                                                                                          
	                               
	                                                   
	                          
	 
		                           
		                                          
		                            
	 
	                                                             
	                         
	                                 
	 
		                                              
	 
	    
	 
		                                           
	 

	                               
	                          
	 
		                            
	 

	             
	                                 
	                       

	                                                               
	                                        

	            
 

                                                                                                 
 
	                                                
	                               

	                                                      
	                

	            
		                              
		 
			                       
			 
				                                                                                                                             
				                                                  
				               
			 
		 
	 

	                                                    
	                                
	 
		                                                                                                                                    
		 
			               
			      
		 
		           
	 

	                                                     
	                             
	                                        
	                               
	                            
	                           
	                                      
	                         
	                                   
	                                   
	                                      
	                                        
	                                             
	                        
	                                    
	                            

	             
	 
		                                                                                                                                    
		 
			               
			      
		 

		                          
		                                                      
		                      
		 
			                                                                                         
			 
				                    
				     
			 
		   


		                                                                                                 
		 
			                                  
			                   
			 
				                                                       
			 
			    
			 
				                                                     
			 
		 
		    
		 
			                                   
			                                                      
		 

		           
	 
 

                                                                                 
 
	                                 
	                               

	                          
	                              

	                
	                                    
	                                                            
	                                    
	                                      

	                                                                                                                                                                                                          

	                                                                                                                                                                                                       
	                                                                  
	                                                          
	                             

	                                                                                                                                                                                                    
	                                                            
	                                                    
	                          

	            
		                                            
		 
			                           
				                        

			                        
				                     
		 
	 

	                         

	             
	 
		                     
		                                                    
		                      
		 
			                                                                                                                                                                                                                               
			 
				                    
				                     
				     
			 
		 

		                                         
		 
			                                                       
			                                                     
			                                                                                                                                                                                                         
			             
			                                     

			                    
			                 

			                                                                                                                                                                                               
			                                                                  
			                                                                            
			                                                          
			                             

			                                                                                                                                                                                            
			                                                            
			                                                                      
			                                                    
			                          
		 
		                                              
		 

			                                                      
			                                                      
			                                                                                                                                                                                                          
			                
			                                    

			                    
			                 

			                                                                                                                                                                                                
			                                                                  
			                                                          
			                             

			                                                                                                                                                                                             
			                                                            
			                                                    
			                          
		 

		                   
		 
			                                                                                              
			                      
			 
				                                                                                                                                                                                
					        

				                                                
				 
					                                                  
					 
						                                         
						                                       
							                                   
					 
				 
			 
		 

		                            
		                                                      
		                                
		 
			                      
			 
				                                          
				                                                                                                                                                                        
			 
		 

		                                          
		                                                                                                                                                                        
		      

		                                 
		           
	 
 

                                                                                 
 
	                                                          

	                     

	                                
	 
		                      
		 
			                                          
			                                                                                
			                               

			                                                                             
			 
				               
				     
			 
		 
	 

	               
	 
		                                              
		                                                                                    
		                               

		                                                                             
		 
			               
		 
	 

	               
 

                                                    
 
	                                
	                       
	 
		                              
		                                      
	 

	                                                                                                                                                              
	                                               
	 
		                                 
		                                                         
	 
	                                                  
	 
		                                 
		                                                         
	 

	                                            
	 
		                        
		 
			                                   
			                             
			 
				                                  
			 
		 
	   

	             
	 
		                                                                  
		 
			                  
			                                                
			                         
			 
				                                                                                             
				                                      
				                                                 
				 
					                                                       
					 
						              
						                                                                                                                                                 
						 
							                                                                                                                                    
							                       
							 
								                                                                               
								                                                                             
							 
							    
							 
								                                                         
							 

							                                            
						 
					 
				 
			 
			            
				                                      

			                                           
				      
		 
		           
	 
 

                                                             
 
	                                                          
		                                              
 

                                                                      
 
	                                
	                                 

	                                                                               
		       

	                                                                                              
	                                                               
		      

	                                       
	 
		                 
		                                                                                                                                                               
		                 
		                                    
		                                               
		 
			                                 
			                                                         
		 
	 
	    
	 
		                                       
	 

	                                    
	 
		                                                        
		 
			                                       
			                                                
			 
				                                                                
				                                   
			 
		 
	   

	                     
	                                     
	 
		               
		 
			                                             
			 
				                                 
				                                                         
			 
		 

		                                                                                       
		                                                                                                                                                 
		 
			                                                                                                                                    
			                       
			 
				                                                                               
				                                                                             
			 
			    
			 
				                                                         
			 

			                                            
		 
		                 
		           
	 
 
                                                                  
 
	                                                 
	                                                      
	                              

	                 
	 
		                                      
		                          
			                                                                                                                                                                                   

		                                                                        
		 
			                                                              
			                                            
			 
				                                                           
				 
					                                                        
				 
				                                                         
			 

			                                                                          
			                                                                                                                             
				                                                                                            
				                                                                                                                            
		 
		                                                                                                                   
	 

	                                           

	                                 
	 
		                                                                                                                
		                                                  
	 

	                                       
 

                                                                
 
	                                                 
	                                                      
	                                                        
	                              

	                 
	 
		                                                                        
		 
			                                                              
			                                            
			 
				                                                           
				 
					                                                        
				 
				                                                         
			 
			                                                                                             
			 
				                                         
				                                                         
			 

			                                                                          
			                                                                                                                             
				                                                                                            
				                                                                                                                            
		 
		                                                                                                                   
	 

	                                           

	                                 
	 
		                                                                                                                    
	 
 
#endif


#if CLIENT
void function OnClientAnimEvent_ability_spike_strip( entity weapon, string name )
{
	GlobalClientEventHandler( weapon, name )

	if ( name == "muzzle_flash" )
	{
		weapon.PlayWeaponEffect( SPIKE_STRIP_MUZZLE_FLASH_FP, SPIKE_STRIP_MUZZLE_FLASH_3P, "muzzle_flash" )
	}
}

void function WeaponActive_Client( entity owner, entity weapon )
{
	EndSignal( weapon, KILL_CLIENT_THREAD_SIGNAL )
	EndSignal( weapon, "OnDestroy" )
	EndSignal( owner, "OnDestroy" )

}

entity function SpikeStripCreatePlacementProxy( asset modelName )
{
	entity proxy = CreateClientSidePropDynamic( <0, 0, 0>, <0, 0, 0>, modelName )
	proxy.EnableRenderAlways()
	proxy.kv.rendermode = 3
	proxy.kv.renderamt = 1
	proxy.Hide()

	return proxy
}

void function MainSpikeCreated( entity spike )
{
	entity player = GetLocalViewPlayer()
	ShowGrenadeArrow( player, spike, file.detectionRadius, 0.0, true, eThreatIndicatorVisibility.INDICATOR_SHOW_TO_ENEMIES )
}

void function UseEntityCreated( entity useEnt )
{
	AddCallback_OnUseEntity_ClientServer( useEnt, SpikeStrip_OnUseClient )
}

void function SpikeStrip_OnUseClient( entity spike, entity player, int useFlags )
{
	if ( IsControllerModeActive() )
	{
		if ( !IsBitFlagSet( useFlags, USE_INPUT_LONG ) )
		{
			thread IssueReloadCommand( player )
		}
	}
}

void function OnCharacterButtonPressed( entity player )
{
	entity useEnt = player.GetUsePromptEntity()
	if ( !IsValid( useEnt ) || useEnt.GetTargetName() != SPIKE_STRIP_USE_ENTITY_NAME )
		return

	if ( useEnt.GetOwner() != player )
		return

	CustomUsePrompt_SetLastUsedTime( Time() )

	entity coreSpike = useEnt.GetParent()
	if( IsValid( coreSpike ) )
		Remote_ServerCallFunction( "ClientCallback_TryPickupSpikeStrip", coreSpike )
}

void function SpikeStrip_OnGainFocus( entity ent )
{
	if ( !IsValid( ent ) )
		return

	entity player = GetLocalViewPlayer()
	if ( !IsValid( player ) )
		return

	if ( player == ent.GetOwner() && ent.GetTargetName() == SPIKE_STRIP_USE_ENTITY_NAME )
	{
		CustomUsePrompt_SetText( Localize( "#WPN_SPIKES_PICKUP" ) )
		CustomUsePrompt_Show( ent )
	}
}

void function SpikeStrip_OnLoseFocus( entity ent )
{
	CustomUsePrompt_ClearForAny()
}

void function MinimapPackage_SpikeStrip( entity ent, var rui )
{
	#if MINIMAP_DEBUG
		printt( "Adding 'rui/hud/gametype_icons/survival/catalyst_ult_map_icon' icon to minimap" )
	#endif
	RuiSetImage( rui, "defaultIcon", $"rui/hud/gametype_icons/survival/catalyst_ult_map_icon" )
	RuiSetImage( rui, "clampedDefaultIcon", $"rui/hud/gametype_icons/survival/catalyst_ult_map_icon" )
	RuiSetBool( rui, "useTeamColor", false )
	RuiSetFloat( rui, "iconBlend", 0.0 )
}
#endif          
