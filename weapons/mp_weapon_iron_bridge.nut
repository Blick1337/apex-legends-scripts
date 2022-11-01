global function MpWeaponIronBridge_Init
global function OnWeaponAttemptOffhandSwitch_weapon_iron_bridge
global function OnWeaponActivate_weapon_iron_bridge
global function OnWeaponDeactivate_weapon_iron_bridge
global function OnWeaponOwnerChanged_weapon_iron_bridge
global function OnWeaponPrimaryAttack_weapon_iron_bridge

global function OnObjectPlacementCanPlace_weapon_iron_bridge

#if SERVER
                                                      
#endif          
#if CLIENT
global function OnCreateClientOnlyModel_weapon_iron_bridge
#endif         


        
const asset IRON_BRIDGE_MUZZLE_FLASH_FP = $"P_wpn_mflash_bang_rocket_FP"
const asset IRON_BRIDGE_MUZZLE_FLASH_3P = $"P_wpn_mflash_bang_rocket"
const asset IRON_BRIDGE_ARM_FP = $"P_ferro_tac_idle"
global const asset IRON_BRIDGE_COVER_WALL = $"mdl/fx/ferrofluid_slab.rmdl"
global const asset IRON_BRIDGE_COVER_WALL_CHARGED = $"mdl/fx/ferrofluid_slab_charged.rmdl"
const asset IRON_BRIDGE_DEATH_BOX_SHARD = $"mdl/fx/ferro_shard_01.rmdl"
const asset IRON_BRIDGE_CREATE_FX = $"P_debris_blast_vert"
const asset IRON_BRIDGE_DESTROY_FX = $"P_debris_blast_vert"

const string KILL_CLIENT_THREAD_SIGNAL = "iron_bridge_kill_client_thread"
const string KILL_UI_THREAD_SIGNAL = "iron_bridge_kill_ui_thread"
const string IRON_BRIDGE_LENGTH_NETVAR = "IRON_BRIDGE_LENGTH_NETVAR"
global const string IRON_BRIDGE_WEAPON_NAME = "mp_weapon_iron_bridge"
const string IRON_BRIDGE_ACTIVE_MOD = "iron_bridge_active"

        
const float IRON_BRIDGE_GEO_DURATION = -1
const float IRON_BRIDGE_GEO_HEALTH = 35.0
const float IRON_BRIDGE_GEO_HEIGHT = 120.0
const float IRON_BRIDGE_ZIPLINE_DETECTION_RADIUS = 120.0
const float IRON_BRIDGE_EXTEND_CHECK_LENGTH = 180.0
const float IRON_BRIDGE_WALL_DOT = 0.7
const float IRON_BRIDGE_COVER_WALL_SCALE_TIME = 0.1
const float IRON_BRIDGE_LOOTBIN_RIGHT_OFFSET = 90
const vector IRON_BRIDGE_LOOTBIN_Z_OFFSET = <0, 0, 50 >
global const vector IRON_BRIDGE_COVER_WALL_BOUNDING_MIN = <-15, -55, 0>
global const vector IRON_BRIDGE_COVER_WALL_BOUNDING_MAX = <20, 55, 100>
const int IRON_BRIDGE_MAX_SHARDS = 2
const int IRON_BRIDGE_MAX_RAMP_SIZE = 6
const int IRON_BRIDGE_MAX_PLACEMENT_SIZE = 3
const float IRON_BRIDGE_MIN_DOT_MIN = 0.50
const float IRON_BRIDGE_MIN_DOT_MAX = 0.50
const float IRON_BRIDGE_MAX_DOT = 0.65
const float IRON_BRIDGE_PUSH_UP_VELOCITY_PER_FRAME = 100.0
const float IRON_BRIDGE_PUSH_UP_RAIDUS = 200
const float IRON_BRIDGE_MIN_DISTANCE = 50
const float IRON_BRIDGE_DESTROY_DELAY = 15
const float IRON_BRIDGE_JUMP_MULTIPLIER = 250

enum eIronBridgeLength
{
	IRON_BRIDGE_LENGTH_LONG,
	IRON_BRIDGE_LENGTH_SHORT
}

