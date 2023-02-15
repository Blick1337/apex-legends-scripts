global function Perk_NextZoneBeaconScan_Init
global function SurveyBeacons_ShouldUseNextZoneSurveyBeaconProp

#if CLIENT
global function PlayEffects_RingConsole_Pulse
#endif

#if SERVER || CLIENT
global function OnActivate_BeaconScan_Circle
global function Perk_NextZoneSurveyBeacon_GetNextZoneBeaconForEntHit
#endif

#if SERVER
                                               
                                          
                                                           
                                                                     

      
 
	                           
	                           
     
#endif



void function Perk_NextZoneBeaconScan_Init()
{
	if ( !(GetCurrentPlaylistVarBool( "disable_perk_beacon_scan", false ) ) )
	{
		PerkInfo beaconScan
		beaconScan.perkId          = ePerkIndex.BEACON_SCAN
		#if SERVER || CLIENT
			beaconScan.activateCallback = OnActivate_BeaconScan_Circle
			beaconScan.deactivateCallback = OnDeactivate_BeaconScan
			beaconScan.minimapStateIndex = eMinimapObject_prop_script.NEXT_ZONE_SURVEY_BEACON
			beaconScan.minimapPingType = ePingType.ENCRYPTED_CONSOLE
			beaconScan.mapFeatureTitle = "#PERK_FEATURE_RING_CONSOLE"
			beaconScan.mapFeatureDescription = "#PERK_FEATURE_RING_CONSOLE_DESC"
		#endif
		#if CLIENT
			beaconScan.worldspaceIconUpOffset = 96
			beaconScan.ruiThinkThread = SurveyBeacons_RingConsole_RuiUpdate
		#endif
		Perks_RegisterClassPerk( beaconScan )

		#if SERVER || CLIENT
		if( SurveyBeacons_UseNewNextZoneBeaconModel() )
		{
			PrecacheModel($"mdl/props/controller_console/controller_console.rmdl")
		}
		#endif

		#if CLIENT
		PrecacheParticleSystem( $"P_ring_console_pulse" )
		#endif
	}
}

bool function SurveyBeacons_ShouldUseNextZoneSurveyBeaconProp()
{
	#if SERVER || CLIENT
	if( GetMapName().find( "mp_rr_box" ) >= 0 )
	{
		return true
	}
	#endif
	return  GetCurrentPlaylistVarBool("use_seperate_controller_perk_beacon_scan_prop", true )
}

bool function SurveyBeacons_UseNewNextZoneBeaconModel()
{
	return  GetCurrentPlaylistVarBool("perk_next_zone_beacon_use_new_model", true )
}

#if SERVER || CLIENT
entity function Perk_NextZoneSurveyBeacon_GetNextZoneBeaconForEntHit( entity ent )
{
	if( ent.GetScriptName() == NEXT_ZONE_SURVEY_BEACON_SCRIPTNAME )
		return ent
	entity entParent = ent.GetParent()
	if( IsValid( entParent ) && entParent.GetScriptName() == NEXT_ZONE_SURVEY_BEACON_SCRIPTNAME )
		return entParent
	return null
}

void function OnActivate_BeaconScan_Circle( entity player, string characterName )
{
	string calloutLine, player1pAnim, player3pAnim, panelAnim

	calloutLine = "bc_revealNextRingLocation"

	switch ( characterName )
	{
		                                                  
		default:
			break
	}

	RegisterNextZoneSurveyBeaconData( player, calloutLine, player1pAnim, player3pAnim, panelAnim )
}

void function RegisterNextZoneSurveyBeaconData( entity player, string calloutLine, string player1pAnim, string player3pAnim, string panelAnim )
{
	SurveyBeaconData data
	data.canUseFunc = Recon_CanUseBeacon
	#if SERVER
		                                      
	#endif
	data.calloutLine = calloutLine
	data.scanType = eBeaconScanType.BEACON_SCAN_CIRCLE

	#if SERVER

		                         
			                   

		                         
			                      

		                      
			                

		                                               
		 
			                                                                               
			                                                                             
			                                                                             

			                                                                       
			                                                                     
			                                                                     

			                                                                                    
			                                                                                  
			                                                                                  
		 
		                                                            
		 
			                                                                          

			                                                                        
			                                                                       

			                                                                       
			                                                                      
			                                                                     

			                                                                      
			                                                                     
			                                                                    
		 
		    
		 
			                                                                               
			                                                                             
			                                                                             

			                                                                       
			                                                                     
			                                                                     

			                                                                                
			                                                                              
			                                                                              
		 

		                               
	#endif

	RegisterSurveyBeaconData( player, data )
}

