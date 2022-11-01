global function MpWeaponCryoWall_Init
global function OnWeaponAttemptOffhandSwitch_weapon_cryo_wall

global function OnWeaponActivate_weapon_cryo_wall
global function OnWeaponDeactivate_weapon_cryo_wall
global function OnWeaponPrimaryAttack_weapon_cryo_wall
global function OnWeaponChargeBegin_weapon_cryo_wall
global function OnWeaponChargeEnd_weapon_cryo_wall

#if SERVER
                                                    
#endif

const asset CRYO_WALL_MODEL = $"mdl/fx/ferrofluid_pillar.rmdl"
const asset CRYO_WALL_PLACEMENT_ARROW_MODEL = $"mdl/fx/ar_marker_big_arrow_down.rmdl"

const string CRYO_WALL_WEAPON_NAME = "mp_weapon_cryo_wall"
const float CRYO_WALL_PLACEMENT_RANGE_MAX = 94
const float CRYO_WALL_PLACEMENT_RANGE_MIN = 64
const vector CRYO_WALL_PLACEMENT_TRACE_OFFSET = <0, 0, 94>
const float CRYO_WALL_PLACEMENT_MAX_GROUND_DIST = 12.0


const float CRYO_WALL_ANGLE_LIMIT = 0.74

const bool CRYO_WALL_DEBUG_DRAW = false
const bool CRYO_WALL_DEBUG_DRAW_PLACEMENT = false

const string CRYO_WALL_PLACEMENT_ACTIVATE_SOUND = "wattson_tactical_a"
const string CRYO_WALL_PLACEMENT_DEACTIVATE_SOUND = "wattson_tactical_b"

const string CRYO_WALL_STOP_PLACEMENT_SIGNAL = "CryoWall_StopPlacementProxy"
const string CRYO_WALL_ORIENTATION_HORIZONTAL_NETVAR = "CryoWall_OrientationHorizontal"

const float CRYO_WALL_SHARD_Z_OFFSET 	= -20
const float CRYO_WALL_STEP_INIT 		= 0
const float CRYO_WALL_STEP 				= 40.0
const float CRYO_WALL_RADIUS 			= CRYO_WALL_STEP / 2.0
const float CRYO_WALL_CLIMB_HEIGHT 		= 80.0
const float CRYO_WALL_DOWN_TRACE_LENGTH		= 200.0

const vector CRYO_WALL_BOUND_MINS = <-CRYO_WALL_RADIUS, -CRYO_WALL_RADIUS, 0>
const vector CRYO_WALL_BOUND_MAXS = <CRYO_WALL_RADIUS, CRYO_WALL_RADIUS, CRYO_WALL_CLIMB_HEIGHT>

const float CRYO_WALL_ICE_PILLAR_DURATION = 60.0
const float CRYO_WALL_ICE_PILLAR_DELAY_FORWARD = 0.15
const float CRYO_WALL_ICE_PILLAR_DELAY_HORIZONTAL = CRYO_WALL_ICE_PILLAR_DELAY_FORWARD * 2
const float CRYO_WALL_ICE_PILLAR_SCALE_TIME = 0.3
const int CRYO_WALL_NUM_ICE_PILLARS_FORWARD = 17
const int CRYO_WALL_NUM_ICE_PILLARS_HORIZONTAL_PER_SIDE = 8
const float CRYO_WALL_ICE_PILLAR_HEALTH = 125

struct CryoWallPlacementInfo
{
	vector origin
	vector angles
	entity parentTo
	bool   success = false
}

enum eCryoWallType
{
	TOGGLE
	LEFT_TO_RIGHT
	FORWARD
}

struct
{
#if SERVER
	                                             
#endif
	int wallType
}file

