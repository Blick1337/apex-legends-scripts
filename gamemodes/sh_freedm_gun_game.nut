                       
                                                                                                   
                                                                                      

global function GunGame_Init
global function IsGunGameActive
global function GunGame_GetPlayerScore
global function GunGame_IsPlayerAhead
#if DEV
#if SERVER
                                           
                                       
                                        
                                       
#endif
#endif

#if CLIENT
global function ServerCallback_AnnounceScored
global function ServerCallback_AnnounceLostPoint
global function ServerCallback_AnnounceWeaponSkip
global function ServerCallback_UpdateWeaponPreviews
global function ServerCallback_GunGame_SetSummaryScreen

global function GunGame_PopulateSummaryDataStrings

global function GunGame_IsTeamWinning
#endif

global const string GUNGAME_SQUAD_WEAPON_INDEX = "FreeDM_WeaponIndexSquad_"
global const string GUNGAME_THROWING_KNIFE_WEAPON_NAME = "mp_weapon_throwingknife"
const string GUNGAME_PLAYERSCORE = "GunGame_PlayerScore"
const int GUNGAME_WEAPON_SKIP_NUM_DEATHS = 3

#if CLIENT
const string GUNGAME_PROMOTION_SOUND = "UI_InGame_GunGame_Promotion"
const string GUNGAME_DEMOTION_SOUND = "UI_InGame_GunGame_Demotion"
const string GUNGAME_FINAL_WEAPON_SOUND = "UI_InGame_GunGame_Leader"
#endif

struct WeightedRef
{
	string ref = ""
	float weight = 1.0
}

struct
{
#if SERVER
	                        

	                               
	                                    
#endif

#if CLIENT
	string     announceOnRespawnMsg = ""
	string	   playSoundOnRespawn = ""
	int        currentWeaponNumber = 0
	int		   weaponPreviewLootIndexPrev = 0
	int        weaponPreviewLootIndex0 = 0
	int        weaponPreviewNumber0 = 0
	int        weaponPreviewLootIndex1 = 0
	int        weaponPreviewNumber1 = 0
	array<var> scorePipRUIs
	array<entity> connectedSquadMembers
	var		   gamemodeRUI = null

	bool hasPlayedFinalWeaponSound = false
#endif
} file

                                                       
                                                                                                                                                     
                                                                                      
#if SERVER
                              
	          
 
#endif

void function GunGame_Init()
{
	if( !IsGunGameActive() )
		return

#if SERVER
	              
	                                                                                 

	                                            
	                                            
	                                                          
	                                              
	                                                                                 

	                                                      
#endif

                       
		#if SERVER
			                                                                  
		#endif              
                                 

	                                   
	Remote_RegisterClientFunction( "ServerCallback_AnnounceScored", "int", 0, 512 )
	                         
	Remote_RegisterClientFunction( "ServerCallback_AnnounceLostPoint", "entity" )
	Remote_RegisterClientFunction( "ServerCallback_AnnounceWeaponSkip", "int", 0, 512 )
	                                                                                                              
	Remote_RegisterClientFunction( "ServerCallback_UpdateWeaponPreviews", "int", 0, 256, "int", 0, 512, "int", -1, 256, "int", 0, 512, "int", -1, 256 )
	Remote_RegisterClientFunction( "ServerCallback_GunGame_SetSummaryScreen" )

	for( int i = 0; i < MAX_TEAMS; ++i )
		RegisterNetworkedVariable( GUNGAME_SQUAD_WEAPON_INDEX + i, SNDC_GLOBAL, SNVT_INT, -1 )

	RegisterNetworkedVariable( GUNGAME_PLAYERSCORE, SNDC_PLAYER_GLOBAL, SNVT_INT, 0 )

#if CLIENT
	AddCallback_LocalClientPlayerSpawned( Client_OnPlayerSpawned )
	AddCallback_OnPlayerChangedTeam( Client_OnTeamChanged )
	AddCallback_OnSelectedWeaponChanged( GunGame_OnSelectedWeaponChanged )

	CircleBannerAnnouncementsEnable( false )
	FreeDM_SetDisplayScoreThread( DisplayGunGameScore_thread )
	FreeDM_SetScoreboardSetupFunc( GunGame_ScoreboardSetup() )

	AddCallback_GameStateEnter( eGameState.Prematch, GunGame_OnPlayerGameStateEntered )
	AddCallback_GameStateEnter( eGameState.PickLoadout, GunGame_OnPlayerGameStateEntered )
#endif
}

