global function MpWeaponResinShot_Init
global function OnWeaponActivate_weapon_resin_shot
global function OnWeaponDeactivate_weapon_resin_shot
global function OnProjectileCollision_weapon_resin_shot
global function OnProjectileExplode_weapon_resin_shot
global function OnWeaponTossReleaseAnimEvent_weapon_resin_shot
global function OnWeaponPrimaryAttack_weapon_resin_shot
global function IsResinShotModel

#if CLIENT
global function OnClientAnimEvent_weapon_resin_shot
#endif

#if SERVER
                               
                                                     
                                                        
#endif

        
const asset RESIN_SHOT_MUZZLE_FLASH_FP = $"P_wpn_mflash_bang_rocket_FP"
const asset RESIN_SHOT_MUZZLE_FLASH_3P = $"P_wpn_mflash_bang_rocket"
const asset RESIN_SHOT_ARM_FP = $"P_ferro_tac_idle"
const asset  RESIN_SHOT_DEBUG_SPHERE_FX = $"debug_sphere_diff_edge"
global const asset RESIN_SHOT_COVER_WALL = $"mdl/fx/ferrofluid_slab.rmdl"
global const asset RESIN_SHOT_COVER_WALL_CHARGED = $"mdl/fx/ferrofluid_slab_charged.rmdl"
global const asset RESIN_SHOT_SPIKE = $"mdl/fx/ferro_spike.rmdl"
global const asset RESIN_SHOT_SPIKE2 = $"mdl/fx/ferro_spike_ball_01.rmdl"
const asset RESIN_SHOT_DEATH_BOX_SHARD = $"mdl/fx/ferro_shard_01.rmdl"
const asset RESIN_SHOT_CREATE_FX = $"P_debris_blast_vert"
const asset RESIN_SHOT_DESTROY_FX = $"P_debris_blast_vert"
const asset  RESIN_SHOT_LIQUID_FX = $"P_tday_oil"

const string KILL_CLIENT_THREAD_SIGNAL = "resin_shot_kill_client_thread"
const string KILL_UI_THREAD_SIGNAL = "resin_shot_ui_thread"
const string RESIN_SHOT_ORIENTATION_NETVAR = "RESIN_SHOT_ORIENTATION_NETVAR"
global const string RESIN_SHOT_WEAPON_NAME = "mp_weapon_resin_shot"

        
const float RESIN_SHOT_GEO_DURATION = -1
const float RESIN_SHOT_GEO_HEALTH = 350.0
const float RESIN_SHOT_GEO_HEIGHT = 120.0
const float RESIN_SHOT_EXTEND_CHECK_LENGTH = 180.0
const float RESIN_SHOT_WALL_DOT = 0.7
const float RESIN_SHOT_COVER_WALL_SCALE_TIME = 0.5
const float RESIN_SHOT_LOOTBIN_RIGHT_OFFSET = 90
const vector RESIN_SHOT_LOOTBIN_Z_OFFSET = <0, 0, 50 >
global const vector RESIN_SHOT_COVER_WALL_BOUNDING_MIN = <-15, -55, 0>
global const vector RESIN_SHOT_COVER_WALL_BOUNDING_MAX = <20, 55, 100>
const int RESIN_SHOT_MAX_SHARDS = 2
const int RESIN_SHOT_MAX_RAMP_SIZE = 5

const float RESIN_SHOT_SPIKE_HEALTH = 10
const float RESIN_SHOT_SPIKE_DURATION = -1

const bool RESIN_SHOT_DEBUG = false

        
const asset RESIN_SHOT_LITTLE_SPIKE = $"mdl/fx/ferrofluid_resin_spikes.rmdl"
                                                                                      
