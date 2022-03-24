                         
                                                                                                                                                                                                                 
                                                                                                                                                                                                      
global function MpWeaponDragon_LMG_Init

#if CLIENT
global function Weapon_Dragon_LMG_TryApplyEnergized
global function OnClientAnimEvent_Thermite_Energized
#endif         

global function OnWeaponActivate_weapon_dragon_lmg
global function OnWeaponDeactivate_weapon_dragon_lmg
global function OnWeaponPrimaryAttack_weapon_dragon_lmg
global function OnWeaponCustomActivityStart_weapon_dragon_lmg
global function OnWeaponCustomActivityEnd_weapon_dragon_lmg
global function OnWeaponEnergizedStart_weapon_dragon_lmg
global function OnWeaponStartEnergizing_weapon_dragon_lmg
global function OnWeaponEnergizedEnd_weapon_dragon_lmg

#if SERVER
                                                     
                                                         
                                                      
#endif         

global const string CMDNAME_DRAGON_LMG_THERMITE_CHARGE = "ClientCallback_ChargeDragonLMGThermite"

const bool DRAGON_LMG_DEBUG = false
const bool DEBUG_FREE_ENERGIZE = false

const string CLIENT_THERMITE_ENERGIZED = "client_thermite_energized"
const string CLIENT_THERMITE_ENERGIZE_START = "client_start_thermite_energize"

global const string DRAGON_LMG_ENERGIZED_MOD = "energized"

const string DRAGON_CLASS_NAME = "mp_weapon_dragon_lmg"

const string SENTINEL_SHOW_CROSSHAIR_ENERGIZE_PLAYLIST_VAR = "sentinel_show_crosshair_energize_status"
const string DRAGON_THERMITE_ENERGIZE_ACTIVITY = "ACT_VM_CHARGE_VER4"                                                                                                 
const string ENERGIZE_DISPLAY_ABORT_SIGNAL = "DragonLMGEnergizeRuiDestroy"
const string ENERGIZE_DRAGON_THERMITE_DEPLEATED = "ThermiteEnergizeDepleated"

const string CHARGING_SOUND_3P = "weapon_rampage_thermite_charge_3p"
const string CHARGE_END_SOUND_FP = "weapon_rampage_lmg_charge_end_1p"
const string CHARGE_END_SOUND_SHOOTING_FP = "weapon_rampage_lmg_charge_end_shooting_1p"
const string CHARGE_END_SOUND_3P = "weapon_rampage_lmg_charge_end_3p"
const string EQUIPPED_WHILE_CHARGED = "weapon_rampage_thermite_charge_04_equip"

const asset EFFECT_ENHANCED_MODE_FP = $"P_drg_ignited_amb_FP"
const asset EFFECT_ENHANCED_MODE_3P = $"P_drg_ignited_amb_3P"

const asset EFFECT_CHAMBER_OPENING_FP = $"P_rampage_chamber_opening"

const asset EFFECT_ENHANCED_MODE_SHOOTING_FP = $"P_Exhaust_drg_ignited_FP"
const asset EFFECT_ENHANCED_MODE_SHOOTING_3P = $"P_Exhaust_drg_ignited_3P"

const float ENERGIZE_STATUS_EFFECT_SLOW_INTENSITY = 0.15

const int ENERGIZE_ACTIVITY_FLAGS = WCAF_ISINTERRUPTIBLE | WCAF_INTERRUPTIBLE_ALLOW_START_WHILE_SPRINTING | WCAF_INTERRUPTIBLE_ALLOW_JUMP_LAND | WCAF_INTERRUPTIBLE_ALLOW_WHILE_SPRINTING | WCAF_KEEPMELEESTATE
const int ENERGIZE_FLAGS_OFF = 0
const int ENERGIZE_FLAGS_CHARGING = 1
const int ENERGIZE_FLAGS_CHARGED = 2

const vector ENERGIZED_UI_COLOR = <255, 0, 4> / 255.0
const vector ENERGIZED_UI_LEFT_BAR_COLOR = <255, 157, 30> / 255.0
const vector DEFAULT_UI_COLOR = <130, 130, 130> / 255.0

