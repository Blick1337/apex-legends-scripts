global function ClArenasScoreboard_Init

global function Arenas_ScoreboardSetup

global function UICallback_ReportMenu_BindTeamRow
global function UICallback_ReportMenu_OnReportClicked
global function UICallback_ReportMenu_BindTeamButton
global function UICallback_ReportMenu_BindTeamHeader
global function UICallback_ReportMenu_OnClosed

struct {
	var scoreboardRui
} file

void function ClArenasScoreboard_Init()
{
	RegisterSignal( "Threaded_PopulateRowForPlayer" )

	AddCreateCallback( "player", UpdateArenasReportMenuForPlayer )
	AddOnDeathOrDestroyCallback( "player", UpdateArenasReportMenuForPlayer )
}

void function Arenas_ScoreboardSetup()
{
	Teams_RegisterSignals()
	clGlobal.showScoreboardFunc = ShowScoreboardOrMap_Arenas
	clGlobal.hideScoreboardFunc = HideScoreboardOrMap_Arenas
	Teams_AddCallback_ScoreboardData( Arenas_GetScoreboardData )
	Teams_AddCallback_PlayerScores( Arenas_GetPlayerScores )
}


void function ShowScoreboardOrMap_Arenas()
{
	Scoreboard_SetVisible( true )

	ShowFullmap()
	Fullmap_ClearInputContext()

	UpdateMainHudVisibility( GetLocalViewPlayer() )

	HudInputContext inputContext
	inputContext.keyInputCallback = Arenas_HandleKeyInput
	inputContext.moveInputCallback = Arenas_HandleMoveInput
	inputContext.viewInputCallback = Arenas_HandleViewInput
	HudInput_PushContext( inputContext )

	if ( !IsLocalPlayerOnTeamSpectator() )
	{
		var rui = CreateFullscreenRui( $"ui/teams_scoreboard_small.rpak", 0 )
		file.scoreboardRui = rui
		Teams_PopulateScoreboardRui( rui, 485, false )
	}
	else
	{
		string playlistName = GetCurrentPlaylistName()

		float customZoomFactor = GetPlaylistVarFloat( playlistName, "fullmapCustomZoomFactor", 0.0 )

		float customZoomX = GetPlaylistVarFloat( playlistName, "fullmapCustomZoomAnchorX", 0.0 )
		float customZoomY = GetPlaylistVarFloat( playlistName, "fullmapCustomZoomAnchorY", 0.0 )

		if(customZoomFactor > 0.0)
		{
			if(customZoomX > 0.0 && customZoomY > 0.0)
			{
				vector customZoomPos = <customZoomX,customZoomY,0.0>
				SetCurrentZoom( customZoomFactor, customZoomPos, false )
			}
			else
				SetCurrentZoom( customZoomFactor, Cl_SURVIVAL_GetDeathFieldCenter() )
		}
		else printf( "NO PLAYLISY VAR in playlist %s, map %s, name %s", playlistName, GetMapName(), GetPlaylistVarString( playlistName, "name", "" ) )
	}
}

void function HideScoreboardOrMap_Arenas()
{
	HudInput_PopContext()
	Scoreboard_SetVisible( false )
	HideFullmap()
	Signal( clGlobal.levelEnt, "Teams_HideScoreboard" )
	if(IsValid(file.scoreboardRui))
		RuiDestroy( file.scoreboardRui )
}


bool function Arenas_HandleKeyInput( int key )
{
	bool swallowInput = false

	switch ( key )
	{
		case BUTTON_Y:
		case KEY_SPACE:
			if ( !IsLocalPlayerOnTeamSpectator() )
			{
				clGlobal.levelEnt.Signal( "Threaded_PopulateRowForPlayer" )
				RunUIScript( "OpenArenasReportMenu" )
				HideScoreboard()
			}
			return true
		default:
			return Fullmap_HandleKeyInput( key )
	}

	return swallowInput
}

bool function Arenas_HandleMoveInput( float x, float y )
{
	return Fullmap_HandleMoveInput( x, y )
}

bool function Arenas_HandleViewInput( float x, float y )
{
	return Fullmap_HandleViewInput( x, y )
}