#if SERVER

                               
 
	                                                                                           
	                 

	                                                                                   
		      

	                                                                        

	                                    
		                                                                 
 

                                                                                        
                               
 
	             	                                               
	           		                                   
	                                                                   

	                       
	                                                                    
	                          

	                                                                                       
	                                                                                          

	                                  
	 
		                                      
			     

		                     
		                                                                                        
		                    
			                                                                 

		                                          
		 
			                    
		 
		                                   
		 
			                                                                  
		 
		    
		 
			                                                                 
			        
		 

		                      
		 
			                                                                          
			        
		 

		                                   
		                                                    

	       
		                                                                 
	      

	 

	                                                                                                                
	                                                             
	 
		                                                                   
		       
			                                                                                         
		      
		                                       
	 
 

                                                                                            
                                                             
 
	             	                                                 
	           		                                   
	                                                                      
	                                                                    
	                                                                 

	                                                

	                        
	                          
	                                  
	 
		                                                                        
		                     
		 
			                                             
			 
				                                       
				 
					                                                                                                              
					                         
						                                                                       
					    
						                                           
				 
				    
					                                                                                                                            
			 

			               
			                       
		 
		                             
		 
			                  
			                                                                              
			                                                            
			                        
		 
		    
		 
			                                                                                                
		 
	 

	                                             
	 
		                                       
		 
			                                                                                                              
			                         
				                                                                       
			    
				                                           
		 
		    
			                                                                                                                            
	 

	                   
 

                                                                          
 
	                                                                                           
	                          

	                                       
	 
		                                                
		                       
		 
			                                                                             
			        
		 

		                  
		                      
		                                  
		                        
	 

	              
 

                                                                                     
 
	                       
	                               

	                      
	 
		                                                        
		                                                          
			        

		                         
		                          
	 

	                             
	 
		                                               
		         
	 

	                                          
	                        
	                              
	 
		                          
		                             
			              
	 

	           
 

                                                                              
 
	                          
	 
		                                              
		      
	 

	                          
	 
		                                                     
		      
	 

	                                       

	                     
	                                                  
	                       
	 
		                                       
		                            
		 
			                                                                      
			                                                                    
				                                                     

			                                                     

			                               
		 
	 

	                                       
	                                    
		      

	                                                                    
	                                                                                                        
	 
		                                                         
	 
 

                                                              
 
	                                                                 
		      

	                          
	 
		                                              
		      
	 

	                                       

	                                       
	                                    
		      

	                                                                    
	                                                                       
		                                                         
 

                                                                                     
 
	                                       
	                                            
	                                          

	                                       
	                                    
		      

	                                                             
	 
		                                                   
		                                                                   
		                                    

		                             
		
		                                              
		                                                                                                         

		                                                                                                                                             
		                                                                                                     
			                                                       
		    
			                                           

		                                                                            

		                                                       
		 
			                                                               
			                                                                                       
		 

		                                                                 
		                                             
		 
			                                                                    
			                              

			                                                      
			 
				                             
					        

				                                     
			 
		 

		                       
	 
 

                      
                                                                                       
 
	                                                                                  
 
      

                                                           
 
	                                                                               
		      

	                                     
	                                                                      

	                                                                        

	                           
	                           
	                                                      
	 
		                                                                                                
			                                                      
	 

	                                              
	                                     
	 
		                                                            
		                              

		                                                      
		 
			                           
				        

			                                     
		 
	 

	                                                                                  
 

                                                                                             
 
	                                                                            
	 
		                                        
		 
			                                                                           
				           
		 
	 

	            
 

                                                
 
	                                              
	                                        
		      

	                                                               
		      

	                                                                                  

	                                                         
	                                                                               
 

                                                    
 
	                                    
		                                

	                                         
		                                     

	                      
 

                                           
 
	                                                  
	                                          

	                                         
	 
		                                                            
		                                    
	 

	                              

	                                       

	                                                   
	                                                                                                                                     
	                                                                         
	                                   
		                                                                

	                                                                                          
	                                    
		                                                


	                                                                   
	                                          
	 
		                                                         
		                                                                                         
		                                                                                      

		                                                        
			                                                                                                   
	 

	                                                                                           
	                                                                      
	 
		                                                                                                                                 
		 
			                                                                            
			 
				                                  
				                                                         

				                                     
				                                   
				 
					                                                             
					                                                               
					                                                                                         
				 
			 
		 
	 

	                     
 

                                          
 
	                           
	                                
 

                                                
 
	                                     

	                                              
	                                             
		      

	                                                                            
	                                                                                                
		                                      

	                                                                    

	                                                                                                                        

	                                                                                                                      
	                         
		                                                                                       

	                                                                                       
	                                            

	                                                                                                       
	                         
 

                                                                                                    
 
	                                                                                                                         
		      

	                                                                 
	                                              

	                                         
	                                     
 

                                                     
 
	                                 
	 
		                                   	             
		                                                          

		                                                                   

		                                                                                         
		                                                                                               
			                                          

		                                                     

		                                              
		 
			                                    
			                                         
			 
				                                                                
				 
					                                                                                
					                             
					                              
				 
			 
		 

		                                                                                                                                                                          
	 
 

                                               
 
	                                            
		                      
 

                            
 
	                                                                                  
	                                                                                              

	                                     
 

                                                                                 
 
	                                         
	                                          
	                                           

	                              
 

