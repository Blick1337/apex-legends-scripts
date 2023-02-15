global function Perk_CarePackageInsight_Init

const string HIDDEN_CARE_PACKAGE_ENT_NAME = "care_package_hidden"
const string REVEALED_CARE_PACKAGE_ENT_NAME = "care_package_revealed"

const float CAREPACKAGE_WAYPOINT_UP_OFFSET = 90
const float CAREPACKAGE_HINT_NOTIFICATION_DIST = 20000
const float FORWARD_CAST_RAY_LENGTH = 40000
const float LOOKAT_HINT_COOLDOWN = 120

#if DEV
const bool CARE_PACKAGE_INSIGHT_PERF_TESTING = false
#endif


#if SERVER
                                             
                                                 

                                                                     
                                                                          
                                                                        
                                                                    

       
                                          
      

                      
 
	                  			                            
	                      		                                                                                 
	                     
	                  
	                                       
 
#endif

#if CLIENT
global function ClientCodeCallback_OnCarePackageInsightDataChanged
global function CarePackage_ShowObituary
global function ServerToClient_NotifyPathfinderCooldownReduction

struct RevealEntData
{
	float revealProgress
	bool hasLos
}

#endif

global function S16_PathfinderSkirmisherPassiveActive

struct
{
	#if SERVER
		                                                 

		       
			                                     
		      
	#endif

	#if CLIENT
		table<entity, RevealEntData> revealEntitiesToData
		array<entity>		 recentlyRevealedEntities
		table<entity, var> 	 revealEntityToRui
		entity                       soundController
		float                        lastRevealPackageHintTime
		entity 				prevHoverEntity
	#endif

} file

void function Perk_CarePackageInsight_Init()
{
	if ( GetCurrentPlaylistVarBool( "disable_perk_care_package_insight", false ) )
		return

	PerkInfo carePackageInsight
	carePackageInsight.perkId          = ePerkIndex.CARE_PACKAGE_INSIGHT
	#if SERVER || CLIENT
		carePackageInsight.minimapPingType = ePingType.CAREPACKAGE_INSIGHT
		carePackageInsight.activateCallback = OnActivate_CarePackageInsight
		carePackageInsight.deactivateCallback = OnDeactivate_CarePackageInsight
		carePackageInsight.mapFeatureTitle = "#PERK_FEATURE_CARE_PACKAGE_INSIGHT"
		carePackageInsight.mapFeatureDescription = "#PERK_FEATURE_CARE_PACKAGE_INSIGHT_DESC"
		RegisterSignal( "Perk_CarePackageInsight_ContentsTaken" )
	#endif

	#if CLIENT
		carePackageInsight.worldspaceIconUpOffset = CAREPACKAGE_WAYPOINT_UP_OFFSET
		carePackageInsight.hideFromTeammates = true
		carePackageInsight.trackEntityPosition = true
		carePackageInsight.ruiThinkThread = Perk_CarePackageInsight_UpdateLookatRevealProgressRui
		carePackageInsight.canPingEnt = Perk_CarePackageInsight_CanPingEnt
		carePackageInsight.getPingPosition = Perk_CarePackageInsight_GetPingPositionForEnt
		carePackageInsight.getPingMaxDistance = Perk_CarePackageInsight_GetPingDistanceForEnt
	#endif

	Perks_RegisterClassPerk( carePackageInsight )

	#if SERVER || CLIENT
	Remote_RegisterServerFunction( "Perks_CarePackageInsight_ClientToServer_RevealPackage", "entity")
	Remote_RegisterServerFunction( "Perks_CarePackageInsight_ClientToServer_StartRevealPackage", "entity")
	Remote_RegisterServerFunction( "Perk_CarePackageInsight_ClientToServer_MinimapIconPinged", "entity" )
	Remote_RegisterClientFunction( "CarePackage_ShowObituary", "entity", "entity" )
	Remote_RegisterClientFunction( "ServerToClient_NotifyPathfinderCooldownReduction", "entity" )

	#endif

	#if SERVER
		                                                                              
		                                                                          
	#endif

	#if CLIENT
		RegisterSignal( "CarePackage_PerkDisabled" )
		AddCreateCallback( "prop_care_package_insight", OnCarePackageDataCreated )

		PrecacheParticleSystem( $"P_ar_loot_drop_point_CP_noZ" )

		AddCallback_OnFindFullMapAimEntity( GetCarePackageUnderAim, PingCarePackageUnderAim )

		file.lastRevealPackageHintTime = -9999
	#endif
}