const asset RESIN_SHOT_SPIKE_TOTEM = $"mdl/fx/ferrofluid_resin_spike_center.rmdl"
const float RESIN_SHOT_PRE_SPIKE_FX_OPACITY = 0.0
const float RESIN_SHOT_PRE_SPIKE_RADIUS = 75
const vector RESIN_SHOT_PRE_SPIKE_FX_COLOR = < 0, 0, 0>
const float RESIN_SHOT_SPIKE_DAMAGE_DEBOUNCE_TIME = 1.0
const float RESIN_SHOT_SPIKE_DAMAGE = 15
const float RESIN_SHOT_SPIKE_SLOW_SCALER = 0.5
global const string RESIN_SHOT_MAIN_SPIKE_NAME = "main_spike_target_name"
const int RESIN_SHOT_NUM_SPIKES_IN_LINE = 3
const int RESIN_SHOT_NUM_SPIKES_IN_SPIKE_STRIP_LINE = 5
const int RESIN_SHOT_NUM_SPIKES_IN_SPIKE_STRIP_EXTRA_WIDTH = 2
const int RESIN_SHOT_DISTANCE_BETWEEN_SPIKES = 23
const int RESIN_SHOT_LITTLE_SPIKE_VERTICAL_OFFSET = -8
const float RESIN_SHOT_MAIN_SPIKE_HEALTH = 150
const asset RESIN_SHOT_TOTEM_FX = $"P_ferro_spike_main"
const asset RESIN_SHOT_SPIKE_FX = $"P_ferro_smoke"
const float RESIN_SHOT_SPIKE_TOTEM_RADIUS = 300
const float RESIN_SHOT_SPIKE_DELAY = 2.0
const float RESIN_SHOT_SPIKE_SCALE_DORMANT = 0.2
const float RESIN_SHOT_SPIKE_SCALE_ACTIVE = 1.0
const float RESIN_SHOT_SPIKE_SCALE_STABBING = 1.3

struct SpikeData
{
	vector startPos
	entity moveParent
	vector angles
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
} file

enum eResinShotOrientation
{
	ORIENTATION_DEFAULT,
	ORIENTATION_OPPOSITE,
	ORIENTATION_COUNT
}

enum eTransformType
{
	TRANSFROM_NONE
	TRANSFROM_SPIKES,
	TRANSFORM_SHOOT_THROUGH,
}

const int RESIN_SHOT_TRANSFROM_TYPE = eTransformType.TRANSFROM_NONE

void function MpWeaponResinShot_Init()
{
	PrecacheModel( RESIN_SHOT_COVER_WALL )
	PrecacheModel( RESIN_SHOT_COVER_WALL_CHARGED )
	PrecacheModel( RESIN_SHOT_SPIKE )
	PrecacheModel( RESIN_SHOT_SPIKE2 )
	PrecacheModel( RESIN_SHOT_SPIKE_TOTEM )
	PrecacheModel( RESIN_SHOT_LITTLE_SPIKE )
	PrecacheParticleSystem( RESIN_SHOT_CREATE_FX )
	PrecacheParticleSystem( RESIN_SHOT_DESTROY_FX )
	PrecacheParticleSystem( RESIN_SHOT_ARM_FP )
	PrecacheParticleSystem( RESIN_SHOT_DEBUG_SPHERE_FX )
	PrecacheParticleSystem( RESIN_SHOT_LIQUID_FX )
	PrecacheParticleSystem( RESIN_SHOT_TOTEM_FX )
	PrecacheParticleSystem( RESIN_SHOT_SPIKE_FX )
	RegisterSignal( KILL_CLIENT_THREAD_SIGNAL )
	RegisterSignal( KILL_UI_THREAD_SIGNAL )

	RegisterNetworkedVariable( RESIN_SHOT_ORIENTATION_NETVAR, SNDC_PLAYER_EXCLUSIVE, SNVT_INT, eResinShotOrientation.ORIENTATION_DEFAULT )
	Remote_RegisterServerFunction( "ClientCallback_ResinShotTogglePressed" )
	Remote_RegisterServerFunction( "ClientCallback_ResinShotResetOrientation" )

	#if CLIENT
		AddCallback_PlayerClassChanged( ResinShot_OnPlayerClassChanged )
		RegisterConCommandTriggeredCallback( "+scriptCommand5", ResinShotTogglePressed )
		AddTargetNameCreateCallback( RESIN_SHOT_MAIN_SPIKE_NAME, MainSpikeCreated )
	#endif
}


void function OnWeaponActivate_weapon_resin_shot( entity weapon )
{
	entity owner = weapon.GetOwner()
	if( !IsValid( owner ) )
		return

	#if SERVER
		                                                                                                 
	#endif
	#if CLIENT


		                                                         
		  	                                           
	#endif
}

void function OnWeaponDeactivate_weapon_resin_shot( entity weapon )
{
	#if CLIENT
		if( weapon.GetOwner() == GetLocalViewPlayer() )
			weapon.Signal( KILL_CLIENT_THREAD_SIGNAL )
	#endif
}