#endif          

#if CLIENT
void function ServerCallback_AnnounceScored( int lootIndex )
{
	Assert( SURVIVAL_Loot_IsLootIndexValid( lootIndex ) )

	LootData lootData = SURVIVAL_Loot_GetLootDataByIndex( lootIndex )
	string weaponName = GetWeaponInfoFileKeyField_GlobalString( lootData.baseWeapon, "shortprintname" )

	entity player = GetLocalViewPlayer()
	if( IsAlive( player ) )
	{
		AnnouncementMessageRight( player,Localize( "#GUNGAME_SCORED", weaponName ) )
		EmitSoundOnEntity( player, GUNGAME_PROMOTION_SOUND )
	}
	else
	{
		file.announceOnRespawnMsg = Localize( "#GUNGAME_SCORED", weaponName )
		file.playSoundOnRespawn = GUNGAME_PROMOTION_SOUND
	}
}

void function GunGame_OnPlayerGameStateEntered()
{
	foreach ( entity player in GetPlayerArray() )
	{
		if ( !IsValid( player ) )
			continue

		SetCustomPlayerInfo( player )
	}
}

void function ServerCallback_AnnounceWeaponSkip( int lootIndex )
{
	Assert( SURVIVAL_Loot_IsLootIndexValid( lootIndex ) )

	LootData lootData = SURVIVAL_Loot_GetLootDataByIndex( lootIndex )
	string weaponName = GetWeaponInfoFileKeyField_GlobalString( lootData.baseWeapon, "shortprintname" )

	entity player = GetLocalViewPlayer()
	if( IsAlive( player ) )
		AnnouncementMessageRight( player,Localize( "#GUNGAME_WEAPONSKIP", weaponName ) )
	else
		file.announceOnRespawnMsg = Localize( "#GUNGAME_WEAPONSKIP", weaponName )
}

