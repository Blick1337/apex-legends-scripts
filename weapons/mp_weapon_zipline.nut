  

#if SERVER
       

                                                       
                                                
                    
                                               
      
#endif              

global function MpWeaponZipline_Init
global function OnWeaponPrimaryAttack_weapon_zipline
global function OnProjectileCollision_weapon_zipline
global function OnWeaponRaise_weapon_zipline
                    
    global function OnWeaponDeactivate_weapon_zipline
      

#if CLIENT
global function OnCreateClientOnlyModel_weapon_zipline
#endif

const ZIPLINE_STATION_MODEL_VERTICAL = $"mdl/IMC_base/scaffold_tech_horz_rail_c.rmdl"
const ZIPLINE_STATION_MODEL_HORIZONTAL = $"mdl/industrial/zipline_arm.rmdl"
const ZIPLINE_TEMP_ZIPLINE_GUN_STATION_MODEL = $"mdl/props/pathfinder_zipline/pathfinder_zipline.rmdl"
const ZIPLINE_TEMP_ZIPLINE_GUN_STATION_WALL_MODEL = $"mdl/props/pathfinder_zipline/pathfinder_zipline.rmdl"
                    
    const asset TEMP_ZIPLINE_RANGE_FX = $"P_ar_zipline_range"
    const string ZIPLINE_EXTENSION_SOUND = "pathfinder_zipline_cable_extension"
    const string ZIPLINE_USABLE_SOUND = "pathfinder_zipline_cable_tension"
    const vector ZIPLINE_BEGIN_STATION_TOP_ROPE_OFFSET = <0.0, 0.0, 21.3>                                                                                                                                                                                                                                                                         
     
                                        
                                          
      
const ZIPLINE_STATION_EXPLOSION = $"p_impact_exp_small_full"
const float ZIPLINE_REFUND_TIME = 3
const float ZIPLINE_AUTO_DETACH_DISTANCE = 100.0
const int ZIPLINE_MAX_IN_WORLD = 10
const string ZIPLINE_START_SCRIPTNAME = "zipline_start"

#if DEV
                    
const bool DEBUG_ZIPLINE_AUDIO_LINE = false
      
#endif

struct
{
    table<int, entity> activeWeaponBolts
                        
        array<entity>    pathfinderZiplines
        bool             weaponAlreadyActive
          
} file

void function MpWeaponZipline_Init()
{
    PrecacheModel( ZIPLINE_STATION_MODEL_VERTICAL )
    PrecacheModel( ZIPLINE_STATION_MODEL_HORIZONTAL )
    PrecacheModel( ZIPLINE_TEMP_ZIPLINE_GUN_STATION_MODEL )
    PrecacheModel( ZIPLINE_TEMP_ZIPLINE_GUN_STATION_WALL_MODEL )
    PrecacheParticleSystem( ZIPLINE_STATION_EXPLOSION )
    PrecacheParticleSystem( TEMP_ZIPLINE_RANGE_FX )

    PrecacheMaterial( $"cable/zipline" )
    PrecacheMaterial( $"cable/zipline_active" )

                        
        #if CLIENT
        RegisterSignal( "ClearZiplineUI" )
        #endif
          
}

#if SERVER
                                                                                                             
 
	        
 

                                                                  
 
	                                                                                                
 

                                                               
 
	                                                                  
	                               
		            

	                                         
	 
		                                     
		                                  
	 
	                                              
	 
		                                     
		                                  
	 
	                                              
	 
		                                     
		                                  
	 
	                                              
	 
		                                     
		                                  
	 
	                                              
	 
		                                     
		                                  
	 
	                                              
	 
		           
	 
	    
	 
		                                  
	 

	                                                            
	                                                            
	                                                                                        
	                                          
	                          
		                    

	                                                   
	           
 
#endif              

#if SERVER
                                                                           
 
	                           
	                               

	            
		                       
		 
			                         
			 
				      
			 

			                                      
			 
				                                                                                                    
				                                                       
				      
			 

			                                                                                                        
			                                                                         
		 
	 

	                                
	                                    

	             
 
#endif

