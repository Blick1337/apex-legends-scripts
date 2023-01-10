                      
global function OnProjectileCollision_weapon_throwingknife
global function OnWeaponActivate_weapon_throwingknife

const int KNIFE_DESPAWN_TIME = 5

void function OnWeaponActivate_weapon_throwingknife( entity weapon )
{

#if SERVER

	                         
		      

	                                       

	                                          
		      

	                                                    
	 
		                                             
		                                                                  
	 
	                                                          
	 
		                                               
	 

#endif

}

void function OnProjectileCollision_weapon_throwingknife( entity projectile, vector pos, vector normal, entity hitEnt, int hitBox, bool isCritical, bool isPassthrough )
{

	if ( !IsValid( projectile ) )
	{
		return
	}


	if ( !IsValid( hitEnt ) )
	{
		#if SERVER
			                    
		#endif
		return
	}

	bool ignoreTarget

	                                   
	if ( IsValid( projectile.GetOwner() ) && hitEnt == projectile.GetOwner() )
		ignoreTarget = true

	                    
	if ( hitEnt.IsPlayer() && IsFriendlyTeam( hitEnt.GetTeam(), projectile.GetTeam() ) )
		ignoreTarget = true

	                       
	if ( hitEnt.IsPlayerVehicle() )
		ignoreTarget = true

	                                                  
	if ( hitEnt.IsPlayer() && StatusEffect_GetTimeRemaining (hitEnt, eStatusEffect.death_totem_recall) > 0.0 )
	{
		ignoreTarget = true
	}

	vector forward = AnglesToForward( VectorToAngles( projectile.GetVelocity() ) )
	vector stickNormal

	if ( LengthSqr( forward ) > FLT_EPSILON )
		stickNormal = forward
	else
		stickNormal = normal

	DeployableCollisionParams collisionParams
	collisionParams.pos = pos + (projectile.proj.savedDir)
	collisionParams.normal = stickNormal
	collisionParams.hitEnt = hitEnt
	collisionParams.hitBox = hitBox
	collisionParams.isCritical = isCritical
	projectile.kv.solid          = 0
	projectile.SetDoesExplode( false )
	
	vector plantAngles = AnglesCompose( VectorToAngles( collisionParams.normal ), <90,0,0> )

	if ( !PlantStickyEntity( projectile, collisionParams, <90,0,0> , true ) || ignoreTarget )
	{
		                          
		#if SERVER
			                                              
		#else              
			                                                                                                             
			projectile.StopPhysics()
			projectile.SetVelocity( <0, 0, 0> )
			projectile.ProjectileTeleport( collisionParams.pos, plantAngles )
		#endif                       
	}
	else
	{
		               
		if ( IsValid( projectile ) )
		{
			#if CLIENT
				projectile.ProjectileTeleport( collisionParams.pos, plantAngles )
			#endif              

			if ( IsValid( projectile.GetWeaponSource() ) )
			{
				StopSoundOnEntity( projectile, GetGrenadeProjectileSound( projectile.GetWeaponSource() ) )
			}
			thread CleanupKnife( projectile, hitEnt, KNIFE_DESPAWN_TIME )
		}
	}
}

void function CleanupKnife( entity ent, entity hitEnt, float time )
{
#if SERVER
	            
		                            
		 
			                     
			 
				             
			 
		 
	 

	                        
	 
		                                                                  
			      

		                               
		                             
	 
	    
	 
		      
	 

	                     
		                            
	    
		      

	                
		         
	    
		             
#endif
}


      


