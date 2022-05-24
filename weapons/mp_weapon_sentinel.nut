                                                                                                                                                                                                      
global function MpWeaponSentinel_Init
global function OnWeaponActivate_weapon_sentinel
global function OnWeaponDeactivate_weapon_sentinel
global function OnWeaponPrimaryAttack_weapon_sentinel
global function OnWeaponCustomActivityStart_weapon_sentinel
global function OnWeaponCustomActivityEnd_weapon_sentinel
global function OnWeaponStartZoomIn_weapon_sentinel
global function OnWeaponStartZoomOut_weapon_sentinel

#if CLIENT
global function WeaponSentinel_TryApplyEnergized
#endif	        

#if SERVER
                                                   
                                                       
                                            
                                             
#endif         

global const string SENTINEL_USE_ENERGIZE_PLAYLIST_VAR = "sentinel_use_energize"
const string SENTINEL_SHOW_CROSSHAIR_ENERGIZE_PLAYLIST_VAR = "sentinel_show_crosshair_energize_status"

const bool DEBUG_FREE_ENERGIZE = false
const bool DEBUG_EFFECTS_TRIGGERS = false
const bool DEBUG_SCRIPT_CHARGE_FRAC = false
const bool DEBUG_FLAGS = false

const string SENTINEL_CLASS_NAME = "mp_weapon_sentinel"

const string SENTINEL_DEACTIVATE_SIGNAL = "SentinelDeactivate"

const float SENTINEL_RECHAMBER_READY_TO_FIRE_FRAC = 50.0 / 63.0	                                                                 

const string ENERGIZED_MOD = "energized"
const string WATCH_ENERGIZE_ABORT_SIGNAL = "SentinelWatchEnergizeAbortSignal"

const int ENERGIZE_FLAGS_OFF = 0
const int ENERGIZE_FLAGS_CHARGING = 1
const int ENERGIZE_FLAGS_CHARGED = 2

const string ENERGIZE_ACTIVITY = "ACT_VM_CHARGE_VER4"
const int ENERGIZE_ACTIVITY_FLAGS = WCAF_ISINTERRUPTIBLE | WCAF_INTERRUPTIBLE_ALLOW_START_WHILE_SPRINTING | WCAF_INTERRUPTIBLE_ALLOW_JUMP_LAND | WCAF_INTERRUPTIBLE_ALLOW_WHILE_SPRINTING | WCAF_KEEPMELEESTATE
const string ENERGIZE_DISPLAY_ABORT_SIGNAL = "EnergizeRuiDestroy"
const float ENERGIZE_STATUS_EFFECT_SLOW_INTENSITY = 0.15

const string RECHAMBER_RUI_ABORT_SIGNAL = "SentinelRechamberRuiAbort"
const string RECHAMBER_RUI_END_EVENT_ANIM = "rechamber"
const string RECHAMBER_RUI_END_EVENT = "hide_rechamber_dot"

enum ScriptChargeFracState
{
	OFF,
	INCREASE_TO_1,
	DECREASE_TO_0,
	MATCH_ENERGIZE,

	_count
}
const float SCRIPT_CHARGE_FRAC_INCREASE_TO_1_TIME = 3.5		                                                                                                             
const float SCRIPT_CHARGE_FRAC_INCREASE_TO_1_SPEED = 1.0 / SCRIPT_CHARGE_FRAC_INCREASE_TO_1_TIME
const float SCRIPT_CHARGE_FRAC_MATCH_ENERGIZE_SPEED_MAX = 0.35
const float SCRIPT_CHARGE_FRAC_MATCH_ENERGIZE_MIN = 0.5
const float SCRIPT_CHARGE_FRAC_DECREASE_TO_0_TIME = 0.5
const float SCRIPT_CHARGE_FRAC_DECREASE_TO_0_SPEED = SCRIPT_CHARGE_FRAC_MATCH_ENERGIZE_MIN / SCRIPT_CHARGE_FRAC_DECREASE_TO_0_TIME
const string SCRIPT_CHARGE_FRAC_THINK_ABORT_SIGNAL = "ScriptChargeFracThinkAbort"

enum EnergizeFXTime
{
	PRE_ENERGIZE,
	ENERGIZE,
	END_ENERGIZE
}
const int MAX_ENERGIZE_FX = 5
const string ENERGIZE_FX_ON_SCOPE_ZOOM_ABORT_SIGNAL = "ScopeZoomFXAbortSignal"

const vector ENERGIZED_UI_COLOR = <134, 255, 221> / 255.0                
const vector ENERGIZED_UI_LEFT_BAR_COLOR = <0, 155, 146> / 255.0
const vector DEFAULT_UI_COLOR = <130, 130, 130> / 255.0
const asset ENERGIZED_CROSSHAIR_RUI = $"ui/crosshair_energize_status_sentinel.rpak"
const asset AMMO_ENERGIZED_ICON = $"rui/hud/gametype_icons/survival/sur_ammo_sniper_charged"
const asset ENERGIZE_UI_CONSUMABLE_ICON = $"rui/hud/loot/loot_stim_shield_small"

struct ConsumableData
{
	string ref
	string consumableNamePlural
	string consumableNameSingular
	asset hudIcon
	int consumableType
}

const int BASE_CONSUMABLES_REQUIRED = 2

struct
{
	bool fileStructInitialized = false

	ConsumableData& consumableData
	float energizedDuration
	float energizedTimeConsumedPerShot
	float energizeActivityTime

