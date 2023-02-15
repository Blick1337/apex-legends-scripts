global function Perk_EnemyBeaconScan_Init

#if SERVER
                                            
                                                 

                                                             
#endif


#if CLIENT
global function BeaconScanEnemy_ShowBeaconLocationOnMinimap
global function BeaconScanEnemy_ShowEnemiesOnMinimap
global function ServerToClient_BeaconScanEnemy_Notifications
global function PlayEffects_SurveyBeacon_Laser
global function StopEffects_SurveyBeacon_Laser
#endif

struct
{
	#if SERVER
	                           
	                          
	#endif
} file

void function Perk_EnemyBeaconScan_Init()
{
	#if SERVER || CLIENT   
		Remote_RegisterClientFunction( "BeaconScanEnemy_ShowEnemiesOnMinimap", "entity", "entity", "entity" )
		Remote_RegisterClientFunction( "BeaconScanEnemy_ShowBeaconLocationOnMinimap", "entity", "entity" )
		Remote_RegisterClientFunction( "ServerToClient_BeaconScanEnemy_Notifications", "entity", "entity" )
		Remote_RegisterClientFunction( "StopEffects_SurveyBeacon_Laser", "entity", "entity" )
	#endif

	if ( !(GetCurrentPlaylistVarBool( "disable_perk_beacon_scan_enemy", false ) ) )
	{
		PerkInfo beaconScanEnemy
		beaconScanEnemy.perkId          = ePerkIndex.BEACON_ENEMY_SCAN
		#if SERVER || CLIENT
			beaconScanEnemy.activateCallback = OnActivate_BeaconScan_Enemy
			beaconScanEnemy.deactivateCallback = OnDeactivate_BeaconScan
			beaconScanEnemy.minimapStateIndex = eMinimapObject_prop_script.SURVEY_BEACON
			beaconScanEnemy.minimapPingType = ePingType.SURVEYBEACON
			beaconScanEnemy.mapFeatureTitle = "#PERK_FEATURE_SURVEY_BEACON"
			beaconScanEnemy.mapFeatureDescription = "#PERK_FEATURE_SURVEY_BEACON_DESC"
		#endif
		#if CLIENT
			beaconScanEnemy.worldspaceIconUpOffset = 96
		#endif
		Perks_RegisterClassPerk( beaconScanEnemy )

		#if SERVER || CLIENT
		if( EnemyBeaconScan_UseNewBeaconModel() )
		{
			PrecacheModel( $"mdl/props/recon_beacon_dish/recon_beacon_dish.rmdl" )
		}
		#endif

		#if SERVER
			                                                         
		#endif
	}

	bool shouldUseSeperateNextZoneScanProp = SurveyBeacons_ShouldUseNextZoneSurveyBeaconProp()
	if ( !(GetCurrentPlaylistVarBool( "disable_perk_beacon_scan", false ) ) && !shouldUseSeperateNextZoneScanProp )
	{
		PerkInfo beaconScan
		beaconScan.perkId          = ePerkIndex.BEACON_SCAN
		#if SERVER || CLIENT
			beaconScan.activateCallback = OnActivate_BeaconScan_Circle
			beaconScan.deactivateCallback = OnDeactivate_BeaconScan
		#endif
		#if CLIENT
			beaconScan.worldspaceIconUpOffset = 96
		#endif
		Perks_RegisterClassPerk( beaconScan )
	}
}

bool function EnemyBeaconScan_UseNewBeaconModel()
{
	return GetCurrentPlaylistVarBool( "perk_enemy_beacon_use_new_model", true )
}

#if SERVER || CLIENT
float function EnemyBeaconScan_GetBeaconScanDuration()
{
	return GetCurrentPlaylistVarFloat( "perk_enemy_beacon_scan_duration", 30.0 )

}
#endif

#if SERVER
                                                
 
	                                                                              
 

                                             
 
	                                                                             
 
#endif