void function ServerCallback_AnnounceLostPoint( entity attacker )
{
	Assert( IsValid( attacker ) )

	entity player = GetLocalViewPlayer()
	if( IsAlive( player ) )
	{
		AnnouncementMessageRight( player, Localize( "#GUNGAME_LOSTPOINT", attacker.GetPlayerName() ) )
		EmitSoundOnEntity( player, GUNGAME_DEMOTION_SOUND )
	}
	else
	{
		file.announceOnRespawnMsg = Localize( "#GUNGAME_LOSTPOINT", attacker.GetPlayerName() )
		file.playSoundOnRespawn = GUNGAME_DEMOTION_SOUND
	}
}

void function ServerCallback_UpdateWeaponPreviews( int currentWeaponNumber, int weapon0Index, int weapon0Number, int weapon1Index, int weapon1Number )
{
	file.currentWeaponNumber = currentWeaponNumber

	file.weaponPreviewLootIndexPrev = file.weaponPreviewLootIndex0

	if( SURVIVAL_Loot_IsLootIndexValid( weapon0Index ) )
		file.weaponPreviewLootIndex0 = weapon0Index

	file.weaponPreviewNumber0 = weapon0Number

	if( SURVIVAL_Loot_IsLootIndexValid( weapon1Index ) )
		file.weaponPreviewLootIndex1 = weapon1Index

	file.weaponPreviewNumber1 = weapon1Number
}

void function ServerCallback_GunGame_SetSummaryScreen()
{
	SetSummaryDataDisplayStringsCallback( GunGame_PopulateSummaryDataStrings )
}

void function GunGame_PopulateSummaryDataStrings( SquadSummaryPlayerData data )
{
	data.modeSpecificSummaryData[0].displayString = "#DEATH_SCREEN_SUMMARY_KILLS"
	data.modeSpecificSummaryData[1].displayString = "#DEATH_SCREEN_SUMMARY_ASSISTS"
	data.modeSpecificSummaryData[2].displayString = ""
	data.modeSpecificSummaryData[3].displayString = "#DEATH_SCREEN_SUMMARY_DAMAGE_DEALT"
	data.modeSpecificSummaryData[4].displayString = ""
	data.modeSpecificSummaryData[5].displayString = "#DEATH_SCREEN_SUMMARY_GUNGAME_DEMOTION_MELEE"
	data.modeSpecificSummaryData[6].displayString = ""
}

void function Client_OnPlayerSpawned( entity localPlayer )
{
	if( file.announceOnRespawnMsg != "" )
	{
		AnnouncementMessageRight( localPlayer, file.announceOnRespawnMsg )
		file.announceOnRespawnMsg = ""
	}

	if( file.playSoundOnRespawn != "" )
	{
		EmitSoundOnEntity( localPlayer, file.playSoundOnRespawn )
		file.playSoundOnRespawn = ""
	}
}

void function Client_OnTeamChanged( entity player, int oldTeam, int newTeam )
{
	if( !IsValid( player ) )
		return

	SetCustomPlayerInfo( player )
}

void function GunGame_OnSelectedWeaponChanged( entity selectedWeapon )
{
	if ( file.gamemodeRUI == null )
		return

	if ( !IsValid(selectedWeapon) || selectedWeapon == null || selectedWeapon.IsWeaponMelee())
		return

	entity localPlayer = GetLocalViewPlayer()
	bool isWeaponTypeUlt = false

	string weaponName = selectedWeapon.GetWeaponClassName()
	printt("weapon Ult name: " + weaponName)

	switch( weaponName )
	{
               
		case SNIPERULT_WEAPON_NAME:
      
		case MOUNTED_TURRET_WEAPON_NAME:
		case MOBILE_HMG_WEAPON_NAME:
		case MOUNTED_TURRET_PLACEABLE_WEAPON_NAME:
			isWeaponTypeUlt = true
			break
	}

	printt("weapon Ult : " + isWeaponTypeUlt)
	RuiSetBool( file.gamemodeRUI, "hasWeaponUltActive", isWeaponTypeUlt )
}