	MarksmansTempoSettings& sentinelTempoSettings
} file

                                                                                         
  
  	                               
  
                                                                                         
void function MpWeaponSentinel_Init()
{
	PrecacheWeapon( SENTINEL_CLASS_NAME )

	RegisterSignal( SENTINEL_DEACTIVATE_SIGNAL )

	RegisterSignal( WATCH_ENERGIZE_ABORT_SIGNAL )
	RegisterSignal( ENERGIZE_DISPLAY_ABORT_SIGNAL )
	RegisterSignal( RECHAMBER_RUI_ABORT_SIGNAL )

	RegisterSignal( ENERGIZE_STATUS_RUI_ABORT_SIGNAL )	              

	RegisterSignal( SCRIPT_CHARGE_FRAC_THINK_ABORT_SIGNAL )

	RegisterSignal( ENERGIZE_FX_ON_SCOPE_ZOOM_ABORT_SIGNAL )

	Remote_RegisterServerFunction( "ClientCallback_BeginEnergize", "entity" )
	Remote_RegisterServerFunction( "ClientCallback_CancelEnergize", "entity" )

	#if CLIENT
		if ( !GetConVarBool( "enable_code_weapon_energize" ) )
			AddCallback_OnPrimaryWeaponStatusUpdate( OnPrimaryWeaponStatusUpdate )
	#endif

	#if SERVER
		                                         
	#endif         

	#if CLIENT
		RegisterConCommandTriggeredCallback( "+weaponcycle", AttemptCancelEnergize )
		RegisterConCommandTriggeredCallback( "+speed", AttemptCancelEnergize )
	#endif         

	ConsumableData consumableData
	consumableData.ref = "health_pickup_combo_small"
	consumableData.consumableNamePlural = "#SURVIVAL_PICKUP_HEALTH_COMBO_SMALL_PLURAL"
	consumableData.consumableNameSingular = "#SURVIVAL_PICKUP_HEALTH_COMBO_SMALL"
	consumableData.hudIcon = $"rui/hud/loot/loot_stim_shield_small"
	consumableData.consumableType = 1                                  
	file.consumableData = consumableData
}

void function OnWeaponActivate_weapon_sentinel( entity weapon )
{

	                                                                             
	if ( !file.fileStructInitialized )
	{
		file.fileStructInitialized = true

		file.energizedDuration = GetWeaponInfoFileKeyField_GlobalFloat( "mp_weapon_sentinel", "energized_duration" )
		file.energizedTimeConsumedPerShot = GetWeaponInfoFileKeyField_GlobalFloat( "mp_weapon_sentinel", "energized_time_consumed_per_shot" )
		file.energizeActivityTime = GetWeaponInfoFileKeyField_GlobalFloat( "mp_weapon_sentinel", "energize_activity_time" )

		MarksmansTempoSettings settings
		settings.requiredShots             = GetWeaponInfoFileKeyField_GlobalInt( SENTINEL_CLASS_NAME, MARKSMANS_TEMPO_REQUIRED_SHOTS_SETTING )
		settings.graceTimeBuildup          = GetWeaponInfoFileKeyField_GlobalFloat( SENTINEL_CLASS_NAME, MARKSMANS_TEMPO_GRACE_TIME_SETTING )
		settings.graceTimeInTempo          = GetWeaponInfoFileKeyField_GlobalFloat( SENTINEL_CLASS_NAME, MARKSMANS_TEMPO_GRACE_TIME_IN_TEMPO_SETTING  )
		settings.fadeoffMatchGraceTime 	   = GetWeaponInfoFileKeyField_GlobalInt( SENTINEL_CLASS_NAME, MARKSMANS_TEMPO_FADEOFF_MATCH_GRACE_TIME )
		settings.fadeoffOnPerfectMomentHit = GetWeaponInfoFileKeyField_GlobalFloat( SENTINEL_CLASS_NAME, MARKSMANS_TEMPO_FADEOFF_ON_PERFECT_MOMENT_SETTING )
		settings.fadeoffOnFire             = GetWeaponInfoFileKeyField_GlobalFloat( SENTINEL_CLASS_NAME, MARKSMANS_TEMPO_FADEOFF_ON_FIRE_SETTING )
		settings.weaponDeactivateSignal    = SENTINEL_DEACTIVATE_SIGNAL
		file.sentinelTempoSettings         = settings
	}

	thread MarksmansTempo_OnActivate( weapon, file.sentinelTempoSettings )

	if ( !GetCurrentPlaylistVarBool( SENTINEL_USE_ENERGIZE_PLAYLIST_VAR, true ) )
		return

	entity player = weapon.GetWeaponOwner()
	#if SERVER
		                                                             
			                                                   

		                        
		 
			                                                      
				                                           
		 
		    
			                                                                                                        
	#endif

	#if CLIENT
		if ( IsValid( player ) )
		{
			int slot = GetSlotForWeapon( player, weapon )
			if ( slot >= 0 )
				weapon.w.activeOptic = SURVIVAL_GetWeaponAttachmentForPoint( player, slot, "sight" )
			else
				weapon.w.activeOptic = ""

			if( GetConVarBool("enable_code_weapon_energize") )
				thread UpdateWeaponEnergizeRui( player, weapon, ENERGIZED_CROSSHAIR_RUI, ENERGIZE_UI_CONSUMABLE_ICON, AMMO_ENERGIZED_ICON )
			else
				thread EnergizeRuiThink( player, weapon )
		}
	#endif

	if ( IsValid( player ) && player.IsPlayer() && !GetConVarBool("enable_code_weapon_energize") )
		thread ScriptChargeFracThink( weapon, player )
}

void function OnWeaponDeactivate_weapon_sentinel( entity weapon )
{
	if ( !GetCurrentPlaylistVarBool( SENTINEL_USE_ENERGIZE_PLAYLIST_VAR, true ) )
		return

	weapon.Signal( SENTINEL_DEACTIVATE_SIGNAL )

	weapon.Signal( ENERGIZE_FX_ON_SCOPE_ZOOM_ABORT_SIGNAL )

	if( !GetConVarBool("enable_code_weapon_energize") )
	{
		StopEnergizeFX( weapon, EnergizeFXTime.PRE_ENERGIZE )
		StopEnergizeFX( weapon, EnergizeFXTime.ENERGIZE )
		StopEnergizeFX( weapon, EnergizeFXTime.END_ENERGIZE )
	}

	if ( IsServer() || (IsClient() && InPrediction() && IsFirstTimePredicted()) )
	{
		weapon.Signal( SCRIPT_CHARGE_FRAC_THINK_ABORT_SIGNAL )
		weapon.SetWeaponChargeFraction( 0.0 )
	}

	MarksmansTempo_OnDeactivate( weapon, file.sentinelTempoSettings )

	                                         
	                                                                                 

	                               
		      

	                                                                    
	 
		                                                 
	   
}

