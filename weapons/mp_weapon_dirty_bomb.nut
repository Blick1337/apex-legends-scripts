global function MpWeaponDirtyBomb_Init

global function OnWeaponTossReleaseAnimEvent_weapon_dirty_bomb
global function OnWeaponTossPrep_weapon_dirty_bomb

#if SERVER
                                      
#endif

global const string DIRTY_BOMB_TARGETNAME = "caustic_trap"
global const string CAUSTIC_DIRTY_BOMB_WEAPON_CLASS_NAME = "mp_weapon_dirty_bomb"

const asset DIRTY_BOMB_CANISTER_MODEL = $"mdl/props/caustic_gas_tank/caustic_gas_tank.rmdl"

const asset DIRTY_BOMB_CANISTER_EXP_FX = $"P_meteor_trap_EXP"
const asset DIRTY_BOMB_CANISTER_FX_ALL = $"P_gastrap_start"

const int DIRTY_BOMB_MAX_GAS_CANISTERS = 6

const string DIRTY_BOMB_WARNING_SOUND = "weapon_vortex_gun_explosivewarningbeep"

                             
const int DIRTY_BOMB_HEALTH = 150
const float DIRTY_BOMB_CLOUD_LINGER_TIME = 2.0
const asset DIRTY_BOMB_CANISTER_EXPLODE_FX = $"P_gastrap_destroyed"
const string DIRTY_BOMB_CANISTER_EXPLODE_SOUND = "GasTrap_Destroyed_Explo"
const float DIRTY_BOMB_GAS_DURATION = 11.0
     
                                          
      
const float DIRTY_BOMB_GAS_RADIUS = 256.0
const float DIRTY_BOMB_DETECTION_RADIUS = 140.0

const float DIRTY_BOMB_THROW_POWER = 1.0
const float DIRTY_BOMB_GAS_FX_HEIGHT = 45.0
const float DIRTY_BOMB_GAS_CLOUD_HEIGHT = 48.0

                     
const float DIRTY_BOMB_ACTIVATE_DELAY = 0.2
const float DIRTY_BOMB_PLACEMENT_RANGE_MAX = 64
const float DIRTY_BOMB_PLACEMENT_RANGE_MIN = 32
const vector DIRTY_BOMB_BOUND_MINS = <-8, -8, -8>
const vector DIRTY_BOMB_BOUND_MAXS = <8, 8, 8>
const vector DIRTY_BOMB_PLACEMENT_TRACE_OFFSET = <0, 0, 128>
const float DIRTY_BOMB_ANGLE_LIMIT = 0.55
const float DIRTY_BOMB_PLACEMENT_MAX_HEIGHT_DELTA = 20.0
const float DIRTY_BOMB_TRACE_START_OFFSET = 16
const float DIRTY_BOMB_TRACE_GROUND_END_OFFSET = 32
const float DIRTY_BOMB_TRACE_HEIGHT_END_OFFSET = 24

const bool CAUSTIC_DEBUG_DRAW_PLACEMENT = false

struct DirtyBombPlacementInfo
{
	vector origin
	vector angles
	entity parentTo
	bool   success = false
	bool   doDeployAnim = true

	entity originalProjectile
}

struct
{
	#if SERVER
		                                      
		                                     
		     		                             
	#endif
} file

void function MpWeaponDirtyBomb_Init()
{
	DirtyBombPrecache()
	#if SERVER
		                                                                                                  
		                                                                                              
		                                                                                                               
	#endif

	#if CLIENT
		AddCreateCallback( "prop_script", DirtyBomb_OnPropScriptCreated )

		AddCallback_MinimapEntShouldCreateCheck_Scriptname( DIRTY_BOMB_TARGETNAME, Minimap_DontCreateRuisForEnemies )
		RegisterMinimapPackage( "prop_script", eMinimapObject_prop_script.DIRTY_BOMB, MINIMAP_OBJECT_RUI, MinimapPackage_DirtyBomb, FULLMAP_OBJECT_RUI, MinimapPackage_DirtyBomb )
	#endif
}


void function DirtyBombPrecache()
{
	RegisterSignal( "DirtyBomb_Detonated" )
	RegisterSignal( "DirtyBomb_PickedUp" )
	RegisterSignal( "DirtyBomb_Disarmed" )
	RegisterSignal( "DirtyBomb_Active" )
	RegisterSignal( "DirtyBomb_Ready" )

	PrecacheParticleSystem( DIRTY_BOMB_CANISTER_EXP_FX )
	PrecacheParticleSystem( DIRTY_BOMB_CANISTER_FX_ALL )
                                 
        PrecacheParticleSystem( DIRTY_BOMB_CANISTER_EXPLODE_FX )
          
	PrecacheModel( DIRTY_BOMB_CANISTER_MODEL )

    #if CLIENT
        RegisterSignal( "DirtyBomb_StopPlacementProxy" )
    #endif
}