void function CreateNestedScoreRUIs( var scoreRui )
{
	const MAX_SCORE_RUIS = 25                                                      
	int maxScore = minint( GetCurrentPlaylistVarInt( "scorelimit", 25 ), MAX_SCORE_RUIS )

	for( int i = 0; i < maxScore; ++i )
	{
		var rui = RuiCreateNested( scoreRui, "scorePip" + i + "Handle", $"ui/gun_game_score_pip.rpak" )
		file.scorePipRUIs.append( rui )
	}
}

void function DisplayGunGameScore_thread()
{
	var rui = CreateCockpitPostFXRui( $"ui/gun_game_score.rpak", MINIMAP_Z_BASE + 10 )
	CreateNestedScoreRUIs( rui )

	file.gamemodeRUI = rui

	int convertedScoreLimit = int( GetCurrentPlaylistVarInt( "scorelimit", 30 ) / float( GetScorePerGun() ) )
	RuiSetInt( rui, "scoreLimit", convertedScoreLimit )
	RuiSetInt( rui, "scoreProgressLimit", GetScorePerGun() )

	int previousTopScore = 0

	while( GetGameState() < eGameState.WinnerDetermined )
	{
		foreach ( entity player in GetPlayerArray() )
		{
			if ( !IsValid( player ) )
				continue

			SetCustomPlayerInfo( player )
		}

		entity localPlayer = GetLocalViewPlayer()

		                             
		                            
		                             

		RuiSetInt( rui, "currentWeaponNumber", file.currentWeaponNumber + 1 )

		bool showWeapon0Connector = false
		bool showWeapon1Connector = false

		if( SURVIVAL_Loot_IsLootIndexValid( file.weaponPreviewLootIndexPrev ) )
		{
			LootData lootData = SURVIVAL_Loot_GetLootDataByIndex( file.weaponPreviewLootIndexPrev )
			RuiSetImage( rui, "weaponIconPrev", lootData.hudIcon )
		}
		if( SURVIVAL_Loot_IsLootIndexValid( file.weaponPreviewLootIndex0 ) )
		{
			LootData lootData = SURVIVAL_Loot_GetLootDataByIndex( file.weaponPreviewLootIndex0 )
			RuiSetImage( rui, "weaponIcon0", lootData.hudIcon )
			RuiSetInt( rui, "weaponTier0", lootData.tier )
		}
		RuiSetInt( rui, "weaponNumber0", file.weaponPreviewNumber0 + 1 )

		if( SURVIVAL_Loot_IsLootIndexValid( file.weaponPreviewLootIndex1 ) )
		{
			LootData lootData = SURVIVAL_Loot_GetLootDataByIndex( file.weaponPreviewLootIndex1 )
			RuiSetImage( rui, "weaponIcon1", lootData.hudIcon )
			RuiSetInt( rui, "weaponTier1", lootData.tier )
		}
		RuiSetInt( rui, "weaponNumber1", file.weaponPreviewNumber1 + 1 )

		for( int i = 0; i < file.scorePipRUIs.len(); ++i )
		{
			RuiSetBool( file.scorePipRUIs[i], "displayWeapon", false )
			RuiSetColorAlpha( file.scorePipRUIs[i], "weaponColor", SrgbToLinear( <1, 1, 1> ), 1 )
			RuiSetBool( file.scorePipRUIs[i], "clientSquadScore", false )
		}

		const int MAX_UI_TEAMS = 4
		int numTeams = GetCurrentPlaylistVarInt( "max_teams", 4 )
		int myTeam = localPlayer.GetTeam()
		array<int> squadScores


		                            
		array<entity> squadMembers = GetPlayerArrayOfTeam( myTeam )

		RuiSetInt(rui, "squadSize", squadMembers.len())

		if( IsValid( localPlayer ) && localPlayer.GetTeam() != TEAM_SPECTATOR )
			squadMembers.fastremovebyvalue( localPlayer )

		squadMembers.sort( SquadMemberIndexSort )

		for( int i = file.connectedSquadMembers.len() - 1; i >= 0; i-- )
		{
			entity player = file.connectedSquadMembers[i]
			                                                                                                                           
			if (!IsValid(player) && i < (GetCurrentPlaylistVarInt("max_team_size", 3)  -2) )
			{
				printf("remove " + i)
				RuiSetBool(rui, "squadWeaponPreview" + i, false)
				file.connectedSquadMembers.remove(i)
			}
		}

		int newTopScore = previousTopScore

		int localPlayerScore = 1
		if( IsValid( localPlayer ) && localPlayer.GetTeam() != TEAM_SPECTATOR )
			localPlayerScore = GunGame_GetPlayerScore( localPlayer ) + 1

		if( newTopScore < localPlayerScore )
			newTopScore = localPlayerScore

		for( int i = 0; i < squadMembers.len(); i++ )
		{
			if(file.connectedSquadMembers.find(squadMembers[i]) == -1)
				file.connectedSquadMembers.append(squadMembers[i])

			if (!IsValid(squadMembers[i]))
				continue

			entity weapon = squadMembers[i].GetNormalWeapon( WEAPON_INVENTORY_SLOT_PRIMARY_0 )
			if( IsValid( weapon ) )
			{
				int score = GunGame_GetPlayerScore(squadMembers[i]) + 1
				LootData weaponData = SURVIVAL_GetLootDataFromWeapon( weapon )
				RuiSetImage( rui, "teammateWeaponIcon" + i, weaponData.hudIcon )
				RuiSetInt( rui, "teammateWeaponNumber" + i, score )

				if( newTopScore < score)
					newTopScore = score
			}

			if( i < 2 )                       
				RuiSetBool(rui, "squadWeaponPreview" + i, true)
		}

		                                            
		if( previousTopScore < newTopScore )
			SquadLeader_UpdateAllUnitFramesRui()

		for( int team = TEAM_IMC; team < TEAM_IMC + MAX_UI_TEAMS; team++ )
		{
			int squadIndex = Squads_GetSquadUIIndex( team )
			int reorderedIndex = Squads_GetReorderedTeamsUIId( team )

			if( reorderedIndex >= numTeams )
			{
				RuiSetBool( rui, "squadVisible" + reorderedIndex, false )
				continue
			}

			int teamScore = GameRules_GetTeamScore( team )

			if( !file.hasPlayedFinalWeaponSound && teamScore == ( convertedScoreLimit - 1 ) )
			{
				file.hasPlayedFinalWeaponSound = true
				EmitSoundOnEntity( localPlayer, GUNGAME_FINAL_WEAPON_SOUND )
			}

			int squadWeaponIndex = GetGlobalNetInt( GUNGAME_SQUAD_WEAPON_INDEX + Squads_GetArrayIndexForTeam( team ) )
			RuiSetInt( rui, "score_" + (reorderedIndex + 1), teamScore )

			if( SURVIVAL_Loot_IsLootIndexValid( squadWeaponIndex ) && teamScore < file.scorePipRUIs.len()-1 )
			{
				LootData lootData = SURVIVAL_Loot_GetLootDataByIndex( squadWeaponIndex )

				RuiSetBool( file.scorePipRUIs[teamScore], "displayWeapon", true )
				RuiSetImage( file.scorePipRUIs[teamScore], "weaponIcon", lootData.hudIcon )
				RuiSetInt( file.scorePipRUIs[teamScore], "weaponNumber", teamScore + 1 )
				string weaponName = GetWeaponInfoFileKeyField_GlobalString( lootData.baseWeapon, "shortprintname" )
				RuiSetString( file.scorePipRUIs[teamScore], "weaponName", weaponName )

				if( reorderedIndex == 0 )               
				{
					RuiSetColorAlpha( file.scorePipRUIs[teamScore], "weaponColor", Squads_GetSquadColor( 0 ), 1.0 )
					RuiSetBool( file.scorePipRUIs[teamScore], "clientSquadScore", true )
				}
			}

			GunGame_SetCharacterInfo( rui,team )
		}

		previousTopScore = newTopScore

		WaitFrame()
	}

	file.gamemodeRUI = null
	RuiDestroy( rui )
}
#endif          