var function OnWeaponPrimaryAttack_weapon_sentinel( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) )
		return 0

	weapon.FireWeapon_Default( attackParams.pos, attackParams.dir, 1.0, 1.0, false )

	int ammoPerShot = weapon.GetWeaponSettingInt( eWeaponVar.ammo_per_shot )

	if ( !GetCurrentPlaylistVarBool( SENTINEL_USE_ENERGIZE_PLAYLIST_VAR, true ) )
		return ammoPerShot

	#if SERVER
		                                                      
		 
			                                                                                      
			                                   
				                        
			    
				                                           
		 
	#endif

	#if CLIENT
		if ( InPrediction() && IsFirstTimePredicted() )
		{
			if ( weapon.GetWeaponPrimaryClipCount() > ammoPerShot && !HasFullscreenScope( weapon ) )
			{
				weapon.Signal( RECHAMBER_RUI_ABORT_SIGNAL )
				thread DisplayRechamberRui( weapon )
			}
		}
	#endif

	MarksmansTempo_OnFire( weapon, file.sentinelTempoSettings, false )		                                                                                             
	float rechamberDuration = weapon.GetWeaponSettingFloat( eWeaponVar.rechamber_time )
	float fireCooldown      = 1.0 / weapon.GetWeaponSettingFloat( eWeaponVar.fire_rate )
	float perfectMomentTime = Time() + fireCooldown + rechamberDuration * SENTINEL_RECHAMBER_READY_TO_FIRE_FRAC
	MarksmansTempo_SetPerfectTempoMoment( weapon, file.sentinelTempoSettings, player, perfectMomentTime, true )


	return ammoPerShot
}

void function OnWeaponCustomActivityStart_weapon_sentinel( entity weapon )
{
	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) )
		return

	weapon.SetScriptFlags0( ENERGIZE_FLAGS_CHARGING )
	if ( DEBUG_FLAGS )
		printt( "SERVER SETTING FLAGS 1 CUSTOM ACTIVITY START" )

	foreach ( effect in weapon.w.statusEffects )
		StatusEffect_Stop( player, effect )
	weapon.w.statusEffects.append( StatusEffect_AddEndless( player, eStatusEffect.move_slow, ENERGIZE_STATUS_EFFECT_SLOW_INTENSITY ) )
}

void function OnWeaponCustomActivityEnd_weapon_sentinel( entity weapon, int activity )
{
	if ( !IsValid( weapon ) )
		return

	if ( IsClient() && (!InPrediction() || !IsFirstTimePredicted()) )
		return

	#if SERVER
		                             

		                                                         
		                                                          
		 
			                                                                                        
			                               
			                  
				                                                                 
		 
	#endif

	if ( weapon.GetScriptInt0() == ScriptChargeFracState.INCREASE_TO_1 )
		weapon.SetScriptInt0( ScriptChargeFracState.DECREASE_TO_0 )

	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) )
		return

	player.Signal( ENERGIZE_DISPLAY_ABORT_SIGNAL )
	foreach ( effect in weapon.w.statusEffects )
		StatusEffect_Stop( player, effect )
}

void function OnWeaponStartZoomIn_weapon_sentinel( entity weapon )
{
	if ( !IsValid( weapon ) )
		return

	if ( !GetCurrentPlaylistVarBool( SENTINEL_USE_ENERGIZE_PLAYLIST_VAR, true ) )
		return

	weapon.Signal( ENERGIZE_FX_ON_SCOPE_ZOOM_ABORT_SIGNAL )
	entity player = weapon.GetWeaponOwner()
	if ( IsValid( player ) && HasFullscreenScope( weapon ) )
		thread StopEnergizeFXOnScopeZoomIn( weapon, player )
}

void function OnWeaponStartZoomOut_weapon_sentinel( entity weapon )
{
	if ( !IsValid( weapon ) )
		return

	if ( !GetCurrentPlaylistVarBool( SENTINEL_USE_ENERGIZE_PLAYLIST_VAR, true ) )
		return

	weapon.Signal( ENERGIZE_FX_ON_SCOPE_ZOOM_ABORT_SIGNAL )
	entity player = weapon.GetWeaponOwner()
	if ( IsValid( player ) && HasFullscreenScope( weapon ) && weapon.GetScriptInt0() == ScriptChargeFracState.MATCH_ENERGIZE )
		thread StartEnergizeFXOnScopeZoomOut( weapon, player )
}


                                                                                         
  
  	            
  
                                                                                         
#if CLIENT
void function WeaponSentinel_TryApplyEnergized( entity player, entity weapon )
{
	printf("Debug sentinel energize: WeaponSentinel_TryApplyEnergized entered")

	if ( !IsValid( player ) || !IsValid( weapon ) )
		return

	if ( weapon.IsInCustomActivity() && (weapon.GetCurrentCustomActivity() == ACT_VM_CHARGE_VER4 || weapon.GetCurrentCustomActivity() == ACT_VM_ONEHANDED_CHARGE) )
		return

	if ( weapon.GetWeaponClassName() != SENTINEL_CLASS_NAME )
		return

	if ( player.IsSwitching( 0 ) )	                           
		return

	if ( weapon.IsRechambering() && !weapon.IsReadyToFire() )
		return

	int consumablesRequired = player.HasPassive( ePassives.PAS_BONUS_SMALL_HEAL ) ? maxint( 0, BASE_CONSUMABLES_REQUIRED - 1 ) : BASE_CONSUMABLES_REQUIRED
	string consumableString = consumablesRequired > 1 ? file.consumableData.consumableNamePlural : file.consumableData.consumableNameSingular
	int consumableCount = SURVIVAL_CountItemsInInventory( player, file.consumableData.ref )
	if ( !DEBUG_FREE_ENERGIZE && consumableCount <= (consumablesRequired - 1) )
	{
		AnnouncementMessageRight( player, Localize( "#WPN_SENTINEL_ENERGIZE_CONSUMABLE_REQUIRED", consumablesRequired, Localize( consumableString ) ) )
		Quickchat( player, eCommsAction.INVENTORY_NEED_SHIELDS )
		return
	}

	Remote_ServerCallFunction( "ClientCallback_BeginEnergize", weapon )
}