#if SERVER
                                                        
 
	                                                                   
	 
		                                                                             

		                               
			      

		                                                                                
			      

		                                                    
			      
	 
	    
	 
		      
	 


	                                   
 

                                                                                     
 
	                                                                                    
		      

	                                    
	                                    

	                              
	                                    

	                                      
	                                                                                                    
	                                                                       
	                                  
	                                 
	                               
                              
		                                               
		                                             
       
	                                             
	                                            
	                                              
	                                                    
	                                            
	                                                     
	                                      
	                                    
	                                  
                                 
                                                
          
	                                           
	                                               
	                                   
	                                              
	                              
	                                                                             
	                                              
	                                             
	                                                       
	                                            
	                        
	                                                                                                                 
	                                   	                                      
	                                                                                                                               
	                                                                                                                                               

	                                                                
	                                                                   

	                                       

	                                                                           
	                                                                             

	                                                                                                
	                                     
	                                                                
	                                                    

	                                        
	 
		                                                 
	 

	                                                    
	                                
	                                               
	                                   

	                                                                                           
	                                                                                                                   

	                                                            
	                                                             

	                                        
	 
		                                                 

                       
			                                                                                                 
				                                                                                                                      
                             
	 

	                                                                                

	            
		                                                               
		 
			                               

			                                       
			                                                 

			                       
			 
				                                                    
				 
					                                                           
					 
						                                              
						 
							                               
						 
					 
				 
				    
				 
					                                                                       
					                                
						                             
				 
			 

			                                                                                   

			                                      
		 
	 

	                                      
	                                                
	                                               
	                                               
	                       
		                                       

	                             

	                                 
	 
		                                                               
		                                 
	 
	                                                                    

	                     
	                                                     
                              
                                                                                                     
      
                                                                                        
       
	                                      
	                              

	                                                            
	                                 
	                                         

	                                             
	                                                               

	                              

	                                              
	                                                   

	                                                                  
	 
		                                              
		                             
		 
			                     
		 
	 

	             
 

                                                    
 
	            
		                             
		 
			                               
			 
				                       
			 
		 
	 

	                               
	 
		                                      
		                                            
		                        

		                                                                                    
		                                              
		                                                 
		                                                             

		                                                                  
	 
 

                   
                                                            
 
	                                      
 

                                                                
 
	                             

	                                      
	 
		                                                
		                           
	 
 

                                                                                        
 
	                                                
	                                      
	                                             
	                                               
	                                               
	                       
		                                       

	                                         

	                                                   
	                                 
	                                                        
	                             
	                             
	                           
	                        
	                             
	                                                
	                        

	                                   

	                                                

	                           

	                                                 

	                                              

	            
		                                       
		 
			                                          
			                                     
			                 
		   

	             
 

                                                           
 
	                                         
	                                
		           

	                                            
	            
 

                                                                
 
	                                                          
	                          

	                                                   
	                                
	                                              
	 
		                                                                                                                                                                
			                                  
	 

	                                              
	                                                                
		                                                    
 

                                                                  
 
	                                                 
	                                

	                                                      
	                                      
	                                                                               
	                           

	                                                   
	                                

	                                         

	                                                          
	                           
	 
		                                            
		                        
		                             

		                                              
		 
			                                                                               
				                                
			    
				                                
		 

		                                                     
		                                                
		                                                 
		                                          
			      

		                                                                          
		                                                                            
		                                     
		                                       

		                            

		                                                                               

		                                    
		 
			                                                 
				        

			                                     
			                                                                                
			                                                                                                                                                    
			                             
			 
				                       
					        

				                          

				                                     
				                                         
				                                                            
				                                                             
				      
			 
		 

		           
	 
 

                                                                     
 
	                                         
	                           
		            

	                      
		            

	                                   
	                       
		            

	                         
	                    
		            

	                                                                                       
		            

	                                      
		            

	           
 

                                                                                       
 
	                                                                  
	                                                                       

	                                                
	 
		                              
			                                                                                                                           

		                                                                      

		      
	 

	                                                      
	                  
	 
		      
	 

	                                                      
	                          
	 
		                             

		                                      
			      
	 

	                         
	 
		                                           
		                                            
			      

		                                                      
			                                            
			      
	 

	                                            
 
                             
                                                                                               
 
	                                                                                                
	                        
		                                      
	                                        
		                                                           

	                                                     

	                                                   
		      

	                          
	 
		                                                                                                                                     
			                                                                                            
			                                                                                                                            
	 
 

                                                                                                 
 
	                                                                  
	                                                                       

	                                                
	 
		                              
			                                                                                                                           

		                                                                      

		      
	 

	                                                      
	                  
	 
		      
	 

	                
	                                                    
	                                                      
	                           
		      

	                                                                             

	                                                                                                                 
	 
		                                         
		 
			                                         
			 
				                                            
			 
		 
		      
	 

	                               
	                                                        
		                                       

	                                                         
	                         
	 
		                                           
		                                            
			      
		                                                      
			                                       
			 
				                                                               
				      
			 
			                                             
			      
		                                           
		                                                
			                                                               
			      
	 

	                                                              
	                                 
	 
		                                                               
		      
	 

                                                           
                                                    
        
                                                                       
 
      

                                                                                    
 
	                                                                  
	                                                                       

	                                                
	 
		                              
			                                                                                                                           

		                                                                      

		      
	 

	                                                      
	                  
	 
		      
	 

	                
	                                                    
	                                                      
	                           
		      

	                                                                                                                 
	 
		                                         
		 
			                                                                                        
			 
				                                            
			 
		 
		      
	 

	                                                         
	                         
	 
		                                           
		                                            
			      
		                                                      
			                                             
			      
		                                           
		                                                
			                                                           
			      
	 

	                                                              
	                                 
	 
		                                                                                        
		      
	 

	                                     
	                 
	 
		                                                           

	 
	    
	 
		                                            
	 
 

                             
                                                           
 
	            
	                 

	                              
	 
		                                                                   
		           	                                   

		                                                                                            
		                                                                             
	 
 
      

                                                             
 
	                               
		                                                                                                      
 

                                                                                        
 
	                                
		      

                              
		                                       
			      
		                                       
       

	                                                
	                                      
	                                          

	                                               
	                                                                            
	                                                                
	                           
		      

	                       
		                                                                   

	                                                      
	                                                                                                                          
	                                                                                     
                              
		                                             
      
                                              
       
	                                                                    
	                                                                       

	                              

	                                                               

                              
		                                                                                                                                             
		                         

		                                               
		                              
			                                            
       

	                                                                                                                                                         
                              
		                                                                                                                                                                                          
      
                                                                                                                                                   
       

	                                                     
	                               
	                                          
	                                                  

	                                                                                                                                 

	            
                              
		                                                   
      
                                 
       
	 
		                                
		 
			                        
		 
                               
			                                                                                                                                                         
        
	 
	 

	                                  

	                                 

	        

	                    
		            

	                                                      
	                                             
 

                             
                                                                           
 
	          

	                         
		                   
 
      

                                          
 
	                                 
	                                           

	           
	 
		                                                 
		        
	 
 

                                                           
 
	                                                
	                                      
	                                               
	                                               
	                                             

	  
	 
		                                            
		                       
			                                       
	 

	                         
	                                            
	                                                                                                                                                                                     
	                                                                                   

	            
		                              
		 
			                               
			 
				                           
			 
		 
	 

	             
	 
		                                                                                 

		                         
			        

		                                         
		                       
			        

		                                            

		                      
		 
			                               
			 
				                                            
			 
		 
	 
 

                                             
 
	                                                           

	                                              
	                                                        
		            

	                                       
		            

	                                

	           
 
