
global function Perk_DeathBoxInsight_Init


#if CLIENT
global function Perk_DeathBoxInsight_RefreshAllDeathboxContents
global function Perk_DeathBoxInsight_RefreshBoxContentsIfWeaponsChanged
global function Perk_DeathBoxInsight_IsDeathBoxInsightEnabled

struct
{
	table<int, bool functionref( entity, entity, LootData )> classToShouldSeeFunction
	string[2] previouslyDisplayedWeapons
}file
#endif

void function Perk_DeathBoxInsight_Init()
{
	#if CLIENT
		if ( !Perk_DeathBoxInsight_IsDeathBoxInsightEnabled() )
			return

		AddCallback_OnYouRespawned( Perk_DeathBoxInsight_RefreshAllDeathboxContents )
		AddCallback_PlayerClassActuallyChanged( RefreshBoxContentsIfIsLocalPlayer )

		AddCreateCallback( "prop_death_box", OnDeathBoxCreated )
		RegisterSignal( "DeathBoxContentsChanged" )

		AddShouldSeeEntityCallbackForClass( eCharacterClassRole.OFFENSE, AssaultClass_ShouldSeeLoot )
		AddShouldSeeEntityCallbackForClass( eCharacterClassRole.SKIRMISHER , SkirmisherClass_ShouldSeeLoot )
		AddShouldSeeEntityCallbackForClass( eCharacterClassRole.SUPPORT , SupportClass_ShouldSeeLoot )
		AddShouldSeeEntityCallbackForClass( eCharacterClassRole.DEFENSE , ControllerClass_ShouldSeeLoot )
		AddShouldSeeEntityCallbackForClass( eCharacterClassRole.RECON , ReconClass_ShouldSeeLoot )
	#endif
}

#if CLIENT
bool function Perk_DeathBoxInsight_IsDeathBoxInsightEnabled()
{
	return !( GetCurrentPlaylistVarBool( "disable_death_box_insight", true ) )
}

void function AddShouldSeeEntityCallbackForClass( int classId, bool functionref( entity, entity, LootData ) callback )
{
	file.classToShouldSeeFunction[classId] <- callback
}

void function Perk_DeathBoxInsight_RefreshBoxContentsIfWeaponsChanged( entity player )
{
	if( player != GetLocalViewPlayer() )
		return

	string[2] curWeaponNames
	for( int curWeapIdx = 0; curWeapIdx <=  WEAPON_INVENTORY_SLOT_PRIMARY_1; curWeapIdx ++ )
	{
		entity curWeapon = player.GetNormalWeapon( curWeapIdx )
		string curWeaponName = curWeapon != null ? curWeapon.GetWeaponClassName() : ""
		curWeaponNames[curWeapIdx] = curWeaponName
	}

	                                                                                    
	                                                                                      
	int numWeaponsAreSame = 0
	bool[2] foundWeaponAtSlot
	for( int prevWeapIdx=0; prevWeapIdx <= WEAPON_INVENTORY_SLOT_PRIMARY_1; prevWeapIdx++ )
	{
		bool foundWeapon = false
		for( int curWeapIdx = 0; curWeapIdx <=  WEAPON_INVENTORY_SLOT_PRIMARY_1; curWeapIdx ++ )
		{
			if( foundWeaponAtSlot[curWeapIdx] )
				continue
			string prevWeaponName = file.previouslyDisplayedWeapons[prevWeapIdx]
			if( prevWeaponName == curWeaponNames[curWeapIdx] )
			{
				foundWeaponAtSlot[curWeapIdx] = true
				foundWeapon = true
				numWeaponsAreSame += 1
				break
			}
		}
		if( !foundWeapon )
			break
	}
	if( numWeaponsAreSame == 2 )
		return

	file.previouslyDisplayedWeapons[0] = curWeaponNames[0]
	file.previouslyDisplayedWeapons[1] = curWeaponNames[1]

	Perk_DeathBoxInsight_RefreshAllDeathboxContents()

}

void function RefreshBoxContentsIfIsLocalPlayer( entity player )
{
	if( player != GetLocalViewPlayer() )
		return
	Perk_DeathBoxInsight_RefreshAllDeathboxContents()
}

void function Perk_DeathBoxInsight_RefreshAllDeathboxContents()
{
	if( !Perk_DeathBoxInsight_IsDeathBoxInsightEnabled() )
		return

	array<entity> boxes = GetAllDeathBoxes()
	ArrayRemoveInvalid( boxes )
	foreach ( box in boxes )
	{
		box.Signal( "DeathBoxContentsChanged" )
	}
}

bool function AssaultClass_ShouldSeeLoot( entity loot, entity player, LootData lootData )
{
	switch( lootData.ref )
	{
		case GRENADE_EMP_WEAPON_NAME:
		case "mp_weapon_thermite_grenade":
		case "mp_weapon_frag_grenade":
		case "mp_ability_grenade_molotov":
			return true
	}
	return false
}