#if SERVER || CLIENT
void function OnActivate_CarePackageInsight( entity player, string characterName )
{
	#if CLIENT
		if( player != GetLocalViewPlayer() )
			return

		thread UpdateCarePackageLootAtReveal( player )
		thread UpdateCarePackageLos( player )

		entity soundController = CreatePropDynamic( EMPTY_MODEL )
		soundController.SetParent( player )
		file.soundController = soundController
	#endif
}

void function OnDeactivate_CarePackageInsight( entity player )
{
	#if CLIENT
	player.Signal( "CarePackage_PerkDisabled" )
		if( player == GetLocalViewPlayer() && file.soundController != null )
		{
			file.soundController.Destroy()
			file.soundController = null
		}
	#endif
}
#endif

                             
float function Perk_CarePackageInsight_LookatRevealTime()
{
	return GetCurrentPlaylistVarFloat( "care_package_insight_reveal_time", 1.0 )
}

float function Perk_CarePackageInsight_LookAtWideRevealDegrees()
{
	return GetCurrentPlaylistVarFloat( "care_package_insight_wide_reveal_degrees", 30.0 )
}

float function Perk_CarePackageInsight_LookAtDirectRevealDegrees()
{
	return GetCurrentPlaylistVarFloat( "care_package_insight_direct_reveal_degrees", 3.0 )
}

float function Perk_CarePackageInsight_IgnoreLosRevealDistance()
{
	return GetCurrentPlaylistVarFloat( "care_package_insight_ignore_los_distance", 6000.0 )
}

bool function S16_PathfinderSkirmisherPassiveActive()
{
	return GetCurrentPlaylistVarBool( "s16_pathfinder_skirmisher_passive_active", true )
}

#if SERVER
                                                              
 
	                                                                                          
 

                                                                                                          
 
	                                                 
	 
		                                                                                        
		                                       
		                    
		 
			                                                                                                           
			      
		 
		                                                                                                                       
		                                                                                                            
		                                   
	 
 

                                                                                              
 
	                                                                          
		           

	                                                               
		           

	                                           
	                             
		           

	                                             
		           

	            
 

                                                                                                                 
 
	                                                                                                                                           
	                                           
	                                          
	                                         
	                                                                                                                     

	                                                                                            
	                                                                       
	                                                           

	                                  
		            

	                  
		           

	                                                                                                                          
	                                                                                   
	             
 

                                                                                                      
 
	                                                                       
		      

	                                           
	                                                         
	                                                      
	 
		                                                                        
			      

		                                          
			      

		                                                                                                                           
			      

		                                                                                 
			      
	 

	                                               
	                                                                   
	                           
	                                          
	                                           

	                                                                           

	                                                                 
	                                       
	 
		                                                                               
	 

	                                                                              
	                                                                                            
	                                                                       
	                                       
	                                    

	                                                                                                      
	 
		                                                
			                                                                                                   
	 
 

                                                                                                           
 
	                                                                       
		      

	                                                      
	 
		                                                                        
			      

		                                                                                             
		                                                                           
		                                                                                                                     
		                                                                                       
			      
	 
	                                           
	                                                                     
 

                                                                                                     
 
	                           
	                                              
	 
		                                          
		                                                             
		               
	 
	    
	 
		         
	 
	         
 

                                                                                                                                          
 
	                                                                                       
	                    
		      

	                                           
	                                             
	                                                                                

	                                                                                                                                  
	                                   
	                                                        
	                           
 

                                                                 
 
	                                                        
	                                        
	 
		                                                                         
		 
			           
		 
	 
	            
 

                                                                                                                              
                                                                                       
 
	                                                                                         
		      

	                                                           
	                   
	                          
	                           

	                                                           
	                                    
	 
		                                                    
		                                
		 
			                     
			                      
			                            
		 
	 

	                                                 

	                                                                            
	                                                                          
	                                               
	                                       
	                                                                     
	                                        

	                                                                             
	                                                                           
	                                                
	                                        
	                                                                        
	                                                          
	                                         

	                                            
	                                             


	                                       
	                       
	                    	         
	                       	                 
	                                              

	                                         

	                                           
	 
		                                                                
		                
			        
		                                                       
	 

	                                                                         
 

                                                                                 
 
	                                         
		      

	                                                                                                                                    
	                                                                
	                                                        

	                                                
	                               
	 
		                                                                               
			        

		                                                                          
		                                 
		 
			                                      
			                                                             
		 
	 

	                       
	 
		                           
		                                                               
		 
			                                                        
			                                  
			 
				                          
					        
				                                                                            
					        
				                                               
			 
		 
	 
 

                                                         
 
	                                                        
	 
		                                                
		                                                

		                                                                           
		                          
		 
			                                     
			                                                       
		 
	 
 
