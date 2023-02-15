                              
global function MpWeaponNemesis_Init
global function OnWeaponActivate_Nemesis
global function OnWeaponDeactivate_Nemesis
global function OnWeaponHeatStateChanged_Nemesis

const vector DEFAULT_UI_COLOR = <130, 130, 130> / 255.0
const vector ENERGIZED_UI_LEFT_BAR_COLOR = <255, 119, 0> / 255.0
const vector ENERGIZED_UI_RIGHT_BAR_COLOR = <150, 255, 30> / 255.0

          
const asset NEMESIS_FX_IDLE_MAGNET_FP = $"P_wpn_nem_idle_magnet_FP"
const asset NEMESIS_FX_IDLE_MAGNET_02_FP = $"P_wpn_nem_idle_magnet_02_FP"
const asset NEMESIS_FX_IDLE_PANEL_FP = $"P_wpn_nem_idle_panel_FP"
const asset NEMESIS_FX_IDLE_CENTER_FP = $"P_wpn_nem_idle_Center_FP"
const asset NEMESIS_FX_IDLE_LATCH_L_FP = $"P_wpn_nem_idle_latch_L_FP"
const asset NEMESIS_FX_IDLE_LATCH_R_FP = $"P_wpn_nem_idle_latch_R_FP"
const asset NEMESIS_FX_IDLE_3P = $"P_wpn_nem_idle_3P"
const asset NEMESIS_FX_IDLE_EMPTY = $"P_wpn_nem_empty_FP"

const asset NEMESIS_FX_IDLE_CHARGED_FP = $"P_wpn_nem_charged_ribbon_FP"

const float BARREL_CLOSE_SOUND_HEAT_VALUE = 0.05

void function MpWeaponNemesis_Init()
{
	PrecacheParticleSystem( NEMESIS_FX_IDLE_MAGNET_FP )
	PrecacheParticleSystem( NEMESIS_FX_IDLE_MAGNET_02_FP )
	PrecacheParticleSystem( NEMESIS_FX_IDLE_PANEL_FP )
	PrecacheParticleSystem( NEMESIS_FX_IDLE_CENTER_FP )
	PrecacheParticleSystem( NEMESIS_FX_IDLE_3P )
	PrecacheParticleSystem( NEMESIS_FX_IDLE_LATCH_L_FP )
	PrecacheParticleSystem( NEMESIS_FX_IDLE_LATCH_R_FP )
	PrecacheParticleSystem( NEMESIS_FX_IDLE_EMPTY )

	PrecacheParticleSystem( NEMESIS_FX_IDLE_CHARGED_FP )

	PrecacheParticleSystem( $"P_wpn_nem_reload_cyl_glow" )
	PrecacheParticleSystem( $"P_wpn_nem_reload_cyl_glow_late" )
	PrecacheParticleSystem( $"P_wpn_nem_cyl_elec" )
	PrecacheParticleSystem( $"P_wpn_nem_reload_elec_ring" )

	PrecacheParticleSystem( $"P_wpn_nem_reload_cyl_elec_01" )
	PrecacheParticleSystem( $"P_wpn_nem_reload_cyl_elec_02" )
	PrecacheParticleSystem( $"P_wpn_nem_reload_cyl_elec_03" )

	#if CLIENT
		AddCallback_OnPrimaryWeaponStatusUpdate( OnPrimaryWeaponStatusUpdate_Nemesis )
	#endif
	RegisterSignal( "WeaponDeactivate_Nemesis" )
	RegisterSignal( "HeatRuiThinkAbortSignal" )
}

void function OnWeaponActivate_Nemesis( entity weapon )
{
	#if CLIENT
		thread UpdateHeat_Client( weapon )
		thread UpdateFX_Client( weapon )
	#endif

	#if SERVER
		                                                                          
	#endif

	thread UpdateSound( weapon )
}