#endif          

#if CLIENT
void function DirtyBomb_OnPropScriptCreated( entity ent )
{
	switch ( ent.GetScriptName() )
	{
		case DIRTY_BOMB_TARGETNAME:
			AddEntityCallback_GetUseEntOverrideText( ent, DirtyBomb_UseTextOverride )
			break
	}
}

string function DirtyBomb_UseTextOverride( entity ent )
{
	entity player = GetLocalViewPlayer()

	if ( player.IsTitan() )
		return "#WPN_DIRTY_BOMB_NO_INTERACTION"

	if ( player == ent.GetBossPlayer() )
	{
		return ""
	}

	return "#WPN_DIRTY_BOMB_NO_INTERACTION"
}
#endif         

DirtyBombPlacementInfo function GetDirtyBombPlacementInfo( entity player, entity bombModel )
{
	vector eyePos  = player.EyePosition()
	vector viewVec = player.GetViewVector()
	vector angles  = < 0, VectorToAngles( viewVec ).y, 0 >
	                                     

	float maxRange = DIRTY_BOMB_PLACEMENT_RANGE_MAX

	TraceResults viewTraceResults = TraceLine( eyePos, eyePos + player.GetViewVector() * (DIRTY_BOMB_PLACEMENT_RANGE_MAX * 2), [player, bombModel], TRACE_MASK_PLAYERSOLID, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )
	if ( viewTraceResults.fraction < 1.0 )
	{
		float slope = fabs( viewTraceResults.surfaceNormal.x ) + fabs( viewTraceResults.surfaceNormal.y )
		if ( slope < 0.707 )
			maxRange = min( Distance2D( eyePos, viewTraceResults.endPos ), DIRTY_BOMB_PLACEMENT_RANGE_MAX )
	}

	vector idealPos = player.GetOrigin() + (AnglesToForward( angles ) * DIRTY_BOMB_PLACEMENT_RANGE_MAX)

	vector fwdStart          = eyePos + viewVec * min( DIRTY_BOMB_PLACEMENT_RANGE_MIN, maxRange )
	TraceResults fwdResults  = TraceHull( fwdStart, eyePos + viewVec * maxRange, DIRTY_BOMB_BOUND_MINS, <30, 30, 1>, player, TRACE_MASK_PLAYERSOLID, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )
	TraceResults downResults = TraceHull( fwdResults.endPos, fwdResults.endPos - DIRTY_BOMB_PLACEMENT_TRACE_OFFSET, DIRTY_BOMB_BOUND_MINS, DIRTY_BOMB_BOUND_MAXS, player, TRACE_MASK_PLAYERSOLID, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )

	                                                                   
	                                                                   
	                                                               
	                                                                                                                

	DirtyBombPlacementInfo placementInfo = DirtyBomb_GetPlacementInfoFromTraceResults( player, bombModel, downResults, viewTraceResults, idealPos )

	if ( !placementInfo.success )
	{
		                                             
		vector fallbackPos               = fwdResults.endPos - (viewVec * Length( DIRTY_BOMB_BOUND_MINS ))
		TraceResults downFallbackResults = TraceHull( fallbackPos, fallbackPos - DIRTY_BOMB_PLACEMENT_TRACE_OFFSET, DIRTY_BOMB_BOUND_MINS, DIRTY_BOMB_BOUND_MAXS, [player, bombModel], TRACE_MASK_PLAYERSOLID, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )

		                                        
		   
		  	                                                                                                                                                      
		   

		placementInfo = DirtyBomb_GetPlacementInfoFromTraceResults( player, bombModel, downFallbackResults, viewTraceResults, idealPos )
	}

	return placementInfo
}


