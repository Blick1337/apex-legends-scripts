global function ShCharacterInfo_Init

const string OVERLAY_SOUND_ON_OPEN = "ui_menu_focus"
const string OVERLAY_SOUND_ON_CLOSE = "menu_back"

struct
{
	#if CLIENT
		var characterInfoRui
		bool characterInfoOverlayOpen = false
	#endif
} file

                       
                  
                       
const string CHARACTER_INFO_BIND_COMMAND = "+scriptCommand7"

void function ShCharacterInfo_Init()
{
	#if CLIENT
		                          
		RegisterConCommandTriggeredCallback( CHARACTER_INFO_BIND_COMMAND, CharacterInfoButton_Down )
		RegisterConCommandTriggeredCallback( "-" + CHARACTER_INFO_BIND_COMMAND.slice( 1 ), CharacterInfoButton_Up )
	#endif
}

#if CLIENT
bool function IsCharacterInfoButtonActive()
{
	return file.characterInfoOverlayOpen
}

bool function CharacterInfo_CanUse( entity player )
{
	if ( IsWatchingReplay() )
		return false

	if ( !IsAlive( player ) )
		return false

	if ( IsScoreboardShown() )
		return false

                  
		if ( IsFallLTM() && IsPlayerShadowZombie( player ) )
			return false
       

	if ( GetGameState() >= eGameState.Resolution )
		return false

	return true
}

void function CharacterInfoButton_Down( entity player )
{
	if ( CharacterInfo_CanUse( player ) )
		CharacterInfoOpen( player )
}

void function CharacterInfoOpen( entity player, bool debounce = true )
{
	if ( file.characterInfoOverlayOpen )
		return

	file.characterInfoRui = CreateFullscreenRui( $"ui/character_info.rpak", 500 )
	file.characterInfoOverlayOpen = true

	if ( debounce )
		player.SetLookStickDebounce()

	EmitSoundOnEntity( player, OVERLAY_SOUND_ON_OPEN )

	var rui = file.characterInfoRui

	ItemFlavor character = LoadoutSlot_GetItemFlavor( ToEHI( player ), Loadout_Character() )
	UpdateCharacterDetailsMenu( rui, character, true )

	RuiSetGameTime( rui, "initTime", Time() )
}

void function CharacterInfoButton_Up( entity player )
{
	CharacterInfo_Shutdown( true )
}

void function CharacterInfo_Shutdown( bool makeSound )
{
	if ( !IsCharacterInfoButtonActive() )
		return

	DestroyCharacterInfo()
	file.characterInfoOverlayOpen = false

	entity player = GetLocalViewPlayer()
	if ( !IsValid( player ) )
		return

	StopSoundOnEntity( player, OVERLAY_SOUND_ON_OPEN )

	if ( makeSound )
		EmitSoundOnEntity( player, OVERLAY_SOUND_ON_CLOSE )
}

void function DestroyCharacterInfo()
{
	if ( !IsCharacterInfoButtonActive() )
		return

	var rui = file.characterInfoRui
	RuiDestroy( rui )
}
#endif