#if CLIENT
void function UpdateFX_Client ( entity weapon)
{
	            
	AssertIsNewThread()

	if ( !IsValid( weapon ) )
		return

	weapon.EndSignal( "OnDestroy" )
	weapon.EndSignal( "WeaponDeactivate_Nemesis" )

	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) || !IsLocalViewPlayer( player ) )
		return

	player.EndSignal( "OnDeath" )
	            

	                                                                                        

	weapon.PlayWeaponEffect( NEMESIS_FX_IDLE_PANEL_FP, $"", "fx_panel_L", true )
	weapon.PlayWeaponEffect( NEMESIS_FX_IDLE_PANEL_FP, $"", "fx_panel_R", true )

	weapon.PlayWeaponEffect( NEMESIS_FX_IDLE_MAGNET_FP, $"", "fx_magnet_01", true )
	weapon.PlayWeaponEffect( NEMESIS_FX_IDLE_MAGNET_02_FP, $"", "fx_magnet_02", true )
	weapon.PlayWeaponEffect( NEMESIS_FX_IDLE_MAGNET_FP, $"", "fx_magnet_03", true )
	weapon.PlayWeaponEffect( NEMESIS_FX_IDLE_MAGNET_02_FP, $"", "fx_magnet_04", true )
	weapon.PlayWeaponEffect( NEMESIS_FX_IDLE_MAGNET_FP, $"", "fx_magnet_05", true )

	int fxHandle_Barrel
	int fxHandle_Ribbon

	if ( !EffectDoesExist(fxHandle_Barrel))
		fxHandle_Barrel = weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_CENTER_FP, NEMESIS_FX_IDLE_3P, "fx_barrel_back", true )
	if ( !EffectDoesExist(fxHandle_Ribbon))
		fxHandle_Ribbon = weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_CHARGED_FP, $"", "fx_ribbon_charge", true )

	                              
	array<int> fxHandlesLeft =
	[
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_L_FP, $"", "fx_mag_latch_L_01", true ),
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_L_FP, $"", "fx_mag_latch_L_02", true ),
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_L_FP, $"", "fx_mag_latch_L_03", true ),
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_L_FP, $"", "fx_mag_latch_L_04", true ),
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_L_FP, $"", "fx_mag_latch_L_05", true ),
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_L_FP, $"", "fx_mag_latch_L_06", true ),
	]
	array<int> fxHandlesRight =
	[
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_R_FP, $"", "fx_mag_latch_R_01", true ),
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_R_FP, $"", "fx_mag_latch_R_02", true ),
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_R_FP, $"", "fx_mag_latch_R_03", true ),
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_R_FP, $"", "fx_mag_latch_R_04", true ),
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_R_FP, $"", "fx_mag_latch_R_05", true ),
		weapon.PlayWeaponEffectReturnViewEffectHandle( NEMESIS_FX_IDLE_LATCH_R_FP, $"", "fx_mag_latch_R_06", true ),
	]

	                                           
	for ( int i; i < fxHandlesLeft.len(); i++ )
	{
		if ( EffectDoesExist( fxHandlesLeft[i] ) )
		{
			EffectSleep( fxHandlesLeft[i])
		}
		if ( EffectDoesExist( fxHandlesRight[i]) )
		{
			EffectSleep( fxHandlesRight[i])
		}
	}

	OnThreadEnd(
		function() : ( weapon, fxHandlesLeft, fxHandlesRight, fxHandle_Barrel, fxHandle_Ribbon )
		{
			for ( int i; i < fxHandlesLeft.len(); i++ )
			{
				if ( EffectDoesExist( fxHandlesLeft[i] ) )
				{
					EffectStop( fxHandlesLeft[i], true, false )
				}

				if ( EffectDoesExist( fxHandlesRight[i]) )
				{
					EffectStop( fxHandlesRight[i], true, false )
				}
			}

			if ( EffectDoesExist( fxHandle_Barrel ) )
			{
				EffectStop( fxHandle_Barrel, true, false )
			}

			if ( EffectDoesExist( fxHandle_Ribbon ) )
			{
				EffectStop( fxHandle_Ribbon, true, false )
			}

			weapon.StopWeaponEffect( $"", NEMESIS_FX_IDLE_3P )
		}

	)

	float previousHeat = 0.0
	float length = float( fxHandlesLeft.len() )

	      
	while( true )
	{
		float heatValue 		= weapon.GetHeatValue()
		float interp 			= 0.0

		                                                                
		if (heatValue != previousHeat)
		{

			if ( EffectDoesExist( fxHandle_Barrel ) )
				EffectSetControlPointVector( fxHandle_Barrel, 15, <heatValue, heatValue, heatValue> )

			if ( EffectDoesExist( fxHandle_Ribbon ) )
				EffectSetControlPointVector( fxHandle_Ribbon, 15, <heatValue, heatValue, heatValue> )

			for ( int i; i < fxHandlesLeft.len(); i++ )
			{

				interp = ( i / length )

				if (heatValue > interp)
				{
					if ( EffectDoesExist( fxHandlesLeft[i] ) )
					{
						EffectWake( fxHandlesLeft[i] )
					}
					if ( EffectDoesExist( fxHandlesRight[i] ))
					{
						EffectWake( fxHandlesRight[i] )
					}
				}
				else
				{
					if ( EffectDoesExist( fxHandlesLeft[i] ))
					{
						EffectSleep( fxHandlesLeft[i] )
					}
					if ( EffectDoesExist( fxHandlesRight[i] ))
					{
						EffectSleep( fxHandlesRight[i] )
					}
				}
			}
		}
		previousHeat = heatValue
		WaitFrame()
	}
}
#endif


