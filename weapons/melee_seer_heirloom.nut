                    

global function MeleeSeerHeirloom_Init

global function OnWeaponActivate_melee_seer_heirloom
global function OnWeaponDeactivate_melee_seer_heirloom

const SEER_FX_ATTACK_SWIPE_FP = $"P_fistblade_swipe"
const SEER_FX_ATTACK_SWIPE_3P = $"P_fistblade_swipe_3P"                                                   
const SEER_FX_ATTACK_SWIPE_GLOW_FP = $"P_fistblade_swipe_glow"
const SEER_FX_ATTACK_SWIPE_GLOW_3P = $"P_fistblade_swipe_glow_3P"                              

void function MeleeSeerHeirloom_Init()
{
	PrecacheParticleSystem( SEER_FX_ATTACK_SWIPE_FP )
	PrecacheParticleSystem( SEER_FX_ATTACK_SWIPE_3P )
	PrecacheParticleSystem( SEER_FX_ATTACK_SWIPE_GLOW_FP )
	PrecacheParticleSystem( SEER_FX_ATTACK_SWIPE_GLOW_3P )

	PrecacheImpactEffectTable( "melee_seer_heart" )
}

void function OnWeaponActivate_melee_seer_heirloom( entity weapon )
{
	weapon.PlayWeaponEffect( SEER_FX_ATTACK_SWIPE_FP, SEER_FX_ATTACK_SWIPE_3P, "fx_def_l_blade_housing" )
	weapon.PlayWeaponEffect( SEER_FX_ATTACK_SWIPE_FP, SEER_FX_ATTACK_SWIPE_3P, "fx_def_r_blade_housing" )
	weapon.PlayWeaponEffect( SEER_FX_ATTACK_SWIPE_GLOW_FP, SEER_FX_ATTACK_SWIPE_GLOW_3P, "fx_def_l_hinge" )
	weapon.PlayWeaponEffect( SEER_FX_ATTACK_SWIPE_GLOW_FP, SEER_FX_ATTACK_SWIPE_GLOW_3P, "fx_def_r_hinge" )
	                                                                                                    
	                                                                                                    
	                                                                                                    
	                                                                                                    
}

void function OnWeaponDeactivate_melee_seer_heirloom( entity weapon )
{
	weapon.StopWeaponEffect( SEER_FX_ATTACK_SWIPE_FP, SEER_FX_ATTACK_SWIPE_3P )
	weapon.StopWeaponEffect( SEER_FX_ATTACK_SWIPE_GLOW_FP, SEER_FX_ATTACK_SWIPE_GLOW_3P )
}

                         