#if CLIENT
bool function GunGame_IsTeamWinning( int teamToCheck )
{
	const int MAX_UI_TEAMS = 4

	int teamToCheckScore = GameRules_GetTeamScore( teamToCheck )
	int highestScore = 0

	for( int team = TEAM_IMC; team < TEAM_IMC + MAX_UI_TEAMS; team++ )
	{
		if( teamToCheck == team )
			continue

		if( !GameRules_IsTeamIndexValid( team ) )
			continue

		int teamScore = GameRules_GetTeamScore( team )

		if( highestScore < teamScore )
			highestScore = teamScore
	}

	return teamToCheckScore > highestScore
}
#endif          

#if CLIENT
void function GunGame_SetCharacterInfo( var rui, int team )
{
	int myTeam = GetLocalViewPlayer().GetTeam()
	if( myTeam == TEAM_SPECTATOR )
		return

	int squadIndex = Squads_GetSquadUIIndex( team )
	int reorderedIndex = Squads_GetReorderedTeamsUIId( team )
	string indexString = string( squadIndex + 1 )
	
	RuiSetImage( rui, "squadImage" + indexString, Squads_GetSquadIcon(reorderedIndex ) )
	RuiSetString( rui, "squadName" + indexString, Squads_GetSquadName(reorderedIndex ) )
	RuiSetBool( rui, "squadVisible" + indexString, true )
	RuiSetColorAlpha( rui, "squadBorderColor" + indexString, Squads_GetSquadColor( reorderedIndex ), 1.0 )
}
#endif          

