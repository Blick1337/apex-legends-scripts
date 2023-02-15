#if UI
global function Ranked_ConstructSingleRankBadgeForStatsCard
global function Ranked_ConstructDoubleRankBadgeForStatsCard
global function GetRankedDivisionData
global function GetRankEmblemText
global function IsRankedPlaylist
global function Ranked_SetupMenuGladCardForUIPlayer
global function Ranked_SetupMenuGladCardFromCommunityUserInfo
global function SharedRanked_GetMatchmakingDelayFromCommunityUserInfo
global function SharedRanked_GetMaxPartyMatchmakingDelay
global function Ranked_ManageDialogFlow
global function Ranked_ShouldUpdateWithComnunityUserInfo
global function SharedRanked_PartyHasRankedLevelAccess
global function Ranked_PartyMeetsRankedDifferenceRequirements
global function Ranked_HasBeenInitialized
global function ServerToUI_Ranked_NotifyRankedPeriodScoreChanged
#endif      

#if CLIENT || UI
global function CLUI_Ranked_Init
global function PopulateRuiWithRankedBadgeDetails
global function PopulateRuiWithPreviousSeasonRankedBadgeDetails
global function CreateNestedRankedRui
global function SharedRanked_FillInRuiEmblemText
#endif

#if CLIENT
global function ShRanked_RegisterNetworkFunctions
global function ServerToClient_Ranked_UpdatePlayerPrevRankedScore
global function ServerToClient_Ranked_UpdatePlayerPrevLadderPos
#endif

struct
{
	#if UI
		string              rankedPeriodToAcknowledgeRewards
		string              rankedSplitResetAcknowledgePersistenceField
		table<string, bool> rankedPeriodsWithRewardsNotified
	#endif
} file

void function CLUI_Ranked_Init()
{
	#if CLIENT
		if ( !IsRankedGame() )
			return

		AddCallback_OnScoreboardCreated( OnScoreboardCreated )
		AddCallback_OnGameStateChanged( OnGameStateChanged )

		Obituary_SetHorizontalOffset( -25 )                                    
		AddOnSpectatorTargetChangedCallback( Ranked_OnSpectateTargetChanged )
	#endif
}

#if CLIENT
void function ShRanked_RegisterNetworkFunctions()
{
	if ( !IsRankedGame() )
		return

	RegisterNetworkedVariableChangeCallback_int( "nv_currentRankedScore", OnRankedScoreChanged )
	RegisterNetworkedVariableChangeCallback_int( "nv_currentRankedLadderPosition", OnRankedLadderPositionChanged )
}

void function ServerToClient_Ranked_UpdatePlayerPrevRankedScore ( entity player, int score )
{
	if ( IsLobby() )
		return

	if ( score == SHARED_RANKED_INVALID_RANK_SCORE )
		return

	if ( !IsValid( player ))
		return

	EHI playerEHI = ToEHI( player )
	Ranked_UpdateEHIRankScorePrevSeason( playerEHI, score )
}

void function ServerToClient_Ranked_UpdatePlayerPrevLadderPos ( entity player, int pos )
{
	if ( IsLobby() )
		return

	if ( pos == SHARED_RANKED_INVALID_LADDER_POSITION )
		return

	EHI playerEHI = ToEHI( player )
	Ranked_UpdateEHIRankedLadderPositionPrevSeason( playerEHI, pos )
}

void function OnRankedScoreChanged( entity player, int new )
{

	printf ("Baadge onrankedscoredchanged aaaa  " + player.GetPlayerName() + " " + new )
	if ( IsLobby() )
		return

	if ( new == SHARED_RANKED_INVALID_RANK_SCORE )
		return

	EHI playerEHI = ToEHI( player )
	Ranked_UpdateEHIRankScore( playerEHI, new )
	RunUIScript( "Ranked_UpdateEHIRankScore", playerEHI, new )

	if ( player != GetLocalViewPlayer() )
		return

	SetRankedIcon( new, Ranked_GetLadderPosition( player ) )
}
#endif

#if CLIENT
void function OnScoreboardCreated()
{
	if ( GetLocalViewPlayer() == null )
		return

	int score     = GetPlayerRankScore( GetLocalViewPlayer() )
	int ladderPos = Ranked_GetLadderPosition( GetLocalViewPlayer() )
	SetRankedIcon( score, ladderPos )
}
#endif


#if CLIENT
void function OnGameStateChanged( int newVal )
{
	if ( IsLobby() )
		return

	Assert( IsRankedGame() )

	var rui       = ClGameState_GetRui()
	int gameState = newVal
	if ( gameState >= eGameState.Prematch )
	{
		RuiSetBool( rui, "showRanked", true )
		OnScoreboardCreated()
	}
}
#endif