const asset ENERGIZED_CROSSHAIR_RUI = $"ui/crosshair_energize_status_sentinel.rpak"
const asset AMMO_ENERGIZED_ICON = $"rui/hud/gametype_icons/survival/sur_ammo_heavy_charged"
const asset ENERGIZE_UI_CONSUMABLE_ICON = $"rui/ordnance_icons/grenade_incendiary"
const asset FX_FIRE = $"P_fire_med_FULL"

struct ConsumableData
{
	string ref
	string consumableName
	asset hudIcon
	int consumableType
}

struct
{
	ConsumableData&    consumableData
	float              energizedDuration
	float              energizedTimeConsumedPerShot
	float              energizeActivityTime
} file

                                                                                                                       
              
                                                                                                                       
void function MpWeaponDragon_LMG_Init()
{
	if ( DRAGON_LMG_DEBUG )
		printt("MpWeaponDragon_LMG_Init")

	PrecacheWeapon( DRAGON_CLASS_NAME )
	PrecacheParticleSystem( EFFECT_ENHANCED_MODE_FP )
	PrecacheParticleSystem( EFFECT_ENHANCED_MODE_3P )
	PrecacheParticleSystem( EFFECT_ENHANCED_MODE_SHOOTING_FP )
	PrecacheParticleSystem( EFFECT_ENHANCED_MODE_SHOOTING_3P )
	PrecacheParticleSystem( EFFECT_CHAMBER_OPENING_FP )

	Remote_RegisterServerFunction( CMDNAME_DRAGON_LMG_THERMITE_CHARGE, "entity" )

	RegisterSignal( ENERGIZE_DRAGON_THERMITE_DEPLEATED )
	RegisterSignal( ENERGIZE_DISPLAY_ABORT_SIGNAL )
	RegisterSignal( ENERGIZE_STATUS_RUI_ABORT_SIGNAL )

	PrecacheParticleSystem( FX_FIRE )

	#if CLIENT
		if ( !GetConVarBool( "enable_code_weapon_energize" ) )
			AddCallback_OnPrimaryWeaponStatusUpdate( OnPrimaryWeaponStatusUpdate )
	#endif

	ConsumableData thermiteData
	thermiteData.ref = "mp_weapon_thermite_grenade"
	thermiteData.consumableName = "#WPN_THERMITE_GRENADE"
	thermiteData.hudIcon = $"rui/ordnance_icons/grenade_incendiary"
	file.consumableData = thermiteData
}

                                                                                                                       
                
                                                                                                                       
void function OnWeaponActivate_weapon_dragon_lmg( entity weapon )
{
	if ( DRAGON_LMG_DEBUG )
		printt("OnWeaponActivate_weapon_dragon_lmg")
	                                                                             
	file.energizedDuration = GetWeaponInfoFileKeyField_GlobalFloat( "mp_weapon_dragon_lmg", "energized_duration" )
	file.energizedTimeConsumedPerShot = GetWeaponInfoFileKeyField_GlobalFloat( "mp_weapon_dragon_lmg", "energized_time_consumed_per_shot" )
	file.energizeActivityTime = GetWeaponInfoFileKeyField_GlobalFloat( "mp_weapon_dragon_lmg", "energize_activity_time" )

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

			if( GetConVarBool( "enable_code_weapon_energize" ) )
				thread UpdateWeaponEnergizeRui( player, weapon, ENERGIZED_CROSSHAIR_RUI, ENERGIZE_UI_CONSUMABLE_ICON, AMMO_ENERGIZED_ICON )
			else
				thread EnergizeRuiThink( player, weapon )
		}

		if ( weapon.HasMod( DRAGON_LMG_ENERGIZED_MOD ) )
		{
			if( !GetConVarBool( "enable_code_weapon_energize" ) )
				Start_Charge_vfx( weapon )
			weapon.EmitWeaponSound_1p3p( EQUIPPED_WHILE_CHARGED, $"" )
		}
		else
			weapon.kv.rendercolor = "0 0 0"
	#endif
}

void function OnWeaponDeactivate_weapon_dragon_lmg( entity weapon )
{
	                                         
	                                                                                 

	                               
		      

	                                                                    
	 
		                                                 
		                                                
		                                                                           
	   
}