void function MpWeaponCryoWall_Init()
{
	#if SERVER
		                                                                                        
	#endif         

	#if CLIENT
		RegisterSignal( CRYO_WALL_STOP_PLACEMENT_SIGNAL )
		RegisterConCommandTriggeredCallback( "+scriptCommand5", CryoWallTogglePressed )
	#endif         

	file.wallType = GetPlaylistVarInt( GetCurrentPlaylistName(), "cryo_wall_type", eCryoWallType.TOGGLE )
	bool netVarDefault = true
	if( file.wallType == eCryoWallType.FORWARD )
		netVarDefault = false

	RegisterNetworkedVariable( CRYO_WALL_ORIENTATION_HORIZONTAL_NETVAR, SNDC_PLAYER_EXCLUSIVE, SNVT_BOOL, netVarDefault )
	Remote_RegisterServerFunction( "ClientCallback_CryoWallTogglePressed" )
	PrecacheModel( CRYO_WALL_MODEL )
	PrecacheModel( CRYO_WALL_PLACEMENT_ARROW_MODEL )


}


void function OnWeaponActivate_weapon_cryo_wall( entity weapon )
{
	entity ownerPlayer = weapon.GetWeaponOwner()
	Assert( ownerPlayer.IsPlayer() )

	#if SERVER
		                                                                                             
	#endif


	#if CLIENT
		if ( !InPrediction() )                             
			return

		if( file.wallType == eCryoWallType.TOGGLE )
			AddPlayerHint( 300, 0, $"", "#WPN_CRYO_WALL_HINT_TOGGLE" )
		else
			AddPlayerHint( 300, 0, $"", "#WPN_CRYO_WALL_HINT" )

		CryoWall_OnBeginPlacement( weapon, ownerPlayer )
	#endif
}


void function OnWeaponDeactivate_weapon_cryo_wall( entity weapon )
{
	entity ownerPlayer = weapon.GetWeaponOwner()
	Assert( ownerPlayer.IsPlayer() )

	#if SERVER
		                                                                                                
	#endif

	#if CLIENT
		if( file.wallType == eCryoWallType.TOGGLE )
			HidePlayerHint( "#WPN_CRYO_WALL_HINT_TOGGLE" )
		else
			HidePlayerHint( "#WPN_CRYO_WALL_HINT" )
		CryoWall_OnEndPlacement( ownerPlayer )
		if ( !InPrediction() )                             
			return
	#endif

}


bool function OnWeaponAttemptOffhandSwitch_weapon_cryo_wall( entity weapon )
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

	return true
}


var function OnWeaponPrimaryAttack_weapon_cryo_wall( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	entity ownerPlayer = weapon.GetWeaponOwner()
	Assert( ownerPlayer.IsPlayer() )

	asset model = CRYO_WALL_MODEL

	entity proxy                      = CryoWall_CreateTrapPlacementProxy( model )
	CryoWallPlacementInfo placementInfo = CryoWall_GetPlacementInfo( ownerPlayer, proxy )
	proxy.Destroy()

	if ( !placementInfo.success )
		return 0

	#if SERVER
		                                                                                         
		                
		 
			                                                
			                                                                                                                             
			                                                                                                                                                                                          
			                                                                                                                                                                                           

		 
		    
		 
			                                                                                                                                                             
		 

	#endif

	#if CLIENT
		CryoWall_OnEndPlacement( ownerPlayer )
	#endif

	PlayerUsedOffhand( ownerPlayer, weapon, true, null, {pos = placementInfo.origin} )

	int ammoReq = weapon.GetAmmoPerShot()
	return ammoReq
}

bool function OnWeaponChargeBegin_weapon_cryo_wall( entity weapon )
{

	return true
}

void function OnWeaponChargeEnd_weapon_cryo_wall( entity weapon )
{
	entity ownerPlayer = weapon.GetWeaponOwner()
	Assert( ownerPlayer.IsPlayer() )
	#if CLIENT
		CryoWall_OnEndPlacement( ownerPlayer )
		if ( !InPrediction() )                             
			return
	#endif
}