var function OnWeaponPrimaryAttack_weapon_resin_shot( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	#if SERVER
		                                
		                                                             
		                              
	#endif          

	#if CLIENT
		if( weapon.GetOwner() == GetLocalViewPlayer() )
			weapon.Signal( KILL_CLIENT_THREAD_SIGNAL )
	#endif
	return Grenade_OnWeaponTossReleaseAnimEvent( weapon, attackParams )
}


var function OnWeaponTossReleaseAnimEvent_weapon_resin_shot( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	#if SERVER
		                                
		                                                             
		                              
	#endif          

	#if CLIENT
		if( weapon.GetOwner() == GetLocalViewPlayer() )
			weapon.Signal( KILL_CLIENT_THREAD_SIGNAL )
	#endif

	return Grenade_OnWeaponTossReleaseAnimEvent( weapon, attackParams )
}


void function OnProjectileCollision_weapon_resin_shot( entity projectile, vector pos, vector normal, entity hitEnt, int hitBox, bool isCritical, bool isPassthrough )
{
	entity owner = projectile.GetOwner()

	if( !IsValid( owner ) )
	{
#if SERVER
		                    
#endif
		return
	}

	if ( projectile.GrenadeHasIgnited() )
		return

	if( !CanDeployResinOnEnt( hitEnt ) )
		return

	vector targetPos = pos
	vector targetNormal = normal
	bool isResinShotModel = IsResinShotModel( hitEnt )
	vector upVector = hitEnt.GetUpVector()

	bool projectileIsOnGround = normal.Dot( <0,0,1> ) > 0.75
	if ( !projectileIsOnGround && !IsResinDoor( hitEnt ) )
		return

	DeployableCollisionParams collisionParams
	collisionParams.pos = targetPos
	collisionParams.normal = targetNormal
	collisionParams.hitEnt = hitEnt
	collisionParams.hitBox = hitBox
	collisionParams.isCritical = isCritical

	bool result = PlantStickyEntity( projectile, collisionParams, <90, 0, 0> )
	if( !result )
		return

	#if SERVER
		          
			    
			      
			      
			 	 
			  
			  
			  
			  
			    
			  
			                      
			                                       
			                 

		                                                                                                                   
		                            
		 
			                                           
		 
		    
		 
			                                                
			                                                                     
			                                                               
			                                                 
			                                                                                   
			                                         
			                               
			                 
			                        
			                                                                                        
			                                                                  
			                                                                                                           
		 
		                      
	#endif
}

void function OnProjectileExplode_weapon_resin_shot( entity projectile )
{

}

bool function CanDeployResinOnEnt( entity ent )
{
	if( !ent.IsWorld() )
	{
		                          
		  	           
	}
	else
	{
		return true
	}

	return false
}

bool function CanResinShotExtend( entity ent )
{
	return false

	if( !IsResinShotModel( ent ) )
		return false

	if( GetResinShotCount( ent ) >= RESIN_SHOT_MAX_RAMP_SIZE )
		return false

	entity leaf = GetResinStructureLeaf( ent )
	TraceResults tr = TraceLine( leaf.GetOrigin(),  leaf.GetOrigin() + ( leaf.GetUpVector() * RESIN_SHOT_EXTEND_CHECK_LENGTH ), leaf, TRACE_MASK_NPCSOLID_BRUSHONLY, TRACE_COLLISION_GROUP_NONE )
	if( tr.fraction < 1.0 )
		return false

	return true
}

bool function CanSpikeExtend( vector pos, vector dir, array<entity> ignoreEnts )
{
	TraceResults tr = TraceLine( pos,  pos + ( dir * 80 ), ignoreEnts, TRACE_MASK_NPCSOLID_BRUSHONLY, TRACE_COLLISION_GROUP_NONE )

	if( tr.fraction < 1.0 )
		return false

	return true
}

bool function IsResinDoor( entity door )
{
	if( IsValid( door ) )
		return IsCodeDoor( door ) && !door.GetDoorIsReinforced() && ! door.GetDoorIsLocked()

	return false
}

bool function IsResinShotModel( entity model )
{
	if( IsResinShard( model ) && ( model.GetModelName() == RESIN_SHOT_COVER_WALL || model.GetModelName() == RESIN_SHOT_COVER_WALL_CHARGED ) )
		return true

	return false
}