#if CLIENT
void function OnPrimaryWeaponStatusUpdate_Nemesis( entity selectedWeapon, var weaponRui )
{
	if ( !IsValid( selectedWeapon ) )
		return

	                                                                                   
	entity activeWeapon = GetLocalViewPlayer().GetActiveWeapon( eActiveInventorySlot.mainHand  )
	bool switchToMeleeOrGrenade = IsBitFlagSet( selectedWeapon.GetWeaponTypeFlags(), ( WPT_VIEWHANDS | WPT_GRENADE ) )
	if ( IsValid( activeWeapon ) && activeWeapon != selectedWeapon && activeWeapon.HasHeatDecay() )
	{
		if ( !( activeWeapon.GetHeatValue() > 0.0 && switchToMeleeOrGrenade ) )
			activeWeapon.Signal( "HeatRuiThinkAbortSignal" )
	}

	if( selectedWeapon.GetWeaponClassName() == "mp_weapon_nemesis" )
		thread UpdateHeat_Client( selectedWeapon )
}
#endif

#if CLIENT
void function UpdateHeat_Client( entity weapon )
{
	AssertIsNewThread()

	if ( !IsValid( weapon ) )
		return

	weapon.Signal( "HeatRuiThinkAbortSignal" )
	weapon.EndSignal( "OnDestroy" )
	weapon.EndSignal( "HeatRuiThinkAbortSignal" )

	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) || !IsLocalViewPlayer( player ) )
		return

	player.Signal( WEAPON_CHARGED_RUI_ABORT_SIGNAL )
	player.EndSignal( "OnDeath" )
	player.EndSignal( WEAPON_CHARGED_RUI_ABORT_SIGNAL )

	var rui = ClWeaponStatus_GetWeaponHudRui( player )
	RuiDestroyNestedIfAlive( rui, "chargedHandle" )

	var nestedRui = RuiCreateNested( rui, "chargedHandle", $"ui/weapon_hud_charged_nemesis.rpak" )
	if ( rui == null )
		return

	OnThreadEnd(
		function() : ( player, weapon, rui, nestedRui )
		{
			RuiSetBool( rui, "showChargeBar", false )
			RuiDestroyNestedIfAlive( rui, "chargedHandle" )
		}
	)

	                    
	RuiSetFloat3( nestedRui, "startBorderColor", SrgbToLinear( <127, 127, 127> / 255.0 ) )
	RuiSetFloat3( nestedRui, "middleBorderColor", SrgbToLinear( <84, 130, 219> / 255.0 ) )
	RuiSetFloat3( nestedRui, "endBorderColor",SrgbToLinear( <92, 191, 218> / 255.0 ) )

	                                   
	RuiSetFloat3( rui, "chargeBarBorderOverlayColor", SrgbToLinear( ENERGIZED_UI_LEFT_BAR_COLOR ) )
	RuiSetBool( rui, "showChargeBarBorderColor", false )
	RuiSetBool( rui, "showChargedAmmoIconOverride", false )
	RuiSetBool( rui, "showChargedAmmoOverride", false )

	RuiSetFloat( nestedRui, "chargeBarTimeRemaining", -1.0 )

	while( true )
	{

		entity activeWeapon = player.GetActiveWeapon( eActiveInventorySlot.mainHand )
		if( IsValid ( activeWeapon ) )
		{
			bool IsPrimaryWeapon = IsBitFlagSet( activeWeapon.GetWeaponTypeFlags(), WPT_PRIMARY )
			bool IsUltimateWeapon = IsBitFlagSet( activeWeapon.GetWeaponTypeFlags(), WPT_ULTIMATE )
			if ( ( IsPrimaryWeapon && !activeWeapon.HasHeatDecay() ) || IsUltimateWeapon )
				break
		}

		float heatValue = weapon.GetHeatValue()

		RuiSetFloat( nestedRui, "chargeBarFrac", heatValue )
		RuiSetBool( rui, "showChargeBar", true )

		WaitFrame()
	}
}
#endif


void function UpdateSound( entity weapon )
{
	AssertIsNewThread()

	if ( !IsValid( weapon ) )
		return

	weapon.EndSignal( "OnDestroy" )
	weapon.EndSignal( "WeaponDeactivate_Nemesis" )

	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) )
		return

	player.EndSignal( "OnDeath" )

	float lastHeatValue
	while( true )
	{
		float heatValue = weapon.GetHeatValue()

		#if SERVER
			                                               
		#endif

		#if CLIENT
		if( heatValue < BARREL_CLOSE_SOUND_HEAT_VALUE && lastHeatValue > BARREL_CLOSE_SOUND_HEAT_VALUE )
		{
			weapon.EmitWeaponSound( "wpn_nemesis_barrelClose" )
		}
		lastHeatValue = heatValue
		#endif

		WaitFrame()
	}
}

void function OnWeaponDeactivate_Nemesis( entity weapon )
{
	weapon.Signal( "WeaponDeactivate_Nemesis" )

	#if SERVER
		                                                  
	#endif
}

void function OnWeaponHeatStateChanged_Nemesis( entity weapon, bool currentIsHeated )
{
	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) )
		return
#if SERVER
                       
                                                                             
       
#endif
}

                                   