struct
{
	#if CLIENT
		var hud = null
		var hintRui = null
	#endif
} file

void function MpWeaponIronBridge_Init()
{
	PrecacheModel( IRON_BRIDGE_COVER_WALL )
	PrecacheModel( IRON_BRIDGE_COVER_WALL_CHARGED )
	PrecacheParticleSystem( IRON_BRIDGE_CREATE_FX )
	PrecacheParticleSystem( IRON_BRIDGE_DESTROY_FX )
	PrecacheParticleSystem( IRON_BRIDGE_ARM_FP )
	RegisterSignal( KILL_CLIENT_THREAD_SIGNAL )
	RegisterSignal( KILL_UI_THREAD_SIGNAL )

	RegisterNetworkedVariable( IRON_BRIDGE_LENGTH_NETVAR, SNDC_PLAYER_EXCLUSIVE, SNVT_INT, eIronBridgeLength.IRON_BRIDGE_LENGTH_LONG )

	Remote_RegisterServerFunction( "ClientCallback_IronBridgeTogglePressed" )
	                                                                              

	#if CLIENT
		RegisterNetVarIntChangeCallback( IRON_BRIDGE_LENGTH_NETVAR, OnIronBridgeLengthChanged )
		RegisterConCommandTriggeredCallback( "+scriptCommand5", IronBridgeTogglePressed )
		AddCallback_PlayerClassChanged( IronBridge_OnPlayerClassChanged )
	#endif
}

void function OnWeaponActivate_weapon_iron_bridge( entity weapon )
{
	entity owner = weapon.GetOwner()
	if( !IsValid( owner ) )
		return

	bool serverOrPredicted = IsServer() || ( InPrediction() && IsFirstTimePredicted() )
	if ( serverOrPredicted )
	{
		if( !weapon.HasMod( IRON_BRIDGE_ACTIVE_MOD ) )
		{
			weapon.AddMod( IRON_BRIDGE_ACTIVE_MOD )
		}
	}

	#if SERVER
		                                                                         
	#endif

	#if CLIENT
		if( IsValid( owner ) && owner == GetLocalViewPlayer() )
			thread WeaponActive_Client( owner, weapon )
	#endif
}

void function OnWeaponDeactivate_weapon_iron_bridge( entity weapon )
{
	entity owner = weapon.GetOwner()
	if( !IsValid( owner ) )
		return

	bool serverOrPredicted = IsServer() || ( InPrediction() && IsFirstTimePredicted() )
	if ( serverOrPredicted )
	{
		if( weapon.HasMod( IRON_BRIDGE_ACTIVE_MOD ) )
		{
			weapon.RemoveMod( IRON_BRIDGE_ACTIVE_MOD )
		}
	}

	#if CLIENT
		if( owner == GetLocalViewPlayer() )
			weapon.Signal( KILL_CLIENT_THREAD_SIGNAL )
	#endif
}

void function OnWeaponOwnerChanged_weapon_iron_bridge( entity weapon, WeaponOwnerChangedParams changeParams )
{
	#if CLIENT
	#endif
}

bool function OnWeaponAttemptOffhandSwitch_weapon_iron_bridge( entity weapon )
{
	entity owner = weapon.GetOwner()
	if( !IsValid( owner ) )
		return false

	if( owner.IsZiplining() )
		return false

	entity activeWeapon = owner.GetActiveWeapon( eActiveInventorySlot.mainHand )
	if( IsValid( activeWeapon ) && weapon == activeWeapon )
		return false

	int ammoReq = weapon.GetAmmoPerShot()
	int currAmmo = weapon.GetWeaponPrimaryClipCount()
	if ( currAmmo < ammoReq )
		return false

	return true
}

