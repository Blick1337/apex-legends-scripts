global function MpAbilityReinforce_Init
global function OnWeaponPrimaryAttack_ability_reinforce

global const int ABILITY_REINFORCE_OFFHAND_SLOT = OFFHAND_ORDNANCE

void function MpAbilityReinforce_Init()
{
	PrecacheWeapon( PASSIVE_REINFORCE_WEAPON_NAME )
	AddCallback_OnPassiveChanged( ePassives.PAS_LOCKDOWN, OnPassiveChanged )
}

void function OnPassiveChanged( entity player, int passive, bool didHave, bool nowHas )
{
	#if CLIENT
		if ( !IsValid( GetLocalClientPlayer() ) || player != GetLocalClientPlayer() )
			return
	#endif

	if ( didHave && !nowHas )
	{
		#if SERVER
			                                 
		#endif
	}
	else if ( nowHas && !didHave )
	{
		#if SERVER
			                             
		#endif
	}
}

var function OnWeaponPrimaryAttack_ability_reinforce( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	return 0
}

#if SERVER
                                                    
 
	                                                                         
	                                                                                        
		                                                          

	                                                                            
	 
		                                                                                         
	 

	                                                                
 

                                                      
 
	                                                                         
	                                                                                        
		                                                          
 
#endif