#if CLIENT
void function CryoWallTogglePressed( entity player )
{
	if( file.wallType != eCryoWallType.TOGGLE )
		return

	if ( player != GetLocalViewPlayer() || player != GetLocalClientPlayer() )
		return

	entity activeWeapon = player.GetActiveWeapon( eActiveInventorySlot.mainHand )
	if ( !IsValid( activeWeapon ) )
		return

	if( activeWeapon.GetWeaponClassName() == CRYO_WALL_WEAPON_NAME )
		Remote_ServerCallFunction( "ClientCallback_CryoWallTogglePressed" )
}
#endif

#if SERVER
                                                                     
 
	                                                       
		                                              

	                                                        
	                                                                     
	 
		                                    
		 
			                                                        
				                                               
			    
				                                       
		 
		    
			                                       
	 
 
                                                                   
 
	                         
		      

	                                                                             
	                               
		      

	                                                                
		      

	                                                                                    
	                                                                               
 

                                                                                                                                            
 
	                                

	                            
	                                      
	                         
	                      
	                                     

	                                                                  
	                                                        
	                                      
	                                             
	                                            

	            
		                                   
		 
			                                             
			                                  
				                           
		 
	 
	                      
	                                                          
	                      

	                                      
	 
		                                            
		                                         
		
		                                                          

		                                                     
		                                                                                                                                   
		                                 
		 
			                  
			     
		 
		                               
			                                                                         
		      

		                                                                                  
		                                                                                                                                          
		                                                                                                
		 
			                
		 
		    
		 
			                                                                                                                         
			                                                                
		 
		                               
			                                                                              
		      

		               
			     

		                
		 
			                          
			                  
		 

		          
	 
 

                                                                                                     
 
	             
		                                                       										         
		         								           
		          									            
		   											         
		   											                   
		   												              
		   												              
		                               				        
		    												                       
		  												                 
		  							                    
		                                     							                               


	                                                                      

	                                                                     
	                                                                                                                  
	                             
	              
	                                
	                                               

	            
		                     
		 
			                    
				             
		 
	 

	                        
	                                                           
	             
	 
		                                                                 
		                          
		                  
			     
		           
	 
	           
	                               

	                                  
 

                                                                    
 
	                             
	                                                   

	                             
	                                      
	                               
	                             
	                           
	                        
	                                    
	                                   
	                                      
	                                        
	                        
	                                                                                              
	                                 

	            
		                         
		 
			                        
				                 
		 
	 

	                                    
 

                                                    
 
	                                     
		                                     
 

                                                          
 
	                                 
	                             

	                                  
	 
		                                                             

		                            

		                        
			           

		                        
		           
	 
 
#endif

  
                                                                                                            
                                                                                                             
                                                                                                             
                                                                                                              
                                                                                                             

  

CryoWallPlacementInfo function CryoWall_GetPlacementInfo( entity player, entity proxy )
{
	vector eyePos              = player.EyePosition()
	vector viewVec             = player.GetViewVector()

	CryoWallPlacementInfo info = _GetPlacementInfo( player, proxy, eyePos, viewVec )

	if ( !info.success && player.IsStanding() )
	{
		CryoWallPlacementInfo crouchInfo = _GetPlacementInfo( player, proxy, eyePos - <0,0,32>, viewVec )

		if ( crouchInfo.success )
			return crouchInfo
	}

	return info
}