void function DisplayRechamberRui( entity weapon )
{
	if ( !IsValid( weapon ) )
		return
	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) )
		return
	player.EndSignal( "OnDeath" )
	weapon.EndSignal( "OnDestroy" )
	weapon.EndSignal( RECHAMBER_RUI_ABORT_SIGNAL )
	OnThreadEnd(
		function() : ( weapon )
		{
			if ( IsValid( weapon ) && weapon.w.sentinelEnergizeHintRui != null )
				RuiSetBool( weapon.w.sentinelEnergizeHintRui, "isRechambering", false)
		}
	)

	float fireRate = weapon.GetWeaponSettingFloat( eWeaponVar.fire_rate )
	if ( fireRate <= 0 )
		return
	wait 1.0 / fireRate

	if ( !IsValid( weapon ) )
		return

	if ( weapon.w.sentinelEnergizeHintRui != null )
		RuiSetBool( weapon.w.sentinelEnergizeHintRui, "isRechambering", true)

	float duration = weapon.GetWeaponSettingFloat( eWeaponVar.rechamber_time ) * 0.66                                         
	                                                                             
	                                                                                                            	                                                                                                                                  

	waitthread DisplayCenterDotRui( weapon, RECHAMBER_RUI_ABORT_SIGNAL, 0.0, duration, 0.5, 0.1, 0.2 )

	if ( IsValid( weapon ) && weapon.w.sentinelEnergizeHintRui != null )
		RuiSetBool( weapon.w.sentinelEnergizeHintRui, "isRechambering", false)
}