#if SERVER
                                                                                                                                        
 
	                                                

	                                                                                                                                                
	                   
	 
		                                                                                   
		                                
	 


	                                   
	                          
		                                

	                    
	                                      
	                           

	            
		                                  
		 
			                           
			 
				                                                                                                                                    
				                                                      
				                   
			 

			                       
			 
				                                                
				 
					                                                           
					 
						                                          
						 
							                               
						 
					 
				 
			 
		 
	 

	                        
	                                                            
	             
	 
		                                                                 
		                                
		                  
			     
		           
	 
	                 
	                                     

	                  
		             
	    
		             
 
                                                                    
 
	                         
		      

	                                                              
	                                                                                        
		      


	                                                                  
	 
		                                                                 
		                          
		 
			                                                                
			 
				                           
				                           
			 
		 
	 
	                                                                              
	 
		                                                                 
		                          
		 
			                                                        
			 
				                                  
			 
		 
	 
 

                                                
 
	                                
		      

	                               

	                           
	                                                                                                                                                                                        
	                                                  

	            
		                   
		 
			                    
				                
		 
	 

	        

	                                                            
	 
		                                       
	 
	    
	 
		                                               
	 
	                            
 

                                                                                                                          
 
	                           
		                    

	                                                                              
	                                                                                                                                                                     
	                                 
	                                                   
	                                       
 

                                                             
 
	                               

	                                                                                                                                                                              
	                                                                                                                                                        
	                                     

	                                                   
	                             
	                                        
	                                                          
	                            
	                           
	                                      
	                                      
	                         
	                                   
	                                   
	                                      
	                                        
	                        
	                          

	                                                

	                                                  
	                               

	                                          
	 
		                                             
			                                      

		                                                           
		 
			                                         
			 
				                               
			 
		 

		                                                           
		 
			                                              
			                             
			 
				                                                                                                                                  
				                     
			 
		 
	 



	            
		                                  
		 
			                   
				                

			                                 
			 
				                                           
				 
					                  
						           
				 
				                                  
			 

			                       
			 
				                                            
				 
					                                                           
					 
						                                      
						 
							                               
						 
					 
				 
			 
		 
	 
	             
 

                                         
 
	                               

	                              
	                                 
	                          

	                                                                                                                                                                      

	                        
	                                

	                                                  
	                         
	 
		                                                                 
		                            
		           
	 
	                                      

	                                                                
	                                                                                                                                  
	                                                             
	                                                                                                                                  
	                                                             
	                                                                                                                                  
	                                                             
	                                                                                                                                  

	                                                                                                                            
	                                                  
	               
 

                                                                                                 
 
	                                                                
	                                                                          
		                                                                                                            
	                                                             
	                                                                            
		                                                                                                            
	                                                             
	                                                                         
		                                                                                                            
	                                                             
	                                                                           
		                                                                                                            
 

                                                                                                 
 
	                               
	                                        
	                           
	                                                                               
	                                                                                                                                                                                        
	                            
	 
		                                                                                                                                                                                           
		                                               
	 
	                                                                                                                                                                        
	                            
	 
		                                                                                                                                                                                           
		                                               
	 
	                                                                                                                                                                     
	                            
	 
		                                                                                                                                                                                           
		                                               
	 
	                                                                                                                                                                      
	                            
	 
		                                                                                                                                                                                           
		                                               
	 
	                                                                                    
	                                                                                                                                                                       
	                            
	 
		                                                                                                                                                                                           
		                                               
	 
	                                                                                                                                                                        
	                            
	 
		                                                                                                                                                                                           
		                                               
	 
	                                                                                                                                                                     
	                            
	 
		                                                                                                                                                                                           
		                                               
	 
	                                                                                                                                                                      
	                            
	 
		                                                                                                                                                                                           
		                                               
	 
 

                                                                                                     
 
	                               
	                                        
	                                                                               
	                                                                                                                                                                                                           
	                                
	 
		                                                                                                                                                                                                                                                                      
		                                                   
	 
	                                                                                                                                                                                           
	                                
	 
		                                                                                                                                                                                                                                                                      
		                                                   
	 
	                                                                                                                                                                                 
	                            
	 
		                                                                                                                                                                                                                                                          
		                                               
		                                                                                                                                                                                                                         
		                                    
		 
			                                                                                                                                                                                                                                                                      
			                                                   
		 
		                                                                                                                                                                                                         
		                                    
		 
			                                                                                                                                                                                                                                                                      
			                                                   
		 
	 
	                                                                                                                                                                                   
	                            
	 
		                                                                                                                                                                                                                                                          
		                                               
		                                                                                                                                                                                                                         
		                                    
		 
			                                                                                                                                                                                                                                                                      
			                                                   
		 
		                                                                                                                                                                                                         
		                                    
		 
			                                                                                                                                                                                                                                                                      
			                                                   
		 
	 
 

                                                                                                                                                              
 
	                                

	             
	                        
	                              

	         
	                      
	                                     

	                                                                                           
	                                                                                                                                                                              

	                                     
	 
		                       

		                   
		                  
			                       

		                       
		                             
		                            

		                                               

		                  
		 
			                                   

			                      
			 
				                                                                                                                                       

				                           
					                                                                         
				      

				                               
			 

			                                                       
			                                                                                                                                                                                          
		 

		                           
			                                                                 
		      

		                                                                                                                                                   
		                                   
		 
			                                              
			                 
				                                                

			                                                                                                                                                                          

			                           
				                                                                           
			      

			                                
				     

			                 
			                   
			                                
			                                   
			                       

			                         
			                                  
			 
				                                  
				 
					                                     
					                                                                                    
					                                                                                  
					                                                                                      
				 
			 
			                                                     
			 
				                                  
				 
					                                     
					                                                                                    
					                                                                                  
					                                                                                      
				 
			 

			                                                                             
			                               

			                                                                      
				     

			                              
			                         

			        
		 

		                                        
		 
			     
		 

		                                    
		 
			                                                                                                                                                

			                           
				                                                                         
			      

			                                 
				        
		 

		                                                                                                                                                       

		                           
			                                                                
		      

		                                       
		 
			                                                                                                                                
				     
		 
		    
		 
			                                                                           
			                                                                                                                                                                            

			                           
				                                                                                  
			      

			                                
				     

			                 
			                   
			                                
			                                   
			                       

			                         
			                                  
			 
				                                  
				 
					                                     
					                                                                         
					                                                                                  
					                                                                                      
				 
			 

			                                                                             
			                               

			                                                                     
				     

			                              
			                         
		 
	 

	                                            
		                         

	                    
 



                                                                                                                                                                        
 
	                                                                                                         
	                                                                 

	                                   
	                          
		                                

	                 
	                                     
	                           

	                                                        

	                
 

                                                                               
 
	                                                
	                               

	                                                                                                                                                                                                            
	                                                                                                                       
	                                                     
	                
	                                       

	            
		                                  
		 
			                   
				                

			                       
			 
				                                                                                                                            
				                                                  
				               
			 
		 
	 

	                          
	                               
	             
	 
		                                                                 
		                            
		                  
			     
		           
	   

	                           

	                                                   
	                             
	                                        
	                               
	                            
	                           
	                                      
	                         
	                                   
	                                            
	                                   
	                                      
	                                        
	                                             
	                        
	                                    
	                          

	                                                  

	             
	 
		                          
		                                                    
		                      
		 
			                                                                                         
			 
				                    
				     
			 
		 



		                                      
		 
			                     
			 
				                   
					                                                      
				    
					                                                    
				                 
			 
			    
			 
				                                                     
				                
			 
		 
		    
		 
			                                                    
		 

		           
	 
 

                                                                     
 
	                                 
	                               

	                          
	                              

	            
	                
	                                    

	                           

	             
	 
		                     
		                                                    
		                      
		 
			                                                                                         
			 
				                    
				     
			 
		 

		                                         
		 
			            
			             
			                                               
			 
				                      
				 
					             
				 
			 
		 
		                                              
		 
			            
			                
			                                               
			 
				                      
				 
					                
				 
			 
		 
		                                 
		           
	 
 

                                                             
 
	                                         
		      

	                                              
 

                                                                      
 
	                                
	                                 

	                                                         
		       

	                                                                                              
	                                                               
		      

	                                       
	 
		                 
		                                                                                                      
		                 
		                                    
	 
	    
	 
		                                       
	 

	                                    
	 
		                                                        
		 
			                                       
			                                                
			 
				                                                                
				                                   
			 
		 
	   

	                                     
	 
		                                                                                       
		                                                                                                                                                
		 
			                                                                                                                                 
			                                            
		 
		           
	 
 

                                                                       
 
	                         
		      

	                                                                            
	                               
		      

	                                                                 
		      

	                                                                                                  
 