var function OnWeaponPrimaryAttack_weapon_iron_bridge( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	entity owner = weapon.GetOwner()
	if( !IsValid( owner ) )
		return 0

	entity ground = owner.GetGroundEntity()
	if( !IsValid( ground ) )
	{
		#if CLIENT
			AddPlayerHint( 1, 0.0, $"", "#WPN_IRON_BRIDGE_WARNING_NO_GROUND" )
			EmitSoundOnEntity( owner, "Survival_UI_Ability_NotReady" )
		#endif
		return 0
	}

	if( IsResinShotModel( ground ) )
	{
		entity root = GetIronBridgeRoot( ground )
		int count = GetIronBridgePieceCount( root )
		if( count >= IRON_BRIDGE_MAX_RAMP_SIZE )
		{
			#if CLIENT
				AddPlayerHint( 1, 0.0, $"", "#WPN_IRON_BRIDGE_WARNING_STRUCTURE_LIMIT" )
				EmitSoundOnEntity( owner, "Survival_UI_Ability_NotReady" )
			#endif
			return 0
		}
	}

	vector targetOrigin
	entity targetParent
	vector startAngles
	vector ownerOrigin = owner.GetOrigin()

	if( weapon.ObjectPlacementHasValidSpot() )
	{
		targetOrigin = weapon.GetObjectPlacementOrigin()
		targetParent = weapon.GetObjectPlacementParent()
		startAngles = weapon.GetObjectPlacementAngles()
	}
	else
	{
		targetOrigin = ownerOrigin + FlattenNormalizeVec( owner.GetViewVector() ) * IRON_BRIDGE_MIN_DISTANCE
		if( IsValid( ground ) && !ground.IsWorld() )
			targetParent = ground
	}
	startAngles = VectorToAngles( FlattenNormalizeVec( owner.GetViewVector() ) )

	vector camTarget = owner.EyePosition() + ( owner.GetViewVector() * 500 )
	vector camAngles = VectorToAngles( Normalize( camTarget - targetOrigin ) )
	vector testVec = AnglesToUp( weapon.GetObjectPlacementAngles() )
	vector potentialVec = AnglesToUp ( RotateAnglesAboutAxis( camAngles, AnglesToRight( camAngles ), -90 ) )
	float dot = testVec.Dot( potentialVec )
	float degrees = DotToAngle( dot )
	float distance = Distance( ownerOrigin, targetOrigin )
	float minDot = GraphCapped( distance, 200, 100, IRON_BRIDGE_MIN_DOT_MAX, IRON_BRIDGE_MIN_DOT_MIN )
	if( dot <= minDot )
		degrees = DotToAngle( minDot )
	else if( dot >= IRON_BRIDGE_MAX_DOT )
		degrees = DotToAngle( IRON_BRIDGE_MAX_DOT )

	vector angles = RotateAnglesAboutAxis( startAngles, AnglesToRight( startAngles ), -degrees )

	vector zipLineTestPos = targetOrigin + ( AnglesToUp( angles ) * IRON_BRIDGE_GEO_HEIGHT * 0.5 )
	if( IsPosInRangeOfAZipline( zipLineTestPos, IRON_BRIDGE_ZIPLINE_DETECTION_RADIUS ) )
	{
		#if CLIENT
			AddPlayerHint( 1, 0.0, $"", "#WPN_IRON_BRIDGE_WARNING_ZIPLINE_NEAR" )
			EmitSoundOnEntity( owner, "Survival_UI_Ability_NotReady" )
		#endif
		return 0
	}

	int currentCharges = GetNumPiecesFromLenth( owner.GetPlayerNetInt( IRON_BRIDGE_LENGTH_NETVAR ) )

	bool isPredictedOrServer = false
	#if SERVER
		                          
		                                                                                                                 
	#endif
	vector vel = owner.GetVelocity()
	vector flatVel = FlattenNormalizeVec( vel )
	vector flatView = FlattenNormalizeVec( owner.GetViewVector() )
	if( isPredictedOrServer && distance < 75 && vel.Length() >= IRON_BRIDGE_MIN_DISTANCE && owner.IsOnGround() && flatView.Dot( flatVel ) > 0.2 )
		owner.SetVelocity( < vel.x, vel.y, vel.z + IRON_BRIDGE_JUMP_MULTIPLIER > )

	#if CLIENT
		if( owner == GetLocalViewPlayer() )
			weapon.Signal( KILL_CLIENT_THREAD_SIGNAL )
	#endif

	return weapon.GetAmmoPerShot()
}