void function EnergizeRuiThink( entity player, entity weapon )
{
	AssertIsNewThread()
	weapon.EndSignal( "OnDestroy" )
	weapon.EndSignal( ENERGIZE_STATUS_RUI_ABORT_SIGNAL )

	if ( !IsValid( player ) || !IsLocalViewPlayer( player ) )
		return
	player.EndSignal( "OnDeath" )

	var rui = ClWeaponStatus_GetWeaponHudRui( player )
	var crosshairRui = CreateCockpitPostFXRui( $"ui/crosshair_energize_status_sentinel.rpak" )
	weapon.w.sentinelEnergizeHintRui = crosshairRui

	OnThreadEnd(
		function() : ( player, weapon, rui, crosshairRui )
		{
			RuiSetBool( rui, "showChargeBar", false )
			RuiDestroy( crosshairRui )
			if ( IsValid( weapon ) )
				weapon.w.sentinelEnergizeHintRui = null
		}
	)

	vector energizedColor = SrgbToLinear( ENERGIZED_UI_COLOR )
	vector energizedLeftBarColor = SrgbToLinear( ENERGIZED_UI_LEFT_BAR_COLOR )
	vector defaultColor = SrgbToLinear( DEFAULT_UI_COLOR )

	vector shieldBatteryLeftBarColor = SrgbToLinear( GetKeyColor( COLORID_HUD_LOOT_TIER0, 2 ) / 255.0 ) * 0.8
	const float COLOR_ADD = 0.2
	vector shieldBatteryColor = <min( shieldBatteryLeftBarColor.x + COLOR_ADD, 1), min( shieldBatteryLeftBarColor.y + COLOR_ADD, 1), min( shieldBatteryLeftBarColor.z + COLOR_ADD, 1)>

	RuiSetImage( rui, "chargeIcon", $"rui/hud/loot/loot_stim_shield_small" )
	RuiSetImage( rui, "chargedAmmoIconOverride", AMMO_ENERGIZED_ICON )
	RuiSetFloat3( rui, "chargedAmmoOverrideColor", energizedColor )

	RuiSetBool( crosshairRui, "isActive", false )
	RuiSetFloat3( crosshairRui, "energizeColor", energizedColor )

	int consumablesRequired
	string consumableName

	float energizingStartTime = -1.0
	float curEnergizingTime = -1.0

	float offset = 0.05
	float width = 100
	float lastTime = Time()

	int flags = -1

	int state = -1
	int lastState = -1
	while ( true )
	{
		{
			lastState = state
			flags = weapon.GetScriptFlags0()
			if ( DEBUG_FLAGS )
				printt( "CLIENT: "+flags )

			consumablesRequired = player.HasPassive( ePassives.PAS_BONUS_SMALL_HEAL ) ? maxint( 0, BASE_CONSUMABLES_REQUIRED - 1 ) : BASE_CONSUMABLES_REQUIRED

			             
			if ( flags == ENERGIZE_FLAGS_CHARGING )
			{
				RuiSetBool( rui, "showChargeBar", true )

				state = 0
				if ( state != lastState )
				{
					RuiSetBool( rui, "showChargeBarBorder", true )
					RuiSetBool( rui, "showChargeBarBorderColor", false )
					RuiSetFloat3( rui, "chargeBGcolor", defaultColor )
					RuiSetFloat( rui, "chargeBorderSaturation", 1.0 )
					RuiSetFloat( rui, "chargeIconSaturation", 1.0 )
					RuiSetFloat3( rui, "chargeBarBorderOverlayColor", shieldBatteryLeftBarColor )
					RuiSetString( rui, "chargeBarTextLeft", Localize( "#WPN_SENTINEL_ENERGIZING_LABEL" ) )
					RuiSetString( rui, "chargeBarTextLeftLong", "" )

					RuiSetBool( rui, "showChargeProgressBar", true )
					RuiSetFloat3( rui, "chargeBarColorRight", shieldBatteryColor )
					RuiSetFloat3( rui, "chargeBarColorLeft", shieldBatteryLeftBarColor )
					energizingStartTime = Time()

					RuiSetBool( rui, "showChargeIcon", true )
					RuiSetBool( rui, "showChargeIconBG", true )
					RuiSetFloat3( rui, "iconBGColor", defaultColor )

					RuiSetBool( rui, "showChargedAmmoIconOverride", false )
					RuiSetBool( rui, "showChargedAmmoOverride", false )
				}

				curEnergizingTime = Time() - energizingStartTime
				RuiSetFloat( rui, "chargeBarTimeRemaining", file.energizeActivityTime - curEnergizingTime )
				RuiSetFloat( rui, "chargeBarFrac", min( curEnergizingTime / file.energizeActivityTime, 1.0 ) )
			}
			                 
			else if ( flags == ENERGIZE_FLAGS_CHARGED && weapon.HasMod( ENERGIZED_MOD ) )
			{
				RuiSetBool( rui, "showChargeBar", true )
				RuiSetFloat( rui, "chargeBarTimeRemaining", -1.0 )

				state = 1
				if ( state != lastState )
				{
					RuiSetBool( rui, "showChargeBarBorder", true )
					RuiSetBool( rui, "showChargeBarBorderColor", true )
					RuiSetFloat( rui, "chargeBorderSaturation", 1.0 )
					RuiSetFloat( rui, "chargeIconSaturation", 1.0 )
					RuiSetFloat3( rui, "chargeBarBorderOverlayColor", energizedLeftBarColor )
					RuiSetString( rui, "chargeBarTextLeft", Localize( "#WPN_SENTINEL_ENERGIZE_LABEL" ) )
					RuiSetString( rui, "chargeBarTextLeftLong", "" )

					RuiSetBool( rui, "showChargeProgressBar", true )
					RuiSetFloat3( rui, "chargeBarColorRight", energizedColor )
					RuiSetFloat3( rui, "chargeBarColorLeft", energizedLeftBarColor )
					RuiSetFloat3( rui, "chargeBGcolor", energizedLeftBarColor )

					RuiSetBool( rui, "showChargeIcon", true )
					RuiSetBool( rui, "showChargeIconBG", true )
					RuiSetFloat3( rui, "iconBGColor", energizedColor )

					RuiSetBool( rui, "showChargedAmmoIconOverride", true )
					RuiSetBool( rui, "showChargedAmmoOverride", true )
				}

				RuiSetFloat( rui, "chargeBarFrac", max( weapon.GetScriptTime0() - Time(), 0 ) / file.energizedDuration )
			}
			                              
			else if ( DEBUG_FREE_ENERGIZE || SURVIVAL_CountItemsInInventory( player, file.consumableData.ref ) > (consumablesRequired -1) )
			{
				RuiSetBool( rui, "showChargeBar", true )
				RuiSetFloat( rui, "chargeBarTimeRemaining", -1.0 )

				                                                                                                                                     
				if ( !weapon.IsWeaponActivated() )
					return

				state = 2
				if ( state != lastState )
				{
					RuiSetBool( rui, "showChargeBarBorder", true )
					RuiSetFloat3( rui, "chargeBGcolor", defaultColor )
					RuiSetBool( rui, "showChargeBarBorderColor", false )
					RuiSetFloat( rui, "chargeBorderSaturation", 1.0 )
					RuiSetFloat( rui, "chargeIconSaturation", 1.0 )
					RuiSetString( rui, "chargeBarTextLeft", "" )
					RuiSetString( rui, "chargeBarTextLeftLong", Localize( "#WPN_SENTINEL_ENERGIZE_HINT" ) )

					RuiSetBool( rui, "showChargeProgressBar", false )

					RuiSetBool( rui, "showChargeIcon", true )
					RuiSetBool( rui, "showChargeIconBG", true )
					RuiSetFloat3( rui, "iconBGColor", defaultColor )

					RuiSetBool( rui, "showChargedAmmoIconOverride", false )
					RuiSetBool( rui, "showChargedAmmoOverride", false )
				}
			}
			                   
			else
			{
				                                                                                                                                     
				if ( !weapon.IsWeaponActivated() )
					return

				RuiSetBool( rui, "showChargeBar", true )
				RuiSetFloat( rui, "chargeBarTimeRemaining", -1.0 )

				consumableName = consumablesRequired > 1 ? file.consumableData.consumableNamePlural : file.consumableData.consumableNameSingular
				RuiSetString( rui, "chargeBarTextLeftLong", Localize( "#WPN_SENTINEL_ENERGIZE_CONSUMABLE_REQUIRED", consumablesRequired, Localize( consumableName ) ) )	                                                                                                               
				
				state = 3
				if ( state != lastState )
				{
					RuiSetBool( rui, "showChargeBarBorder", true )
					RuiSetBool( rui, "showChargeBarBorderColor", false )
					RuiSetFloat( rui, "chargeBorderSaturation", 0.0 )
					RuiSetFloat( rui, "chargeIconSaturation", 0.0 )
					RuiSetString( rui, "chargeBarTextLeft", "" )

					RuiSetBool( rui, "showChargeProgressBar", false )

					RuiSetBool( rui, "showChargeIcon", true )
					RuiSetBool( rui, "showChargeIconBG", true )
					RuiSetFloat3( rui, "iconBGColor", defaultColor )

					RuiSetBool( rui, "showChargedAmmoIconOverride", false )
					RuiSetBool( rui, "showChargedAmmoOverride", false )
				}
			}
		}


		if ( GetCurrentPlaylistVarBool( SENTINEL_SHOW_CROSSHAIR_ENERGIZE_PLAYLIST_VAR, true ) ){
			if ( weapon.HasMod( ENERGIZED_MOD ) )
			{
				RuiSetBool( crosshairRui, "isActive", true )
				RuiSetFloat( crosshairRui, "energizeFrac", max( weapon.GetScriptTime0() - Time(), 0.0 ) / file.energizedDuration )
				RuiSetFloat( crosshairRui, "adsFrac", player.GetZoomFrac() )

				switch ( weapon.w.activeOptic )
				{
					case "":	            
						offset = 0.085
						break
					case "optic_cq_hcog_classic":
						offset = 0.035
						break
					case "optic_cq_holosight":
						offset = 0.055
						break
					case "optic_cq_hcog_bruiser":
						offset = 0.0415
						break
					case "optic_cq_holosight_variable":
						offset = 0.055
						break
					case "optic_ranged_hcog":
						offset = 0.0825
						break
					case "optic_ranged_aog_variable":
						offset = 0.095
						break
					case "optic_sniper":
						offset = 0.135
						break
					case "optic_sniper_variable":
						float offset4x = 0.135
						float offset8x = 0.175
						offset = GraphCapped( weapon.GetWeaponZoomFOV(), 19.8583, 10.0042, offset4x, offset8x )
						break
					case "optic_sniper_threat":
						float offset4x = 0.135
						float offset10x = 0.2
						offset = GraphCapped( weapon.GetWeaponZoomFOV(), 19.8583, 8.01071, offset4x, offset10x )
						break
					default:
						Warning( "Sentinel energize crosshair rui: unhandled optic " + weapon.w.activeOptic + ". Falling back on default offset." )
						offset = 0.05
				}

				RuiSetFloat( crosshairRui, "offset", offset )

				if ( !weapon.IsWeaponActivated() )
					RuiSetBool( crosshairRui, "isActive", false )
			}
			else
			{
				RuiSetBool( crosshairRui, "isActive", false )
			}
		}

		lastTime = Time()
		WaitFrame()
	}
}