CryoWallPlacementInfo function _GetPlacementInfo( entity player, entity proxy, vector eyePos, vector viewVec )
{
	vector angles              = < 0, VectorToAngles( viewVec ).y, 0 >
	array< entity > ignoreEnts = [player, proxy]

	float maxRange = CRYO_WALL_PLACEMENT_RANGE_MAX

	TraceResults viewTraceResults = TraceLine( eyePos, eyePos + player.GetViewVector() * (CRYO_WALL_PLACEMENT_RANGE_MAX * 2), ignoreEnts, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE, player )
	if ( viewTraceResults.fraction < 1.0 )
	{
		float slope = fabs( viewTraceResults.surfaceNormal.x ) + fabs( viewTraceResults.surfaceNormal.y )
		if ( slope < CRYO_WALL_ANGLE_LIMIT )
			maxRange = min( Distance( eyePos, viewTraceResults.endPos ), CRYO_WALL_PLACEMENT_RANGE_MAX )
	}

	vector idealPos          = player.GetOrigin() + (AnglesToForward( angles ) * CRYO_WALL_PLACEMENT_RANGE_MAX)
	vector defaultUpVector   = < 0, 0, 1.0 >
	TraceResults fwdResults  = TraceHull( eyePos, eyePos + viewVec * maxRange, CRYO_WALL_BOUND_MINS, CRYO_WALL_BOUND_MAXS, ignoreEnts, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE, defaultUpVector, player )
	TraceResults downResults = TraceHull( fwdResults.endPos, fwdResults.endPos - CRYO_WALL_PLACEMENT_TRACE_OFFSET, CRYO_WALL_BOUND_MINS, CRYO_WALL_BOUND_MAXS, ignoreEnts, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE, defaultUpVector, player )

	if ( CRYO_WALL_DEBUG_DRAW_PLACEMENT )
	{
		DebugDrawBox( fwdResults.endPos, CRYO_WALL_BOUND_MINS, CRYO_WALL_BOUND_MAXS, COLOR_GREEN, 1, 1.0 )                                 
		DebugDrawBox( downResults.endPos, CRYO_WALL_BOUND_MINS, CRYO_WALL_BOUND_MAXS, COLOR_BLUE, 1, 1.0 )                                  
		DebugDrawLine( eyePos + viewVec * min( CRYO_WALL_PLACEMENT_RANGE_MIN, maxRange ), fwdResults.endPos, COLOR_GREEN, true, 1.0 )                    
		DebugDrawLine( fwdResults.endPos, eyePos + viewVec * maxRange, COLOR_RED, true, 1.0 )                            
		DebugDrawLine( fwdResults.endPos, downResults.endPos, COLOR_BLUE, true, 1.0 )                     
		DebugDrawLine( player.GetOrigin(), player.GetOrigin() + (AnglesToForward( angles ) * CRYO_WALL_PLACEMENT_RANGE_MAX), COLOR_GREEN, true, 1.0 )                     
		DebugDrawLine( eyePos + <0, 0, 8>, eyePos + <0, 0, 8> + (viewVec * CRYO_WALL_PLACEMENT_RANGE_MAX), COLOR_GREEN, true, 1.0 )                     
	}

	                                                           
	bool isScriptedPlaceable = false
	if ( IsValid( downResults.hitEnt ) )
	{
		isScriptedPlaceable = Placement_IsHitEntScriptedPlaceable( downResults.hitEnt, 1 )
	}

	bool success = !downResults.startSolid && downResults.fraction < 1.0 && (downResults.hitEnt.IsWorld() || isScriptedPlaceable)

	entity parentTo
	if ( IsValid( downResults.hitEnt ) && (downResults.hitEnt.GetNetworkedClassName() == "func_brush" || downResults.hitEnt.GetNetworkedClassName() == "script_mover") )
	{
		parentTo = downResults.hitEnt
	}

	if ( downResults.startSolid && downResults.fraction < 1.0 && (downResults.hitEnt.IsWorld() || isScriptedPlaceable) )
	{
		TraceResults upResults = TraceHull( downResults.endPos, downResults.endPos, CRYO_WALL_BOUND_MINS, CRYO_WALL_BOUND_MAXS, ignoreEnts, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE )
		if ( !upResults.startSolid )
		{
			success = true
		}
		else
		{
			                                        
		}
	}

	vector surfaceAngles = angles

	                        
	                                                                
	if ( success && !PlayerCanSeePos( player, downResults.endPos, true, 90 ) )
	{
		surfaceAngles = angles
		success = false
		                                                             
	}

	              
	if ( success && viewTraceResults.hitEnt != null && (!viewTraceResults.hitEnt.IsWorld() && !isScriptedPlaceable) )
	{
		surfaceAngles = angles
		success = false
		  	                                                               
	}

	                                           
	if ( success && downResults.fraction < 1.0 )
	{
		surfaceAngles = AnglesOnSurface( downResults.surfaceNormal, AnglesToForward( angles ) )
		vector newUpDir = AnglesToUp( surfaceAngles )
		vector oldUpDir = AnglesToUp( angles )

		                   
		proxy.SetOrigin( downResults.endPos )
		proxy.SetAngles( surfaceAngles )

		vector right   = proxy.GetRightVector()
		vector forward = proxy.GetForwardVector()

		float length = Length( CRYO_WALL_BOUND_MINS )

		array< vector > groundTestOffsets = [
			Normalize( right * 2 + forward ) * length,
			Normalize( -right * 2 + forward ) * length,
			Normalize( right * 2 + -forward ) * length,
			Normalize( -right * 2 + -forward ) * length
		]

		if ( CRYO_WALL_DEBUG_DRAW_PLACEMENT )
		{
			DebugDrawLine( proxy.GetOrigin(), proxy.GetOrigin() + (right * 64), COLOR_GREEN, true, 1.0 )                      
			DebugDrawLine( proxy.GetOrigin(), proxy.GetOrigin() + (forward * 64), COLOR_BLUE, true, 1.0 )                        
		}

		                                                 
		foreach ( vector testOffset in groundTestOffsets )
		{
			vector testPos           = proxy.GetOrigin() + testOffset
			TraceResults traceResult = TraceLine( testPos + (proxy.GetUpVector() * CRYO_WALL_PLACEMENT_MAX_GROUND_DIST), testPos + (proxy.GetUpVector() * -CRYO_WALL_PLACEMENT_MAX_GROUND_DIST), ignoreEnts, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE )

			if ( CRYO_WALL_DEBUG_DRAW_PLACEMENT )
				DebugDrawLine( testPos + (proxy.GetUpVector() * CRYO_WALL_PLACEMENT_MAX_GROUND_DIST), traceResult.endPos, COLOR_RED, true, 1.0 )                   

			if ( traceResult.fraction == 1.0 )
			{
				surfaceAngles = angles
				success = false
				                                                                    
				break
			}
		}

		                     
		if ( success && DotProduct( newUpDir, oldUpDir ) < CRYO_WALL_ANGLE_LIMIT )
		{
			                        
			success = false
			                                                        
		}
	}

	                           
	if ( success && IsValid( downResults.hitEnt ) && IsEntInvalidForPlacingPermanentOnto( downResults.hitEnt ) )
		success = false

	if ( success && IsOriginInvalidForPlacingPermanentOnto( downResults.endPos ) )
		success = false


	if( success )
	{
		TraceResults playerResults = TraceHull( downResults.endPos, downResults.endPos, CRYO_WALL_BOUND_MINS, CRYO_WALL_BOUND_MAXS, [proxy], TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE, defaultUpVector, player  )
		if( IsValid( playerResults.hitEnt ) && playerResults.hitEnt.IsPlayer() )
			success = false
	}

	CryoWallPlacementInfo placementInfo
	placementInfo.success = success
	placementInfo.origin = downResults.endPos                                                        
	placementInfo.angles = angles
	placementInfo.parentTo = parentTo

	return placementInfo
}


