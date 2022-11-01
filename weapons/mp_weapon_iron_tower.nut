global function MpWeaponIronTower_Init
global function OnWeaponAttemptOffhandSwitch_weapon_iron_tower

global function OnWeaponActivate_weapon_iron_tower
global function OnWeaponDeactivate_weapon_iron_tower
global function OnWeaponPrimaryAttack_weapon_iron_tower

global function IsIronTowerModel

global const asset IRON_TOWER_MODEL = $"mdl/fx/ferrofluid_tower.rmdl"
global const asset IRON_TOWER_MODEL_CHARGED = $"mdl/fx/ferrofluid_tower_charged.rmdl"
const asset GRAPPLE_ANCHOR = $"mdl/industrial/grappling_hook_end.rmdl"

const string IRON_TOWER_START_SOUND = "Lockdown_Ult_Tower_Emerge"
const string IRON_TOWER_WEAPON_NAME = "mp_weapon_iron_tower"
const string IRON_TOWER_MOVER_SCRIPTNAME = "iron_tower_mover"
const bool IRON_TOWER_DEBUG_DRAW = false

const float IRON_TOWER_SHARD_Z_OFFSET 	= -20
const float IRON_TOWER_RADIUS 			= 80
const vector IRON_TOWER_BOUND_MINS = <-IRON_TOWER_RADIUS, -IRON_TOWER_RADIUS, 0>
const vector IRON_TOWER_BOUND_MAXS = <IRON_TOWER_RADIUS, IRON_TOWER_RADIUS, 1>
const float IRON_TOWER_DURATION = -1
const float IRON_TOWER_BLOCK_MOVE_INPUT_TIME = 0.7
const float IRON_TOWER_SCALE_TIME = 3.0 
const float IRON_TOWER_HEALTH = 1200
const float IRON_TOWER_HEIGHT = 500
const float IRON_TOWER_DESTROY_DELAY = 60
const float IRON_TOWER_ZIPLINE_DETECTION_RADIUS = 120.0

const array< int > IRON_TOWER_ZIPLINE_TEST_OFFSETS =
[
	120,
	360,
	500
]


struct IronTowerPlacementInfo
{
	vector origin
	vector angles
	entity parentTo
	string failReason
	bool   success = false
}

struct
{
	#if SERVER
		                              
	#endif
}file

void function MpWeaponIronTower_Init()
{
	PrecacheModel( IRON_TOWER_MODEL )
	PrecacheModel( IRON_TOWER_MODEL_CHARGED )
	PrecacheModel( GRAPPLE_ANCHOR )
}


void function OnWeaponActivate_weapon_iron_tower( entity weapon )
{
}


void function OnWeaponDeactivate_weapon_iron_tower( entity weapon )
{
}

bool function OnWeaponAttemptOffhandSwitch_weapon_iron_tower( entity weapon )
{
	int ammoReq  = weapon.GetAmmoPerShot()
	int currAmmo = weapon.GetWeaponPrimaryClipCount()
	if ( currAmmo < ammoReq )
		return false

	entity player = weapon.GetWeaponOwner()
	if ( player.IsPhaseShifted() )
		return false

	if ( player.IsZiplining() )
		return false

	IronTowerPlacementInfo info = IronTower_GetPlacementInfo( player )
	if( !info.success )
	{
#if CLIENT
		IronTower_PlacementFailed( player, info )
#endif
		return false
	}

	return true
}


var function OnWeaponPrimaryAttack_weapon_iron_tower( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	entity ownerPlayer = weapon.GetWeaponOwner()
	Assert( ownerPlayer.IsPlayer() )

	IronTowerPlacementInfo placementInfo = IronTower_GetPlacementInfo( ownerPlayer )

	if( !placementInfo.success )
	{
		#if CLIENT
			IronTower_PlacementFailed( ownerPlayer, placementInfo )
		#endif
		return 0
	}

	#if SERVER
		                                                                
		                                                
		                                                                                                                         
	#endif

	PlayerUsedOffhand( ownerPlayer, weapon, true, null, {pos = placementInfo.origin} )

	int ammoReq = weapon.GetAmmoPerShot()
	return ammoReq
}

