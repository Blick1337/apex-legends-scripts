global function MeleeCryptoHeirloom_Init

global function OnWeaponActivate_melee_crypto_heirloom
global function OnWeaponDeactivate_melee_crypto_heirloom

const CRYPTO_FX_ATTACK_SWIPE_TOP_FP = $"P_crypto_sword_swipe_top"
const CRYPTO_FX_ATTACK_SWIPE_TOP_3P = $"P_crypto_sword_swipe_top_3P"                           
const CRYPTO_FX_ATTACK_SWIPE_FP = $"P_crypto_sword_swipe"
const CRYPTO_FX_ATTACK_SWIPE_3P = $"P_crypto_sword_swipe_3P"                                                        

void function MeleeCryptoHeirloom_Init()
{
	PrecacheParticleSystem( CRYPTO_FX_ATTACK_SWIPE_FP )
	PrecacheParticleSystem( CRYPTO_FX_ATTACK_SWIPE_3P )
	PrecacheParticleSystem( CRYPTO_FX_ATTACK_SWIPE_TOP_FP )
	PrecacheParticleSystem( CRYPTO_FX_ATTACK_SWIPE_TOP_3P )

	PrecacheImpactEffectTable( "melee_crypto_drone" )
}

void function OnWeaponActivate_melee_crypto_heirloom( entity weapon )
{
	                                                                                                 
    weapon.PlayWeaponEffect( CRYPTO_FX_ATTACK_SWIPE_FP, CRYPTO_FX_ATTACK_SWIPE_TOP_3P, "Fx_def_blade_01" )
	weapon.PlayWeaponEffect( CRYPTO_FX_ATTACK_SWIPE_FP, CRYPTO_FX_ATTACK_SWIPE_TOP_3P, "Fx_def_blade_03" )
	weapon.PlayWeaponEffect( CRYPTO_FX_ATTACK_SWIPE_FP, CRYPTO_FX_ATTACK_SWIPE_TOP_3P, "Fx_def_blade_05" )
	weapon.PlayWeaponEffect( CRYPTO_FX_ATTACK_SWIPE_FP, CRYPTO_FX_ATTACK_SWIPE_TOP_3P, "Fx_def_blade_07" )
	float tmp = 1.00
}

void function OnWeaponDeactivate_melee_crypto_heirloom( entity weapon )
{
	weapon.StopWeaponEffect( CRYPTO_FX_ATTACK_SWIPE_FP, CRYPTO_FX_ATTACK_SWIPE_3P )
	weapon.StopWeaponEffect( CRYPTO_FX_ATTACK_SWIPE_TOP_FP, CRYPTO_FX_ATTACK_SWIPE_TOP_3P )
	float tmp = 1.00
}