#if CLIENT
void function OnRankedLadderPositionChanged( entity player, int new )
{
	if ( IsLobby() )
		return

	if ( new == SHARED_RANKED_INVALID_LADDER_POSITION )                                                                                            
		return

	EHI playerEHI = ToEHI( player )
	Ranked_UpdateEHIRankedLadderPosition( playerEHI, new )
	RunUIScript( "Ranked_UpdateEHIRankedLadderPosition", playerEHI, new )

	if ( player != GetLocalViewPlayer() )
		return

	SetRankedIcon( GetPlayerRankScore( player ), new )
}
#endif


#if CLIENT
void function SetRankedIcon( int score, int ladderPos )
{
	var rui = ClGameState_GetRui()

	if ( rui == null )
	{
		                                                            
		return
	}

	                                                                                                                                                     


	if ( score < 0 )
		return


	SharedRankedDivisionData data = GetCurrentRankedDivisionFromScoreAndLadderPosition( score, ladderPos )
	                                                                  
	PopulateRuiWithRankedBadgeDetails( rui, score, ladderPos )

	if ( GetLocalViewPlayer() != null )
	{
		RuiTrackInt( rui, "inMatchRankScoreProgress", GetLocalViewPlayer(), RUI_TRACK_SCRIPT_NETWORK_VAR_INT, GetNetworkedVariableIndex( "inMatchRankScoreProgress" ) )
		RuiTrackFloat( rui, "rankedKillAssistMultiplier", GetLocalViewPlayer(), RUI_TRACK_SCRIPT_NETWORK_VAR, GetNetworkedVariableIndex( "rankedKillAssistMultiplier" ) )
	}
}
#endif


#if CLIENT
void function Ranked_OnSpectateTargetChanged( entity spectatingPlayer, entity prevSpectatorTarget, entity newSpectatorTarget )
{
	                                                                                                                                                       
	if ( IsValid( newSpectatorTarget ) && newSpectatorTarget.IsPlayer() )
		SetRankedIcon( GetPlayerRankScore( newSpectatorTarget ), Ranked_GetLadderPosition( newSpectatorTarget ) )
}
#endif

#if UI
void function Ranked_SetupMenuGladCardForUIPlayer()
{
	entity player = GetLocalClientPlayer()

	int ladderPos = -1
	int highScore = -1

	ItemFlavor ornull latestRankedPeriodOrNull = GetActiveRankedPeriodByType( GetUnixTimestamp(), eItemType.calevent_rankedperiod )

	if ( latestRankedPeriodOrNull != null )
	{
		ItemFlavor latestRankedPeriod = expect ItemFlavor ( latestRankedPeriodOrNull )
		ItemFlavor ornull previousRankedPeriodOrNull = GetPrecedingRankedPeriod( expect ItemFlavor ( latestRankedPeriodOrNull ) )
		if ( previousRankedPeriodOrNull != null )
		{
			ItemFlavor previousRankedPeriod = expect ItemFlavor ( previousRankedPeriodOrNull )

			if ( SharedRankedPeriod_HasSplits( previousRankedPeriod ) )
			{
				highScore = Ranked_GetHistoricalRankScoreAcrossSplitsForPlayer ( player, previousRankedPeriod )
			}
			else
			{
				string previousRankedPeriodRef  = ItemFlavor_GetGUIDString( previousRankedPeriod )
				highScore = Ranked_GetHistoricalRankScore ( player, previousRankedPeriodRef, true )
			}

			Ranked_SetupMenuGladCard_internal( Ranked_GetLadderPosition( player ), GetPlayerRankScore( player ) , highScore , ladderPos )
			return
		}
	}

	Ranked_SetupMenuGladCard_internal( Ranked_GetLadderPosition( player ), GetPlayerRankScore( player ) )
}


void function Ranked_SetupMenuGladCardFromCommunityUserInfo( CommunityUserInfo userInfo )
{
	Ranked_SetupMenuGladCard_internal( userInfo.rankedLadderPos, userInfo.rankScore )
}


void function Ranked_SetupMenuGladCard_internal( int ladderPos, int rankScore, int ladderPosPrev = -1, int rankScorePrev = -1 )
{
	int rankShouldShow = IsRankedPlaylist( Lobby_GetSelectedPlaylist() ) ? 1 : 0
	SendMenuGladCardPreviewCommand( eGladCardPreviewCommandType.RANKED_SHOULD_SHOW, rankShouldShow, null )
	SendMenuGladCardPreviewCommand( eGladCardPreviewCommandType.RANKED_DATA, ladderPos, null, rankScore )
	SendMenuGladCardPreviewCommand( eGladCardPreviewCommandType.RANKED_DATA_PREV, ladderPosPrev, null, rankScorePrev )                            
}


int function SharedRanked_GetMatchmakingDelayFromCommunityUserInfo( CommunityUserInfo userInfo )
{
	return userInfo.banSeconds
}


int function SharedRanked_GetUIPlayerMatchmakingDelay()
{
	string playerHardware = GetPlayerHardware()
	if ( playerHardware == "" )                                                      
		return 0

	string playerUID = GetPlayerUID()
	if ( playerUID == "" )                                                        
		return 0

	CommunityUserInfo ornull userInfo = GetUserInfo( GetPlayerHardware(), GetPlayerUID() )
	if ( userInfo == null )
		return 0

	expect CommunityUserInfo( userInfo  )

	return SharedRanked_GetMatchmakingDelayFromCommunityUserInfo( userInfo )
}