bool function Recon_CanUseBeacon( entity player, entity beacon )
{
	if ( HasActiveSurveyZone( player ) )
	{
		#if CLIENT
			AddPlayerHint( 0.1, 0, SurveyBeacon_GetBeaconIcon( beacon ), "#SURVEY_ALREADY_ACTIVE" )
		#endif         
		return false
	}

	if( SurveyBeacons_ShouldUseNextZoneSurveyBeaconProp() && beacon.GetScriptName() != NEXT_ZONE_SURVEY_BEACON_SCRIPTNAME )
		return false

	return true
}

#if SERVER
                                                                                                               
 
	                               
	                             

	                                    
	                                                                          
	 
		          
	 
	                                              
 

                                                                    
 
	                         
 

                                          
 
	                                 
		      

	                             

	                                      
	 
		                                                                            
	 
	                                                    
	 
		                                                                                 
		                                                                                 
		                                                                                 
		                                                                                  
		                                                                                  
		                                                                                 
		                                                                               
		                                                                                
		                                                                                
	 
	                                                   
	 
		                                                                                   
		                                                                                  
		                                                                                  
		                                                                                 
		                                                                                  
		                                                                                  
		                                                                                  
		                                                                                   
		                                                                                  
		                                                                                 
		                                                                                  
		                                                                                 
		                                                                               
		                                                                                 
		                                                                                 
		                                                                                 
		                                                                               
		                                                                                  
		                                                                                  
		                                                                                 
	 
	                                                   
	 
		                                                                                 
		                                                                               
		                                                                                 
		                                                                                
		                                                                                 
		                                                                                
		                                                                               
		                                                                                  
		                                                                                
		                                                                               
		                                                                               
		                                                                                
		                                                                                 
		                                                                                 
		                                                                                
		                                                                                
		                                                                               
		                                                                               
		                                                                               
		                                                                                
		                                                                                
	 
	                                                     
	 
		                                                                                
		                                                                                
		                                                                               
		                                                                                 
		                                                                                 
		                                                                               
		                                                                                 
		                                                                                
		                                                                                
		                                                                              
		                                                                             
		                                                                                
		                                                                               
		                                                                                 
		                                                                                
		                                                                               
		                                                                                 
		                                                                                 
		                                                                                 
		                                                                               
		                                                                                
	 
	                                               
	 
		                                                                                    
		                                                                                  
		                                                                                   
		                                                                                    
		                                                                                    
		                                                                                    
		                                                                                 
		                                                                                   
		                                                                                  
		                                                                                  
		                                                                                  
		                                                                                    
		                                                                                     
		                                                                                     
		                                                                                   
		                                                                                    
		                                                                                  
		                                                                                    
	 

	                                                       
	                                  
 

                                                                    
 
	                                             
	                            
	                                                                   
	                   
	              
	                       

	                                                  
 

                                                                    
 
	                                  
	                                                        
 

                                                                             
 
	                                                        
	 
		                      
		      
	 

	                                               
	 
		                                                
		                                               
		                                               
		                                                                                         
		                      
		                 
		                                                       
		                          
		                      
		                        
	 
	    
	 
		                                                
		                                                
		                                                                                      
		                                                              
		                                               
		                             
		                          
		                                                                                

		                                                   
		                                                               
		                                                                 
		                                                  
		                         
		                    
		                            
		                             
	 

	                                         

	                                                                           
	                                                                                                   
	                                                                     
 

                                                                                        
 
	                           

	                                     

	                        
		                                                            

	                                              

	                                                                                                                                  

	                                      
	                                                          

	                                                           
	 
		                                          
	 
 


#endif
#endif                        

#if CLIENT
void function PlayEffects_RingConsole_Pulse( entity beacon )
{
	array<entity> children = beacon.GetChildren()
	bool foundLocalPlayer = false
	entity localPlayer = GetLocalViewPlayer()
	foreach( entity child in children )
	{
		if( child == localPlayer )
		{
			foundLocalPlayer = true
			break
		}
	}

	if( !foundLocalPlayer )
		return

	EmitSoundOnEntity( beacon, "Controller_RingConsole_ScanPulse_3P" )

	int fxIdx = GetParticleSystemIndex( $"P_ring_console_pulse" )
	string attachPoint = "fx_disc_top"
	int attachIdx = beacon.LookupAttachment( attachPoint )
	StartParticleEffectOnEntity( beacon, fxIdx, FX_PATTACH_POINT_FOLLOW, attachIdx )
}

void function SurveyBeacons_RingConsole_RuiUpdate( var rui, entity ent )
{
	ent.EndSignal( "OnDestroy" )
	ent.EndSignal( "HidePerkMinimapVisibility" )
	clGlobal.levelEnt.EndSignal( "UpdatePerkMinimapVisibility" )

	while( true )
	{
		entity localPlayer = GetLocalViewPlayer()
		bool canUse = !HasActiveSurveyZone( localPlayer )
		vector color = canUse ? INTERACTIBLE_PERK_MINIMAP_COLOR : NON_INTERACTIBLE_PERK_MINIMAP_COLOR
		RuiSetFloat3( rui, "iconColor", color )
		Wait( .5 )
	}
}
#endif