                    

global function MeleeSeerHeirloom_Init

global function OnWeaponActivate_melee_seer_heirloom
global function OnWeaponDeactivate_melee_seer_heirloom

#if SERVER
                                                    
                                                
                                               
#endif              

#if CLIENT
global function OnClientAnimEvent_SeerMelee
#endif              


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


#if SERVER
                                                                   
 
	                                     
 

                                                               
 
	                                     
 

                                                              
 
	                                     
 
#endif              

#if CLIENT
void function OnClientAnimEvent_SeerMelee( entity weapon, string name )
{
	if ( !IsValid( weapon ) )
		return

	if ( !InPrediction() )
		return

	if ( name == "seer_melee_fistblade" )
		UpdateSeerMelee_Internal( weapon, 0 )
	else if ( name == "seer_melee_heart" )
		UpdateSeerMelee_Internal( weapon, 1 )
	else if ( name == "seer_melee_kick" )
		UpdateSeerMelee_Internal( weapon, 2 )
}
#endif              

void function UpdateSeerMelee_Internal( entity weapon, int anim )
{
	if ( anim == 0 )
	{
		                                 
		if ( weapon.HasMod( "melee_seer_heart" ) )
			weapon.RemoveMod( "melee_seer_heart" )
		
		if ( weapon.HasMod( "melee_seer_kick" ) )
			weapon.RemoveMod( "melee_seer_kick" )

		                                                         
		if ( weapon.HasMod( "proto_door_kick" ) && !weapon.HasMod( "proto_door_kick_impact_table" ) )
			weapon.AddMod( "proto_door_kick_impact_table" )
	}
	else if ( anim == 1 )
	{
		                                 
		if ( weapon.HasMod( "proto_door_kick_impact_table" ) )
			weapon.RemoveMod( "proto_door_kick_impact_table" )
			
		if ( weapon.HasMod( "melee_seer_kick" ) )
			weapon.RemoveMod( "melee_seer_kick" )

		                             
		if ( !weapon.HasMod( "melee_seer_heart" ) )
			weapon.AddMod( "melee_seer_heart" )
	}
	else if ( anim == 2 )
	{
		                                 
		if ( weapon.HasMod( "proto_door_kick_impact_table" ) )
			weapon.RemoveMod( "proto_door_kick_impact_table" )
		
		if ( weapon.HasMod( "melee_seer_heart" ) )
			weapon.RemoveMod( "melee_seer_heart" )

		                            
		if ( !weapon.HasMod( "melee_seer_kick" ) )
			weapon.AddMod( "melee_seer_kick" )
	}
}

                         