int function SharedRanked_GetMaxPartyMatchmakingDelay()
{
	Party party    = GetParty()
	int currentMax = -1

	if ( party.members.len() == 0 )
	{
		                                                                                         
		currentMax = SharedRanked_GetUIPlayerMatchmakingDelay()
	}
	else
	{
		foreach ( member in party.members )
		{
			CommunityUserInfo ornull userInfoOrNull = GetUserInfo( member.hardware, member.uid )

			if ( userInfoOrNull != null )
			{
				CommunityUserInfo userInfo = expect CommunityUserInfo(userInfoOrNull)

				int delay = SharedRanked_GetMatchmakingDelayFromCommunityUserInfo( userInfo )

				                                                              

				if ( delay > currentMax )
				{
					currentMax = delay
				}
			}
		}
	}

	return currentMax
}


bool function Ranked_ManageDialogFlow( bool rankedSplitChangeAudioPlayed = false )
{
	bool result = false

	if ( Ranked_HasRankedPeriodMarkedForRewardAcknowledgement() )
	{
		string earliestRankedPeriod = Ranked_GetRankedPeriodToAcknowledgReward()
		Remote_ServerCallFunction( "ClientCallback_rankedPeriodRewardAcknowledged", earliestRankedPeriod )
		Ranked_MarkRankedRewardsGivenNotified( earliestRankedPeriod )

		ItemFlavor rankedPeriodToAcknowledgeReward                      = GetItemFlavorByGUID( ConvertItemFlavorGUIDStringToGUID( earliestRankedPeriod ) )
		ItemFlavor followingRankedPeriod                                = expect ItemFlavor( GetFollowingRankedPeriod( rankedPeriodToAcknowledgeReward ) )
		SharedRankedDivisionData rankedDivisionForFollowingRankedPeriod = Ranked_GetNewDivisionForNewSeasonOrSplitReset( GetLocalClientPlayer(), followingRankedPeriod, false )

		Assert( IsPersistenceAvailable() )
		string unlockMessage = Localize( "#RANKED_REWARDS_GIVEN_DIALOG_MESSAGE", Localize( ItemFlavor_GetShortName( rankedPeriodToAcknowledgeReward ) ),
		Localize( rankedDivisionForFollowingRankedPeriod.divisionName ), Localize( ItemFlavor_GetShortName( followingRankedPeriod ) ) )

		if( !rankedSplitChangeAudioPlayed )
			PlayLobbyCharacterDialogue( "glad_rankNewSeason", 1.7 )                      

		PromoDialog_OpenHijackedUM( Localize( "#RANKED_REWARDS_GIVEN_DIALOG_HEADER" ), unlockMessage, "ranked_rewards" )
		IncrementNumDialogFlowDialogsDisplayed()

		DialogFlow_DidCausePotentiallyInterruptingPopup()

		result = true
	}
	else if ( Ranked_NeedToNotifySplitReset() )
	{
		string rankedSplitResetAcknowledgePersistenceField = Ranked_GetSplitResetAcknowledgePersistenceField()
		SetDialogFlowPersistenceTables( "starterAcknowledged", true )
		Remote_ServerCallFunction( "ClientCallback_rankedSplitResetAcknowledged" )

		ItemFlavor ornull activeRankedPeriod = GetActiveRankedPeriodByType( GetUnixTimestamp(), eItemType.calevent_rankedperiod )
		expect ItemFlavor ( activeRankedPeriod )
		Assert( SharedRankedPeriod_HasSplits( activeRankedPeriod ) && SharedRankedPeriod_IsSecondSplitActive( activeRankedPeriod ) )
		SharedRankedDivisionData newRankedDivisionAfterSplit = GetCurrentRankedDivisionFromScore( GetPlayerRankScore( GetLocalClientPlayer() ) )
		string resetMessage                                  = Localize( "#RANKED_SPLIT_RESET_DIALOG_MESSAGE", Localize( newRankedDivisionAfterSplit.divisionName ) )

		if( !rankedSplitChangeAudioPlayed )
			PlayLobbyCharacterDialogue( "glad_rankNewSplit", 1.7 )                       

		PromoDialog_OpenHijackedUM( Localize( "#RANKED_SPLIT_RESET_DIALOG_HEADER" ), resetMessage, "ranked_split" )
		IncrementNumDialogFlowDialogsDisplayed()

		DialogFlow_DidCausePotentiallyInterruptingPopup()

		result = true
	}

	return result
}