var function OnWeaponPrimaryAttack_weapon_zipline( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	if ( !weapon.ZiplineGrenadeHasValidSpot() )
	{
		weapon.DoDryfire()
		return 0
	}

	#if SERVER
		                                              
		 
			                                                                        
			                  
			        
		 
	#endif

	weapon.EmitWeaponNpcSound( LOUD_WEAPON_AI_SOUND_RADIUS_MP, 0.2 )
	entity weaponOwner = weapon.GetWeaponOwner()
	int weaponOwnerTeam = weaponOwner.GetTeam()

	bool shouldCreateProjectile = false
	if ( IsServer() || weapon.ShouldPredictProjectiles() )
		shouldCreateProjectile = true

	if ( shouldCreateProjectile )
	{
		WeaponFireGrenadeParams fireGrenadeParams
		fireGrenadeParams.pos = attackParams.pos
		fireGrenadeParams.vel = attackParams.dir
		fireGrenadeParams.angVel = <0, 0, 0>
		fireGrenadeParams.fuseTime = 0.0
		fireGrenadeParams.scriptTouchDamageType = 0
		fireGrenadeParams.scriptExplosionDamageType = 0
		fireGrenadeParams.clientPredicted = true
		fireGrenadeParams.lagCompensated = true
		fireGrenadeParams.useScriptOnDamage = true
		fireGrenadeParams.isZiplineGrenade = true
                      
		fireGrenadeParams.ziplineGrenadeRopeMaterial = "cable/zipline_active"
       
                                                                 
        

		entity projectile = weapon.FireWeaponGrenade( fireGrenadeParams )

		#if SERVER
                       
			                                                        
         
			                                         
			                                       
			                                            
			                             
			                                                                
			                                                      

			                                                          
			                                                                
		#else
			PlayerUsedOffhand( weaponOwner, weapon )
		#endif          
                     
		#if CLIENT
		weapon.Signal( "ClearZiplineUI" )
		#endif
       
	}

	return weapon.GetWeaponSettingInt( eWeaponVar.ammo_min_to_fire )
}

#if SERVER
                                                                                                                             
 
	                                                                                                          

	                                                                                
	                                      

	            
		                                                                                       
		 
			                        
			 
				                                      
				                                                

				                          
				 
					                                                                        
					                                            
				 
			 

			                            
			 
				                                                                                        
				                                                           
				                                                                           
				                                                                    
				                                         
				                    
			 

			                          
			 
				                                                                                      
				                                                         
				                                                                         
				                                                                  
				                                         
				                  
			 

			                              
			 
				                      
			 

			                            
			 
				                    
			 
		 
	 

	                            
	 
		                                    
	 

	                          
	 
		                                  
	 

	                              
	 
		                                      
	 

	                            
	 
		                                    
	 

	                        

	                           

	             
 

                                                                                                                                                           
 
	                                    
	                                     
	                                      
	                                                 

	                                                
                     
	                                                   
	                                                       
	                                                          
      
                                             
       
	                                   
	                                               
	                                                                         
	                                                                                         
	                                                                                   
	                                     
	                                                                                                            
	                                          
	                                                  

	                                                                    

	                                      
	                       
		                               

	                                                  
	                                 
	                                             
	                                                                       
	                                                                                                    
	                                                                

	                                      
	                              

	                              
	                            
	                                                       

	                                                                                                    
	 
		                                                           
	 

	                                                                                     

	                                                                      
 

                    
                                                               
     
    	                                                  
     
      

#endif

bool function CanTetherEntities( entity startEnt, entity endEnt )
{
	TraceResults traceResult = TraceLine( startEnt.GetOrigin(), endEnt.GetOrigin(), [], TRACE_MASK_NPCWORLDSTATIC, TRACE_COLLISION_GROUP_NONE )
	if ( traceResult.fraction < 1 )
		return false

	return true
}


