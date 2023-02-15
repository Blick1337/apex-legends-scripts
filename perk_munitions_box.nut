const string MUNITIONS_BOX_SCRIPT_NAME = "assault_perk_loot_bin"
global const string MUNITIONS_BOX_LOOT_BIN_SKIN_NAME = "MunitionsBox"

const int HOP_UP_DROP_CHANCE = 20
const int MAG_DROP_CHANCE = 65
const int PURPLE_DROP_CHANCE = 20
const int BLUE_DROP_CHANCE = 100

const int HOP_UP_TIER = 6
const int PURPLE_TIER = 3
const int BLUE_TIER = 2
const int WHITE_TIER = 1

global function Perk_MunitionsBox_Init
global function Perk_SwapMunitionsBoxAndSkirmisherPerks

#if SERVER || CLIENT
global function Perk_MunitionsBox_IsEntMunitionsBox
#endif


#if SERVER
                                                  
                                                                

                             
 
	                                       

	                           

	                               
 

      
 
	                       
	                                       
	                                     
	                                                            
     

                                                                                                                                      
                                                                                                             
#endif

#if CLIENT
global function MunitionsBox_ServerToClient_DisplayOpenedMunitionsBoxPrompt
#endif

void function Perk_MunitionsBox_Init()
{
	if ( GetCurrentPlaylistVarBool( "disable_perk_munitions_box", false ) )
		return

	PerkInfo munitionsBox
	munitionsBox.perkId          = ePerkIndex.MUNITIONS_BOX
	#if SERVER || CLIENT
		munitionsBox.minimapStateIndex = eMinimapObject_prop_script.MUNITIONS_BOX
		munitionsBox.minimapPingType = ePingType.MUNITIONS_BOX
		munitionsBox.mapFeatureTitle = "#PERK_FEATURE_MUNITIONS_BOX"
		munitionsBox.mapFeatureDescription = "#PERK_FEATURE_MUNITIONS_BOX_DESC"
		#if CLIENT
			munitionsBox.worldspaceIconUpOffset = 20
			munitionsBox.ruiThinkThread = Perk_MunitionsBin_RuiThinkThread
			munitionsBox.getPingMaxDistance = Perk_MunitionsBin_GetPingMaxDistance
		#endif
	#endif

	Perks_RegisterClassPerk( munitionsBox )

	#if SERVER
	                                                                                                                     
	 
		                                                  
		                                            
	 
	#endif


	#if SERVER
	                                                                     
	                                                                  
	#endif

	#if CLIENT
	AddCreateCallback( "prop_dynamic", OnMunitionsBoxSpawned )
	AddCreateCallback( "prop_script", OnMunitionsBoxSpawned )
	#endif

	#if SERVER || CLIENT
		Remote_RegisterClientFunction( "MunitionsBox_ServerToClient_DisplayOpenedMunitionsBoxPrompt" )
		Remote_RegisterServerFunction( "MunitionsBox_ClientToServer_MarkMunitionsBoxLoot" )
	#endif
}

#if SERVER
                                                        
 
	                                                                                
 

                                             
 
	                                                                    
 

                                                              
 
	                                                                                       
 

                                                             
 
	                                                                                      
 

                                                  
 
	                                                                                         
 

                                                        
 
	                                                                                 
 

                                                                  
 
	                                                                                       
 

                                                   
 
	                                                                          
 
#endif

bool function Perk_SwapMunitionsBoxAndSkirmisherPerks()
{
	return GetCurrentPlaylistVarBool( "swap_munitions_box_and_skirmisher_perks", false )
}

bool function MunitionsBoxSpawnsSmartLoot()
{
	return GetCurrentPlaylistVarBool( "munitions_box_spawns_smart_loot", true )
}

bool function AllPlayersCanOpenMunitionsBin()
{
	return GetCurrentPlaylistVarBool( "munitions_box_all_players_can_open", true )
}

bool function MunitionsBoxSpawnsSmartOptic()
{
	return GetCurrentPlaylistVarBool( "munitions_box_spawns_smart_optic", true )
}

bool function MunitionsBoxDropsWeaponIfOpeningPlayerIsUnarmed()
{
	return GetCurrentPlaylistVarBool( "munitions_box_drops_weapon_if_opening_player_is_unarmed", true )
}

bool function MunitionsBoxLimitsMagsAndHopUps()
{
	return GetCurrentPlaylistVarBool( "munitions_box_limits_mags_and_hopups", true )
}

bool function MunitionsBoxLimitGoldDrops()
{
	return GetCurrentPlaylistVarBool( "munitions_box_limits_gold_drops", true )
}

