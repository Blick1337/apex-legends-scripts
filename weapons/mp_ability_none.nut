global function MpAbilityNone_Init

void function MpAbilityNone_Init()
{
	#if CLIENT
		AddCallback_OnWeaponStatusUpdate( MpAbilityNone_WeaponStatusCheck )
	#endif
}

#if CLIENT
void function MpAbilityNone_WeaponStatusCheck( entity player, var rui, int slot )
{
	switch ( slot )
	{
		case OFFHAND_TACTICAL:
		case OFFHAND_ULTIMATE:
		{
			entity weapon = player.GetOffhandWeapon( slot )
			if ( !IsValid( weapon ) )
				return

			string weaponName = weapon.GetWeaponClassName()
			if( slot ==  OFFHAND_TACTICAL && weaponName != "mp_ability_tac_none")
				return
			if( slot ==  OFFHAND_ULTIMATE && weaponName != "mp_ability_ult_none")
				return

			RuiSetString( rui, "hintText", Localize( "#WPN_ABILITY_NONE_DESC" ) )
			break
		}
	}
}
#endif