#endif          

#if CLIENT
void function ClientCodeCallback_OnCarePackageInsightDataChanged( entity carePackageInsightEnt )
{
	if( carePackageInsightEnt.GetAreContentsTaken() )
	{
		carePackageInsightEnt.Signal( "Perk_CarePackageInsight_ContentsTaken" )
	}
}

void function CarePackage_ShowObituary( entity playerWhoScanned, entity player )
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

	Obituary_Print_Localized( Localize( "#SURVIVAL_HUD_REVEALED_AIRDROP", playerName ), playerNameColor )
}

void function OnCarePackageDataCreated( entity ent )
{
	                                                                                                           
	thread OnCarePackageDataCreated_Delayed( ent )
}

void function OnCarePackageDataCreated_Delayed( entity ent )
{
	ent.EndSignal( "OnDestroy" )
	WaitFrame()
	if( !Perks_DoesPlayerHavePerk( GetLocalViewPlayer(), ePerkIndex.CARE_PACKAGE_INSIGHT ) )
		return

	if ( !IsValid( ent ) )
		return

	if( ent.GetScriptName() == HIDDEN_CARE_PACKAGE_ENT_NAME )
	{
		thread AddCarePackageInsightRui( ent, false )
		AddDropLocationEffects( ent )
	}
	else if( ent.GetScriptName() == REVEALED_CARE_PACKAGE_ENT_NAME )
	{
		thread AddCarePackageInsightRui( ent, true )
	}
}

void function AddDropLocationEffects( entity ent )
{
	ent.EndSignal( "OnDestroy" )
	entity carePackage = ent.GetLinkEnt()
	carePackage.EndSignal( "OnDestroy" )

	int colorID = COLORID_AIRDROP_DEFAULT_COLOR
	asset markerParticleSystem = $"P_ar_loot_drop_point_CP_noZ"

	int markerIndex = GetParticleSystemIndex( markerParticleSystem )
	int markerHandle = StartParticleEffectInWorldWithHandle( markerIndex, ent.GetOrigin(), ent.GetAngles() )
	EffectSetControlPointColorById( markerHandle, 1, colorID )

	OnThreadEnd(
		function() : ( markerHandle )
		{
			EffectStop( markerHandle, true, false )
		}
	)


	vector landPosition = ent.GetOrigin()
	while( DistanceSqr( landPosition, carePackage.GetOrigin() ) > 50 * 50 )
	{
		float distToPlayer = Distance( landPosition, GetLocalViewPlayer().GetOrigin() )
		printl( distToPlayer )
		Wait( .5 )
	}
}


