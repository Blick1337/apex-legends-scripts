global function MeleeValkyrieSpear_Init
global function OnWeaponActivate_melee_valkyrie_spear
global function OnWeaponDeactivate_melee_valkyrie_spear

const VALK_FX_ATTACK_SWIPE_TOP_FP = $"P_valk_spear_swipe_FP"
const VALK_FX_ATTACK_SWIPE_TOP_3P = $"P_valk_spear_swipe_3P"                           
const VALK_FX_ATTACK_SWIPE_FP = $"P_valk_spear_swipe_FP"
const VALK_FX_ATTACK_SWIPE_3P = $"P_crypto_sword_swipe_3P"                                                        

const VALK_FX_ATTACK_THRUST_FP = $"P_valk_spear_thrust_FP"
const VALK_FX_ATTACK_THRUST_3P = $"P_crypto_sword_swipe_top_3P"                           

const VALK_FX_ATTACK_BURST_FP = $"P_valk_spear_thruster_burst"
const VALK_FX_ATTACK_BURST_3P = $"P_valk_spear_thruster_burst_3P"

const asset VALK_FX_ATTACK_DLIGHT_FP = $"P_valk_spear_thruster_burst_dlight"
const asset VALK_FX_ATTACK_DLIGHT_3P = $"P_valk_spear_thruster_burst_dlight_3P"

const asset VALK_IDLE_EXHAUST_FP = $"P_valk_spear_thruster_idle"
const asset VALK_IDLE_EXHAUST_3P = $"P_valk_spear_thruster_idle_3P"

void function MeleeValkyrieSpear_Init()
{
	PrecacheParticleSystem( VALK_FX_ATTACK_SWIPE_FP )
	PrecacheParticleSystem( VALK_FX_ATTACK_SWIPE_3P )
	PrecacheParticleSystem( VALK_FX_ATTACK_SWIPE_TOP_FP )
	PrecacheParticleSystem( VALK_FX_ATTACK_SWIPE_TOP_3P )
	PrecacheParticleSystem( VALK_FX_ATTACK_BURST_FP )
	PrecacheParticleSystem( VALK_FX_ATTACK_BURST_3P )
	PrecacheParticleSystem( VALK_FX_ATTACK_THRUST_FP )
	PrecacheParticleSystem( VALK_FX_ATTACK_THRUST_3P )

	PrecacheParticleSystem( VALK_IDLE_EXHAUST_FP )
	PrecacheParticleSystem( VALK_IDLE_EXHAUST_3P )

	PrecacheParticleSystem( VALK_FX_ATTACK_DLIGHT_FP )
	PrecacheParticleSystem( VALK_FX_ATTACK_DLIGHT_3P )

	PrecacheImpactEffectTable( "melee_spear_blunt" )
}

                                                                              
                                                          
void function OnWeaponActivate_melee_valkyrie_spear( entity weapon )
{
	                                            
	weapon.PlayWeaponEffect( VALK_FX_ATTACK_BURST_FP, VALK_FX_ATTACK_BURST_3P, "fx_l_thruster_top" )
	weapon.PlayWeaponEffect( VALK_FX_ATTACK_BURST_FP, VALK_FX_ATTACK_BURST_3P, "fx_l_thruster_bot" )
	weapon.PlayWeaponEffect( VALK_FX_ATTACK_BURST_FP, VALK_FX_ATTACK_BURST_3P, "fx_r_thruster_top" )
	weapon.PlayWeaponEffect( VALK_FX_ATTACK_BURST_FP, VALK_FX_ATTACK_BURST_3P, "fx_r_thruster_bot" )

	weapon.PlayWeaponEffect( VALK_IDLE_EXHAUST_FP, VALK_IDLE_EXHAUST_3P, "fx_l_thruster_top" , true )
	weapon.PlayWeaponEffect( VALK_IDLE_EXHAUST_FP, VALK_IDLE_EXHAUST_3P, "fx_l_thruster_bot" , true )
	weapon.PlayWeaponEffect( VALK_IDLE_EXHAUST_FP, VALK_IDLE_EXHAUST_3P, "fx_r_thruster_top" , true )
	weapon.PlayWeaponEffect( VALK_IDLE_EXHAUST_FP, VALK_IDLE_EXHAUST_3P, "fx_r_thruster_bot" , true )


	                                                                                            

	                                                                                                 
	                                                                                                 

	weapon.PlayWeaponEffect( VALK_FX_ATTACK_SWIPE_FP, VALK_FX_ATTACK_SWIPE_TOP_3P, "fx_l_thruster_bot" )
	weapon.PlayWeaponEffect( VALK_FX_ATTACK_SWIPE_FP, VALK_FX_ATTACK_SWIPE_TOP_3P, "fx_r_thruster_bot" )

	weapon.PlayWeaponEffect( VALK_FX_ATTACK_DLIGHT_FP, VALK_FX_ATTACK_DLIGHT_3P, "fx_r_thruster_bot" )
}

void function OnWeaponDeactivate_melee_valkyrie_spear( entity weapon )
{
	                                              
	weapon.StopWeaponEffect( VALK_FX_ATTACK_SWIPE_FP, VALK_FX_ATTACK_SWIPE_3P )
	                                                                               
	weapon.StopWeaponEffect( VALK_FX_ATTACK_BURST_FP, VALK_FX_ATTACK_BURST_3P )
	weapon.StopWeaponEffect( VALK_FX_ATTACK_SWIPE_TOP_FP, VALK_FX_ATTACK_SWIPE_TOP_3P )

	weapon.StopWeaponEffect( VALK_FX_ATTACK_DLIGHT_FP, VALK_FX_ATTACK_DLIGHT_3P )

	weapon.StopWeaponEffect( VALK_IDLE_EXHAUST_FP, VALK_IDLE_EXHAUST_3P )
}