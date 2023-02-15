global function Perk_SupportLootbin_Init
global function SupportBin_ShouldProvideSurvivalAssitance
global function SupportBin_UseBasicLootConfiguration

#if SERVER || CLIENT
global function SupportBin_ShouldUseDiscreteSupportBins
global function SupportBin_ShouldEveryoneAccessSupportBins
global function SupportBin_CanUseSupportBin
global function SupportBin_ShouldSpawnSupportBins
global function SupportBin_EntityIsSupportBin

#if SERVER
                                            
                                          
                                                        
                                                            
#endif
#if CLIENT
global function Perk_SupportBin_SupportBinHasHudMarker
global function Perk_SupportBin_ServerToClient_DisplayOpenedSupportBoxPrompt
#endif
#endif


#if SERVER || CLIENT
global const string LOOT_BIN_SUPPORT_SKIN = "SecretLoot"
global const string LOOT_BIN_DEFAULT_SKIN = "(default)"

global const float SURVIVAL_ASSISTANCE_COOLDOWN_DURATION = 45.0
global const int SURVIVAL_ASSISTANCE_MAX_COUNT = 3
#endif

const string LOOT_ITEM_MEDKIT_NAME = "health_pickup_health_large"
const string LOOT_ITEM_BATTERY_NAME = "health_pickup_combo_large"
const string LOOT_ITEM_PHEONIX_NAME = "health_pickup_combo_full"

const string SUPPORT_BIN_INGAME_LOCKED_HINT = "Support Bins can be used by Support Legends"

#if SERVER
                                             
 
	                          
	                          
	                          
	                          
	                          
	                          
	                          
	                         
 

                                            
 
	                         
	                         
	                         
	                         
	                         
	                         
	                         
	                        
 

                                             
 
	            
	               
	               
	               
	             
	             
	             
	             
 
#endif

enum SurvivalNeedType
{
	SURIVIAL_LOOT_NEED_MRB,
	SURIVIAL_LOOT_NEED_HS,
	SURIVIAL_LOOT_NEED_ANY,
	SURIVIAL_LOOT_NEED_NONE
}

enum SurvivalStatusType
{
	SURIVIAL_LOOT_HAS_MRB,
	SURIVIAL_LOOT_HAS_HS,
	SURIVIAL_LOOT_HAS_NONE
}

#if SERVER
                              
 
	                           
	                                 

	                         
	                     
 

      
 
	                               
	                                       

	                                                                 
     

#endif

void function Perk_SupportLootbin_Init()
{
	if ( !SupportBin_ShouldUseDiscreteSupportBins() )
		return

	PerkInfo extraBinLoot
	extraBinLoot.perkId          = ePerkIndex.EXTRA_BIN_LOOT
	#if SERVER || CLIENT
		extraBinLoot.activateCallback = null
		extraBinLoot.deactivateCallback = null
		extraBinLoot.minimapStateIndex = eMinimapObject_prop_script.SUPPORT_BIN
		extraBinLoot.minimapPingType = ePingType.SUPPORT_BOX
		extraBinLoot.mapFeatureTitle = "#PERK_FEATURE_SUPPORT_LOOTBIN"
		extraBinLoot.mapFeatureDescription = "#PERK_FEATURE_SUPPORT_LOOTBIN_DESC"
	#endif
	#if CLIENT
		extraBinLoot.worldspaceIconUpOffset = 20
		extraBinLoot.ruiThinkThread = Perk_SupportBin_RuiThinkThread
		extraBinLoot.getPingMaxDistance = Perk_SupportBin_GetPingMaxDistance
	#endif

	Perks_RegisterClassPerk( extraBinLoot )

	#if SERVER || CLIENT
		if ( !SupportBin_ShouldSpawnSupportBins() )
			return
	#endif

	#if SERVER
		                               
			                                                                                    
	#endif

	#if CLIENT
		AddCreateCallback( "prop_dynamic", SupportBin_OnPropScriptCreated )
		AddCreateCallback( "prop_script", SupportBin_OnPropScriptCreated )
	#endif

	#if SERVER || CLIENT
		PrecacheModel( LOOT_BIN_MODEL )
		PrecacheParticleSystem( LOOT_BIN_OPEN_REGULAR_FX )
		PrecacheParticleSystem( LOOT_BIN_OPEN_SECRET_FX )

		Remote_RegisterClientFunction( "Perk_SupportBin_ServerToClient_DisplayOpenedSupportBoxPrompt" )
		Remote_RegisterServerFunction( "SupportBin_ClientToServer_MarkSupportBoxLoot" )

		#if SERVER
			                                       
				                                                                              

			                                                                     

		#endif

	#endif
}