void function OnPrimaryWeaponStatusUpdate( entity selectedWeapon, var weaponRui )
{
	if ( !IsValid( selectedWeapon ) )
		return

	entity lastSelectedWeapon = GetLastSelectedPrimaryWeapon()
	if ( IsValid( lastSelectedWeapon ) && lastSelectedWeapon.GetWeaponClassName() == "mp_weapon_sentinel" && selectedWeapon.GetWeaponClassName() == "mp_weapon_sentinel" )
		return

	entity weaponInSlot0 = GetLocalViewPlayer().GetNormalWeapon( WEAPON_INVENTORY_SLOT_PRIMARY_0 )
	entity weaponInSlot1 = GetLocalViewPlayer().GetNormalWeapon( WEAPON_INVENTORY_SLOT_PRIMARY_1 )

	bool fullHUDWeapon = IsTurretWeapon( selectedWeapon )
	fullHUDWeapon = fullHUDWeapon || IsHMGWeapon( selectedWeapon )

	                                                                   
	if ( fullHUDWeapon || ( IsValid( lastSelectedWeapon) && !lastSelectedWeapon.HasMod( ENERGIZED_MOD ) && !selectedWeapon.HasMod( ENERGIZED_MOD ) ) )
	{
		if (IsValid( weaponInSlot0 ))
			weaponInSlot0.Signal( ENERGIZE_STATUS_RUI_ABORT_SIGNAL )

		if (IsValid( weaponInSlot1 ))
			weaponInSlot1.Signal( ENERGIZE_STATUS_RUI_ABORT_SIGNAL )
	}
}

void function AttemptCancelEnergize( entity player )
{
	if ( !IsValid( player ) )
		return

	entity weapon = player.GetActiveWeapon( eActiveInventorySlot.mainHand )
	if ( !IsValid( weapon ) )
		return

	if ( weapon.GetWeaponClassName() != "mp_weapon_sentinel" )
		return

	int customAct = weapon.GetCurrentCustomActivity()
	if ( customAct != ACT_VM_CHARGE_VER4 && customAct != ACT_VM_ONEHANDED_CHARGE )
		return

	Remote_ServerCallFunction( "ClientCallback_CancelEnergize", weapon )
}
#endif         

                                                                                         
  
  	            
  
                                                                                         
#if SERVER
                                                                          
 
	                                                                       

	                         
	 
		                                                                              
		      
	 

	                         
		      

	                             
		      

	                                                         
		      

	                                                                                                                                                      
 	                                                                                                                             
		      

	                                                         
		      

	                                                                               
		                            
 

                                                                           
 
	                         
	 
		                                                                               
		      
	 

	                         
		      

	                             
		      

	                                                         
		      

	                                   
		      

	                                                 
	                                                                              
		      

	                           
 

                                                                  
 
	                         
		      

	                                       
	                         
		      
	                                              

	                                         
	                                                                                                                                                      
	                                                                                                              
		      

	                                                                           
	                     

	                             
 

                                                                
 
	                   
	                             
	                               
	                                               

	           		                                                                                                                                                                           

	              
	 
		                                                                                                                                             
		 
			                        

			                                  
			 
				                                            
			 
		 

		                                                                         
		 
			                        

			                                  
			 
				                                            
			 
		 

		                                                                                    
		 
			                                                                                        
			                               
			                  
				                                                            
		 

		                                                                                              
			                                                           	                                                                                                                                                               

		                  
			                                             

		           
	 
 

                                                                      
 
	                         
		      

	                                                                                                        
		                                                           
 

                                                          
 
	                                  
	                                         

	                              
	                                    
	                              
	                                    

	                                                                            
	                                                                                  
	                                                                            
	                                                                                  

	                 
		                      
	                    
		                         
	                 
		                      
	                    
		                         
 
#endif         

                                                                                         
  
  	            
  
                                                                                         
void function AddEnergize( entity weapon )
{
	weapon.SetWeaponChargeFraction( 1.0 )
	weapon.SetScriptInt0( ScriptChargeFracState.MATCH_ENERGIZE )
	weapon.SetScriptTime0( Time() + file.energizedDuration )
	weapon.SetScriptFlags0( ENERGIZE_FLAGS_CHARGED )
	if ( DEBUG_FLAGS )
		printt( "SERVER SETTING FLAGS 2 ADD ENERGIZE" )
	weapon.AddMod( ENERGIZED_MOD )
}