bool function OnObjectPlacementCanPlace_weapon_iron_bridge( entity weapon, vector origin, vector angles, entity parentTo )
{
	entity owner = weapon.GetOwner()
	if( !IsValid( owner ) )
		return false

	if( Distance( origin, owner.GetOrigin() ) <= IRON_BRIDGE_MIN_DISTANCE )
		return false

	return true
}

bool function CanBridgeExtend( entity owner, entity ent )
{
	if( !IsValid( owner ) )
		return false

	if( !IsResinShotModel( ent ) )
		return false

	entity root = GetIronBridgeRoot( ent )
	if( GetIronBridgePieceCount( root ) >= IRON_BRIDGE_MAX_RAMP_SIZE )
		return false

	entity parentEnt = ent.GetParent()
	entity groundEnt = owner.GetGroundEntity()
	array< entity > ignoreEnts
	ignoreEnts.append( ent )
	if( IsValid( groundEnt ) )
		ignoreEnts.append( groundEnt )
	if( IsValid( parentEnt ) )
		ignoreEnts.append( parentEnt )
	TraceResults tr = TraceLine( ent.GetOrigin() + ( ent.GetUpVector() * IRON_BRIDGE_GEO_HEIGHT * 0.25 ),  ent.GetOrigin() + ( ent.GetUpVector() * IRON_BRIDGE_EXTEND_CHECK_LENGTH ), ignoreEnts, TRACE_MASK_NPCSOLID_BRUSHONLY, TRACE_COLLISION_GROUP_NONE )
	if( tr.fraction < 1.0 )
		return false

	vector zipLineTestPos = tr.endPos
	if( IsPosInRangeOfAZipline( zipLineTestPos, IRON_BRIDGE_ZIPLINE_DETECTION_RADIUS ) )
		return false

	return true
}

int function GetIronBridgePieceCount( entity ent )
{
	int count = 1
	array< entity > entChildren = ent.GetChildren()
	foreach( c in entChildren )
	{
		if( IsResinShotModel( c ) )
			count += GetIronBridgePieceCount( c )
	}
	return count
}
entity function GetIronBridgeRoot( entity ent )
{
	if( !IsResinShard( ent ) )
		return null

	entity root = ent
	while( IsResinShotModel( root.GetParent() ) )
		root = root.GetParent()

	return root
}

int function GetNumPiecesFromLenth( int length )
{
	if( length == eIronBridgeLength.IRON_BRIDGE_LENGTH_LONG )
		return IRON_BRIDGE_MAX_PLACEMENT_SIZE

	return 1
}

#if SERVER
                                                                     
 
	                         
		      

	                                                              
	                                                                                         
		      

	                                                                
	                                                                                                                                                                
	                                                              
 

                                                                                                                                                         
 
	                                                

	                       
	                                                                                                                                                             
	                                     
	                          
		                                  

	                      
	                                        
	                             

	                                          
	 
		                                                     
			                                            

		                                                           
		 
			                                         
			 
				                               
			 
		 

		                                                            
		 
			                                              
			                             
			 
				                                                                                                                                   
				                     
			 
		 
	 

	            
		                                    
		 
			                             
			 
				                                                                                                                                         
				                                                        
				                     
			 

			                       
			 
				                                                  
				 
					                                                           
					 
						                                            
						 
							                               
						 
					 
				 
			 
		 
	 

	                        
	                                                             
	             
	 
		                                                                 
		                                  
		                  
			     
		           
	 
	                   
	                                       

	             
	                                                              
	 
		                                                                                                                                             
		                                                                                                                      
	 

	                  
		             
	    
		             
 
#endif

#if CLIENT
void function OnCreateClientOnlyModel_weapon_iron_bridge( entity weapon, entity model, bool validHighlight )
{
	model.Hide()
}