var function OnWeaponPrimaryAttack_weapon_dragon_lmg( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	if ( DRAGON_LMG_DEBUG )
		printt("OnWeaponPrimaryAttack_weapon_dragon_lmg")

	weapon.FireWeapon_Default( attackParams.pos, attackParams.dir, 1.0, 1.0, false )

	int ammoPerShot = weapon.GetWeaponSettingInt( eWeaponVar.ammo_per_shot )

	if ( weapon.HasMod( DRAGON_LMG_ENERGIZED_MOD ) && !GetConVarBool("enable_code_weapon_energize") )
	{
		weapon.PlayWeaponEffect ( EFFECT_ENHANCED_MODE_SHOOTING_FP, EFFECT_ENHANCED_MODE_SHOOTING_3P, "muzzle_flash" )

		#if SERVER
			                                                                                      
			                                   
				                        
			    
				                                           
		#endif
	}

	return ammoPerShot
}

void function OnWeaponCustomActivityStart_weapon_dragon_lmg ( entity weapon )
{
	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) )
		return

	weapon.SetScriptFlags0( ENERGIZE_FLAGS_CHARGING )
	foreach ( effect in weapon.w.statusEffects )
		StatusEffect_Stop( player, effect )
	weapon.w.statusEffects.append( StatusEffect_AddEndless( player, eStatusEffect.move_slow, ENERGIZE_STATUS_EFFECT_SLOW_INTENSITY ) )
}

void function OnWeaponCustomActivityEnd_weapon_dragon_lmg( entity weapon, int activity )
{
	if ( !IsValid( weapon ) )
		return

	if ( IsClient() && (!InPrediction() || !IsFirstTimePredicted()) )
		return

	if ( DRAGON_LMG_DEBUG )
		printt("OnWeaponCustomActivityEnd_weapon_dragon_lmg")

	Charge_Cancel_Stop_Effects( weapon )

	#if SERVER
		                                                          
		 
			                                                                                                   
			                               
		 
	#endif

	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) )
		return

	foreach ( effect in weapon.w.statusEffects )
		StatusEffect_Stop( player, effect )
}

void function OnWeaponStartEnergizing_weapon_dragon_lmg( entity weapon, entity player )
{
	weapon.PlayWeaponEffectNoCull ( EFFECT_CHAMBER_OPENING_FP, $"", "muzzle_flash" )
}

void function OnWeaponEnergizedStart_weapon_dragon_lmg( entity weapon, entity player )
{
	OnWeaponEnergizedStart( weapon, player )
	weapon.AddMod ( "has_been_energized" )
#if CLIENT
	SetEnableEmission( weapon, true )
#endif

	#if SERVER
	                                               
		                                                                                   

	                                              
	                                                                                                   
	                                            
	#endif
}

void function OnWeaponEnergizedEnd_weapon_dragon_lmg( entity weapon, entity player )
{
	#if SERVER
	                                                                                   
	#endif

#if CLIENT
	Stop_Thermite_Effects( weapon )
	SetEnableEmission( weapon, false )
#endif
}

                                                                                                                       
                
                                                                                                                       
#if CLIENT
void function Weapon_Dragon_LMG_TryApplyEnergized( entity player, entity weapon )
{
	if ( !IsValid( player ) || !IsValid( weapon ) )
		return

	if ( weapon.GetWeaponClassName() != DRAGON_CLASS_NAME )
		return

	int flags = -1
	flags = weapon.GetScriptFlags0()

	if ( flags == ENERGIZE_FLAGS_CHARGING )
		return

	if ( weapon.HasMod( DRAGON_LMG_ENERGIZED_MOD ))
		return

	if ( player.IsSwitching( 0 ) )	                           
		return

	int thermiteCount = SURVIVAL_CountItemsInInventory( player, file.consumableData.ref )
	if ( thermiteCount <= 0 )
	{
		AnnouncementMessageRight( player, Localize( "#WPN_DRAGON_LMG_ENERGIZE_CONSUMABLE_REQUIRED", Localize( file.consumableData.consumableName ) ) )
		Quickchat( player, eCommsAction.INVENTORY_NEED_THERMITE )
		return
	}

	Remote_ServerCallFunction( CMDNAME_DRAGON_LMG_THERMITE_CHARGE, weapon )
}