asset function GetHiddenCarePackageIcon()
{
	return Perks_GetSettingsInfoForPerk( ePerkIndex.CARE_PACKAGE_INSIGHT ).icon
}

void function AddCarePackageInsightRui( entity ent, bool revealed )
{
	vector pos 			= ent.GetOrigin()
	asset lootIcon = GetHiddenCarePackageIcon()
	int lootTier = 1

	ent.EndSignal( "OnDestroy" )

	if( revealed )
	{
		int lootIndex = ent.GetLootIndex()
		LootData ld = SURVIVAL_Loot_GetLootDataByIndex( lootIndex )
		lootIcon = ld.hudIcon
		lootTier = ld.tier
	}

	int iconColorID
	switch( lootTier )
	{
		case 0:
			iconColorID = COLORID_HUD_LOOT_TIER0
			break
		case 1:
			iconColorID = COLORID_HUD_LOOT_TIER1
			break
		case 2:
			iconColorID = COLORID_HUD_LOOT_TIER2
			break
		case 3:
			iconColorID = COLORID_HUD_LOOT_TIER3
			break
		case 4:
			iconColorID = COLORID_HUD_LOOT_TIER4
			break
		case 5:
			iconColorID = COLORID_HUD_LOOT_TIER5
			break
		default:
			iconColorID = COLORID_HUD_LOOT_TIER0
			break
	}

	vector iconColor = GetKeyColor( iconColorID ) * ( 1.0 / 255.0 )
	asset button = $"rui/menu/inventory/buttons/border_base_default"
	asset bg = $"rui/menu/inventory/buttons/bg_base"

	float miniMapScale	= 1.0
	float fullMapScale 	= 12

	var minimapRui = Minimap_AddCarePackageInsightIconAtPosition( pos, <0,90,0>, lootIcon, miniMapScale, iconColor )      
	var fullmapRui = FullMap_AddCarePackageInsightIconAtPos( pos, <0,0,0>, lootIcon, fullMapScale, iconColor )      

	if( lootTier >= 5 )
	{
		RuiSetFloat2( minimapRui, "iconScale", <1.5,1.0,0.0> )

		RuiSetFloat2( fullmapRui, "objectScale", <1.5,1.0,0.0> )
	}

	if( !revealed )
	{
		RevealEntData data
		file.revealEntitiesToData[ent] <- data
	}
	else
	{
		file.revealEntityToRui[ent] <- fullmapRui
	}

	bool addMinimapEnt = true
	if( revealed )
	{
		if( ent.GetAreContentsTaken() )
		{
			RuiSetBool( fullmapRui, "contentsTaken", true )
			RuiSetBool( minimapRui, "contentsTaken", true )
			PingCarePackageUnderAim( ent )
			addMinimapEnt = false
		}
		else
		{
			thread ListenToDroppodEmptied( ent, minimapRui, fullmapRui )
		}
	}

	if( addMinimapEnt )
		Perks_AddMinimapEntityForPerk( ePerkIndex.CARE_PACKAGE_INSIGHT, ent )


	OnThreadEnd(
		function() : ( ent, revealed, minimapRui, fullmapRui )
		{
			if( !revealed )
			{
				delete file.revealEntitiesToData[ent]
			}
			else
			{
				delete file.revealEntityToRui[ent]
			}

			RuiSetBool( fullmapRui, "destroy", true )
			Minimap_CommonCleanup( minimapRui )
			Fullmap_RemoveRui( fullmapRui )
		}
	)

	WaitForever()

}

