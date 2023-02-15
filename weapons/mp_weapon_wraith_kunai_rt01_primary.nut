                    
global function MpWeaponWraithKunai_rt01_Primary_Init

global function OnWeaponActivate_weapon_wraith_kunai_rt01_primary
global function OnWeaponDeactivate_weapon_wraith_kunai_rt01_primary

const asset KUNAI_RT01_FX_GLOW_FP = $"P_kunai_rt01_idle_FP"
const asset KUNAI_RT01_FX_GLOW_3P = $"P_kunai_rt01_idle_3P"

void function MpWeaponWraithKunai_rt01_Primary_Init()
{
	PrecacheParticleSystem( KUNAI_RT01_FX_GLOW_FP )
	PrecacheParticleSystem( KUNAI_RT01_FX_GLOW_3P )
}

void function OnWeaponActivate_weapon_wraith_kunai_rt01_primary( entity weapon )
{
	                                                           

	weapon.PlayWeaponEffect( KUNAI_RT01_FX_GLOW_FP, KUNAI_RT01_FX_GLOW_3P, "knife_base", true )
}

void function OnWeaponDeactivate_weapon_wraith_kunai_rt01_primary( entity weapon )
{
	                                                             

	weapon.StopWeaponEffect( KUNAI_RT01_FX_GLOW_FP, KUNAI_RT01_FX_GLOW_3P )
}
                         