#endif


#if CLIENT
void function OnClientAnimEvent_weapon_resin_shot( entity weapon, string name )
{
	GlobalClientEventHandler( weapon, name )

	if ( name == "muzzle_flash" )
	{
		weapon.PlayWeaponEffect( RESIN_SHOT_MUZZLE_FLASH_FP, RESIN_SHOT_MUZZLE_FLASH_3P, "muzzle_flash" )
	}
}

void function WeaponActive_Client( entity owner, entity weapon )
{
	EndSignal( weapon, KILL_CLIENT_THREAD_SIGNAL )
	EndSignal( weapon, "OnDestroy" )
	EndSignal( owner, "OnDestroy" )

	entity proxy = ResinShotCreatePlacementProxy( RESIN_SHOT_SPIKE2 )
	proxy.EnableRenderAlways()
	proxy.Show()
	DeployableModelHighlight( proxy )
	entity proxy2 = ResinShotCreatePlacementProxy( RESIN_SHOT_SPIKE2 )
	proxy2.EnableRenderAlways()
	proxy2.Show()
	DeployableModelHighlight( proxy2 )
	entity proxy3 = ResinShotCreatePlacementProxy( RESIN_SHOT_SPIKE2 )
	proxy3.EnableRenderAlways()
	proxy3.Show()
	DeployableModelHighlight( proxy3 )
	entity proxy4 = ResinShotCreatePlacementProxy( RESIN_SHOT_SPIKE2 )
	proxy4.EnableRenderAlways()
	proxy4.Show()
	DeployableModelHighlight( proxy4 )
	EmitSoundOnEntity( owner, "bangalore_slide_start_water_1p" )

	int fxHandle = -1
	entity vm = weapon.GetWeaponViewmodel()
	if ( IsValid( vm ) )
	{
		int attach = vm.LookupAttachment( "L_HAND" )
		int fxid = GetParticleSystemIndex( RESIN_SHOT_ARM_FP )
		fxHandle = StartParticleEffectOnEntity( vm, fxid, FX_PATTACH_POINT_FOLLOW, attach )
	}

	OnThreadEnd(
		function () : ( owner, proxy, fxHandle, proxy2, proxy3, proxy4 )
		{
			if ( IsValid( proxy ) )
			{
				proxy.Destroy()
			}
			if ( IsValid( proxy2 ) )
			{
				proxy2.Destroy()
			}
			if ( IsValid( proxy3 ) )
			{
				proxy3.Destroy()
			}
			if ( IsValid( proxy4 ) )
			{
				proxy4.Destroy()
			}
			if ( IsValid( owner ) )
			{
				StopSoundOnEntity( owner, "bangalore_slide_start_water_1p" )
			}
			EffectStop( fxHandle, true, true )
			HidePlayerHint( "#WPN_RESIN_SHOT_HINT" )

		}
	)

	bool hitResinLastFrame = false
	bool firstLoop = true
	while( true )
	{
		bool hitResinThisFrame = false
		if( weapon.IsReadyToFire() )
		{
			if( firstLoop )
			{
				firstLoop = false
				WaitFrame()
				continue
			}

			GrenadeIndicatorData data = weapon.GetMostRecentGrenadeIndicatorData()
			bool projectileIsOnGround = data.hitNormal.Dot( <0,0,1> ) > 0.75
			entity hitEnt = data.hitEnt
			if( IsValid( hitEnt ) && CanDeployResinOnEnt( hitEnt ) && ( IsResinDoor( hitEnt ) || projectileIsOnGround ) )
			{

				proxy.Hide()
				proxy2.Hide()
				proxy3.Hide()
				proxy4.Hide()

				vector targetPos = data.hitPos
				vector flattenedDir = FlattenNormalizeVec( owner.GetViewVector() )
				vector targetAngles = VectorToAngles( flattenedDir )

				vector newAngles = RotateAnglesAboutAxis( targetAngles, <0, 0, 1>, 0 )
				proxy.SetOrigin( targetPos + ( AnglesToRight( newAngles ) * -90 ) )
				proxy.SetAngles( newAngles )
				newAngles = RotateAnglesAboutAxis( newAngles, <0, 0, 1>, 90 )
				proxy2.SetOrigin( targetPos + ( AnglesToRight( newAngles ) * -90 ) )
				proxy2.SetAngles( newAngles )
				newAngles = RotateAnglesAboutAxis( newAngles, <0, 0, 1>, 90 )
				proxy3.SetOrigin( targetPos + ( AnglesToRight( newAngles ) * -90 ) )
				proxy3.SetAngles( newAngles )
				newAngles = RotateAnglesAboutAxis( newAngles, <0, 0, 1>, 90 )
				proxy4.SetOrigin( targetPos + ( AnglesToRight( newAngles ) * -90 ) )
				proxy4.SetAngles( newAngles )

				array< entity > ignoreEnts = [ proxy, proxy2, proxy3, proxy4 ]
				if( CanSpikeExtend( targetPos + < 0, 0, 20 >, -AnglesToRight( targetAngles ), ignoreEnts ) )
					proxy.Show()
				if( CanSpikeExtend( targetPos + < 0, 0, 20 >, -AnglesToForward( targetAngles ), ignoreEnts ) )
					proxy2.Show()
				if( CanSpikeExtend( targetPos + < 0, 0, 20 >, AnglesToRight( targetAngles ), ignoreEnts ) )
					proxy3.Show()
				if( CanSpikeExtend( targetPos + < 0, 0, 20 >, AnglesToForward( targetAngles ), ignoreEnts ) )
					proxy4.Show()

				                             
				 
					                                                                                                                    
					                                 
					                            
					                               
					                                              
					                               
					 
						                                                                                                                                
						                                       
						                             
						                                
						             
					 
				   


			}
			else
			{
				proxy.Hide()
				proxy2.Hide()
				proxy3.Hide()
				proxy4.Hide()
			}
		}
		else
		{
			proxy.Hide()
			proxy2.Hide()
			proxy3.Hide()
			proxy4.Hide()
		}
		if( !hitResinThisFrame )
		{
			HidePlayerHint( "#WPN_RESIN_SHOT_HINT" )
			printt("Hide hint")
		}
		hitResinLastFrame = hitResinThisFrame
		WaitFrame()
	}
}