#if SERVER || CLIENT
bool function SupportBin_ShouldSpawnSupportBins()
{
	if(GetCurrentPlaylistVarBool("survival_block_lootbin_creation", false ))
		return false

	if(WinterExpress_IsModeEnabled() )
		return false

	if(IsGunGameActive())
		return false

                         
		if(Control_IsModeEnabled())
			return false
                               

                        
                   
               
                              

	return true
}
#endif

bool function SupportBin_ShouldUseDiscreteSupportBins()
{
	#if SERVER || CLIENT
	if( GetMapName().find( "mp_rr_box" ) >= 0 )
	{
		return true
	}
	#endif

	return ( GetCurrentPlaylistVarBool("use_discrete_support_bins", true ) )
}

bool function Perk_SupportBin_SupportBinHasHudMarker()
{
	return ( GetCurrentPlaylistVarBool("supportbin_enable_hud_marker", true ) )
}

bool function Perk_SupportBin_ShouldShowEveryoneSupportBins()
{
	return ( GetCurrentPlaylistVarBool("supportbin_show_everyone", false ) )
}

bool function SupportBin_ShouldLimitSurvivalItems()
{
	return ( GetCurrentPlaylistVarBool("supportbin_enable_survival_rate_limiting", true ) )
}

bool function SupportBin_ShouldProvideSurvivalAssitance()
{
	return ( GetCurrentPlaylistVarBool("supportbin_enable_survival_assistance", true ) )
}

int function SupportBin_Get_RandomizeExclusionDistance()
{
	return ( GetCurrentPlaylistVarInt("supportbin_exclusion_radius", 13000*13000 ) )
}

int function SupportBin_Get_MaxBigHealInSecretLoot()
{
	return ( GetCurrentPlaylistVarInt("supportbin_max_bigheal_count", 2 ) )
}

bool function SupportBin_ShouldEveryoneAccessSupportBins()
{
	return ( GetCurrentPlaylistVarBool("supportbin_inclusive_class_access", true ) )
}

bool function SupportBin_UseBasicLootConfiguration()
{
	return ( GetCurrentPlaylistVarBool("supportbin_use_basic_loot", true ) )
}

bool function SupportBin_UseScalingLoot()
{
	return ( GetCurrentPlaylistVarBool("supportbin_use_scaling_loot", false ) )
}

bool function SupportBin_OnlyScaleSecretLoot()
{
	return ( GetCurrentPlaylistVarBool("supportbin_disable_scaling_regular_loot", true ) )
}

bool function SupportBin_AllowArmorLootInBins()
{
	return ( GetCurrentPlaylistVarBool("supportbin_enable_armor_loot", false ) )
}

bool function SupportBin_ResepectGroundLootRotation()
{
	return ( GetCurrentPlaylistVarBool("supportbin_enforce_ground_loot_rotation", true ) )
}

bool function SupportBin_ValidateSurvivalNeedAgainstTeamInvetory( )
{
	return ( GetCurrentPlaylistVarBool("supportbin_validate_survival_using_team_inventory", true ) )
}

#if SERVER || CLIENT
bool function SupportBin_CanUseSupportBin( entity player, entity lootBin )
{
	bool playerHasPerk = Perks_DoesPlayerHavePerk( player, ePerkIndex.EXTRA_BIN_LOOT )
	if ( !playerHasPerk && !SupportBin_ShouldEveryoneAccessSupportBins() )
	{
		#if CLIENT
			AddPlayerHint( 0.1, 0, Perks_GetIconForPerk( ePerkIndex.EXTRA_BIN_LOOT ), SUPPORT_BIN_INGAME_LOCKED_HINT )
		#endif
		return false
	}

	return true
}

bool function SupportBin_EntityIsSupportBin( entity ent )
{
	if( ent.GetScriptName() != LOOT_BIN_SCRIPTNAME && ent.GetScriptName() != LOOT_BIN_MARKER_SCRIPTNAME )
		return false
	if( !LootBin_HasSecretCompartment( ent ) )
		return false
	return ent.GetSkin() == ent.GetSkinIndexByName( "SecretLoot" )
}
#endif