bool function MunitionsBox_UseNewLootLogic()
{
	return GetCurrentPlaylistVarBool( "munitions_box_use_new_loot_logic", true )
}

#if SERVER || CLIENT
bool function CanPlayerUseMunitionsBoxCallback( entity player, entity lootBin )
{
	bool result =  CanPlayerUseMunitionsBox( player )
	#if CLIENT
	if( !result )
	{
		AddPlayerHint( 0.1, 0, Perks_GetIconForPerk( ePerkIndex.MUNITIONS_BOX ), "Munitions Bins can be used by Assault Legends" )
	}
	#endif

	return result
}

bool function CanPlayerUseMunitionsBox( entity player )
{
	if( !IsValid( player ) || !player.IsPlayer() || !Perks_DoesPlayerHavePerk( player, ePerkIndex.MUNITIONS_BOX ) || Bleedout_IsBleedingOut( player ) )
		return false

	return true
}

bool function Perk_MunitionsBox_IsEntMunitionsBox( entity ent )
{
	return ent.GetScriptName() == LOOT_BIN_SCRIPTNAME && ent.GetSkin() == ent.GetSkinIndexByName( MUNITIONS_BOX_LOOT_BIN_SKIN_NAME )
}

void function OnMunitionsBoxSpawned( entity ent )
{
	if( !Perk_MunitionsBox_IsEntMunitionsBox( ent ) )
		return

	if( !AllPlayersCanOpenMunitionsBin() )
	{
		AddCallback_CanOpenLootBin( ent, CanPlayerUseMunitionsBoxCallback )
	}

	Perks_AddMinimapEntityForPerk( ePerkIndex.MUNITIONS_BOX, ent )
}