DirtyBombPlacementInfo function DirtyBomb_GetPlacementInfoFromTraceResults( entity player, entity bombModel, TraceResults hullTraceResults, TraceResults viewTraceResults, vector idealPos )
{
	vector viewVec = player.GetViewVector()
	vector angles  = < 0, VectorToAngles( viewVec ).y, 0 >

	bool isScriptedPlaceable = false

	bool success = !hullTraceResults.startSolid && hullTraceResults.fraction < 1.0 && (hullTraceResults.hitEnt.IsWorld() || hullTraceResults.hitEnt.GetNetworkedClassName() == "func_brush" || isScriptedPlaceable)

	entity parentTo
	if ( IsValid( hullTraceResults.hitEnt ) && hullTraceResults.hitEnt.GetNetworkedClassName() == "func_brush" )
	{
		parentTo = hullTraceResults.hitEnt
	}

	if ( hullTraceResults.startSolid && hullTraceResults.fraction < 1.0 && (hullTraceResults.hitEnt.IsWorld() || isScriptedPlaceable) )
	{
		TraceResults upResults = TraceHull( hullTraceResults.endPos, hullTraceResults.endPos, DIRTY_BOMB_BOUND_MINS, DIRTY_BOMB_BOUND_MAXS, player, TRACE_MASK_PLAYERSOLID, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )
		if ( !upResults.startSolid )
			success = true
	}

	if ( success )
	{
		bombModel.SetOrigin( hullTraceResults.endPos )
		bombModel.SetAngles( angles )
	}

	if ( !player.IsOnGround() )
		success = false

	                                           
	if ( success && hullTraceResults.fraction < 1.0 )
	{
		vector right   = bombModel.GetRightVector()
		vector forward = bombModel.GetForwardVector()
		vector up      = bombModel.GetUpVector()

		float length = Length( DIRTY_BOMB_BOUND_MINS )

		array< vector > groundTestOffsets = [
			Normalize( right + forward ) * length,
			Normalize( -right + forward ) * length,
			Normalize( right + -forward ) * length,
			Normalize( -right + -forward ) * length
		]

		foreach ( vector testOffset in groundTestOffsets )
		{
			vector testPos           = bombModel.GetOrigin() + testOffset
			TraceResults traceResult = TraceLine( testPos + (up * DIRTY_BOMB_PLACEMENT_MAX_HEIGHT_DELTA), testPos + (up * -DIRTY_BOMB_PLACEMENT_MAX_HEIGHT_DELTA), [player, bombModel], TRACE_MASK_PLAYERSOLID, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )

			if ( traceResult.fraction == 1.0 )
			{
				success = false
				break
			}
		}
	}

	                                                                                                                           
	  	               
	if ( success && hullTraceResults.hitEnt != null && (!hullTraceResults.hitEnt.IsWorld() && !isScriptedPlaceable) )
	{
		                                                               
		                        
		success = false
	}

	                                                                                                                                                             
	if ( success && !PlayerCanSeePos( player, hullTraceResults.endPos, false, 90 ) )                                                               
		success = false

	vector org = success ? hullTraceResults.endPos - <0, 0, DIRTY_BOMB_BOUND_MAXS.z> : idealPos
	DirtyBombPlacementInfo placementInfo
	placementInfo.success = success
	placementInfo.origin = org
	placementInfo.angles = angles
	placementInfo.parentTo = parentTo

	return placementInfo
}

                                                                        
  			    
                                                                        

