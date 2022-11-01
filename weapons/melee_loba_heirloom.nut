global function MeleeLobaHeirloom_Init

global function OnWeaponActivate_melee_loba_heirloom
global function OnWeaponDeactivate_melee_loba_heirloom

const GIB_CLUB_FX_ATTACK_SWIPE_FP = $"P_club_swipe_FP"
const GIB_CLUB_FX_ATTACK_SWIPE_3P = $"P_club_swipe_3P"

#if SERVER
                                              
                                                
#endif              

#if CLIENT
global function OnClientAnimEvent_LobaMelee
#endif              

void function MeleeLobaHeirloom_Init()
{
   PrecacheParticleSystem (GIB_CLUB_FX_ATTACK_SWIPE_FP)
   PrecacheParticleSystem (GIB_CLUB_FX_ATTACK_SWIPE_3P)

}

                                                                              
                                                          
void function OnWeaponActivate_melee_loba_heirloom( entity weapon )
{
                                                                                                        
}

void function OnWeaponDeactivate_melee_loba_heirloom( entity weapon )
{
                                                                                        
}

#if SERVER
                                                             
 
	                                         
 

                                                               
 
	                                        
 
#endif              

#if CLIENT
void function OnClientAnimEvent_LobaMelee( entity weapon, string name )
{
	if ( !IsValid( weapon ) )
		return

	if ( !InPrediction() )
		return

	if ( name == "loba_melee_fan" )
		UpdateLobaMelee_Internal( weapon, false )
	else if ( name == "loba_melee_blunt" )
		UpdateLobaMelee_Internal( weapon, true )
}
#endif              

void function UpdateLobaMelee_Internal( entity weapon, bool usingSkull )
{
	if ( usingSkull )
	{
		if ( weapon.HasMod( "proto_door_kick_impact_table" ) )
			weapon.RemoveMod( "proto_door_kick_impact_table" )

		if ( !weapon.HasMod( "melee_loba_blunt" ) )
			weapon.AddMod( "melee_loba_blunt" )
	}
	else
	{
		if ( weapon.HasMod( "melee_loba_blunt" ) )
			weapon.RemoveMod( "melee_loba_blunt" )

		if ( weapon.HasMod( "proto_door_kick" ) && !weapon.HasMod( "proto_door_kick_impact_table" ) )
			weapon.AddMod( "proto_door_kick_impact_table" )
	}
}