#if SERVER
                                            
 
	                             
	                                      
	 
		                                                                                              
		                                                                                              
		                                                                                              
		                                                                                              
		                                                                                              
		                                                                                                 
	 

	                                                 
		      

	                                                    
	 
		                                                                                                       
		                                                                                                 
		                                                                                               
		                                                                                                  
		                                                                                            
		                                                                                                 
		                                                                                                
		                                                                                                
		                                                                                                
		                                                                                               
		                                                                                               
		                                                                                                
		                                                                                               
		                                                                                                
		                                                                                                 
		                                                                                                 
		                                                                                                
		                                                                                               
		                                                                                                  
		                                                                                                   
		                                                                                                 
		                                                                                                 
		                                                                                                  
		                                                                                                
		                                                                                                
		                                                                                                 
		                                                                                               
		                                                                                                 
		                                                                                             
		                                                                                                 
		                                                                                                 
		                                                                                                 
		                                                                                               
		                                                                                                 
		                                                                                                
		                                                                                               
		                                                                                              
		                                                                                             
		                                                                                              
		                                                                                             
		                                                                                                
		                                                                                                
		                                                                                                  
		                                                                                                 
		                                                                                                
		                                                                                                  
		                                                                                                 
		                                                                                                 
	 
	                                                   
	 
		                                                                                                       
		                                                                                                 
		                                                                                                 
		                                                                                                  
		                                                                                                
		                                                                                                 
		                                                                                                
		                                                                                                  
		                                                                                                  
		                                                                                                  
		                                                                                                  
		                                                                                                 
		                                                                                                   
		                                                                                                  
		                                                                                                 
		                                                                                                 
		                                                                                                 
		                                                                                                 
		                                                                                                
		                                                                                                  
		                                                                                                
		                                                                                                 
		                                                                                                 
		                                                                                                 
		                                                                                                 
		                                                                                                 
		                                                                                               
		                                                                                                 
		                                                                                               
		                                                                                              
		                                                                                                
		                                                                                                
		                                                                                             
	 
	                                                   
	 
		                                                                                                    
		                                                                                                       
		                                                                                                     
		                                                                                                     
		                                                                                                      
		                                                                                                       
		                                                                                                       
		                                                                                                       
		                                                                                                      
		                                                                                                    
		                                                                                                     
		                                                                                                     
		                                                                                                    
		                                                                                                     
		                                                                                                      
		                                                                                                      
		                                                                                                     
		                                                                                                     
		                                                                                                       
		                                                                                                      
		                                                                                                      
		                                                                                                     
		                                                                                                     
		                                                                                                     
		                                                                                                      
		                                                                                                      
		                                                                                                     
		                                                                                                    
		                                                                                                    
		                                                                                                   
		                                                                                                      
		                                                                                                     
		                                                                                                    
		                                                                                                     
		                                                                                                    
		                                                                                                    
		                                                                                                    
		                                                                                                    
		                                                                                                    
		                                                                                                     
		                                                                                                      
		                                                                                                    
		                                                                                                      
	 
	                                               
	 
		                                                                                                       
		                                                                                                         
		                                                                                                        
		                                                                                                     
		                                                                                                      
		                                                                                                       
		                                                                                                        
		                                                                                                        
		                                                                                                     
		                                                                                                       
		                                                                                                       
		                                                                                                      
		                                                                                                     
		                                                                                                  
		                                                                                                      
		                                                                                                      
		                                                                                                      
		                                                                                                      
		                                                                                                       
		                                                                                                     
		                                                                                                    
		                                                                                                     
		                                                                                                      
		                                                                                                     
		                                                                                                       
		                                                                                                         
		                                                                                                       
		                                                                                                        
		                                                                                                        
		                                                                                                        
		                                                                                                         
		                                                                                                      
		                                                                                                       
		                                                                                                       
		                                                                                                      
		                                                                                                      
		                                                                                                      
		                                                                                                     
		                                                                                                      
		                                                                                                       
		                                                                                                     
		                                                                                                      
		                                                                                                      
		                                                                                                        
		                                                                                                     
		                                                                                                       
		                                                                                                       
		                                                                                                       
		                                                                                                       
		                                                                                                      
		                                                                                                       
		                                                                                                     
		                                                                                                       
		                                                                                                       
		                                                                                                       
		                                                                                                      
		                                                                                                    
		                                                                                                     
		                                                                                                     
		                                                                                                     
	 
	                                                     
	 
		                                                                                             
		                                                                                              
		                                                                                                
		                                                                                               
		                                                                                               
		                                                                                               
		                                                                                                
		                                                                                                
		                                                                                                
		                                                                                                 
		                                                                                                
		                                                                                               
		                                                                                                
		                                                                                               
		                                                                                                
		                                                                                               
		                                                                                               
		                                                                                               
		                                                                                                
		                                                                                                
		                                                                                              
		                                                                                                
		                                                                                                
		                                                                                              
		                                                                                              
		                                                                                               
		                                                                                                
		                                                                                                 
		                                                                                                 
		                                                                                              
		                                                                                                 
		                                                                                               
		                                                                                              
		                                                                                              
		                                                                                                 
		                                                                                               
		                                                                                                
		                                                                                                
		                                                                                               
		                                                                                              
		                                                                                              
		                                                                                              
		                                                                                               
		                                                                                              
		                                                                                            
		                                                                                            
		                                                                                              
		                                                                                               
		                                                                                             
		                                                                                                
		                                                                                                
		                                                                                                 
		                                                                                               
		                                                                                               
		                                                                                               
		                                                                                               
		                                                                                              
	 

	                                          

	                                                                
 

                                                                          
 
	                                                                  

	                        
	 
		                      
		                                                             

		                                                  
		 
			                                        
			                             

			                                              
			 
				                                                                                                                                                           
			 
			    
			 
				                                                                                                                                                         
				                                                                                                                                                                      
			 
			                                                                                           
		 

		                                       
		                     		                                                                                                                                           
		                                                                                                                                                                        
		                            

		                                           
		 
			                                                                                                                                                                                 
			                                                                                                        
		 
		    
		 
			                                                                                                                                                                                
			                                                                                                                 
		 

		                                                                                                                                                                                  
		                                             
		 
			                                          
			                                                                 

			                                           
			 
				                                                    
				 
					                                                                               
				 
			 
		 

		                                                     

		                                                                                         

		                                                                  

		                                                                                           

		                                                                   

		                                      
	 

	              
 

                                                                           
 
	                    
	                   
	                 
	                    

	                                         
	 
		                      
		                     
		                   
		                      

		                        

		                                                         

		                                                                                                                                  
		 
			                
			              

			                                            
			 
				               
				             
			 

			                                             
			 
				             
				           
			 

			                                             
			 
				                
				              
			 
		 

		                                                                                               
		 
			                                                            
			 
				                                                                               

				                                               
				 
					               
					             
				 

				                                                
				 
					             
					           
				 

				                    

				                 
				              
			 
			    
			 
				                                                                               
				                 
				              
				              
			 
		 

		                                                                                                                       
		 
			                                                                               
			                
			              
			                 
			              
		 

		                                                                                                                                                            
		 
			                                                                               

			                                               
			 
				               
			 

			                                                
			 
				             
				                
				           
				             
			 

			                    
		 
	 
 

                                                                                                
 
	                                  
 

                                                
 
	                                                         
	                                                        

	                                            
	 
		                     
			                                           
		    
			                                            

		                                                                                      
		                                                                                     

		                                    
		                                   

		                   		                                                                      

		                     
		 
			                
		 

		                         		                                                                            
		                                                       

		                                                                                                                            
		                                                                                                                                

		                    
			                                                                                                          

		                     
			                                                                                                  

		                                                                                                
	 
 

                                                                
 
	                                                                            

	                     
	                        

	                                                    
	 
		                                                        
		 
			                       
			        
		 
		                                                         
		 
			                          
			        
		 
	 

	                                                
 

                                                                                                                                                               
 
	                         

	                                   
	                               

	                     
	                        

	                                           
	 
		                                           
		 
			                       
			                                          
			                   
			        
		 
		                                            
		 
			                          
			                                          
			                   
			        
		 
	 

	                                                                                                                       
	 
		                                                   
		                                                                                
		                          
		                   
		                                     
	 

	                           

	                                      
	 
		                                                                
		                                        
		 
			                                                    
			 
				                                    
				                                       
				                     
			 
		 
	 

	                           
	 
		                             
		                                                                                                                                 
		                                              
			                               
	 

	                        
 

                                                        
 
	                                               
	                        
		      

	                                                  
	                       
	                                    
	                                       

	                                                               

	                                                                                 

	                                    
	 
		                                             
		 
			             
			                                                    
			 
				                                                                                                                                                                     
				 
					       
				 
			 
			                                            
			 
				                                               
				                       
				   
				     
			 
			    
			 
				                                                  
				                       
				   
			 
		 
	 

	                                                          
	 
		                                                      
		                    
	 
 

                                                                                       
 
	                                               
		      

	                             
		      

	                     
	                                                
	 
		                                            
			                                             
				                                                                       
				 
					                                
				 
			    
				                                
			     
		                                             
			                                             
				                                                                      
				 
					                               
				 
			    
				                               
			     
		                                             
			                                             
			 
				                                                                                                                                                                                                
				 
					                                                                           
				 
				                                                                                                                                                                                                    
				 
					                                
				 
				                                                                                                                                                                                                    
				 
					                               
				 
			 
			    
			 
				                                                     
				 
					                                                                           
				 
			 
			     
	 

	                     
		      

	                                              
	                                                                      
	                                     
	 
		                                    
			      
	 

	                                             
	 
		                                                                          

		                                                                
		                                        
		                                               

		                                     
		 
			                              
		 
	                                   
	    
	 
		                                  

		                                      
		                                

		                                                   
	 

	                                                                      

	                                                                              
 

                                                            
 
	                                             
	 
		                                                                          

		                                                                                                                                                                   
		                                       
		 
			                                                                

			                                                                            
			 
				            
			 
			    
			 
				                                         
			 
		 

		                                                                                                                                                               
		                                     
		 
			                                                                    
			 
				            
			 
		 
	 




	                                                                                                                                                                                                                                                                         
	 
		           
	 

	                                                                                          
	 
		            
	 

	            
 

                                                                    
 

	                                                                                    

	                                           
	 
		                                              
	 
	                                              
	 
		                                               
	 

	                                                

 

                                                              
 

	                      
	                       

	                                                          
	 
		                                                                      
		 
			                           
			 
				                                                                                                       
				 
					        
				 

				                                                                                                      
				 
					                
				 

				                                                                                                       
				 
					                 
				 
			 
		 
	 

	                                                                                                                                                                                                                   
	 
		                                                                       
		 
			                                               
		 

		                                             
	 

	                                                                                                                                                                                                                                             
	 
		                                                                        
		 
			                                               
		 

		                                              
	 

	                                                                                                                                                                  
	 
		                                              
	 

	                                               
 

                                                                           
 
	                                           
		      

	                                           
	                                                                                                          
 