void function OnClientAnimEvent_Thermite_Energized( entity weapon, string name )
{
	GlobalClientEventHandler( weapon, name )

	entity player = weapon.GetWeaponOwner()

	if (!IsValid( player ) )
		return

	if (!IsLocalViewPlayer( player ) )
		return

	                               
	if ( name == CLIENT_THERMITE_ENERGIZED )
	{
		Start_Charge_vfx( weapon )
	}

	if ( name == CLIENT_THERMITE_ENERGIZE_START )
		weapon.PlayWeaponEffectNoCull ( EFFECT_CHAMBER_OPENING_FP, $"", "muzzle_flash" )
}

void function Stop_Thermite_Effects ( entity weapon )
{
	                               
	entity player = weapon.GetWeaponOwner()

	if (!IsValid( player ) )
		return

	if (!IsLocalViewPlayer( player ) )
		return

	if ( weapon.IsReadyToFire() )
		weapon.EmitWeaponSound_1p3p( CHARGE_END_SOUND_FP, $"" )
	else
		weapon.EmitWeaponSound_1p3p( CHARGE_END_SOUND_SHOOTING_FP, $"" )

	weapon.StopWeaponSound( "weapon_rampage_lmg_firstshot_1p_alt" )
	weapon.StopWeaponSound( "weapon_rampage_lmg_loop_1p_alt" )
	weapon.StopWeaponEffect( EFFECT_ENHANCED_MODE_FP, EFFECT_ENHANCED_MODE_3P )
}