entity function ResinShotCreatePlacementProxy( asset modelName )
{
	entity proxy = CreateClientSidePropDynamic( <0, 0, 0>, <0, 0, 0>, modelName )
	proxy.EnableRenderAlways()
	proxy.kv.rendermode = 3
	proxy.kv.renderamt = 1
	proxy.Hide()

	return proxy
}

void function ResinShotTogglePressed( entity player )
{
	if ( player != GetLocalViewPlayer() || player != GetLocalClientPlayer() )
		return

	Remote_ServerCallFunction( "ClientCallback_ResinShotTogglePressed" )
}

void function ResinShot_OnPlayerClassChanged( entity player )
{
	if ( player != GetLocalViewPlayer()  )
		return

	player.Signal( KILL_UI_THREAD_SIGNAL )


	entity tacWeapon = player.GetOffhandWeapon( OFFHAND_TACTICAL )
	if ( RESIN_SHOT_TRANSFROM_TYPE == eTransformType.TRANSFROM_NONE || !IsValid( tacWeapon ) || tacWeapon.GetWeaponClassName() != RESIN_SHOT_WEAPON_NAME )
		return

	thread TacticalUIThread( player )
}

void function TacticalUIThread( entity owner )
{
	if( !IsValid( owner ) )
		return
	EndSignal( owner, "OnDestroy" )
	EndSignal( owner, KILL_UI_THREAD_SIGNAL )

	OnThreadEnd(
		function () : ()
		{
			if( file.hud )
			{
				RuiDestroyIfAlive( file.hud )
				file.hud = null
			}
		}
	)

	file.hud = CreateCockpitPostFXRui( $"ui/catalyst_tactical_hud.rpak", HUD_Z_BASE )
	WaitForever()
}

void function MainSpikeCreated( entity spike )
{
	entity player = GetLocalViewPlayer()
	ShowGrenadeArrow( player, spike, RESIN_SHOT_SPIKE_TOTEM_RADIUS, 0.0, true, eThreatIndicatorVisibility.INDICATOR_SHOW_TO_ENEMIES )
}
#endif          