#if SERVER
                                                                               
 
	                                        
		      

	                                        
	                                                                                                            
 

                                                                                                                                                                                                    
 
	                                                     
		      

	                                                           
		      

	                                                                
	                                          
	                                                                 
	                                                                    

	                                   
	 
		                                                                                                      
	 
 

                                               
 
	                  

	                                     
	 
		                                                                     
	 
	    
	 
		                                    
		                                                                 
		                         
		                                                                    
		                                           
		                           
			                             

		                                    
		 
			                                                                                                
			                                                                                    
			                                                                                     
		 

		                                                                                                       
		                                                                                                
		                    
	 
	           
 

                                                          
 
	                                                                           
 

                                                                      
 
	                                                                          
 

                                                        
 
	                                                         

	                                                                                                      
	                           

	                                     
	 
		                                                       
		 
			               
		 
	 
	          
 

                            
 
	                         
	                               
	 
		                  
	 
	                               
	 
		                  
	 
	                             
	 
		                
	 
	                 
 

                                                                                                                             
 
	                                    
	                                                                
	 
		                                                  
		                                       
		                         
		                                 
	 
	                                         
	 
		                                            
		                                                       
		                                            
		                                                         
		                                                          
		 
			                          
		 
		                        
		 
			                                             
		 
		                         
		                                      
	 
 

                                                                           
 
	                           
	
	                                          
	 
		                                                                    

		                                                                
		                                                   

		                                          
		 
			                                  
			                                                                           
		 
	 
	    
	 
		                               

		                                    

		                                                   

		                                              
	 
 

                                                                            
 
	                           

	                                          
	 
		                                                                    

		                                                                                                                                                                 
		                                                                                                                    
		 
			            
		 


		                                                                                            
		                                                                                 
		 
			            
		 
	 

	           
 

                                                                                                                                                                                                                       
 
	                              
	                         

	                                                                                                                       
	 
		                         
		                               
		 
			                                                                                                                   
			                         
			 
				                                       
				 
					                                                                              
					 
						                   
						                                                                  
						                                                      
						                                              
					 
				 
			 
		 

		                                                                                                                       

		                                                               
		 
			                             
			                                
			 
				                                                                                                           
			 
		 

		                              
			        

		                                                 
		 
			                              
				     

			                                                
			                                            

			                                                                

			                        
			 
				                                              
				                                                       
			 

			                                                                                                       
			                                             
			 
				                                               
				                                

				                  
				 
					                                                                         
					                                       
					 
						            
					 

					                                               
					                                                                  
					 
						            
					 
				 

				                  
				 
					                                                                                                                       
					 
						            
					 
				 

				                                                     
				                                                       


				                        
			 

			                                                                                                        
			 
				                        
				 
					                                              
					                                                       
				 
			 

			                                                       

			                        
			 
				                                              
			 

			                                       
			                                     
		 
	 
 

                                                                                                                                                                     
 
	                                  
	                             
	                       

	                                  
	                                

	                                   
	 
		                                  
	 

	                                                       

	                                                                                                                              
	                                                                   
	                                                                                                            
	                          
	 
		                                                                                        
		                           
		                                                        

		                                    
		 
			                                                                                    

			                                                                                                                                                                                                  
			 
				                                    
				 
					                                
				 
				    
				 
					                                
				 
			 

			                                           
			                                                                                                                                                                                                                  

			                                             
			 
				                                                        
				 
					                                              
						     

					                                                                  

					                                                              
					                                                     
				 
			 

			                                          
			                                                   
				                             

			                                                                                      
			                      
			 
				                                                           
				                            
			 

			                                        
			 
				                        
				 
					                                             
					                                                                                                                                                                                                                                              

					                                               
					 
						                                                                    

						                                                                
						                                                       
					 

					                               
					                                                   
						                             

					                                                                        

					                      
					 
						                                                           
						                            
					 
				 
			 

			                                                                 
			 
				                                                                       
				 
					                         
					 
						                                            
					 
					    
					 
						                                            
					 
				 

				                                                                     
			 

			                                                              
			                                                                             
			                                               
			 
				                                                                  

				                                                              
				                                                                                  
				 
					                                                                     

					                                                              
				 

				                                                                                       
			 
		 
		    
		 
			                                          
			 
				                                           
				                                                                                                                                                                                                                                           
				                                             
				 
					                                                                  

					                                                              
					                                                     
					                                                            
				 
				                                                                          
				                      
				 
					                                                           
				 
			 

			                                                                         
			                                                                               
			                                                                                    
			 
				                                                       

				                                                     
				                                              
			 

			                                                                                      
			                                                                                          
			 
				                                                                               
			 

			                                                                 
			 
				                                                                     
			 
		 


		                                  
	 

	                                                                             
	                          
	 
		                                    
		                                                                 
		                                                                
		                              
		                                                                            

		                                                                                                                                                                           
			                                                           
		    
			                             

		                                                                               
		                                                                               

		                                                
		                                       
		 
			                                      
			 
				                                                                  

				                                                            
					                                                      
			 
		 

		                                                                                                                           
		 
			                                    
			 
				                                          
				                                                   
					                             

				                                                                                                         
				                      
				 
					                                                     
					                            
				 
			 
		 
	 

	                
 

                                                                            
 
	                                                                    

	                                                                                            
	 
		           
	 

	            
 

                                                                                                                                                   
 
	                          
	                      
	                          
	                               

	                                                           
	                                     
	 
		                                                        

		                          
		 
			                 
			                  
			                  
			                  
			                 
			                 
				                
				     
		 

		                                                                                                                                            
		 
			                    
		 
	 

	                                                                                            
	                                  
	 
		                                                                     

		                               
		 
			                                   
			 
				                        
				 
					        
				 

				                                                                
				                                    

				                                                                                    
				                               
				 
					        
				 

				                                                             
				                         

				                  

				                                                                                      

				                                      
				 
					                           
						            
				 

				                                                         
				 
					                    

					                           
					 
						                                                  
					 
					    
					 
						                        
					 
					     
				 
			 
		 
	 

	                                          
	 
		                                                                                             
		                                                      
		                                                                       
		 
			                       
			                     

			                                                                         
			                                                    
			 
				                               
				 
					                         
					                        
				 
			 

			                          
			 
				                                            
				                
				        
			 
		 

		                                                         
		                                           
		 
			                                    
			                                                                   

			                                          
			        
		 
	 
 

                                                                         
 
	                                                                    
	                        

	                                                                                 
	                                   
	 
		                          
			        

		                                                                       

		                            
			                  
	 

	                 
	 
		           
	 

	            
 

                                                                  
 
	                             

	                                            
	 
		                                                                                                                               
		 
			           
		 
	 

	            
 

                                                                   
 
	                             

	                                            
	 
		                                                                       
	 
	    
	 
		                               

		                                           

		                                                
	 
 

                                                                                   
 
	                                                       
	                 
	                      
	 
		                                  
		                                                          
		                       
		 
			                                               
			                     
			 
				                                              
			 
			    
			 
				                                             
			 
		 
		                            
		 
			                                             
		 
		                            
		 
			                                               
		 
		                            
		 
			                                          
		 
		                                                                    
		                                           
		                           
			                                    
	 
	    
	 
		                                          
		                                                          
		                                           
		 
			                                                  

		 
	 
	                                
 

                                                                   
 
	                                                 
		      

	                                                                           
	                                  
		      


	                                        
	                                   

	                                                                                                                     
	                                      
	 
		              
		                  
		                                                                   
		                                      
		 
			                                                     
				             
			                                                                                                                         
				                 
		 
		                                            
		                                                                                     
		                                                                    

		                                                                              
		                                                            
		 
			                                                                                                  
			                                                                                    
			 
				                                          
			 
		 
		                                                       
		 
			                                                                                        
			                                                                               
			 
				                                     
			 
		 
	 

	                                                                                                                              

	                         
	                                   
	 
		                                                          
		                        
			                      
	 
	                                                                         

	                                                                                
 