entity function CryoWall_CreateTrapPlacementProxy( asset modelName )
{
	#if SERVER
		                                                                   
	#else
		entity proxy = CreateClientSidePropDynamic( <0, 0, 0>, <0, 0, 0>, modelName )
	#endif
	proxy.EnableRenderAlways()
	proxy.kv.rendermode = 3
	proxy.kv.renderamt = 1
	proxy.Hide()

	return proxy
}

#if CLIENT
void function CryoWall_OnBeginPlacement( entity weapon, entity player )
{
	if ( player != GetLocalViewPlayer() )
		return

	EmitSoundOnEntity( player, CRYO_WALL_PLACEMENT_ACTIVATE_SOUND )

	asset model = CRYO_WALL_MODEL

	thread CryoWall_PlacementProxy( weapon, player, model )
}

void function CryoWall_OnEndPlacement( entity player )
{
	if ( player != GetLocalViewPlayer() )
		return

	EmitSoundOnEntity( player, CRYO_WALL_PLACEMENT_DEACTIVATE_SOUND )

	player.Signal( CRYO_WALL_STOP_PLACEMENT_SIGNAL )
}

void function CryoWall_PlacementProxy( entity weapon, entity player, asset model )
{
	weapon.EndSignal( "OnDestroy" )
	player.EndSignal( "OnDeath" )
	player.EndSignal( CRYO_WALL_STOP_PLACEMENT_SIGNAL )

	entity proxy = CryoWall_CreateTrapPlacementProxy( model )
	proxy.Show()
	entity arrow1 = CreateClientSidePropDynamic( proxy.GetOrigin(), ZERO_VECTOR, CRYO_WALL_PLACEMENT_ARROW_MODEL )
	entity arrow2 = CreateClientSidePropDynamic( proxy.GetOrigin(), ZERO_VECTOR, CRYO_WALL_PLACEMENT_ARROW_MODEL )

	OnThreadEnd(
		function() : ( proxy, arrow1, arrow2 )
		{
			if( IsValid( proxy ) )
				proxy.Destroy()

			if( IsValid( arrow1 ) )
				arrow1.Destroy()

			if( IsValid( arrow2 ) )
				arrow2.Destroy()
		}
	)

	while ( true )
	{
		bool horizontal = player.GetPlayerNetBool( CRYO_WALL_ORIENTATION_HORIZONTAL_NETVAR )
		CryoWallPlacementInfo placementInfo = CryoWall_GetPlacementInfo( player, proxy )

		if ( !placementInfo.success )
		{
			DeployableModelInvalidHighlight( proxy )
		}
		else
		{
			DeployableModelHighlight( proxy )
		}

		vector fwd = player.GetViewForward()
		fwd = <fwd.x, fwd.y, 0.0>
		fwd = Normalize( fwd )

		vector right = player.GetViewRight()
		right = <right.x, right.y, 0.0>
		right = Normalize( right )

		proxy.SetOrigin( placementInfo.origin )
		proxy.SetAngles( placementInfo.angles )

		if( horizontal )
		{
			arrow1.SetOrigin( proxy.GetOrigin() + < 0, 0, 50 > + ( right * 100 ) )
			arrow1.SetAngles( AnglesCompose( proxy.GetAngles(), <90,-90,0> ) )
			arrow2.SetOrigin( proxy.GetOrigin() + < 0, 0, 50 > + ( -right * 100 ) )
			arrow2.SetAngles( AnglesCompose( proxy.GetAngles(), <90,90,0> ) )
			arrow1.Show()
			arrow2.Show()

		}
		else
		{
			arrow1.SetOrigin( proxy.GetOrigin() + < 0, 0, 80 > + ( fwd * 50 )  )
			arrow1.SetAngles( AnglesCompose( proxy.GetAngles(), <80,0,0> ) )
			arrow1.Show()
			arrow2.Hide()

			arrow1.SetOrigin( proxy.GetOrigin() + < 0, 0, 50 > + ( fwd * 50 ) )
			arrow1.SetAngles( AnglesCompose( proxy.GetAngles(), <75,0,0> ) )
			arrow2.SetOrigin( proxy.GetOrigin() + < 0, 0, 70 > +  ( fwd * 200 )  )
			arrow2.SetAngles( AnglesCompose( proxy.GetAngles(), <75, 0, 0> ) )
			arrow1.Show()
			arrow2.Show()
		}

		WaitFrame()
	}
}
#endif         

  
                                                                                                                                        
                                                                                                                                         
                                                                                                                                       
                                                                                                                                        
                                                                                                                                         
                                                                                                                                        
  

#if SERVER
                                                                                  
 
	                              

	                                
	                                                          

	                                    
	                                    

	                                                                 
 

                                                       
 
	                                                                   
	 
		                                                                             

		                               
			      

		                                                                 
			      
		                                             
	 
	    
	 
		                                                
		      
	 

	                                   
 
#endif         