#if CLIENT
void function GunGame_ScoreboardSetup()
{
	clGlobal.showScoreboardFunc = ShowScoreboardOrMap_Teams
	clGlobal.hideScoreboardFunc = HideScoreboardOrMap_Teams
	Teams_AddCallback_ScoreboardData( GunGame_GetScoreboardData )
	Teams_AddCallback_Header( GunGame_ScoreboardUpdateHeader )
	Teams_AddCallback_GetTeamColor( GunGame_ScoreboardGetTeamColor )
	Teams_AddCallback_PlayerScores( GunGame_GetPlayerScores )
	Teams_AddCallback_SortScoreboardPlayers( GunGame_SortPlayersByScore )
}
#endif          

#if CLIENT
ScoreboardData function GunGame_GetScoreboardData()
{
	ScoreboardData data
	data.numScoreColumns = 4

	data.columnDisplayIcons.append( $"rui/hud/gamestate/player_kills_icon" )
	data.columnDisplayIconsScale.append( 1.0 )
	data.columnNumDigits.append( 2 )

	data.columnDisplayIcons.append( $"rui/hud/gamestate/assist_count_icon2" )
	data.columnDisplayIconsScale.append( 0.8 )
	data.columnNumDigits.append( 2 )

	data.columnDisplayIcons.append( $"rui/hud/gamestate/player_damage_dealt_icon" )
	data.columnDisplayIconsScale.append( 1.0 )
	data.columnNumDigits.append( 4 )

	data.columnDisplayIcons.append( $"rui/hud/gametype_icons/scoreboard/gunscore" )
	data.columnDisplayIconsScale.append( 1.0 )
	data.columnNumDigits.append( 4 )

	return data
}
#endif          