void function RemoveEnergize( entity weapon )
{
	if ( weapon.GetScriptInt0() == ScriptChargeFracState.MATCH_ENERGIZE || weapon.GetScriptInt0() == ScriptChargeFracState.INCREASE_TO_1 )
		weapon.SetScriptInt0( ScriptChargeFracState.DECREASE_TO_0 )
	else
		weapon.SetScriptInt0( ScriptChargeFracState.OFF )
	weapon.SetScriptTime0( -1.0 )
	if ( weapon.GetScriptFlags0() != ENERGIZE_FLAGS_CHARGING )	                                                                                      
	{
		weapon.SetScriptFlags0( ENERGIZE_FLAGS_OFF )
		if ( DEBUG_FLAGS )
			printt( "SERVER SETTING FLAGS 0 REMOVE ENERGIZE" )
	}
	weapon.RemoveMod( ENERGIZED_MOD )
}

Assert( ScriptChargeFracState._count == 4 )
void function ScriptChargeFracThink( entity weapon, entity player )
{
	AssertIsNewThread()

	player.EndSignal( "OnDeath" )
	weapon.EndSignal( "OnDestroy" )
	weapon.EndSignal( SCRIPT_CHARGE_FRAC_THINK_ABORT_SIGNAL )

	int lastState = 0
	float newFrac = 0.0
	float lastTime = Time()
	float dt = 0.0
	WaitFrame()

	while ( true )
	{
		dt = Time() - lastTime
		lastTime = Time()

		if ( DEBUG_SCRIPT_CHARGE_FRAC )
		{
			string str = IsServer() ? "Server" : "Client"
			printt( "(" + str + ") state: " + weapon.GetScriptInt0() )
		}

		bool serverOrPredicted = IsServer() || (InPrediction() && IsFirstTimePredicted())

		switch ( weapon.GetScriptInt0() )
		{
			case ScriptChargeFracState.OFF:
				if ( serverOrPredicted )
					weapon.SetWeaponChargeFraction( 0.0 )

				if ( lastState == ScriptChargeFracState.INCREASE_TO_1 )
					StopEnergizeFX( weapon, EnergizeFXTime.PRE_ENERGIZE )
				else if ( lastState == ScriptChargeFracState.MATCH_ENERGIZE )
					StopEnergizeFX( weapon, EnergizeFXTime.ENERGIZE )

				break
			case ScriptChargeFracState.INCREASE_TO_1:
				if ( serverOrPredicted )
				{
					newFrac = min( weapon.GetWeaponChargeFraction() + SCRIPT_CHARGE_FRAC_INCREASE_TO_1_SPEED * dt, 1.0 )
					weapon.SetWeaponChargeFraction( newFrac )
				}


				if ( lastState == ScriptChargeFracState.OFF || lastState == ScriptChargeFracState.DECREASE_TO_0 )
					PlayEnergizeFX( weapon, EnergizeFXTime.PRE_ENERGIZE )

				break
			case ScriptChargeFracState.DECREASE_TO_0:
				if ( serverOrPredicted )
				{
					newFrac = max( weapon.GetWeaponChargeFraction() - SCRIPT_CHARGE_FRAC_DECREASE_TO_0_SPEED * dt, 0.0 )
					weapon.SetWeaponChargeFraction( newFrac )
					if ( newFrac <= 0.0 )
						weapon.SetScriptInt0( ScriptChargeFracState.OFF )
				}

				if ( lastState == ScriptChargeFracState.INCREASE_TO_1 )
					StopEnergizeFX( weapon, EnergizeFXTime.PRE_ENERGIZE )
				else if ( lastState == ScriptChargeFracState.MATCH_ENERGIZE )
				{
					StopEnergizeFX( weapon, EnergizeFXTime.ENERGIZE )
					PlayEnergizeFX( weapon, EnergizeFXTime.END_ENERGIZE )
				}

				break
			case ScriptChargeFracState.MATCH_ENERGIZE:
				if ( serverOrPredicted )
				{
					float energizeFrac = max( weapon.GetScriptTime0() - Time(), 0 ) / file.energizedDuration
					float targetFrac = GraphCapped( energizeFrac, 0.0, 1.0, SCRIPT_CHARGE_FRAC_MATCH_ENERGIZE_MIN, 1.0 )
					float curFrac = weapon.GetWeaponChargeFraction()
					newFrac = targetFrac < curFrac ? max( curFrac - SCRIPT_CHARGE_FRAC_MATCH_ENERGIZE_SPEED_MAX * dt, targetFrac ) : targetFrac
					weapon.SetWeaponChargeFraction( newFrac )
				}

				if ( lastState == ScriptChargeFracState.INCREASE_TO_1 )
					StopEnergizeFX( weapon, EnergizeFXTime.PRE_ENERGIZE )
				if ( lastState != ScriptChargeFracState.MATCH_ENERGIZE )
					PlayEnergizeFX( weapon, EnergizeFXTime.ENERGIZE )
				break
			default:
				Assert( false, "Invalid script charge frac state: " + weapon.GetScriptInt0() )
		}

		lastState = weapon.GetScriptInt0()

		WaitFrame()
	}
}