void function WeaponActive_Client( entity owner, entity weapon )
{
	EndSignal( weapon, KILL_CLIENT_THREAD_SIGNAL )
	EndSignal( weapon, "OnDestroy" )
	EndSignal( owner, "OnDestroy" )

	wait 0.2

	array< entity > proxies
	int maxCharges = IRON_BRIDGE_MAX_PLACEMENT_SIZE
	for( int i = 0; i < maxCharges; i++ )
	{
		entity proxy = IronBridgeCreatePlacementProxy( IRON_BRIDGE_COVER_WALL )
		proxy.EnableRenderAlways()
		proxy.Show()
		DeployableModelHighlight( proxy )
		proxies.append( proxy )
		if( i > 0 )
		{
			entity lastProxy = proxies[ i - 1 ]
			proxy.SetOrigin( lastProxy.GetOrigin() + ( lastProxy.GetUpVector() * IRON_BRIDGE_GEO_HEIGHT ) + ( lastProxy.GetForwardVector() * -4 ) )
			proxy.SetParent( lastProxy )
		}
	}

	                                                         
	var hintRui = CreateCockpitRui( $"ui/mobile_hmg_hint.rpak" )

	OnThreadEnd(
		function () : ( owner, maxCharges, proxies, hintRui )
		{
			for( int i = 0; i < maxCharges; i++ )
			{
				if ( IsValid( proxies[ i ] ) )
				{
					proxies[ i ].Destroy()
				}
			}
			                                           
			RuiDestroyIfAlive( hintRui )
		}
	)

	int lastCharges = 0
	bool lastGroundValid = true
	while( true )
	{
		                               
		RuiSetString( hintRui, "hintText", "" )
		int currentCharges = GetNumPiecesFromLenth( owner.GetPlayerNetInt( IRON_BRIDGE_LENGTH_NETVAR ) )
		bool setRed = false
		entity lastProxy = null
		int count = 0
		entity ground = owner.GetGroundEntity()
		if( IsValid( ground ) && IsResinShotModel( ground ) )
		{
			entity root = GetIronBridgeRoot( ground )
			count = GetIronBridgePieceCount( root )
		}

		if( !IsValid( ground ) )
		{
			RuiSetString( hintRui, "hintText", "#WPN_IRON_BRIDGE_WARNING_NO_GROUND" )
		}

		for( int i = 0; i < maxCharges; i++ )
		{
			entity proxy = proxies[ i ]
			if( i + 1 <= currentCharges )
			{
				proxy.Show()
			}
			else
			{
				proxy.Hide()
			}

			if( i == 0 )
			{
				vector startAngles
				if( weapon.ObjectPlacementHasValidSpot() )
				{
					proxy.SetOrigin( weapon.GetObjectPlacementOrigin() )
					                                                 
				}
				else
				{
					proxy.SetOrigin( owner.GetOrigin() + FlattenNormalizeVec( owner.GetViewVector() ) * IRON_BRIDGE_MIN_DISTANCE )

				}
				startAngles = VectorToAngles( FlattenNormalizeVec( owner.GetViewVector() ) )

				vector camTarget = owner.EyePosition() + ( owner.GetViewVector() * 500 )
				vector camAngles = VectorToAngles( Normalize( camTarget - proxy.GetOrigin() ) )
				vector testVec = AnglesToUp( weapon.GetObjectPlacementAngles() )
				vector potentialVec = AnglesToUp ( RotateAnglesAboutAxis( camAngles, AnglesToRight( camAngles ), -90 ) )
				float dot = testVec.Dot( potentialVec )
				float degrees = DotToAngle( dot )
				float distance = Distance( owner.GetOrigin(), proxy.GetOrigin() )
				float minDot = GraphCapped( distance, 200, 100, IRON_BRIDGE_MIN_DOT_MAX, IRON_BRIDGE_MIN_DOT_MIN )
				if( dot <= minDot )
					degrees = DotToAngle( minDot )
				else if( dot >= IRON_BRIDGE_MAX_DOT )
					degrees = DotToAngle( IRON_BRIDGE_MAX_DOT )

				vector angles = RotateAnglesAboutAxis( startAngles, AnglesToRight( startAngles ), -degrees )

				proxy.SetAngles( angles )

				vector zipLineTestPos = proxy.GetOrigin() + ( proxy.GetUpVector() * IRON_BRIDGE_GEO_HEIGHT * 0.5 )
				bool inZiplineRange = IsPosInRangeOfAZipline( zipLineTestPos, IRON_BRIDGE_ZIPLINE_DETECTION_RADIUS )
				if( !IsValid( ground ) || count + i + 1 > IRON_BRIDGE_MAX_RAMP_SIZE || inZiplineRange )
				{
					if( inZiplineRange && i + 1 <= currentCharges )
					{
						RuiSetString( hintRui, "hintText", "#WPN_IRON_BRIDGE_WARNING_ZIPLINE_NEAR" )
					}

					if( count + i + 1 > IRON_BRIDGE_MAX_RAMP_SIZE && i + 1 <= currentCharges  )
					{
						RuiSetString( hintRui, "hintText", "#WPN_IRON_BRIDGE_WARNING_STRUCTURE_LIMIT" )
					}

					DeployableModelInvalidHighlight( proxy )
					setRed = true
				}
				else
				{
					DeployableModelHighlight( proxy )
				}
			}
			else
			{
				if( setRed || count + i + 1 > IRON_BRIDGE_MAX_RAMP_SIZE || !CanBridgeExtend( owner, lastProxy )  )
				{
					vector zipLineTestPos = proxy.GetOrigin() + ( proxy.GetUpVector() * IRON_BRIDGE_GEO_HEIGHT * 0.5 )
					bool inZiplineRange = IsPosInRangeOfAZipline( zipLineTestPos, IRON_BRIDGE_ZIPLINE_DETECTION_RADIUS )
					if( inZiplineRange && i + 1 <= currentCharges )
					{
						RuiSetString( hintRui, "hintText", "#WPN_IRON_BRIDGE_WARNING_ZIPLINE_NEAR" )
					}

					if( count + i + 1 > IRON_BRIDGE_MAX_RAMP_SIZE && i + 1 <= currentCharges  )
					{
						RuiSetString( hintRui, "hintText", "#WPN_IRON_BRIDGE_WARNING_STRUCTURE_LIMIT" )
					}
					DeployableModelInvalidHighlight( proxy )
					setRed = true
				}
				else
				{
					DeployableModelHighlight( proxy )
				}
			}
			lastProxy = proxy
		}
		lastGroundValid = IsValid( ground )
		lastCharges = currentCharges
		WaitFrame()
	}
}

