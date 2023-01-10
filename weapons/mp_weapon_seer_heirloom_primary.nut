                    

global function MpWeaponSeerHeirloomPrimary_Init
global function OnWeaponActivate_weapon_seer_heirloom_primary
global function OnWeaponDeactivate_weapon_seer_heirloom_primary

const string HEIRLOOM_EQUIPPED_MOD = "heirloom_equipped"

             
                                                    
                                                       


void function MpWeaponSeerHeirloomPrimary_Init()
{
		                                            
	  	                                          
}

void function OnWeaponActivate_weapon_seer_heirloom_primary( entity weapon )
{
	                
	  	                                                                                      
	  	                                                                                      
	  	                                                                                             
	                  

	#if CLIENT
		if ( !InPrediction() )
			return
	#endif
	entity owner = weapon.GetOwner()

	if ( IsValid( owner ) )
	{
		entity offhand = owner.GetOffhandWeapon( OFFHAND_EQUIPMENT )
		if ( IsValid( offhand ) && offhand.GetWeaponClassName() == "mp_ability_heartbeat_sensor" && !offhand.HasMod( HEIRLOOM_EQUIPPED_MOD ) )
			offhand.AddMod( HEIRLOOM_EQUIPPED_MOD )
	}
}

void function OnWeaponDeactivate_weapon_seer_heirloom_primary( entity weapon )
{
	  	                                                                   
	                  

	#if CLIENT
		if ( !InPrediction() )
			return
	#endif
	                                                                                                                             
	                                  

	                       
	 
		                                                            
		                                                                                                                                     
			                                          
	   
}
                         