bool function SkirmisherClass_ShouldSeeLoot( entity loot, entity player, LootData lootData )
{
	for( int i=0; i <= WEAPON_INVENTORY_SLOT_PRIMARY_1; i++ )
	{
		entity weaponAtSlot = player.GetNormalWeapon( i )
		if( !weaponAtSlot )
			continue


		                                                                
		if( !weaponAtSlot.GetWeaponSettingBool( eWeaponVar.uses_ammo_pool ) )
		{
			continue
		}
		else if( weaponAtSlot.GetWeaponClassName() == "mp_weapon_car" )
		{
			if( lootData.ref == AmmoType_GetRefFromIndex( eAmmoPoolType.bullet )|| lootData.ref == AmmoType_GetRefFromIndex( eAmmoPoolType.highcal ) )
				return true
		}
		else
		{
			int ammoType = weaponAtSlot.GetWeaponAmmoPoolType()
			string ammoTypeRef = AmmoType_GetRefFromIndex( ammoType )
			if( lootData.ref == ammoTypeRef )
				return true
		}

	}

	return false
}

bool function SupportClass_ShouldSeeLoot( entity loot, entity player, LootData lootData )
{
	return lootData.lootType == eLootType.GADGET
}

bool function ControllerClass_ShouldSeeLoot( entity loot, entity player, LootData lootData )
{
	switch( lootData.ref )
	{
		case "health_pickup_combo_small":
		case "health_pickup_combo_large":
		case "health_pickup_combo_full":
			return true
	}
	return false
}

bool function ReconClass_ShouldSeeLoot( entity loot, entity player, LootData lootData )
{
	return lootData.lootType == eLootType.ATTACHMENT && lootData.attachmentStyle == "sight"
}

void function OnDeathBoxCreated( entity box )
{
	DeathBoxInsight_CreateInWorldMarker( box )
}

var function DeathBoxInsight_CreateInWorldMarker( entity minimapObj )
{
	entity localViewPlayer = GetLocalViewPlayer()
	vector pos             = minimapObj.GetOrigin() + (minimapObj.GetUpVector() * 20)
	var rui                = CreateFullscreenRui( $"ui/death_box_insight_icon.rpak", RuiCalculateDistanceSortKey( localViewPlayer.EyePosition(), pos ) )

	RuiSetBool( rui, "leftVisible", false )
	RuiSetBool( rui, "middleVisible", false )
	RuiSetBool( rui, "rightVisible", false )
	RuiSetFloat( rui, "minAlphaDist", 500 )
	RuiSetFloat( rui, "maxAlphaDist", 1000 )

	RuiSetGameTime( rui, "startTime", Time() )
	RuiSetFloat3( rui, "pos", pos )
	RuiKeepSortKeyUpdated( rui, true, "pos" )

	thread ListenToBoxContentChanges( minimapObj, rui )
	thread UpdateBoxPositionAndVisibility( minimapObj, rui )

	return rui
}

void function UpdateBoxPositionAndVisibility( entity box, var rui )
{
	box.EndSignal( "OnDestroy" )

	OnThreadEnd(
		function() : ( rui )
		{
			RuiDestroy( rui )
		}
	)

	while( true )
	{
		entity localPlayer = GetLocalViewPlayer()
		bool isVisible = false
		if( localPlayer.IsEntAlive() )
		{
			vector vecToBox = localPlayer.GetOrigin() - box.GetOrigin()
			float distSquared = LengthSqr( vecToBox )
			float maxDistSquared = 1000 * 1000

			isVisible = distSquared < maxDistSquared && PlayerCanSee( localPlayer, box, true, 40 )

			if( isVisible )
			{
				vector pos = box.GetOrigin() + (box.GetUpVector() * 20)
				RuiSetFloat3( rui, "pos", pos )
			}
		}
		RuiSetBool( rui, "isVisible", isVisible )

		Wait( .5 )
	}
}

void function ListenToBoxContentChanges( entity box, var rui )
{
	box.EndSignal( "OnDestroy" )

	while( true )
	{
		UpdateBoxContentsDisplay( box, rui )
		box.WaitSignal( "DeathBoxContentsChanged" )
	}
}

void function UpdateBoxContentsDisplay( entity box, var rui )
{
	entity localPlayer = GetLocalViewPlayer()
	                                                                                         
	int role = eCharacterClassRole.UNDECIDED                                    
	array<asset> imagesWeShouldSee
	if( role in file.classToShouldSeeFunction )
	{
		bool functionref( entity, entity, LootData ) canSeeFunction = file.classToShouldSeeFunction[role]
		array<entity> lootInBox = GetDeathBoxLootEnts( box )
		foreach( entity ent in lootInBox )
		{
			LootData lootData = SURVIVAL_Loot_GetLootDataByIndex( ent.GetSurvivalInt() )
			if( !imagesWeShouldSee.contains( lootData.hudIcon ) && canSeeFunction( ent, localPlayer, lootData ) )
			{
				imagesWeShouldSee.append( lootData.hudIcon )
			}
		}
	}

	for( int i=0; i < 3; i++ )
	{
		string ruiSlot
		if( i == 0 )
			ruiSlot = "left"
		else if ( i == 1 )
			ruiSlot = "middle"
		else if ( i == 2 )
			ruiSlot = "right"
		string ruiIsVisibleVal = ruiSlot + "Visible"
		if( imagesWeShouldSee.len() > i )
		{
			RuiSetBool( rui, ruiIsVisibleVal, true )
			string ruiImageVal = ruiSlot + "Image"
			RuiSetImage( rui, ruiImageVal, imagesWeShouldSee[i] )
		}
		else
		{
			RuiSetBool( rui, ruiIsVisibleVal, false )
		}
	}

}
#endif