#if CLIENT
array< string > function GunGame_GetPlayerScores( entity player )
{
	array< string > scores

	string eliminations = string( player.GetPlayerNetInt( "kills" ) )
	scores.append( eliminations )

	string assists = string( player.GetPlayerNetInt( "assists" ) )
	scores.append( assists )

	string damage = string( player.GetPlayerNetInt( "damageDealt" ) )
	scores.append( damage )

	                                                                                                           
	string gunNumber =  string( minint( GunGame_GetPlayerScore( player ) + 1, GetCurrentPlaylistVarInt( "scorelimit", 30 ) ) )                                                     
	scores.append( gunNumber )


	return scores
}
#endif          


#if CLIENT
array< entity > function GunGame_SortPlayersByScore( array< entity > teamPlayers, ScoreboardData gameData )
{
	teamPlayers.sort( int function( entity a, entity b )
	{
		int aScore = a.GetPlayerNetInt( "kills" )
		int bScore = b.GetPlayerNetInt( "kills" )

		if ( aScore > bScore ) return -1
		else if ( aScore < bScore ) return 1
		return 0
	}
	)

	return teamPlayers
}
#endif          

#if CLIENT
void function GunGame_ScoreboardUpdateHeader( var headerRui, var frameRui, int team )
{
	if( headerRui != null )
	{
		int squadIndex = Squads_GetSquadUIIndex( team )
		int teamScore = GameRules_GetTeamScore( team )

		RuiSetString( headerRui, "headerText", Localize( Squads_GetSquadName( squadIndex ) ) )
		int squadWeaponIndex = GetGlobalNetInt( GUNGAME_SQUAD_WEAPON_INDEX + Squads_GetArrayIndexForTeam( team ) )

		if( SURVIVAL_Loot_IsLootIndexValid( squadWeaponIndex ) && GetGameState() >= eGameState.Playing )
		{
			LootData lootData = SURVIVAL_Loot_GetLootDataByIndex( squadWeaponIndex )
			RuiSetInt( headerRui, "weaponNumber", minint( teamScore + 1, GetCurrentPlaylistVarInt( "scorelimit", 30 ) ) )
			RuiSetImage( headerRui, "weaponIcon", lootData.hudIcon )
		}

		RuiSetBool( headerRui, "isWinning", GunGame_IsTeamWinning(team) )
		RuiSetImage( headerRui, "teamIcon", Squads_GetSquadIcon(squadIndex))
	}

}
#endif          

#if CLIENT
vector function GunGame_ScoreboardGetTeamColor( int team )
{
	int squadIndex = Squads_GetSquadUIIndex( team )

	return Squads_GetSquadColor( team - TEAM_IMC )
}
#endif         

bool function IsGunGameActive()
{
	return GetCurrentPlaylistVarBool( "freedm_gun_game_active", false)
}

int function GunGame_GetPlayerScore( entity player )
{
	return player.GetPlayerNetInt( GUNGAME_PLAYERSCORE )
}

bool function GunGame_IsPlayerAhead( entity player )
{
	int team = player.GetTeam()
	array<entity> squadMembers = GetPlayerArrayOfTeam( team )

	entity playerAhead
	int highestScore = 0

	foreach( member in squadMembers )
	{
		int score = GunGame_GetPlayerScore( member )
		if( score > highestScore )
		{
			highestScore = score
			playerAhead = member
		}
	}

	return playerAhead == player
}

int function GetScorePerGun()
{
	return GetCurrentPlaylistVarInt( "gun_game_score_per_gun", 1 )
}

#if DEV
#if SERVER
                                           
 
	                 
 

                                                        
 
	                     
		      

	                                                         
	                             
		      

	                                                             
	                                                         
 

                                                       
 
	                                 
	                                   
	                                                              
	 
		                        
		 
			                                                               
			                            
			 
				            
				                                      
				      
			 
		 
	 

	                                                                
 

                                                      
 
	                                          
		      

	                                    
		      

	                                     
	                                    
		      

	                                                                    
	                                                       
 
#endif
#endif

                            