#endif

#if CLIENT
void function SupportBin_OnPropScriptCreated( entity ent )
{
	if( ent.GetScriptName() != LOOT_BIN_SCRIPTNAME && ent.GetScriptName() != LOOT_BIN_MARKER_SCRIPTNAME )
		return
	if( !LootBin_HasSecretCompartment( ent ) )
		return
	if( ent.GetSkin() != ent.GetSkinIndexByName( "SecretLoot" ) )
		return

	Perks_AddMinimapEntityForPerk( ePerkIndex.EXTRA_BIN_LOOT, ent )
	AddCallback_CanOpenLootBin( ent, SupportBin_CanUseSupportBin )
}

void function Perk_SupportBin_ServerToClient_DisplayOpenedSupportBoxPrompt()
{
	AddOnscreenPromptFunction( "quickchat", InvokePingOpenedSupportBox, 6.0, Localize( "#PING_OPEN_SUPPORT_BOX" ) )
}

void function InvokePingOpenedSupportBox( entity player )
{
	Remote_ServerCallFunction( "SupportBin_ClientToServer_MarkSupportBoxLoot" )
}

float function Perk_SupportBin_GetPingMaxDistance( entity ent )
{
	return 1500
}

void function Perk_SupportBin_RuiThinkThread( var rui, entity ent )
{
	RuiSetFloat( rui, "minAlphaDist", 1500 )
	RuiSetFloat( rui, "maxAlphaDist", 2000 )
}
#endif

#if SERVER

                                                                                                                                                                                                      
 
	                                               
		      
	                                                           
		      
	                                                                 
	                                                   
	                                         

	                                           
	                                                                 
	                                                                      

	                                                                                                       
 
#endif