bool function Ranked_HasRankedPeriodMarkedForRewardAcknowledgement()
{
	if ( IsFeatureSuppressed( eFeatureSuppressionFlags.RANKED_DIALOG ) )
		return false

	string earliestRankedPeriod = Ranked_EarliestRankedPeriodWithRewardsNotAcknowledged()
	if ( earliestRankedPeriod == "" )
		return false

	                                                         
	ItemFlavor rankedPeriodToAcknowledgeReward = GetItemFlavorByGUID( ConvertItemFlavorGUIDStringToGUID( earliestRankedPeriod ) )
	ItemFlavor ornull followingRankedPeriod    = GetFollowingRankedPeriod( rankedPeriodToAcknowledgeReward )

	if ( followingRankedPeriod == null )
		return false

	file.rankedPeriodToAcknowledgeRewards = earliestRankedPeriod
	return true
}


string function Ranked_GetRankedPeriodToAcknowledgReward()
{
	return file.rankedPeriodToAcknowledgeRewards
}

string function Ranked_EarliestRankedPeriodWithRewardsNotAcknowledged()
{
	string rankedPeriodResult = ""

	if ( !IsPersistenceAvailable() )
		return rankedPeriodResult

	int previousPeriodFinishTime = 0                                                                      

	foreach ( ItemFlavor rankedPeriod in GetAllRankedPeriodFlavorsByType( eItemType.calevent_rankedperiod ) )
	{
		int rankedPeriodFinishTime = CalEvent_GetFinishUnixTime( rankedPeriod )
		Assert( previousPeriodFinishTime < rankedPeriodFinishTime )

		if ( rankedPeriodFinishTime > GetUnixTimestamp() )                                              
			continue

		previousPeriodFinishTime = rankedPeriodFinishTime
		string rankedPeriodGUID = ItemFlavor_GetGUIDString( rankedPeriod )

		entity uiPlayer = GetLocalClientPlayer()

		int numberOfRankedGames = GetStat_Int( uiPlayer, ResolveStatEntry( CAREER_STATS.rankedperiod_games_played, rankedPeriodGUID ) )

		if ( numberOfRankedGames == 0 )                                                                                                            
			continue

		if ( Ranked_NeedToCheckWithStryderForEndRankedSplitOrPeriod( uiPlayer, rankedPeriodGUID ) )
		{
			if ( Ranked_GetHistoricalLadderPosition( uiPlayer, rankedPeriodGUID ) == 0 )                                                                   
				continue
		}

		var wasAwardsAcknowledged = Ranked_GetHistoricalRankedPersistenceData( uiPlayer, "rankedRewardsAcknowledged", rankedPeriodGUID )                                                                                                                                                                     

		if ( wasAwardsAcknowledged == null )
			continue

		expect bool ( wasAwardsAcknowledged  )

		if ( wasAwardsAcknowledged )
			continue

		if ( Ranked_HasNotifiedRankedRewardsGiven( rankedPeriodGUID ) )
			continue

		rankedPeriodResult = rankedPeriodGUID
		break
	}

	return rankedPeriodResult
}


bool function Ranked_NeedToNotifySplitReset()
                                                                                                       
{
	if ( !IsPersistenceAvailable() )
		return false

	if( IsFeatureSuppressed( eFeatureSuppressionFlags.RANKED_SPLIT_DIALOG ) )
		return false

	ItemFlavor ornull activeRankedPeriod = GetActiveRankedPeriodByType( GetUnixTimestamp(), eItemType.calevent_rankedperiod )

	if ( activeRankedPeriod == null )
		return false

	expect ItemFlavor( activeRankedPeriod  )

	if ( !SharedRankedPeriod_HasSplits( activeRankedPeriod ) )
		return false

	if ( SharedRankedPeriod_IsFirstSplitActive( activeRankedPeriod ) )
		return false

	if ( !SharedRankedPeriod_IsSecondSplitActive( activeRankedPeriod ) )
		return false

	bool hasRankedSplitOccured = bool( GetRankedPersistenceData( GetLocalClientPlayer(), "hasSplitResetOccured" ) )
	if ( !hasRankedSplitOccured )
		return false

	if ( GetCurrentPlaylistVarBool( "ranked_end_series_stryder_check", true ) )
	{
		if ( Ranked_GetHistoricalLadderPosition( GetLocalClientPlayer(), ItemFlavor_GetGUIDString( activeRankedPeriod ), true ) == 0 )                                                                   
			return false
	}

	string rankedPeriodGUID                       = ItemFlavor_GetGUIDString( activeRankedPeriod )
	string historicalPersistenceFieldAcknowledged = "allRankedData[" + rankedPeriodGUID + "]." + "splitResetAcknowledged"

	file.rankedSplitResetAcknowledgePersistenceField = historicalPersistenceFieldAcknowledged

	return (GetDialogFlowTablesValueOrPersistence( historicalPersistenceFieldAcknowledged, 9999 ) == false)
}


string function Ranked_GetSplitResetAcknowledgePersistenceField()
{
	return file.rankedSplitResetAcknowledgePersistenceField
}


bool function IsRankedPlaylist( string playlist )
{
	return GetPlaylistVarBool( playlist, "is_ranked_game", false )
}