void function SetEnableEmission( entity weapon, bool enable )
{
	if( enable )
		weapon.kv.rendercolor = "255 255 255"
	else
		weapon.kv.rendercolor = "0 0 0"

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

	vector shieldBatteryLeftBarColor = energizedLeftBarColor                                                                        
	const float COLOR_ADD = 0.2
	vector shieldBatteryColor = energizedColor                                                                                                                                                        

	RuiSetImage( rui, "chargeIcon", $"rui/ordnance_icons/grenade_incendiary" )
	RuiSetImage( rui, "chargedAmmoIconOverride", AMMO_ENERGIZED_ICON )
	RuiSetFloat3( rui, "chargedAmmoOverrideColor", energizedLeftBarColor )

	RuiSetBool( crosshairRui, "isActive", false )
	RuiSetFloat3( crosshairRui, "energizeColor", energizedColor )
	RuiSetFloat3( crosshairRui, "energizedLeftBarColor", energizedLeftBarColor )

	float energizingStartTime = -1.0
	float curEnergizingTime = -1.0

	float offset = 0.05
	float width = 100
	float lastTime = Time()

	int flags = -1
	float scriptFloat0 = 0.0

	int state = -1
	int lastState = -1
	bool wasActive = false
	while ( true )
	{
		{
			lastState = state
			flags = weapon.GetScriptFlags0()
			scriptFloat0 = weapon.GetScriptFloat0()

			             
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
					RuiSetString( rui, "chargeBarTextLeft", Localize( "#WPN_DRAGON_LMG_ENERGIZING_LABEL" ) )
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
			                 
			else if ( weapon.HasMod( DRAGON_LMG_ENERGIZED_MOD ) )
			{
				RuiSetBool( rui, "showChargeBar", true )

				state = 1
				wasActive = true
				if ( state != lastState )
				{
					RuiSetBool( rui, "showChargeBarBorder", true )
					RuiSetBool( rui, "showChargeBarBorderColor", true )
					RuiSetFloat( rui, "chargeBorderSaturation", 1.0 )
					RuiSetFloat( rui, "chargeIconSaturation", 1.0 )
					RuiSetFloat3( rui, "chargeBarBorderOverlayColor", energizedLeftBarColor )
					RuiSetString( rui, "chargeBarTextLeft", Localize( "#WPN_DRAGON_LMG_ENERGIZE_LABEL" ) )
					RuiSetString( rui, "chargeBarTextLeftLong", "" )
					RuiSetFloat( rui, "chargeBarTimeRemaining", -1.0 )

					RuiSetBool( rui, "showChargeProgressBar", true )
					RuiSetFloat3( rui, "chargeBarColorRight", energizedColor )
					RuiSetFloat3( rui, "chargeBarColorLeft", energizedLeftBarColor )
					RuiSetFloat3( rui, "chargeBGcolor", energizedColor )

					RuiSetBool( rui, "showChargeIcon", true )
					RuiSetBool( rui, "showChargeIconBG", true )
					RuiSetFloat3( rui, "iconBGColor", energizedColor )

					RuiSetBool( rui, "showChargedAmmoIconOverride", true )
					RuiSetBool( rui, "showChargedAmmoOverride", true )
				}

				RuiSetFloat( rui, "chargeBarFrac", scriptFloat0 )
			}
			                                    
			else if ( DEBUG_FREE_ENERGIZE || SURVIVAL_CountItemsInInventory( player, file.consumableData.ref ) > 0 )
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
					RuiSetFloat( rui, "chargeBorderSaturation", 1.0 )
					RuiSetFloat( rui, "chargeIconSaturation", 1.0 )
					RuiSetBool( rui, "showChargeBarBorderColor", false )
					RuiSetString( rui, "chargeBarTextLeft", Localize( "#WPN_DRAGON_LMG_ENERGIZE_HINT" ) )
					RuiSetString( rui, "chargeBarTextLeftLong", "" )

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
				if ( SURVIVAL_CountItemsInInventory( player, file.consumableData.ref ) <= 0  )

				                                                                                                                                                   
				if ( !weapon.IsWeaponActivated() )
					return

				RuiSetBool( rui, "showChargeBar", true )
				RuiSetFloat( rui, "chargeBarTimeRemaining", -1.0 )
				RuiSetString( rui, "chargeBarTextLeftLong", Localize( "#WPN_DRAGON_LMG_ENERGIZE_CONSUMABLE_REQUIRED", Localize( file.consumableData.consumableName ) ) )

				state = 3
				if ( state != lastState )
					RuiSetBool( rui, "showChargeBar", false )
					RuiSetBool( rui, "showChargeBarBorder", true )
					RuiSetFloat( rui, "chargeBorderSaturation", 0.0 )
					RuiSetFloat( rui, "chargeIconSaturation", 0.0 )
					RuiSetBool( rui, "showChargeBarBorderColor", false )
					RuiSetString( rui, "chargeBarTextLeft", "" )

					RuiSetBool( rui, "showChargeProgressBar", false )

					RuiSetBool( rui, "showChargeIcon", true )
					RuiSetBool( rui, "showChargeIconBG", true )
					RuiSetFloat3( rui, "iconBGColor", defaultColor )

					RuiSetBool( rui, "showChargedAmmoIconOverride", false )
					RuiSetBool( rui, "showChargedAmmoOverride", false )
			}
		}

		if ( weapon.HasMod( DRAGON_LMG_ENERGIZED_MOD ) )
		{
			RuiSetBool( crosshairRui, "isActive", true )
			RuiSetFloat( crosshairRui, "energizeFrac", scriptFloat0 )
			RuiSetFloat( crosshairRui, "adsFrac", player.GetZoomFrac() )

			weapon.kv.rendercolor = "255 255 255"

			switch ( weapon.w.activeOptic )
			{
				case "":	            
				offset = 0.065
				break
				case "optic_cq_hcog_classic":
					offset = 0.035
					break
				case "optic_cq_holosight":
					offset = 0.055
					break
				case "optic_cq_hcog_bruiser":
					offset = 0.055
					break
				case "optic_cq_holosight_variable":
					offset = 0.055
					break
				case "optic_ranged_hcog":
					offset = 0.085
					break
				case "optic_ranged_aog_variable":
					offset = 0.085
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
			weapon.kv.rendercolor = "0 0 0"

			if ( wasActive )
			{
				                           
				wasActive = false
				Stop_Thermite_Effects( weapon )
			}
			
			RuiSetBool( crosshairRui, "isActive", false )
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

	if ( IsValid( lastSelectedWeapon ) && lastSelectedWeapon.GetWeaponClassName() == "mp_weapon_dragon_lmg" && selectedWeapon.GetWeaponClassName() == "mp_weapon_dragon_lmg" )
		return

	entity weaponInSlot0 = GetLocalViewPlayer().GetNormalWeapon( WEAPON_INVENTORY_SLOT_PRIMARY_0 )
	entity weaponInSlot1 = GetLocalViewPlayer().GetNormalWeapon( WEAPON_INVENTORY_SLOT_PRIMARY_1 )

	bool fullHUDWeapon = IsTurretWeapon( selectedWeapon )
	fullHUDWeapon = fullHUDWeapon || IsHMGWeapon( selectedWeapon )

	                                                                                             
	if ( fullHUDWeapon || ( IsValid( lastSelectedWeapon ) && !lastSelectedWeapon.HasMod( DRAGON_LMG_ENERGIZED_MOD ) && !selectedWeapon.HasMod( DRAGON_LMG_ENERGIZED_MOD ) ) )
	{
		if ( IsValid( weaponInSlot0 ) )
			weaponInSlot0.Signal( ENERGIZE_STATUS_RUI_ABORT_SIGNAL )

		if ( IsValid( weaponInSlot1 ) )
			weaponInSlot1.Signal( ENERGIZE_STATUS_RUI_ABORT_SIGNAL )
	}
}
#endif         


                                                                                                                       
                        
                                                                                                                       
#if SERVER
                                                                                    
 
	       
		                       
		 
			                                               
		 
	            

	                         
	 
		                                                                                       
		      
	 

	                                                                                     
	                       
		                                           

	                         
		      

	                         
		      

	                             
		      

	                                                       
		      

	                                                                                               
		                                                 

 
#endif         

                                                                                                                       
                
                                                                                                                       
#if SERVER
                                                                        
 
	                         
		      

	                                                     
 

                                                                    
 
	                       
		                                               

	                         
		      

	                                       
	                         
		      
	                                              

	                                         
	                                                              
		      

	                                                      
	                                       
	                                                                        
	                     

 

                                                                
 
	                   
	                             
	                               

	                                                                                                                                                                                       

	              
	 

		                                                                                          
		                                      

		                                                  

		                                                                       
		 
				                        

				                                                                                                                         
				                                  
					      
		 

		                                                 
		                                                                                                                                     
		 
			                                                                                                   
			                               
		 

		           
	 
 
#endif         

                                                                                                                       
                
                                                                                                                       
void function AddEnergize( entity weapon )
{
	weapon.SetScriptTime0( Time() + file.energizedDuration )
	if ( DRAGON_LMG_DEBUG )
		printt( "SERVER SETTING FLAGS 2 ADD ENERGIZE" )
	weapon.AddMod( DRAGON_LMG_ENERGIZED_MOD )
	weapon.AddMod ( "has_been_energized" )
}

void function RemoveEnergize( entity weapon )
{
	weapon.SetScriptTime0( -1.0 )
	weapon.EmitWeaponSound_1p3p( $"", CHARGE_END_SOUND_3P )
	weapon.StopWeaponEffect( $"", EFFECT_ENHANCED_MODE_3P )
	weapon.RemoveMod( DRAGON_LMG_ENERGIZED_MOD )
}

void function Start_Charge_vfx ( entity weapon )
{
	weapon.PlayWeaponEffectNoCull ( EFFECT_ENHANCED_MODE_FP, $"", "muzzle_flash" )
}

void function Charge_Cancel_Stop_Effects ( entity weapon )
{
	entity player = weapon.GetWeaponOwner()

	if (!IsValid( player ) )
		return
	if ( !weapon.HasMod( DRAGON_LMG_ENERGIZED_MOD ) )
	{
		weapon.StopWeaponSound( CHARGING_SOUND_3P )
		weapon.StopWeaponEffect( EFFECT_ENHANCED_MODE_FP, EFFECT_ENHANCED_MODE_3P )
		weapon.StopWeaponEffect( EFFECT_CHAMBER_OPENING_FP, $"" )
	}
}
                              