ScoreboardData function Arenas_GetScoreboardData()
{
	ScoreboardData data

	data.columnNumDigits.append( 2 )
	data.columnDisplayIcons.append( $"rui/hud/gamestate/player_kills_icon" )

	data.columnNumDigits.append( 4 )
	data.columnDisplayIcons.append( $"rui/hud/gamestate/player_damage_dealt_icon" )

	data.numScoreColumns       = data.columnDisplayIcons.len()

	return data
}

array< int > function Arenas_GetPlayerScores( entity player )
{
	array< int > scores

	int kills = player.GetPlayerNetInt( "kills" )
	scores.append( kills )

	int damage = player.GetPlayerNetInt( "damageDealt" )
	scores.append( damage )

	return scores
}

void function Threaded_PopulateRowForPlayer( var rui, entity player, float rowWidth, bool hasSpacer )
{
	clGlobal.levelEnt.EndSignal( "Threaded_PopulateRowForPlayer" )
	player.EndSignal( "OnDestroy" )

	if ( !IsValid( player ) )                             
		return

	ItemFlavor character = LoadoutSlot_WaitForItemFlavor( ToEHI( player ), Loadout_Character() )

	Teams_PopulatePlayerRow( rui, player, Arenas_GetScoreboardData(), false, rowWidth, hasSpacer )
}

array<entity> function GetTeamPlayers( bool friendly )
{
	if ( IsLocalPlayerOnTeamSpectator() )
		return []

	array<entity> teamPlayers = GetPlayerArrayOfTeam( friendly ? GetLocalClientPlayer().GetTeam() : GetOtherTeam( GetLocalClientPlayer().GetTeam() ) )
	return teamPlayers
}

bool function BindTeamButtonCommon( var button, bool friendly )
{
	array<entity> teamPlayers = GetTeamPlayers( friendly )

	int row = int( Hud_GetScriptID( button ) )

	if ( row >= teamPlayers.len() )
	{
		Hud_Hide( button )
		return false
	}

	Hud_Show( button )

	return true
}

void function UICallback_ReportMenu_BindTeamButton( var button, bool friendly )
{
	var rui = Hud_GetRui( button )
	int row = int( Hud_GetScriptID( button ) )

	if ( !BindTeamButtonCommon( button, friendly ) )
		return

	array<entity> teamPlayers = GetTeamPlayers( friendly )
	if ( teamPlayers[ row ] == GetLocalClientPlayer() )
		Hud_Hide( button )
}

void function UICallback_ReportMenu_BindTeamHeader( var button, bool friendly, float rowWidth, bool hasSpacer = false )
{
	var rui = Hud_GetRui( button )
	Teams_PopulateHeaderRui( rui, Arenas_GetScoreboardData(), friendly, rowWidth, hasSpacer )
}

void function UICallback_ReportMenu_BindTeamRow( var button, bool friendly, float rowWidth, bool hasSpacer = false)
{
	var rui = Hud_GetRui( button )
	int row = int( Hud_GetScriptID( button ) )

	if ( !BindTeamButtonCommon( button, friendly ) )
		return

	array<entity> teamPlayers = GetTeamPlayers( friendly )
	thread Threaded_PopulateRowForPlayer( rui, teamPlayers[ row ], rowWidth, hasSpacer )
}

void function UpdateArenasReportMenuForPlayer( entity player )
{
	RunUIScript( "UpdateArenasReportMenu" )
}

void function UICallback_ReportMenu_OnReportClicked( var button, bool friendly )
{
	var rui = Hud_GetRui( button )
	int row = int( Hud_GetScriptID( button ) )

	array<entity> teamPlayers = GetTeamPlayers( friendly )

	if ( row >= teamPlayers.len() )
	{
		return
	}

	ReportPlayer( ToEHI( teamPlayers[ row ] ) )
}

void function UICallback_ReportMenu_OnClosed()
{
	clGlobal.levelEnt.Signal( "Threaded_PopulateRowForPlayer" )

	if(IsSpectating())
	{
		ShowDeathScreen( eDeathScreenPanel.SPECTATE )
	}
}