void function UpdateCarePackageLos( entity player )
{
	EndSignal( player, "OnDestroy" )
	EndSignal( player, "CarePackage_PerkDisabled" )

	var soundHandle = null
	while( true )
	{
		if( !IsAlive( player ) )
		{
			Wait( 1 )
			continue
		}

		vector eyePosition = player.EyePosition()
		foreach( ent, data in file.revealEntitiesToData )
		{
			if( data.revealProgress > 0 )
				continue

			entity carePackage = ent.GetLinkEnt()

			if ( !IsValid( carePackage ) )
				continue

			vector wpPosition = carePackage.GetOrigin() +  <0,0,CAREPACKAGE_WAYPOINT_UP_OFFSET>
			TraceResults trace = TraceLine( player.EyePosition(), wpPosition, null, TRACE_MASK_BLOCKLOS, TRACE_COLLISION_GROUP_NONE )
			bool canSee = trace.hitEnt == carePackage || trace.fraction >= 0.99 || trace.hitSky
			file.revealEntitiesToData[ent].hasLos = canSee
		}

		Wait( 1.0 )
	}
}

void function UpdateCarePackageLootAtReveal( entity player )
{
	EndSignal( player, "OnDestroy" )
	EndSignal( player, "CarePackage_PerkDisabled" )

	var soundHandle = null
	while( true )
	{
		if( !IsAlive( player ) || player.IsPhaseShifted() )
		{
			Wait( 1 )
			continue
		}
#if DEV
		if( CARE_PACKAGE_INSIGHT_PERF_TESTING )
		{
			PerfStart( PerfIndexClient.CarePackagePerkLookatUpdate )
		}
#endif

		entity centerEnt = null
		bool traceHitSky = false
		vector eyePosition = player.EyePosition()
		vector viewDir = player.GetViewVector()
		float minDot = deg_cos( Perk_CarePackageInsight_LookAtWideRevealDegrees() )
		float revealDegrees = deg_cos( Perk_CarePackageInsight_LookAtDirectRevealDegrees() )
		bool revealedCarePackage = false

		foreach( ent, data in file.revealEntitiesToData )
		{
			if( !IsValid( ent ) )
				continue

			int playerIndex = player.GetEntIndex()
			if( data.revealProgress >= 1.0 )
			{
				continue
			}

			entity carePackage = ent.GetLinkEnt()

			if ( !IsValid( carePackage ) )
				continue

			vector wpPosition = carePackage.GetOrigin() +  <0,0,CAREPACKAGE_WAYPOINT_UP_OFFSET>
			float dot = DotProduct( Normalize( wpPosition - eyePosition ), viewDir )
			if ( dot < minDot )
			{
				continue
			}

			vector landPos = ent.GetOrigin()
			                                                                                                                                
			float ignoreLosDistance = Perk_CarePackageInsight_IgnoreLosRevealDistance()
			bool ignoreLosCheck = data.revealProgress > 0 || ( DistanceSqr( landPos, eyePosition ) < ignoreLosDistance * ignoreLosDistance && dot > revealDegrees )

			if( !ignoreLosCheck && !data.hasLos )
			{
				continue
			}

			if( centerEnt == null && !ignoreLosCheck )
			{
				vector viewVector = player.GetViewVector()
				TraceResults trace = TraceLine( eyePosition, eyePosition + viewVector * FORWARD_CAST_RAY_LENGTH, null, TRACE_MASK_BLOCKLOS, TRACE_COLLISION_GROUP_NONE )
				centerEnt = trace.hitEnt
				traceHitSky = trace.hitSky
			}

			bool lookingAt = ( traceHitSky && dot > revealDegrees ) || centerEnt == carePackage || ignoreLosCheck

			if( !lookingAt )
			{
				if( dot < revealDegrees )
				{
					continue
				}

				TraceResults trace = TraceLine( player.EyePosition(), wpPosition, null, TRACE_MASK_BLOCKLOS, TRACE_COLLISION_GROUP_NONE )
				bool canSee = trace.hitEnt == carePackage || trace.fraction >= 0.99 || trace.hitSky
				if( !canSee )
				{
					continue
				}
			}

			if( file.revealEntitiesToData[ent].revealProgress == 0.0 )
			{
				Remote_ServerCallFunction( "Perks_CarePackageInsight_ClientToServer_StartRevealPackage", ent )
			}

			file.revealEntitiesToData[ent].revealProgress += ( FrameTime() / Perk_CarePackageInsight_LookatRevealTime() )

			if( soundHandle == null )
				soundHandle = EmitSoundOnEntity( file.soundController, "Skirmisher_PackageScan_Progress_LP_1P" )
			file.soundController.SetSoundCodeControllerValue( file.revealEntitiesToData[ent].revealProgress * 100 )

			revealedCarePackage = true
			
			if( file.revealEntitiesToData[ent].revealProgress >= 1.0 )
			{
				EmitSoundOnEntity( GetLocalViewPlayer(), "Skirmisher_PackageScan_Complete_1P" )
				Remote_ServerCallFunction( "Perks_CarePackageInsight_ClientToServer_RevealPackage", ent )
				thread ResetRevealIfNotAcked( ent )
			}
			break
		}
		if( !revealedCarePackage && soundHandle != null )
		{
			StopSound( soundHandle )
			soundHandle = null
		}

#if DEV
		if( CARE_PACKAGE_INSIGHT_PERF_TESTING )
		{
			PerfEnd( PerfIndexClient.CarePackagePerkLookatUpdate )
		}
#endif
		WaitFrame()
	}
}

