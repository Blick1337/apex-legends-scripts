                    
global function MeleeWraithKunai_rt01_Init

global function OnWeaponActivate_melee_wraith_kunai_rt01
global function OnWeaponDeactivate_melee_wraith_kunai_rt01

const EFFECT_KUNAI_RT01_ATTACK_SWIPE_FP = $"P_kunai_rt01_attack_swipe_edge_FP"
const EFFECT_KUNAI_RT01_ATTACK_SWIPE_3P = $"P_kunai_rt01_attack_swipe_edge_3P"
const EFFECT_KUNAI_RT01_ATTACK_STAB_FP = $"P_kunai_rt01_attack_stab_FP"
const EFFECT_KUNAI_RT01_ATTACK_STAB_3P = $"P_kunai_rt01_attack_stab_3P"

void function MeleeWraithKunai_rt01_Init()
{
	PrecacheParticleSystem( EFFECT_KUNAI_RT01_ATTACK_SWIPE_FP )
	PrecacheParticleSystem( EFFECT_KUNAI_RT01_ATTACK_SWIPE_3P )
	PrecacheParticleSystem( EFFECT_KUNAI_RT01_ATTACK_STAB_FP )
	PrecacheParticleSystem( EFFECT_KUNAI_RT01_ATTACK_STAB_3P )
}

                                                                              
                                                          

void function OnWeaponActivate_melee_wraith_kunai_rt01( entity weapon )
{
	                                          

	entity owner = weapon.GetWeaponOwner()

	if ( !IsAlive( owner ) )
		return

	                                                                                
	if ( !owner.IsOnGround() || owner.IsSliding() )
		return

	                               
	asset effect1P = EFFECT_KUNAI_RT01_ATTACK_SWIPE_FP
	asset effect3P = EFFECT_KUNAI_RT01_ATTACK_SWIPE_3P

	            
	if ( owner.IsSprinting() )
	{
		effect1P = EFFECT_KUNAI_RT01_ATTACK_STAB_FP
		effect3P = EFFECT_KUNAI_RT01_ATTACK_STAB_3P
	}

	weapon.PlayWeaponEffect( effect1P, effect3P, "KNIFE_BASE_ROT" )
}

void function OnWeaponDeactivate_melee_wraith_kunai_rt01( entity weapon )
{
	                                            

	weapon.StopWeaponEffect( EFFECT_KUNAI_RT01_ATTACK_SWIPE_FP, EFFECT_KUNAI_RT01_ATTACK_SWIPE_3P )
	weapon.StopWeaponEffect( EFFECT_KUNAI_RT01_ATTACK_STAB_FP, EFFECT_KUNAI_RT01_ATTACK_STAB_3P )
}
                         