#if SERVER
                                                                                             
 
	                             
	 
		                                         
		                         
			                  
	 

	                                                                      

	                             
	                                                                                                                                                        
	                                                                                     
	                                                                                       
	                               

	                         
		                                
	                
	                                  
	                        
	                                                   

	                             
	                                        
	                                                   
	                                                 
	                           
	                        
	                                   
	                                      
	                                        
	                                                 
	                        
	                          
	                                   

	                                                               

	            
		                                
		 
			                                   
			                        
				                 
			                      
				               
		 
	 

	                        
	                                                 
	             
	 
		                                                                 
		                            
		                  
			     
		           
	 

	                                                  
	                                                           

	                                                         
	                                                                 

	                                                                                        

	                                                 
	             
	                                 
	                                                 

	                             
		                        
	    
		             
 

                                                                                                                                                                               
 
	                                                              

	                                                             
	                                                                            
	                                    
	                                     
	                                      
	                                  

	                                         

	                                   
		                                              

	                                                
	
	                                           
	                                   
	                                      
	                                                       
	                                                                                         
	                                                                                   
	                                          
	                                                  
	                                                     

	                                   
	                                      

	                                                  
	                                                     
	                                 

	                                      

	                              
	                            

	                                                          

	                                    
	                                  
	                                                                                        

	                              
	                                
	                             
	                                                                           

	                           

	                             

	                         
	               

	                                

	            
		                                            
		 
			                              
				                       
			                            
				                     
		 
	 

 


                                                                 
 
	                                         
		      

	                                                  
 

                                                                          
 
	                                
	                                 

	                                                   
	                                  
	 
		                        
			                                                   
	   

	                                     
		           
 



                                                                                         
 
	                               
	                                                   

	                             
	                                        
	                                              
	                           
	                           
	                        
	                                    
	                                   
	                                      
	                                        
	                        
	                                                                                              
	                                 

	                                                                                                    
	                       
	                               

	                                                                                                              
	               
	                           

	                                 
	                                                                                                    

	                                                                                            

	            
		                                                 
		 

			                                             
			 
				                                                         
				                                 
				 
					                                   
					 
						                    
					 
				 
			 

			                      
			 
				                      
				               
			 

			                         
			 
				                  
			 

			                        
				                 
		 
	 

	                              
	                                                 

	             
	 
		                                                                 
		                                                   
		                  
			     
		           
	 
 

                                                    
 
	                                     
		                                     
 

                                                          
 
	                                 
	                             

	                                  
	 
		                                                             

		                            

		                        
			           

		                        
		           
	 
 
#endif

#if CLIENT
void function IronTower_PlacementFailed( entity player, IronTowerPlacementInfo placementInfo )
{
	AddPlayerHint( 1.0, 0.25, $"rui/hud/ultimate_icons/ultimate_catalyst_iron_tower", placementInfo.failReason )
	EmitSoundOnEntity( player, "Survival_UI_Ability_NotReady" )
}
#endif         

IronTowerPlacementInfo function IronTower_GetPlacementInfo( entity player )
{
	vector eyePos              = player.EyePosition()
	vector viewVec             = player.GetViewVector()
	vector angles              = < 0, VectorToAngles( viewVec ).y, 0 >
	array< entity > ignoreEnts
	array< entity > players = GetPlayerArray()
	foreach( p in players )
		ignoreEnts.append( p )

	IronTowerPlacementInfo placementInfo
	placementInfo.success = true
	vector idealPos          = player.GetOrigin()


	                                                                                                                                       
	TraceResults downResults  = TraceHull( idealPos + < 0, 0, 10 >, idealPos + < 0, 0, -10 >, IRON_TOWER_BOUND_MINS, IRON_TOWER_BOUND_MAXS, ignoreEnts, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE, <0, 0, 1>, player )

	bool isScriptedPlaceable = false
	if ( IsValid( downResults.hitEnt ) )
	{
		isScriptedPlaceable = Placement_IsHitEntScriptedPlaceable( downResults.hitEnt, 1 )
	}

	entity parentTo
	if ( IsValid( downResults.hitEnt ) && !downResults.hitEnt.IsWorld() )
	{
		                                                                                                                                  
		  	                             
		placementInfo.success = false
		placementInfo.failReason = "#WPN_IRON_TOWER_SURFACE_FAIL"
	}

	if( placementInfo.success )
	{
		TraceResults upResults = TraceHull( eyePos, eyePos + < 0, 0, IRON_TOWER_HEIGHT >, IRON_TOWER_BOUND_MINS, IRON_TOWER_BOUND_MAXS, ignoreEnts, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE, <0, 0, 1>, player )
		if( upResults.fraction < 1.0 )
		{
			placementInfo.success = false
			placementInfo.failReason = "#WPN_IRON_TOWER_CLEARANCE_FAIL"
		}
		else
		{
			foreach( int height in IRON_TOWER_ZIPLINE_TEST_OFFSETS )
			{
				vector testPos = eyePos + < 0, 0, height >
				if( IsPosInRangeOfAZipline( testPos, IRON_TOWER_ZIPLINE_DETECTION_RADIUS ) )
				{
					placementInfo.success = false
					placementInfo.failReason = "#WPN_IRON_TOWER_ZIPLINE_FAIL"
					break
				}
			}
		}
	}

	                           
	if ( placementInfo.success && IsValid( downResults.hitEnt ) && IsEntInvalidForPlacingPermanentOnto( downResults.hitEnt ) )
	{
		placementInfo.success = false
		placementInfo.failReason = "#WPN_IRON_TOWER_SURFACE_FAIL"
	}

	if ( placementInfo.success && IsOriginInvalidForPlacingPermanentOnto( downResults.endPos ) )
	{
		placementInfo.success = false
		placementInfo.failReason = "#WPN_IRON_TOWER_SURFACE_FAIL"
	}

	if ( placementInfo.success && !player.IsOnGround() )
	{
		placementInfo.success = false
		placementInfo.failReason = "#WPN_IRON_TOWER_SURFACE_FAIL"
	}

	placementInfo.origin = placementInfo.success ? downResults.endPos : idealPos
	placementInfo.angles = angles
	placementInfo.parentTo = parentTo

	return placementInfo
}

bool function IsIronTowerModel( entity model )
{
	if( IsResinShard( model ) && ( model.GetModelName() == IRON_TOWER_MODEL || model.GetModelName() == IRON_TOWER_MODEL_CHARGED ) )
		return true

	return false
}