void function ResetRevealIfNotAcked( entity ent )
{
	ent.EndSignal( "OnDestroy" )
	Wait( 2.0 )
	if( ent in file.revealEntitiesToData )
	{
		file.revealEntitiesToData[ent].revealProgress = 0.0
	}
}

bool function Perk_CarePackageInsight_CanPingEnt( entity ent )
{
	return ent.GetScriptName() == REVEALED_CARE_PACKAGE_ENT_NAME
}

entity function GetCarePackageUnderAim( vector worldPos, float worldRange )
{
	entity closestEnt = null
	float closestDistSqr = FLT_MAX
	float worldRangeSqr = worldRange * worldRange
	foreach( ent, rui in file.revealEntityToRui )
	{
		if( !IsValid( ent ) )
			continue
		float distSqr = Distance2DSqr( worldPos, ent.GetOrigin() )
		if( distSqr > worldRangeSqr )
			continue
		if( distSqr > closestDistSqr )
			continue
		closestDistSqr = distSqr
		closestEnt = ent
	}

	if( closestEnt != file.prevHoverEntity )
	{
		if( IsValid( file.prevHoverEntity ) )
		{
			RuiSetBool( file.revealEntityToRui[file.prevHoverEntity], "showContents", false )
		}
		if( closestEnt != null )
			RuiSetBool( file.revealEntityToRui[closestEnt], "showContents", true )
		file.prevHoverEntity = closestEnt
	}

	return closestEnt
}

bool function PingCarePackageUnderAim( entity ent )
{
	entity player = GetLocalClientPlayer()

	if ( !IsValid( player ) || !IsAlive( player ) )
		return false

	if ( !IsPingEnabledForPlayer( player ) )
		return false

	Remote_ServerCallFunction( "Perk_CarePackageInsight_ClientToServer_MinimapIconPinged", ent )

	EmitSoundOnEntity( GetLocalViewPlayer(), PING_SOUND_LOCAL_CONFIRM )

	return true
}