bool function Ranked_ShouldUpdateWithComnunityUserInfo( int score, int ladderPosition )
{
	SharedRankedDivisionData data = GetCurrentRankedDivisionFromScoreAndLadderPosition( score, ladderPosition )
	if ( data.emblemDisplayMode ==  emblemDisplayMode.DISPLAY_LADDER_POSITION && ladderPosition == SHARED_RANKED_INVALID_LADDER_POSITION )
		return true

	if ( Ranked_HasActiveLadderOnlyDivision() )
	{
		SharedRankedTierData rankedTier = data.tier
		if ( Ranked_GetNextTierData( rankedTier ) != null )
			return false
		else
			return ( Ranked_GetActiveLadderOnlyDivisionData().scoreMin <= score )
	}

	return false
}


bool function SharedRanked_PartyHasRankedLevelAccess()
{
	if ( !IsFullyConnected() )
		return false

	if ( GetCurrentPlaylistVarBool( "ranked_dev_playtest", false ) )
		return true

	Party party = GetParty()
	if ( party.members.len() == 0 )
	{
		if ( IsPersistenceAvailable() )
			return GetAccountLevelForXP( GetPersistentVarAsInt( "xp" ) ) >= SHARED_RANKED_LEVEL_REQUIREMENT
		else
			return false
	}

	bool allPartyMembersMeetRankedLevelRequirement = true

	foreach ( member in party.members )
	{
		CommunityUserInfo ornull userInfoOrNull = GetUserInfo( member.hardware, member.uid )

		if ( userInfoOrNull != null )
		{
			CommunityUserInfo userInfo = expect CommunityUserInfo(userInfoOrNull)

			if ( userInfo.charData[ePlayerStryderCharDataArraySlots.ACCOUNT_LEVEL] < SHARED_RANKED_LEVEL_REQUIREMENT )
			{
				allPartyMembersMeetRankedLevelRequirement = false
				break
			}
		}
		else
		{
			allPartyMembersMeetRankedLevelRequirement = false
			break
		}
	}

	return allPartyMembersMeetRankedLevelRequirement
}


bool function Ranked_PartyMeetsRankedDifferenceRequirements()
{
	if ( !IsFullyConnected() )
		return false

	if ( GetCurrentPlaylistVarBool( "ranked_dev_playtest", false ) )
		return true

	if ( GetCurrentPlaylistVarBool( "ranked_ignore_party_rank_difference", false ) )
		return true

	Party party = GetParty()
	if ( party.members.len() == 0 )
		return true

	bool allPartyMembersMeetRankedDifferenceRequirements = true

	foreach ( member in party.members )
	{
		CommunityUserInfo ornull userInfoOrNull = GetUserInfo( member.hardware, member.uid )

		if ( userInfoOrNull != null )
		{
			CommunityUserInfo userInfo = expect CommunityUserInfo(userInfoOrNull)

			int rankedTierThresholdIndex = Ranked_GetTierOfThresholdForRankedPartyDifferences()

			SharedRankedTierData tierData = GetCurrentRankedDivisionFromScore( userInfo.rankScore ).tier
			if ( tierData.index < rankedTierThresholdIndex )
			{
				continue
			}
			else
			{
				foreach ( partyMember in party.members )                                                                              
				{
					if ( partyMember.hardware == member.hardware && partyMember.uid == member.uid )
						continue

					CommunityUserInfo ornull partyMemberUserInfo = GetUserInfo( partyMember.hardware, partyMember.uid )
					if ( partyMemberUserInfo == null )
					{
						allPartyMembersMeetRankedDifferenceRequirements = false
						break
					}

					expect CommunityUserInfo( partyMemberUserInfo )

					SharedRankedTierData partyMemberTierData = GetCurrentRankedDivisionFromScore( partyMemberUserInfo.rankScore ).tier

					if ( abs( partyMemberTierData.index - tierData.index ) > 1 )
					{
						allPartyMembersMeetRankedDifferenceRequirements = false
						break
					}
				}

				if ( !allPartyMembersMeetRankedDifferenceRequirements )
					break
			}
		}
		else
		{
			allPartyMembersMeetRankedDifferenceRequirements = false
			break
		}
	}

	return allPartyMembersMeetRankedDifferenceRequirements

}


