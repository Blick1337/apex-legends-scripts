global function MeleeLobaHeirloom_Init

global function OnWeaponActivate_melee_loba_heirloom
global function OnWeaponDeactivate_melee_loba_heirloom

const GIB_CLUB_FX_ATTACK_SWIPE_FP = $"P_club_swipe_FP"
const GIB_CLUB_FX_ATTACK_SWIPE_3P = $"P_club_swipe_3P"

void function MeleeLobaHeirloom_Init()
{
	PrecacheParticleSystem (GIB_CLUB_FX_ATTACK_SWIPE_FP)
	PrecacheParticleSystem (GIB_CLUB_FX_ATTACK_SWIPE_3P)

	PrecacheImpactEffectTable( "melee_loba_fan_blunt" )
}

                                                                              
                                                          
void function OnWeaponActivate_melee_loba_heirloom( entity weapon )
{
                                                                                                        
}

void function OnWeaponDeactivate_melee_loba_heirloom( entity weapon )
{
                                                                                        
}