void function OnProjectileCollision_weapon_zipline( entity projectile, vector pos, vector normal, entity hitEnt, int hitbox, bool isCritical, bool isPassthrough )
{
	#if SERVER
		                                               
		             

		                                    
		                       
		 
			                       
			 
				                               
				 
					                                             
					                        
					 
						                                                     
						                                   
						 
							                                       
							                                                  
							                                          
							 
								                                                                                                                                                                                 
								                  
								 
									                                                                     
									                                                                     

									                                  
									                                                                                                                   
									                                     
									                                                
									                                                                      
									                                                                                                                       
									                                                                                                                                                                  
									                                          
									 
										                                                          
                               
                                                                               
                
									 
									                               

									                                         
                             
										                                                                                                   
										       
										                               
											                                                                                            
										      
               
								 
							 
						 
					 
				 
			 
		 

		                                          
		 
			                        
			 
				                                                                         
			 

			                                                      
			 
				                          
				 
					                  
				 
			 
		 

		                        
		 
			                                      
		 
		                    
	#endif
}


#if CLIENT
void function OnCreateClientOnlyModel_weapon_zipline( entity weapon, entity model, bool validHighlight )
{
	if ( validHighlight )
	{
		DeployableModelHighlight( model )
	}
	else
	{
		DeployableModelInvalidHighlight( model )
	}
                    
	if ( !file.weaponAlreadyActive )
    	thread WeaponActiveVFXThread_Client( weapon )
}

void function WeaponActiveVFXThread_Client( entity weapon )
{
	file.weaponAlreadyActive = true
	entity owner = weapon.GetOwner()
	owner.EndSignal( "OnDestroy" )
	weapon.EndSignal( "OnDestroy" )
	weapon.EndSignal( "ClearZiplineUI" )

	var overlayRui = CreateCockpitPostFXRui( $"ui/zipline_placement.rpak", HUD_Z_BASE )
	RuiSetVisible( overlayRui, false )
	RuiSetBool( overlayRui, "useWeaponCycleToCancel", GetKeyCodeForBinding( "weaponCycle", IsControllerModeActive().tointeger() ) != -1 )

	int fxId = GetParticleSystemIndex( TEMP_ZIPLINE_RANGE_FX )
	int pulseVFX  = StartParticleEffectOnEntity( owner, fxId, FX_PATTACH_ABSORIGIN_FOLLOW, ATTACHMENTID_INVALID )
                     
	    float ziplineRange = GetWeaponInfoFileKeyField_GlobalFloat(weapon.GetWeaponClassName(), "zipline_distance_max")
	    EffectSetControlPointVector( pulseVFX, 1, <ziplineRange, 0, 0> )
      
                                                                         
       

	OnThreadEnd(
		function() : ( weapon, overlayRui, pulseVFX )
		{
			if( IsValid( weapon ) )
				RuiDestroyIfAlive( overlayRui )
			if ( EffectDoesExist( pulseVFX ) )
				EffectStop( pulseVFX, false, true )
			file.weaponAlreadyActive = false
		}
	)

	while( true )
	{
		RuiSetVisible( overlayRui, true )
		WaitFrame()
	}
      
}
#endif

#if SERVER
                                                                                      
 
	                                                               

	                                                                                                           
	                                            
	                                       
		                               
	                                       
	                          
		      
	                                                                                 
		      

	                                              
	                               
		      

	                                         
		      

	                                                      
		      

	                                                 
		      

	                                                         
	                                                                                   
	                                                                                   
	                                                                                                             
	                                                                     
	 
		                      
		      
	 

	                                  
	                                               
	                                                     
	                                                                                                                    
	                                                               
                      
                                                                   
       
	                                                                              
	                                                                                     

	                                   
	                                         
	                                                                                                                                                                


                     
	                                                                                 
       
 

                                                                                                                     
 
	                                                         
	                                                       
	 
		                                                    
		                                                        
	 

	                                                 
	                                                                 
	                                               

	                                    
	                                                          

	            
 

#endif          

void function OnWeaponRaise_weapon_zipline( entity weapon )
{
	weapon.EmitWeaponSound_1p3p( "pathfinder_zipline_predeploy", "pathfinder_zipline_predeploy" )
}

                    
    void function OnWeaponDeactivate_weapon_zipline( entity weapon )
    {
    	#if CLIENT
    	weapon.Signal( "ClearZiplineUI" )
    	#endif
    }
      