bool function Ranked_HasBeenInitialized()
{
	if ( !IsFullyConnected() )
		return false

	if ( !IsPersistenceAvailable() )
		return false

	#if DEV
		                                                                                                                 
		if ( GetBugReproNum() == 9000  )
		{
			if ( GetAccountLevelForXP( GetPersistentVarAsInt( "xp" ) ) < 150 )                                        
				return false
		}
	#endif          

	if ( GetCurrentPlaylistVarBool( "ranked_dev_playtest", false ) )
		return true

	if ( GetCurrentPlaylistVarBool( "ranked_ignore_intialization_check", false ) )
		return true

	ItemFlavor ornull activeRankedPeriod = GetActiveRankedPeriodByType( GetUnixTimestamp(), eItemType.calevent_rankedperiod )
	if ( activeRankedPeriod == null )                                                        
		return true

	expect ItemFlavor ( activeRankedPeriod )

	entity uiPlayer = GetLocalClientPlayer()

	if ( bool( GetRankedPersistenceData( uiPlayer, "rankedInitialized" ) ) == false )
		return false

	if ( SharedRankedPeriod_HasSplits( activeRankedPeriod ) )
	{
		if ( GetCurrentPlaylistVarBool( "ranked_end_series_stryder_check", true ) )                                                                                                                                                             
		{
			if ( SharedRankedPeriod_IsSecondSplitActive( activeRankedPeriod ) && GetRankedPersistenceData( uiPlayer, "endFirstSplitLadderPosition" ) == 0 )
				return false
		}
	}

	return true

}


void function ServerToUI_Ranked_NotifyRankedPeriodScoreChanged()
{
	thread ServerToUI_Ranked_NotifyRankedPeriodScoreChanged_threaded()
}


void function ServerToUI_Ranked_NotifyRankedPeriodScoreChanged_threaded()
{
	Signal( uiGlobal.signalDummy, "Ranked_NotifyRankedPeriodScoreChanged" )                                                                
	EndSignal( uiGlobal.signalDummy, "Ranked_NotifyRankedPeriodScoreChanged" )

	WaitEndFrame()
	thread TryRunDialogFlowThread()
}


bool function Ranked_HasNotifiedRankedRewardsGiven( string rankedPeriodGUID )
{
	return (rankedPeriodGUID in file.rankedPeriodsWithRewardsNotified)
}


void function Ranked_MarkRankedRewardsGivenNotified( string rankedPeriodGUID )
                                                                                                                                                                  
{
	if ( rankedPeriodGUID in file.rankedPeriodsWithRewardsNotified )
		return

	file.rankedPeriodsWithRewardsNotified[ rankedPeriodGUID  ] <- true
}


void function Ranked_ConstructSingleRankBadgeForStatsCard( var badgeRui, entity player, string rankedPeriodRef )
{
	int score                     = Ranked_GetHistoricalRankScore( player, rankedPeriodRef )
	SharedRankedDivisionData data = Ranked_GetHistoricalRankedDivisionFromScore( score, rankedPeriodRef )

	if ( rankedPeriodRef == GetCurrentStatRankedPeriodRefOrNullByType( eItemType.calevent_rankedperiod ) )
	{
		PopulateRuiWithRankedBadgeDetails( badgeRui, score, Ranked_GetLadderPosition( GetLocalClientPlayer() ) )
	}
	else
	{
		int historicalLadderPosition = Ranked_GetHistoricalLadderPosition( player, rankedPeriodRef, false )
		PopulateRuiWithHistoricalRankedBadgeDetails( badgeRui, score, historicalLadderPosition, rankedPeriodRef )
	}

	RuiSetInt( badgeRui, "score", score )
	RuiSetInt( badgeRui, "scoreMax", 0 )
	RuiSetFloat( badgeRui, "scoreFrac", 1.0 )
	RuiSetString( badgeRui, "rankName", data.divisionName )
}


void function Ranked_ConstructDoubleRankBadgeForStatsCard( var firstSplitBadgeRui, var secondSplitBadgeRui, entity player, string rankedPeriodRef )
{
	ItemFlavor rankedPeriodItemFlavor = GetItemFlavorByGUID( ConvertItemFlavorGUIDStringToGUID( rankedPeriodRef ) )
	var settingBlockForPeriod = ItemFlavor_GetSettingsBlock ( rankedPeriodItemFlavor )
	bool rewardOnHighestWatermark = GetSettingsBlockBool ( settingBlockForPeriod , "rewardOnHighestWatermark" )

	int firstSplitScore                        = Ranked_GetHistoricalFirstSplitRankScore( player, rankedPeriodRef, rewardOnHighestWatermark )
	SharedRankedDivisionData firstSplitDivData = Ranked_GetHistoricalRankedDivisionFromScore( firstSplitScore, rankedPeriodRef )
	int firstSplitLadderPos                    = Ranked_GetHistoricalLadderPosition( player, rankedPeriodRef, true )

	PopulateRuiWithHistoricalRankedBadgeDetails( firstSplitBadgeRui, firstSplitScore, firstSplitLadderPos, rankedPeriodRef )
	RuiSetInt( firstSplitBadgeRui, "score", firstSplitScore )
	RuiSetInt( firstSplitBadgeRui, "scoreMax", 0 )
	RuiSetFloat( firstSplitBadgeRui, "scoreFrac", 1.0 )
	RuiSetString( firstSplitBadgeRui, "rankName", firstSplitDivData.divisionName )

	int secondSplitSplitScore                   = Ranked_GetHistoricalRankScore( player, rankedPeriodRef , rewardOnHighestWatermark)
	SharedRankedDivisionData secondSplitDivData = Ranked_GetHistoricalRankedDivisionFromScore( secondSplitSplitScore, rankedPeriodRef )

	if ( rankedPeriodRef == GetCurrentStatRankedPeriodRefOrNullByType( eItemType.calevent_rankedperiod ) )
	{
		PopulateRuiWithRankedBadgeDetails( secondSplitBadgeRui, secondSplitSplitScore, Ranked_GetLadderPosition( GetLocalClientPlayer() ) )
	}
	else
	{
		int historicalLadderPosition = Ranked_GetHistoricalLadderPosition( player, rankedPeriodRef, false )
		PopulateRuiWithHistoricalRankedBadgeDetails( secondSplitBadgeRui, secondSplitSplitScore, historicalLadderPosition, rankedPeriodRef )
	}

	RuiSetInt( secondSplitBadgeRui, "score", secondSplitSplitScore )
	RuiSetInt( secondSplitBadgeRui, "scoreMax", 0 )
	RuiSetFloat( secondSplitBadgeRui, "scoreFrac", 1.0 )
	RuiSetString( secondSplitBadgeRui, "rankName", secondSplitDivData.divisionName )
}
#endif     