void function PlayEnergizeFX( entity weapon, int energizeTime, bool play3p = true, bool playInFullscreenScope = false )
{
	if ( !IsValid( weapon ) )
	{
		Warning( "Sentinel PlayEnergizeFX called with invalid weapon" )
		return
	}

	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) || !IsAlive( player ) )
		return

	if ( ShouldShowADSScopeView( weapon ) && !playInFullscreenScope )
		return

	entity vm = weapon.GetWeaponViewmodel()

	string debug = ""
	string baseStr = ""
	switch ( energizeTime )
	{
		case EnergizeFXTime.PRE_ENERGIZE:
			debug = " PLAY PRE ENERGIZE FX"
			baseStr = "pre_"
			break
		case EnergizeFXTime.ENERGIZE:
			debug = " PLAY ENERGIZE FX"
			break
		case EnergizeFXTime.END_ENERGIZE:
			debug = " PLAY END ENERGIZE FX"
			baseStr = "end_"
			break
	}
	baseStr += "energize_effect"

	string serverClient = IsServer() ? "(SERVER)" : "(CLIENT)"
	if ( DEBUG_EFFECTS_TRIGGERS )
		printt( serverClient + debug )

	for ( int i = 0; i < MAX_ENERGIZE_FX; i++ )
	{
		string str = baseStr + string( i )
		asset fx1p = weapon.GetWeaponInfoFileKeyFieldAsset( str + "_1p" )
		asset fx3p = weapon.GetWeaponInfoFileKeyFieldAsset( str + "_3p" )
		if ( fx1p == "" && fx3p == "" )
			continue
		if ( fx1p == "" && !play3p )
			continue

		if ( fx3p == "" && !IsValid( vm ) )
			continue

		var attachRaw = weapon.GetWeaponInfoFileKeyField( str + "_attachment" )
		var attachScopedRaw = weapon.GetWeaponInfoFileKeyField( str + "_attachment_scoped" )
		if ( attachRaw == null && attachScopedRaw == null )
		{
			Warning( "Sentinel energize FX: " + str + " has no _attachment or _attachment_scoped setting -- skipping" )
			continue
		}

		string attachUnscoped = ""
		if ( attachRaw != null )
			attachUnscoped = expect string( attachRaw )

		string attachScoped = ""
		if ( attachScopedRaw != null )
			attachScoped = expect string( attachScopedRaw )

		                                                         
		#if CLIENT
			bool useScopedAttach = attachScoped != "" && IsValid( player ) && IsLocalViewPlayer( player ) && ShouldShowADSScopeView( weapon )
		#endif
		#if SERVER
			                            
		#endif
		if ( !useScopedAttach && attachUnscoped == "" )
		{
			Warning( "Sentinel energize FX: " + str + " is not set to use scoped attachment and it has no _attachmnet setting -- skipping" )
			continue
		}

		string attach = useScopedAttach ? attachScoped : attachUnscoped

		if ( play3p )
			weapon.PlayWeaponEffectNoCull( fx1p, fx3p, attach, true, FX_PATTACH_WEAPON_CHARGE_FRACTION )
		else
			weapon.PlayWeaponEffectNoCull( fx1p, $"", attach, true, FX_PATTACH_WEAPON_CHARGE_FRACTION )

		if ( DEBUG_EFFECTS_TRIGGERS )
			printt( serverClient + " PLAY: 1p: " + fx1p + " 3p: "  + fx3p + " attach: " + attach )
	}
}

void function StopEnergizeFX( entity weapon, int energizeTime, bool stop3p = true )
{
	if ( !IsValid( weapon ) )
	{
		Warning( "Sentinel StopEnergizeFX called with invalid weapon" )
		return
	}

	entity vm = weapon.GetWeaponViewmodel()

	string debug = ""
	string baseStr = ""
	switch ( energizeTime )
	{
		case EnergizeFXTime.PRE_ENERGIZE:
			debug = " STOP PRE ENERGIZE FX"
			baseStr = "pre_"
			break
		case EnergizeFXTime.ENERGIZE:
			debug = " STOP ENERGIZE FX"
			break
		case EnergizeFXTime.END_ENERGIZE:
			debug = " STOP END ENERGIZE FX"
			baseStr = "end_"
			break
	}
	baseStr += "energize_effect"

	string serverClient = IsServer() ? "(SERVER)" : "(CLIENT)"
	if ( DEBUG_EFFECTS_TRIGGERS )
		printt( serverClient + debug )

	for ( int i = 0; i < MAX_ENERGIZE_FX; i++ )
	{
		string str = baseStr + string( i )
		asset fx1p = weapon.GetWeaponInfoFileKeyFieldAsset( str + "_1p" )
		asset fx3p = weapon.GetWeaponInfoFileKeyFieldAsset( str + "_3p" )
		if ( fx1p == "" && fx3p == "" )
			continue
		if ( fx1p == "" && !stop3p )
			continue

		if ( fx3p == "" && !IsValid( vm ) )
			continue

		if ( stop3p )
			weapon.StopWeaponEffect( fx1p, fx3p )
		else
			weapon.StopWeaponEffect( fx1p, $"" )

		if ( DEBUG_EFFECTS_TRIGGERS )
			printt( serverClient + " STOP: 1p: " + fx1p + " 3p: "  + fx3p )
	}
}

void function StartEnergizeFXOnScopeZoomOut( entity weapon, entity player )
{
	AssertIsNewThread()
	player.EndSignal( "OnDeath" )
	weapon.EndSignal( "OnDestroy" )
	weapon.EndSignal( ENERGIZE_FX_ON_SCOPE_ZOOM_ABORT_SIGNAL )

	float safetyAbortTime = Time() + 5.0
	while ( Time() < safetyAbortTime )
	{
		if ( player.GetZoomFrac() < weapon.GetWeaponSettingFloat( eWeaponVar.ads_fov_zoomfrac_end ) )
		{
			PlayEnergizeFX( weapon, EnergizeFXTime.ENERGIZE, false )
			return
		}

		WaitFrame()
	}
}

void function StopEnergizeFXOnScopeZoomIn( entity weapon, entity player )
{
	AssertIsNewThread()
	player.EndSignal( "OnDeath" )
	weapon.EndSignal( "OnDestroy" )
	weapon.EndSignal( ENERGIZE_FX_ON_SCOPE_ZOOM_ABORT_SIGNAL )

	float safetyAbortTime = Time() + 5.0
	while ( Time() < safetyAbortTime )
	{
		if ( !GetConVarBool("enable_code_weapon_energize") && player.GetZoomFrac() > (weapon.GetWeaponSettingFloat( eWeaponVar.ads_fov_zoomfrac_end ) - 0.1) )
		{
			StopEnergizeFX( weapon, EnergizeFXTime.PRE_ENERGIZE, false )
			StopEnergizeFX( weapon, EnergizeFXTime.ENERGIZE, false )
			StopEnergizeFX( weapon, EnergizeFXTime.END_ENERGIZE, false )
			return
		}

		WaitFrame()
	}
}