entity function IronBridgeCreatePlacementProxy( asset modelName )
{
	entity proxy = CreateClientSidePropDynamic( <0, 0, 0>, <0, 0, 0>, modelName )
	proxy.SetScriptName( RESIN_SHARD_SCRIPT_NAME )
	proxy.EnableRenderAlways()
	proxy.kv.rendermode = 3
	proxy.kv.renderamt = 1
	proxy.Hide()

	return proxy
}

void function IronBridgeTogglePressed( entity player )
{
	if ( player != GetLocalViewPlayer() || player != GetLocalClientPlayer() )
		return

	entity tacWeapon = player.GetOffhandWeapon( OFFHAND_TACTICAL )
	if ( !IsValid( tacWeapon ) )
		return

	if( tacWeapon.GetWeaponClassName() == IRON_BRIDGE_WEAPON_NAME )
		Remote_ServerCallFunction( "ClientCallback_IronBridgeTogglePressed" )
}

void function OnIronBridgeLengthChanged( entity player, int newLength )
{
	if( file.hud != null )
	{
		RuiSetInt( file.hud, "bridgeLegnth", newLength )
	}
}

void function IronBridge_OnPlayerClassChanged( entity player )
{
	if ( player != GetLocalViewPlayer()  )
		return

	player.Signal( KILL_UI_THREAD_SIGNAL )

	entity tacWeapon = player.GetOffhandWeapon( OFFHAND_TACTICAL )
	if ( !IsValid( tacWeapon ) || tacWeapon.GetWeaponClassName() != IRON_BRIDGE_WEAPON_NAME )
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
	RuiSetInt( file.hud, "bridgeLegnth", owner.GetPlayerNetInt( IRON_BRIDGE_LENGTH_NETVAR ) )
	WaitForever()
}
#endif          