#if CLIENT || UI
void function PopulateRuiWithRankedBadgeDetails( var rui, int rankScore, int ladderPosition, bool isNested = false )
{
	SharedRankedDivisionData currentRank = GetCurrentRankedDivisionFromScoreAndLadderPosition( rankScore, ladderPosition )
	                                                       
	SharedRankedTierData currentTier     = currentRank.tier
	RuiSetImage( rui, "rankedIcon", currentTier.icon )
	if ( currentTier.isLadderOnlyTier )                                                      
	{
		SharedRankedTierData tierByScore = GetCurrentRankedDivisionFromScore( rankScore ).tier
		RuiSetInt( rui, "rankedIconState", tierByScore.index + 1 )
	}
	else
	{
		RuiSetInt( rui, "rankedIconState", currentTier.index )
	}

	SharedRanked_FillInRuiEmblemText( rui, currentRank, rankScore, ladderPosition )

	if ( !isNested )
	{
		RuiDestroyNestedIfAlive( rui, "rankedBadgeHandle" )
		CreateNestedRankedRui( rui, currentRank.tier, "rankedBadgeHandle", rankScore, ladderPosition )
	}
}

void function PopulateRuiWithPreviousSeasonRankedBadgeDetails( var rui, int rankScore, int ladderPosition, bool isNested = false )
{
	SharedRankedDivisionData currentRank = GetCurrentRankedDivisionFromScoreAndLadderPosition( rankScore, ladderPosition )
	                                                       
	SharedRankedTierData currentTier     = currentRank.tier
	RuiSetImage( rui, "rankedIconPrev", currentTier.icon )
	if ( currentTier.isLadderOnlyTier )                                                      
	{
		SharedRankedTierData tierByScore = GetCurrentRankedDivisionFromScore( rankScore ).tier
		RuiSetInt( rui, "rankedIconStatePrev", tierByScore.index + 1 )
	}
	else
	{
		RuiSetInt( rui, "rankedIconStatePrev", currentTier.index )
	}

	SharedRanked_FillInRuiEmblemText( rui, currentRank, rankScore, ladderPosition, "Prev" )

	if ( !isNested )
	{
		RuiDestroyNestedIfAlive( rui, "rankedBadgeHandlePrev" )
		CreateNestedRankedRui( rui, currentRank.tier, "rankedBadgeHandlePrev", rankScore, ladderPosition )
	}
}


void function PopulateRuiWithHistoricalRankedBadgeDetails( var rui, int rankScore, int ladderPosition, string rankedSeasonGUID, bool isNested = false )
{
	SharedRankedDivisionData historicalRank = Ranked_GetHistoricalRankedDivisionFromScoreAndLadderPosition( rankScore, ladderPosition, rankedSeasonGUID )
	SharedRankedTierData historicalTier     = historicalRank.tier
	RuiSetImage( rui, "rankedIcon", historicalTier.icon )
	                                                           

	if ( historicalTier.isLadderOnlyTier )                                                      
	{
		SharedRankedTierData tierByScore = Ranked_GetHistoricalRankedDivisionFromScore( rankScore, rankedSeasonGUID ).tier
		RuiSetInt( rui, "rankedIconState", tierByScore.index + 1 )
	}
	else
	{
		RuiSetInt( rui, "rankedIconState", historicalTier.index )
	}

	SharedRanked_FillInRuiEmblemText( rui, historicalRank, rankScore, ladderPosition )

	if ( !isNested )
	{
		RuiDestroyNestedIfAlive( rui, "rankedBadgeHandle" )
		CreateNestedHistoricalRankedRui( rui, historicalRank.tier, rankedSeasonGUID, "rankedBadgeHandle", rankScore, ladderPosition )
	}
}