void function Perk_CarePackageInsight_UpdateLookAtRevealRuiVisibility( var rui, entity carePackage )
{
	EndSignal( carePackage, "OnDestroy" )
	EndSignal( carePackage,  "HidePerkMinimapVisibility" )
	clGlobal.levelEnt.EndSignal( "UpdatePerkMinimapVisibility" )

	bool prevWithinGroundRevealDist = false
	while( true )
	{
		entity player = GetLocalViewPlayer()
		float ignoreLosDist = Perk_CarePackageInsight_IgnoreLosRevealDistance()
		bool withinGroundRevealDist = DistanceSqr( player.GetOrigin(), carePackage.GetOrigin() ) < ignoreLosDist * ignoreLosDist
		if( prevWithinGroundRevealDist != withinGroundRevealDist && withinGroundRevealDist && Time() - file.lastRevealPackageHintTime > LOOKAT_HINT_COOLDOWN )
		{
			file.lastRevealPackageHintTime = Time()
			AddPlayerHint( 10, 0, Perks_GetIconForPerk( ePerkIndex.CARE_PACKAGE_INSIGHT ), "#CARE_PACKAGE_INSIGHT_REVEAL_HINT" )
		}
		prevWithinGroundRevealDist = withinGroundRevealDist

		bool visible = file.revealEntitiesToData[carePackage].hasLos || file.revealEntitiesToData[carePackage].revealProgress > 0 || withinGroundRevealDist
		if( visible )
		{
			RuiSetBool( rui, "doAdsFade", false )
			RuiSetBool( rui, "isVisibleOverride", true )
			RuiSetBool( rui, "hidePerkIcon", file.revealEntitiesToData[carePackage].hasLos )
		}
		else
		{
			RuiSetBool( rui, "doAdsFade", true )
			RuiSetBool( rui, "isVisibleOverride", false )
			RuiSetBool( rui, "hidePerkIcon", true )
		}

		Wait( 1.0 )
	}
}

void function Perk_CarePackageInsight_UpdateLookatRevealProgressRui( var rui, entity revealEnt )
{
	EndSignal( revealEnt, "OnDestroy" )
	clGlobal.levelEnt.EndSignal( "UpdatePerkMinimapVisibility" )

	if( revealEnt.GetScriptName() == HIDDEN_CARE_PACKAGE_ENT_NAME )
	{
		entity carePackage = revealEnt.GetLinkEnt()
		RuiTrackFloat3( rui, "pos", carePackage, RUI_TRACK_ABSORIGIN_FOLLOW  )
		thread Perk_CarePackageInsight_UpdateLookAtRevealRuiVisibility( rui, revealEnt )

		float currentProgress = 0
		float targetProgress = 0

		RuiSetFloat( rui, "arcFill", 0.0 )
		RuiSetBool( rui, "clampToScreen", true )
		RuiSetBool( rui, "ignoreDistanceFade", true )
		RuiSetBool( rui, "isUnrevealedCarePackageInsight", true )

		while( currentProgress < 1.0 && revealEnt in file.revealEntitiesToData )
		{
			entity localPlayer = GetLocalViewPlayer()
			targetProgress = file.revealEntitiesToData[revealEnt].revealProgress
			RuiSetFloat( rui, "arcFill", targetProgress )
			WaitFrame()
		}

		revealEnt.WaitSignal( "OnDestroy" )
	}
	else
	{
		int lootIndex = revealEnt.GetLootIndex()
		LootData ld = SURVIVAL_Loot_GetLootDataByIndex( lootIndex )
		if( ld.tier >= 5 )
		{
			RuiSetFloat2( rui, "sizeScale", <1.5,1.0,0.0> )
		}
		RuiSetString( rui, "descriptiveTextLocString", ld.pickupString )
		RuiSetImage( rui, "beaconImage", ld.hudIcon )
		RuiSetInt( rui, "lootTier", ld.tier )
		RuiSetFloat( rui, "arcFill", 0.0 )
		RuiSetBool( rui, "playConfirmAnim", true )
		RuiSetBool( rui, "clampToScreen", false )
		RuiSetBool( rui, "isVisibleOverride", true )
		RuiSetBool( rui, "isRevealedCarePackageInsight", true )

		                                                                                               
		entity player = GetLocalViewPlayer()
		entity carePackageEnt = revealEnt.GetLinkEnt()
		vector viewVector = player.GetViewVector()
		vector eyePosition = player.EyePosition()
		vector carePackagePos = carePackageEnt.GetOrigin()
		vector dirToCarePackage = Normalize( carePackagePos - eyePosition )
		if( DotProduct( dirToCarePackage, viewVector ) > deg_cos( PERK_HIGHLIGHT_DEGREES ) )
		{
			Perks_SetHighlightedPerkIcon( revealEnt, ePerkIndex.CARE_PACKAGE_INSIGHT )
		}

		thread Perk_CarePackageInsight_ResetRevealDistance( rui, revealEnt )
		RuiTrackFloat3( rui, "pos", carePackageEnt, RUI_TRACK_ABSORIGIN_FOLLOW  )
	}
}