#endif
#endif

#if SERVER
                                   
 
	                             
	                                      
	 
		                                                                                                        
		                                                                                                       
		                                                                                                       
		                                                                                                       
		                                                                                                       
		                                                                                                      

	 

	                                                 
		      

	                                               
	 
		                                                                                                           
		                                                                                                           
		                                                                                                           
		                                                                                                          
		                                                                                                         
		                                                                                                       
		                                                                                                        
		                                                                                                        
		                                                                                                           
		                                                                                                          
		                                                                                                          
		                                                                                                           
		                                                                                                           
		                                                                                                            
		                                                                                                    
		                                                                                                  
		                                                                                                     
	 
	                                                   
	 
		                                                                                                     
		                                                                                                       
		                                                                                                      
		                                                                                                     
		                                                                                                      
		                                                                                                        
		                                                                                                       
		                                                                                                      
		                                                                                                     
		                                                                                                     
		                                                                                                      
		                                                                                                     
		                                                                                                     
		                                                                                                     
		                                                                                                    
		                                                                                                   
		                                                                                                     
		                                                                                                       
	 
	                                                   
	 
		                                                                                                      
		                                                                                                    
		                                                                                                    
		                                                                                                      
		                                                                                                     
		                                                                                                    
		                                                                                                     
		                                                                                                     
		                                                                                                       
		                                                                                                    
		                                                                                                      
		                                                                                                       
		                                                                                                     
		                                                                                                      
		                                                                                                     
		                                                                                                      
		                                                                                                     
		                                                                                                     
		                                                                                                    
		                                                                                                   
		                                                                                                    
	 
	                                               
	 
		                                                                                                       
		                                                                                                        
		                                                                                                       
		                                                                                                        
		                                                                                                       
		                                                                                                     
		                                                                                                     
		                                                                                                       
		                                                                                                         
		                                                                                                        
		                                                                                                       
		                                                                                                        
		                                                                                                         
		                                                                                                        
		                                                                                                      
		                                                                                                       

		                                                                                                 
		                                                                                                  
	 
	                                                     
	 
		                                                                                                    
		                                                                                                   
		                                                                                                   
		                                                                                                     
		                                                                                                    
		                                                                                                   
		                                                                                                   
		                                                                                                 
		                                                                                                     
		                                                                                                   
		                                                                                                   
		                                                                                                     
		                                                                                                     
		                                                                                                  
		                                                                                                     
		                                                                                                      
	 
 

                                                                                    
 
	                                                                
	                     
		          

	                  
	                                                                         
	                                                                       

	                                                  
	 
		                                                            
		                                                                                           
	 


	                            

	                            

	          
 

                                            
 
	                                            
	                                                         
	                     
 

                                                                              
 
	                                                          

	                                                                   
		      

	                                                                                                        
	                             
		      
	                                      
	 
		                      
		                                                         
		 
			                                                 
			                   
				        
			                                    
			 
				                              
				     
			 
		 
		                      
			      
	 

	                                                                      

 

                                                
 
	                                         
		      

	                                                                   
		      

	                                                                                                        
	                                        
 

                                                      
 
	           

	                         
		      

	                                                                                 
	                                                                   
	                                                                                                                                                           

	                                           
		      

	                                                     
	                                     

	                                      
	                                                                                   
	                                                                                              
	                               
		                                                                         
	                                             
	                                                         
	                                                             
	                                                       
 
#endif


#if CLIENT
void function MunitionsBox_ServerToClient_DisplayOpenedMunitionsBoxPrompt()
{
	AddOnscreenPromptFunction( "quickchat", InvokePingOpenedMunitionsBox, 6.0, Localize( "#PING_OPEN_MUNITIONS_BOX" ) )
}

void function InvokePingOpenedMunitionsBox( entity player )
{
	Remote_ServerCallFunction( "MunitionsBox_ClientToServer_MarkMunitionsBoxLoot" )
}

void function Perk_MunitionsBin_RuiThinkThread( var rui, entity ent )
{
	RuiSetFloat( rui, "minAlphaDist", 1500 )
	RuiSetFloat( rui, "maxAlphaDist", 2000 )
}

float function Perk_MunitionsBin_GetPingMaxDistance( entity ent )
{
	return 1500
}
#endif