var function CreateNestedRankedRui( var pRui, SharedRankedTierData tier, string varName, int score, int ladderPosition )
{
	var rui = RuiCreateNested( pRui, varName, tier.iconRuiAsset )

	PopulateRuiWithRankedBadgeDetails( rui, score, ladderPosition, true )

	return rui
}


var function CreateNestedHistoricalRankedRui( var pRui, SharedRankedTierData tier, string rankedSeasonGUID, string varName, int score, int ladderPosition )
{
	var rui = RuiCreateNested( pRui, varName, tier.iconRuiAsset )

	PopulateRuiWithHistoricalRankedBadgeDetails( rui, score, ladderPosition, rankedSeasonGUID, true )

	return rui
}


void function SharedRanked_FillInRuiEmblemText( var rui, SharedRankedDivisionData divData, int rankScore, int ladderPosition, string ruiArgumentPostFix = "" )
{
	RuiSetInt( rui, "emblemDisplayMode" + ruiArgumentPostFix, divData.emblemDisplayMode )
	switch( divData.emblemDisplayMode )
	{
		case emblemDisplayMode.DISPLAY_DIVISION:
		{
			RuiSetString( rui, "emblemText" + ruiArgumentPostFix, divData.emblemText )
			break
		}

		case emblemDisplayMode.DISPLAY_RP:
		{
			string rankScoreShortened = FormatAndLocalizeNumber( "1", float( rankScore ), IsTenThousandOrMore( rankScore ) )
			RuiSetString( rui, "emblemText" + ruiArgumentPostFix, Localize( "#RANKED_POINTS_GENERIC", rankScoreShortened ) )
			break
		}

		case emblemDisplayMode.DISPLAY_LADDER_POSITION:
		{
			string ladderPosShortened
			if ( ladderPosition == SHARED_RANKED_INVALID_LADDER_POSITION )
				ladderPosShortened = ""
			else
				ladderPosShortened = Localize( "#RANKED_LADDER_POSITION_DISPLAY", FormatAndLocalizeNumber( "1", float( ladderPosition ), IsTenThousandOrMore( ladderPosition ) ) )

			RuiSetString( rui, "emblemText" + ruiArgumentPostFix, ladderPosShortened )
			break
		}

		case emblemDisplayMode.NONE:
		default:
		{
			RuiSetString( rui, "emblemText" + ruiArgumentPostFix, "" )
			break
		}
	}
}
#endif                


#if UI
SharedRankedDivisionData function GetRankedDivisionData( int rankScore, int ladderPosition, string rankedPeriodGUID )
{
	ItemFlavor rankedPeriodItemFlavor = GetItemFlavorByGUID( ConvertItemFlavorGUIDStringToGUID( rankedPeriodGUID ) )
	int rankedPeriodItemType          = ItemFlavor_GetType( rankedPeriodItemFlavor )

	Assert( rankedPeriodItemType == eItemType.calevent_rankedperiod || rankedPeriodItemType == eItemType.calevent_arenas_ranked_period )

	bool isRankedPeriodActive = rankedPeriodGUID == GetCurrentStatRankedPeriodRefOrNullByType( rankedPeriodItemType )
	SharedRankedDivisionData division

	if ( rankedPeriodItemType == eItemType.calevent_rankedperiod )
	{
		if ( isRankedPeriodActive )
			division = GetCurrentRankedDivisionFromScoreAndLadderPosition( rankScore, ladderPosition )
		else
			division = Ranked_GetHistoricalRankedDivisionFromScoreAndLadderPosition( rankScore, ladderPosition, rankedPeriodGUID )
	}
	else                                           
	{
		if ( isRankedPeriodActive )
			division = GetCurrentArenasRankedDivisionFromScoreAndLadderPosition( rankScore, ladderPosition )
		else
			division = ArenasRanked_GetHistoricalRankedDivisionFromScoreAndLadderPosition( rankScore, ladderPosition, rankedPeriodGUID )
	}

	return division
}

string function GetRankEmblemText( SharedRankedDivisionData division, int rankScore, int ladderPosition )
{
	switch ( division.emblemDisplayMode )
	{
		case emblemDisplayMode.DISPLAY_DIVISION:
			return Localize( division.emblemText )

		case emblemDisplayMode.DISPLAY_RP:
		{
			string rankScoreShortened = FormatAndLocalizeNumber( "1", float( rankScore ), IsTenThousandOrMore( rankScore ) )
			return Localize( "#RANKED_POINTS_GENERIC", rankScoreShortened )
		}

		case emblemDisplayMode.DISPLAY_LADDER_POSITION:
		{
			string ladderPosShortened
			if ( ladderPosition == SHARED_RANKED_INVALID_LADDER_POSITION )
				ladderPosShortened = ""
			else
				ladderPosShortened = Localize( "#RANKED_LADDER_POSITION_DISPLAY", FormatAndLocalizeNumber( "1", float( ladderPosition ), IsTenThousandOrMore( ladderPosition ) ) )

			return ladderPosShortened
		}

		case emblemDisplayMode.NONE:
		default:
			return ""
	}

	unreachable
}
#endif      