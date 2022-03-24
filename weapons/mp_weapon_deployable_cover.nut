global function MpWeaponDeployableCover_Init

global function OnWeaponTossReleaseAnimEvent_weapon_deployable_cover
global function OnWeaponAttemptOffhandSwitch_weapon_deployable_cover
global function OnWeaponTossPrep_weapon_deployable_cover
global function OnProjectileCollision_weapon_deployable_cover

#if SERVER
                           
                                                 
#endif

const DEPLOYABLE_ONE_PER_PLAYER = false
const DEPLOYABLE_SHIELD_DURATION = 15.0

const DEPLOYABLE_SHIELD_FX = $"P_pilot_cover_shield"
const DEPLOYABLE_SHIELD_FX_AMPED = $"P_pilot_amped_shield"
const DEPLOYABLE_SHIELD_HEALTH = 850

const DEPLOYABLE_SHIELD_RADIUS = 84
const DEPLOYABLE_SHIELD_HEIGHT = 89
const DEPLOYABLE_SHIELD_FOV = 150

const DEPLOYABLE_SHIELD_ANGLE_LIMIT = 0.55

struct
{
	table< entity, int > playerToAmpedWallsActiveTable                                                            
	int index
} file

void function MpWeaponDeployableCover_Init()
{
	PrecacheWeapon( "mp_weapon_deployable_cover" )

	PrecacheParticleSystem( DEPLOYABLE_SHIELD_FX )
	file.index = PrecacheParticleSystem( DEPLOYABLE_SHIELD_FX_AMPED )
	PrecacheModel( $"mdl/fx/pilot_shield_wall_amped.rmdl" )
}

bool function OnWeaponAttemptOffhandSwitch_weapon_deployable_cover( entity weapon )
{
	int ammoReq = weapon.GetAmmoPerShot()
	int currAmmo = weapon.GetWeaponPrimaryClipCount()
	if ( currAmmo < ammoReq )
		return false

	entity player = weapon.GetWeaponOwner()
	if ( player.IsPhaseShifted() )
		return false

	return true
}

var function OnWeaponTossReleaseAnimEvent_weapon_deployable_cover( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	int ammoReq = weapon.GetAmmoPerShot()
	weapon.EmitWeaponSound_1p3p( GetGrenadeThrowSound_1p( weapon ), GetGrenadeThrowSound_3p( weapon ) )

	#if SERVER
	                                                                           
		                                      
	#endif

	entity deployable = ThrowDeployable( weapon, attackParams, DEPLOYABLE_THROW_POWER, OnDeployableCoverPlanted, null, null )
	entity player = weapon.GetWeaponOwner()

	if ( deployable )
	{
		if ( player.IsPlayer() )	                                            
			PlayerUsedOffhand( player, weapon )

		#if SERVER
		                                                            
		                            
			                                                

		                                         
		#endif

		#if SERVER
			                                                
		#endif
	}

	return ammoReq
}

void function OnWeaponTossPrep_weapon_deployable_cover( entity weapon, WeaponTossPrepParams prepParams )
{
	weapon.EmitWeaponSound_1p3p( GetGrenadeDeploySound_1p( weapon ), GetGrenadeDeploySound_3p( weapon ) )
}

void function OnDeployableCoverPlanted( entity projectile, DeployableCollisionParams collisionParams )
{
	#if SERVER
		                               
		                                      

		                                    
		                                                  
		                                             

		                                                                                                           
		                                 
		 
			                                                               
			                                                                     

			                                             
			                                                                       
				                                           
		 

		                                          

		                                         
		                        
		                                     

		                                                                                                                            
		 
			                                          
		 
		                                
		 
			                                 
		 

		                                                                                                                                                                                            

		                  
			                                                    
		    
			                                                
	#endif
}

#if SERVER
                                                                                                                         
 
	                               
	                             
		      

	                                                            

	                                      
	                                
	                                                          
	                            

	                                                                                                                                                                                                     

	                      
	                    
		      

	                                    
	                                     
	                                          
	                                    

	                                                                 

	            
		                                         
		 
			                                                            
			                                                          

			                                                         
				                                    

			                              
				                      
		 
	 

	             
 

                                                                             
 
	                 
	                                                         
	                                     

	                                      
	                                
	                                                          
	                            

	                                                         
	                                                                                                                     
	                                         
	                                                                             
	                                                                           
	                                       
	                
	                                         
	                                        
	                              
	                           
	                                                                       
	                                  
	                                                           

	               
	                                 
	 
		                                                                                                                                       
	 
	    
	 
		                                                                                
		                                                                    
	 

	                                                            

	                                             

	                                      
	                                          
	                                                                                                                

	                                                     

	                                   
	                                           
	 
		                                                        
		                                    
		 
			                                                                                                                   
			                                                                  
			 
				                                                                                                                        
				     
			 
		 

		                                                           
	 

	            
		                                             
		 
			                                                         
			                                                       

			                         
				                                 

			                           
				                   

			                          
				                      
		 
	 

	                               
 

                                                                                 
 
	                                                   
		                                              
	    
		                                                 

	                                  


	            
	                       
		 
			                       
			 
				                                                      
				                                              
			 

		 
	 

	             
 

                                                               
 
	                                                      
		        

	                                                  
 

                                                                    
 
	                                                      
	                           
		      

	                          
		                                                                                                                                                                                                                                                                                                                                           

	                                                 
	                                                                           
	                                    

	                                          
 
#endif          

void function OnProjectileCollision_weapon_deployable_cover( entity projectile, vector pos, vector normal, entity hitEnt, int hitBox, bool isCritical, bool isPassthrough )
{
	#if CLIENT
	if ( !IsValid( hitEnt ) )
		return

	if ( hitEnt.IsProjectile() )
		return
	#endif

	#if SERVER
	                                 
	#endif
	{
		#if SERVER
		                                                
			                    
		                                       
		#endif

		DeployableCollisionParams collisionParams
		collisionParams.pos = pos
		collisionParams.normal = normal
		collisionParams.hitEnt = hitEnt
		collisionParams.hitBox = hitBox
		collisionParams.isCritical = isCritical

		bool result = PlantStickyEntityOnWorldThatBouncesOffWalls( projectile, collisionParams, 0.7 )
	}
}