void function Perk_CarePackageInsight_ResetRevealDistance( var rui, entity revealEnt )
{
	revealEnt.EndSignal( "OnDestroy" )
	revealEnt.EndSignal( "Perk_CarePackageInsight_ContentsTaken" )
	revealEnt.EndSignal( "HidePerkMinimapVisibility" )
	clGlobal.levelEnt.EndSignal( "UpdatePerkMinimapVisibility" )

	RuiSetFloat( rui, "minAlphaDist", 999999 )
	RuiSetFloat( rui, "maxAlphaDist", 999999 )
	file.recentlyRevealedEntities.append( revealEnt )

	OnThreadEnd(
		function() : ( revealEnt )
		{
			file.recentlyRevealedEntities.fastremovebyvalue( revealEnt )
		}
	)

	wait( 10 )

	RuiSetFloat( rui, "minAlphaDist", 3000 )
	RuiSetFloat( rui, "maxAlphaDist", 4000 )
}

void function Perk_CarePackageInsight_WaitForContentsTaken( entity carePackage )
{
	if( !IsValid( carePackage ) )
		return

	carePackage.EndSignal( "OnDestroy" )

	carePackage.WaitSignal( "Perk_CarePackageInsight_ContentsTaken" )
	ServerToClient_HidePerkPropMinimapVisibility( carePackage, ePerkIndex.CARE_PACKAGE_INSIGHT )
}

float function Perk_CarePackageInsight_GetPingDistanceForEnt( entity ent )
{
	if( file.recentlyRevealedEntities.contains( ent ) )
		return 999999
	return PERK_ENT_MAX_PING_DISTANCE
}

vector function Perk_CarePackageInsight_GetPingPositionForEnt( entity ent )
{
	entity carePackageEnt = ent.GetLinkEnt()
	if ( !IsValid( carePackageEnt ) )
		return <0, 0, 0>

	return carePackageEnt.GetOrigin()
}

void function ListenToDroppodEmptied( entity droppod, var minimapRui, var fullmapRui )
{
	droppod.EndSignal( "OnDestroy" )
	droppod.WaitSignal( "Perk_CarePackageInsight_ContentsTaken" )

	RuiSetBool( fullmapRui, "contentsTaken", true )
	RuiSetBool( minimapRui, "contentsTaken", true )
	ServerToClient_HidePerkPropMinimapVisibility( droppod, ePerkIndex.CARE_PACKAGE_INSIGHT )
}

void function ServerToClient_NotifyPathfinderCooldownReduction( entity beacon )
{
	entity localViewPlayer = GetLocalViewPlayer()
	if ( IsValid( localViewPlayer ) && PlayerHasPassive( localViewPlayer, ePassives.PAS_PATHFINDER ) )
	{
		HidePlayerHint( "#CARE_PACKAGE_INSIGHT_REVEAL_HINT" )
		AddPlayerHint( 2.5, 0.25, $"rui/hud/ultimate_icons/ultimate_pathfinder", "#SURVEY_PATHFINDER_SUCCESS" )
	}
}

#endif          

#if SERVER
       
                                          
 
	                                                        
	 
		                      
			        

		                                                      
		                                                  
		 
			                          
		 


	 

	                             
 
      
#endif