#if SERVER || CLIENT
void function OnActivate_BeaconScan_Enemy( entity player, string characterName )
{
	string calloutLine, player1pAnim, player3pAnim, panelAnim

	calloutLine  = "bc_revealEnemyPosition"

	switch ( characterName )
	{
		case "pathfinder":
		{
			player1pAnim = "pathfinder"
			player3pAnim = "pathfinder"
			panelAnim    = "pathfinder"
			break
		}
		case "crypto":
		{
			if ( HasCryptoSword ( player ) )
			{
				player1pAnim = "crypto_heirloom"
				panelAnim    = "crypto_heirloom"				
				player3pAnim = "crypto"
			}
			else
			{
				player3pAnim = "crypto"
			}
			break
		}
		case "seer":
		{
                       
				if ( HasSeerBlades ( player ) )
				{
					player1pAnim = "seer_heirloom"
					panelAnim    = "seer_heirloom"
					                                                                     
					                       
				}
				else
				{
					player1pAnim = "seer"
				}
         
			break
		}
               
		case "vantage":
		{
			player1pAnim = "vantage"
			panelAnim    = "vantage"
			break
		}
      

		default:
			calloutLine  = "bc_revealEnemyPosition"
			break
	}

	RegisterEnemySurveyBeaconData( player, calloutLine, player1pAnim, player3pAnim, panelAnim )
}

void function RegisterEnemySurveyBeaconData(  entity player, string calloutLine, string player1pAnim, string player3pAnim, string panelAnim )
{
	SurveyBeaconData data
	data.canUseFunc = BeaconScanEnemy_CanUseBeacon
	#if SERVER
		                                                
	#endif
	data.calloutLine = calloutLine
	data.scanType = eBeaconScanType.BEACON_SCAN_ENEMY

	#if SERVER
		                         
			                   

		                         
			                      

		                      
			                

		                                                                               
		                                                                             
		                                                                             

		                                                                       
		                                                                     
		                                                                     

		                                                                                
		                                                                              
		                                                                              

		                               
	#endif

	RegisterSurveyBeaconData( player, data )
}

bool function BeaconScanEnemy_CanUseBeacon( entity player, entity beacon )
{
	                                                                                                   
	bool isUsable
	#if CLIENT
	int minimapFlags = beacon.Minimap_GetRuiMinimapFlags()
	isUsable = ( minimapFlags & MINIMAP_FLAG_VISIBILITY_SHOW ) > 0
	#endif
	#if SERVER
	                           
	                                                    
	#endif
	if ( !isUsable )
	{
		#if CLIENT
			AddPlayerHint( 0.1, 0, SurveyBeacon_GetBeaconIcon( beacon ), "#SURVEY_ENEMY_ALREADY_ACTIVE" )
		#endif         
		return false
	}

	if( beacon.GetScriptName() != ENEMY_SURVEY_BEACON_SCRIPTNAME )
		return false

	return true
}

#if SERVER
                                                                                           
 
	                                                
		      

	                                 
	                                                                 
	                      
		      

	                                     
	                                                    
		      

	                                                                

	                                  
	 
		                          
			        
		                                                                         
			        
		                                        
	 
 

                                                          
 
	                         
 

                                                                 
 
	                                         
	 
		                                                
		                                               
		                                               
		                                                                                      
		                      
		                 
		                                                       
		                          
		                      
		                        
	 

	                                         
	                                                                       
	                                                                                                      
	                                                                           
 

                                                                                                  
 
	                           

	                                     

	                        
		                                                            

	                                                
	                                                                    
	                                                                                

	                                                        
	                                       
	 
		                                                                                                                                                        
	 

	                                                        

	                                                
	                                                           

	                                                           
	 
		                                          
	 
 

                                                                      
 
	                           
	                                   
	                                                   
	                                              
 

                                                                                                
 

	                           
	                                                                  

	                                       
	 
		                                                                        
		                                                   
			        

                       
                                                 
            
        

		                           
		                                                            
		                                                                                                       
		                                                                   
		                                                
	 

	                                                                 
	                                       
	 
		                                                                                                   
		                                                                                                                                   
	 

 

                                                                                              
 
	                             
	                               

	                                                    
		      

	            
		                      
		 
			                         
			 
				                         
			 
		 
	 

	                                                                                                    

	                                                     
 

                                                                               
 
	                        
		                                                                                                 

	                                                                                                                                                                                                                    

	                                     
	                                          
	                                                                 
	                     

	                                     

	                             
	                                                                                                             
	         
 

                                           
 
	                            

	            
		                   
		 
			                    
				            
		 
	 

	                                      
 
#endif         