var function OnWeaponTossReleaseAnimEvent_weapon_dirty_bomb( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	int ammoReq = weapon.GetAmmoPerShot()
	weapon.EmitWeaponSound_1p3p( GetGrenadeThrowSound_1p( weapon ), GetGrenadeThrowSound_3p( weapon ) )

	vector angularVelocity = <0,0,500>
	entity deployable = ThrowDeployable( weapon, attackParams, DIRTY_BOMB_THROW_POWER, OnDirtyBombPlanted, null, angularVelocity )
	if ( deployable )
	{
		entity player = weapon.GetWeaponOwner()
		PlayerUsedOffhand( player, weapon )

#if SERVER
		                                      

		                                                            
		                            
			                                                

		                                         

		                        
			                                                              
#endif

		#if SERVER
			                                                
		#endif

	}

	return ammoReq
}


void function OnWeaponTossPrep_weapon_dirty_bomb( entity weapon, WeaponTossPrepParams prepParams )
{
	weapon.EmitWeaponSound_1p3p( GetGrenadeDeploySound_1p( weapon ), GetGrenadeDeploySound_3p( weapon ) )
}


void function RestoreDirtyBombAmmo( entity owner )
{
	if ( IsAlive( owner ) )
	{
		entity weapon = owner.GetOffhandWeapon( OFFHAND_SPECIAL )
		if ( IsValid( weapon ) && weapon.GetWeaponClassName() == CAUSTIC_DIRTY_BOMB_WEAPON_CLASS_NAME )
		{
			Weapon_AddSingleCharge( weapon )
		}
	}
}


void function OnDirtyBombPlanted( entity projectile, DeployableCollisionParams cp )
{
	#if SERVER
		                                                
		                                                                            

		                                                                                                                                                                                

		                                    
		                                                                                    
		 
			                                         
			                                                                                                                
		 
		                                                  
		 
			                                             
		 
		                                             

		                            
		                                  
		                                               
		                                             

		  
		 
			                      
			                             
                        
				                                     
					                            
                                  

			                                                                                                                                                                            

			                                                             
				                                                                
			    
				                                             
		 

		                    
	#endif
}

#if CLIENT
void function MinimapPackage_DirtyBomb( entity ent, var rui )
{
	#if MINIMAP_DEBUG
		printt( "Adding 'rui/hud/tactical_icons/tactical_caustic' icon to minimap" )
	#endif
	RuiSetImage( rui, "defaultIcon", $"rui/hud/tactical_icons/tactical_caustic" )
	RuiSetImage( rui, "clampedDefaultIcon", $"rui/hud/tactical_icons/tactical_caustic" )
	RuiSetBool( rui, "useTeamColor", false )
	RuiSetFloat( rui, "iconBlend", 0.0 )
}
#endif