#if CLIENT
void function BeaconScanEnemy_ShowBeaconLocationOnMinimap( entity enemy, entity beacon )
{
	if ( enemy != GetLocalViewPlayer() )
		return

	vector pulseOrigin = beacon.GetOrigin()
	FullMap_PlayCryptoPulseSequence( pulseOrigin, false, EnemyBeaconScan_GetBeaconScanDuration() )                                   
}

void function BeaconScanEnemy_ShowEnemiesOnMinimap( entity playerWhoScanned, entity player, entity beacon )
{
	if ( player != GetLocalViewPlayer() )
		return

	vector playerNameColor = <255, 255, 255>

	int teamMemberIndex = playerWhoScanned.GetTeamMemberIndex()
	if ( teamMemberIndex < 0 )
		Warning( "%s() - Invalid team member index (%d) for player: %s", FUNC_NAME(), teamMemberIndex, string( player ) )
	else
		playerNameColor = GetPlayerInfoColor( playerWhoScanned )

	string playerName = playerWhoScanned == player ? Localize( "#OBITUARY_YOU" ) : playerWhoScanned.GetPlayerName()

	Obituary_Print_Localized( Localize( "#SURVIVAL_HUD_REVEALED_ENEMIES", playerName ), playerNameColor )
	thread BeaconScanEnemy_DisplayEnemiesOnMinimap_Thread( player, beacon )
}

void function BeaconScanEnemy_DisplayEnemiesOnMinimap_Thread( entity player, entity beacon )
{
	if ( player != GetLocalViewPlayer() )
		return

	int team = player.GetTeam()
	array<entity> aliveEnemies = GetPlayerArrayOfEnemies_Alive( team )

	float scanDuration = EnemyBeaconScan_GetBeaconScanDuration()
	float endTime = Time() + scanDuration
	float timeToStartFade = Time() + ( scanDuration/2 )                                                
	float timeToEndFade = endTime                                                          

	array<var> fullMapRuis
	array<var> minimapRuis
	array<entity> entsForTracking

	OnThreadEnd(
		function() : ( fullMapRuis, minimapRuis )
		{
			foreach( var ruiToDestroy in fullMapRuis )
			{
				Fullmap_RemoveRui( ruiToDestroy )
				RuiDestroyIfAlive( ruiToDestroy )
			}

			foreach( var ruiToDestroy in minimapRuis)
			{
				Minimap_CommonCleanup( ruiToDestroy )
			}
		}
	)

	foreach( entity enemy in aliveEnemies )
	{
                       
                                     
            
        

		           
		var fRui = FullMap_AddEnemyLocation( enemy )
		fullMapRuis.append( fRui )

		          
		var mRui = Minimap_AddEnemyToMinimap( enemy )
		minimapRuis.append( mRui )
		RuiSetGameTime( mRui, "fadeStartTime", timeToStartFade )
		RuiSetGameTime( mRui, "fadeEndTime", timeToEndFade )
	}

	vector pulseOrigin = beacon.GetOrigin()

	FullMap_PlayCryptoPulseSequence( pulseOrigin, true, EnemyBeaconScan_GetBeaconScanDuration() )

	while ( Time() < endTime )                   
	{
		if( !IsValid(player) )
			break
		WaitFrame()
	}

}

void function ServerToClient_BeaconScanEnemy_Notifications( entity player, entity beacon )
{
	int team = player.GetTeam()
	                                                                             
	bool showSquadInfo =  GetCurrentPlaylistVarBool( "beacon_show_squad_info", false )
	if (showSquadInfo)
		SurveyBeacon_ShowSquadInfo()

	EmitSoundOnEntity( beacon, "Recon_SurveyBeacon_EnemiesScanned_UI_1P" )
}
#endif          
#endif                        

#if CLIENT
void function PlayEffects_SurveyBeacon_Laser( entity beacon )
{
	EmitSoundOnEntity( beacon, "Recon_Hack_SurveyBeacon_LaserBeam_3P")
}


void function StopEffects_SurveyBeacon_Laser( entity player, entity soundEnt )
{
	StopSoundOnEntity( soundEnt, "Recon_Hack_SurveyBeacon_LaserBeam_3P" )
	StopSoundOnEntity( soundEnt, "Recon_Hack_SurveyBeacon_LaserBeam_Stereo_3P" )
}
#endif