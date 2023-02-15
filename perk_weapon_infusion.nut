global function Perk_WeaponInfusion_Init

#if SERVER || CLIENT
#endif

#if SERVER
                                                 
                                                           
#endif

#if CLIENT
global function CL_WeaponDurability_ActivateHUDMeter
global function CL_WeaponDurability_DeactivateHUDMeter
global function ServerToClient_AppendUnstableHarvesterEnt
global function ServerToClient_UpdateUsedHarvesters
#endif


const bool PERK_WEAPON_INFUSION_DEBUG 						= true
const bool DEBUG_PERK_WEAPON_INFUSION_AUTO_LOOP		 		= false
const float DEBUG_PERK_WEAPON_INFUSION_LOOP_TEST_TIME 		= 5.0

const string PERK_INFUSED_WEAPON_DURABILITY_NETVAR 			= "perkInfusedWeaponDurability"

const int PERK_INFUSED_WEAPON_MAX_DURABILITY 				= 100                                           
const float PERK_WEAPON_INFUSION_DURABILITY_DAMAGE_FRAC 	= 0.25                                                                                      
const float UNSTABLE_HARVESTER_MAX_VISIBLE_WP_RANGE 		= 2500

const float UNSTALBLE_HARVESTER_CREATION_DELAY 				= 10.0	                                                         
const float UNSTABLE_HARVESTER_MIN_SEPARATION_RANGE 		= 6000
const float UNSTABLE_HARVESTER_DISTANCE_TO_INTERACT 		= 150

const asset PERK_WEAPON_INFUSION_DESTROY_WPN_FX				= $"P_exp_hold_exp_emp_med"                              
const asset PERK_WEAPON_INFUSION_UNSTABLE_BEAM_FX			= $"P_wpn_orbital_laser"
const string PERK_WEAPON_INFUSION_DESTROY_WPN_SFX 			= "Newcastle_Ultimate_Wall_Destroy"

struct InfusedWeaponInfo
{
	entity weapon
	int durability
}

struct SavedWeaponInfo
{
	entity weapon
	string weaponRef
	array<string> lootTags
	array<string> attachments
}

struct
{
	table<entity, InfusedWeaponInfo > infusedWeaponData
	table<entity, SavedWeaponInfo > savedWeaponData
	table<entity, entity> infusedWeapon
	array<entity> craftingHarvesters
	array<entity> unstableHarvesters
	table<entity, array> playerUsedHarvesters
	#if CLIENT
		var infusedWeaponRui
	#endif
} file

void function Perk_WeaponInfusion_Init()
{
	if ( GetCurrentPlaylistVarBool( "disable_perk_weapon_infusion", true ) )
		return

	PerkInfo weaponInfusion
	weaponInfusion.perkId          = ePerkIndex.WEAPON_INFUSION
	#if SERVER || CLIENT
		weaponInfusion.activateCallback = OnActivate_PerkWeaponInfusion
		weaponInfusion.deactivateCallback = OnDeactivate_PerkWeaponInfusion
	#endif
	Perks_RegisterClassPerk( weaponInfusion )

	RegisterSignal( "Deactivate_PerkWeaponInfusion" )
	RegisterSignal( "OnLeave_UnstableHarvesterRange" )

#if SERVER
	                                                                      
	                                                                                 
	                                                                              
	                                                                                   
	                                                                
	                                                              
#endif

	#if SERVER || CLIENT
		RegisterNetworkedVariable( PERK_INFUSED_WEAPON_DURABILITY_NETVAR, SNDC_PLAYER_EXCLUSIVE, SNVT_INT, -1 )

		PrecacheParticleSystem( PERK_WEAPON_INFUSION_DESTROY_WPN_FX )
		PrecacheParticleSystem( PERK_WEAPON_INFUSION_UNSTABLE_BEAM_FX )

		Remote_RegisterClientFunction( "CL_WeaponDurability_ActivateHUDMeter", "entity", "entity" )
		Remote_RegisterClientFunction( "CL_WeaponDurability_DeactivateHUDMeter", "entity" )
		Remote_RegisterClientFunction( "ServerToClient_AppendUnstableHarvesterEnt", "entity", "entity" )
		Remote_RegisterClientFunction( "ServerToClient_UpdateUsedHarvesters", "entity", "entity" )
		Remote_RegisterServerFunction( "ClientCallback_AttemptUse_UnstableHarvester", "entity" )
	#endif

	#if CLIENT
		RegisterConCommandTriggeredCallback( "+use_alt", AttemptUse_UnstableHarvester )        
	#endif
}





#if SERVER || CLIENT
void function OnActivate_PerkWeaponInfusion( entity player, string characterName )
{
	#if SERVER
		                                                  
	#endif

	#if CLIENT
		thread CL_Track_UnstableHarvesters_Thread( player )
	#endif

}
#endif

#if SERVER || CLIENT
void function OnDeactivate_PerkWeaponInfusion( entity player )
{
	#if SERVER
		                                                 
	#endif
}
#endif

#if SERVER             
                                                                
 
	                                
	                              
	                                                    

	                                       

	                                                                         

	                                       

	            
		                
		 

		 
	 

	              
	 
		                        
			      


		                                                          
		                                  
		 
			                                 
			 
				                                     
				 
					                                                                                              
				 
				                                 
			 

			                                   

			                                     
			 
				                     
					        


				               	       
				           		       

				                                         
				 
					                                                       
						             
				 

				                                                              
				                                                               
					                

				                          
				 
					                           
					                                                             
					 
						                                                                             
						 
							                     
							     
						 

					 

					                     
					 
						                                                         
						                                        
						                           

						                                                          
					 
				 
				    
				 
						                                                             
					 
						                                                                             
						 
							                               
							                   
								            

							                                                                   
							     
						 

					 
				 
			 

		 


		                               
		       
			                                                                

			                                          
			 
				                                                                                                                      


				                             
				 

					                                                      
						                                                               
				 
			 

			                                          
				                                              
			    
		            

		           
	 
 
#endif

#if SERVER || CLIENT
bool function IsWeaponValidForInfusion( entity player, entity weapon )
{
	if( !IsValid( weapon ) )
		return false

	LootData data      	= SURVIVAL_GetLootDataFromWeapon( weapon )
	string weaponRef 	= data.baseWeapon

	                                             
	if ( SURVIVAL_Loot_IsRefValid( weaponRef ) )
	{
		array<string> baseWeaponlootTags = data.lootTags
		bool isGoldWeapon = data.lootTags.contains( WEAPON_LOCKEDSET_MOD_GOLD )

		if ( isGoldWeapon )
			return false

		bool usesAmmoPool = bool ( GetWeaponInfoFileKeyField_Global( data.baseWeapon, "uses_ammo_pool" ) )
		if ( !usesAmmoPool )                  
			return false
	}

	                                                             
	if( player in file.infusedWeaponData )
	{
		entity infusedWeapon = file.infusedWeaponData[ player ].weapon
		if( IsValid( infusedWeapon ) )
			return false
	}

	return true
}
#endif

#if SERVER
                                                                                     
 
	                                                             
	                                  
	                                             

	                                                                    
	                               
	                                                   
	 
		                                                                                     
		                      
		 
			                                    
		 
	 

	                  
	                                           
	   
	  	           		                                                                     
	  	                                                                                                                                                                   
	   

	                          
	                               
	                       				        
	                         			           
	                        			               
	                           			                   

	                                                 

	                                   
	                                   

	                                                           
	                                                              
	                                                                                      
	                                      
	                                          

	                                                                                                      

	                                                                 
	                   
	                

	                                        
	                                                                              

	                      
	            	               
	               	                                    

	                                      

	                                                                                                   

	                                                          

 
#endif

#if SERVER
                                                                        
 
	                              
	                                
	                                            
	                                                                                                                                                                

	                                

	            
		                               
		 
			                       
			 
				                               
			 
		 
	 

	                                                                                               

	             
	 
		                                         
			      

		                                                           
		              		                                           

		                              
			      

		                                                   
		                                                    
		                                             

		                                                                                            
		                                                                  
			      

		           
	 
 
#endif

#if SERVER
                                                    
 
	                        
		      

	                                                  
	                                                                                                                                                     
	                                      
		                                     

	                                                                                         
 
#endif

#if SERVER
                                                                       
 
	                                                                       

	                      
		      

	                                         
		      

	                                                              
	                                             

	                                   
	                                   

	                                                              
	                                                                                                   
	                       		                          
	                         	                             

	                                                         
	                                                    
		                                                     

	                                                                                                               

	                                                                 
	                   
	                

	                                   
 
#endif         


#if SERVER
                                                                             
 
	      

	                   
	 
		                
		                                
		                                                                        
		                                                                    
		                                                                                    


		                                                                          
		                                                              
		                       		                          
		                         	                             

		                                                         
		                                                    
			                                                     

		                                                                    
			                                                                     

		                  
		                                                    
		 
			              		                                                       
			                                                                                                                                                                      
		 

		                                                                                       

		              
	 
 
#endif

#if SERVER
                                                                                                           
 
	                                          
		      

	                                                            
	                               
	 
		                                                                  
		                                  
		                   
		                  
		                          
			      

		                                                         
	 
 
#endif


#if CLIENT
void function CL_WeaponDurability_ActivateHUDMeter( entity player, entity weapon )
{
	if ( player != GetLocalViewPlayer() )
		return

	thread CL_WeaponDurability_HUDMeterRui_Thread( player )
}

void function CL_WeaponDurability_DeactivateHUDMeter( entity player )
{
	if ( player != GetLocalViewPlayer() )
		return

	Signal( player, "Deactivate_PerkWeaponInfusion" )
}
#endif         

#if CLIENT
void function CL_WeaponDurability_HUDMeterRui_Thread( entity player )
{
	EndSignal( player, "OnDeath" )
	EndSignal( player, "OnDestroy" )
	EndSignal( player, "Deactivate_PerkWeaponInfusion" )

	int durability = 0

	OnThreadEnd(
		function() : ( player )
		{
			if(	file.infusedWeaponRui != null )
			{
				RuiDestroy( file.infusedWeaponRui )
				file.infusedWeaponRui = null
			}
		}
	)

	if(	file.infusedWeaponRui != null )
	{
		RuiDestroy( file.infusedWeaponRui )
		file.infusedWeaponRui = null
	}

	durability = player.GetPlayerNetInt( PERK_INFUSED_WEAPON_DURABILITY_NETVAR )

	file.infusedWeaponRui = CreateCockpitRui( $"ui/infused_weapon_durability.rpak" )

	RuiSetFloat( file.infusedWeaponRui, "progress", 0.0 )
	RuiSetString( file.infusedWeaponRui, "barLabel", "DURABILITY" )

	RuiSetInt( file.infusedWeaponRui, "durability", durability )
	RuiSetInt( file.infusedWeaponRui, "maxDurability", PERK_INFUSED_WEAPON_MAX_DURABILITY )

	float progress = 0.0
	while ( true )
	{
		durability = player.GetPlayerNetInt( PERK_INFUSED_WEAPON_DURABILITY_NETVAR )

		progress = durability.tofloat() / PERK_INFUSED_WEAPON_MAX_DURABILITY
		RuiSetInt( file.infusedWeaponRui, "durability", durability )
		RuiSetFloat( file.infusedWeaponRui, "progress", progress )

		WaitFrame()
	}
}
#endif         


#if SERVER
                                                                    
 
	       
		                                 
			                                                 
	      

	                         
		      

	                                                                                       
		                                                                          
 

                                                                      
 
	       
		                                 
			                                                     
	      

	                                                                                       
		                                                                          
 
#endif         

#if SERVER
                                                                       
 
	       
		                                 
			                                                    
	      

	                                                 

	                                                                                  
		                                                                             
 
#endif         

#if SERVER
                                                                                  
 
	       
		                                 
			                                               
	      

	                                                    
	                                                      
	                                             
		      

	                                                       
	              			                                    
	                     	                                         
	              			                                             

	                                                     
		      

	                             
		      

	                                                       
	                                                 
	                                                                          

	                                                                       
	                                                           

	                                                                                

	       
		                                 
		 
			                                       
			                                                                                                                                                     
		 
	      

 
#endif          

#if SERVER
                                                                                                  
 
	                                           
		                               
 
#endif

#if SERVER
                                                 
 
	                                         
 
#endif

#if SERVER
                                                         
 
	                                                     
		      

	                                        
 

                                                
 
	                                                                                                                      
	                                       

	                                	                         

	                                          
	 
		                           
			        

		                         
		                                     

		                                         
		 
			                  
			 
				                                                  
				                                                    
				 
					                     
					     
				 
			 
		 

		                   
		 
			                                           
			                                                                       
		 

	 

       
	                                 
	 
		                                                                       
	 
      

 
#endif         


#if CLIENT
void function ServerToClient_AppendUnstableHarvesterEnt( entity player, entity randHarvester )
{
	if ( player != GetLocalClientPlayer() )
		return

	if( file.unstableHarvesters.contains(randHarvester) )
		return

	file.unstableHarvesters.append(randHarvester)
}
#endif         

#if CLIENT
void function ServerToClient_UpdateUsedHarvesters( entity player, entity harvester )
{
	if ( player != GetLocalViewPlayer() )
		return

	if( !( player in file.playerUsedHarvesters ) )
		file.playerUsedHarvesters[player] <- []
	else if( file.playerUsedHarvesters[player].contains(harvester) )
		return

	file.playerUsedHarvesters[player].append(harvester)
}
#endif         


#if SERVER
                                                                          
 
	                           
		            

	                                                        
		            

	                                              
		            

	                                                           
		            

	           
 
#endif         

#if SERVER || CLIENT
bool function IsUnstableHarvesterInActivationRange( entity player, entity harvester )
{

	                                                           
	                                                                                                 

	float distToHarvester = Distance( player.GetOrigin(), harvester.GetOrigin() )
	if( distToHarvester > UNSTABLE_HARVESTER_DISTANCE_TO_INTERACT )
		return false          

	vector dirToHarvester = harvester.GetOrigin() - player.GetOrigin()
	float dotToHarvester = DotProduct( player.GetViewForward(), dirToHarvester  )

	if( dotToHarvester > 0.80 )
	{
		return true
	}


	return false
}
#endif

#if CLIENT
void function AttemptUse_UnstableHarvester( entity player )
{
	if ( player != GetLocalClientPlayer() )
		return

	if ( !( Perks_DoesPlayerHavePerk( player, ePerkIndex.WEAPON_INFUSION ) ) )
		return

	array<entity> unstableHarvesters = file.unstableHarvesters
	foreach( harvester in unstableHarvesters )
	{
		if ( !IsValid( harvester ) )
			continue

		if ( IsUnstableHarvesterInActivationRange( player, harvester ) )
			Remote_ServerCallFunction( "ClientCallback_AttemptUse_UnstableHarvester", harvester )
	}
}
#endif         


#if SERVER
                                                                                            
 
	                        
		      
	                                                                    
	                                              
		                                       
	    
	 
		                                                                       
		                        
			      
	 

	                                                                                                                      
	                             
	 
		                                                      
		 
			                                                               
			                                                   
			                                                                                              
			                                                                 
		 
	 
 
#endif          



#if CLIENT
void function CL_Track_UnstableHarvesters_Thread( entity player )
{
	EndSignal( player, "OnDeath" )
	EndSignal( player, "OnDestroy" )

	if( player != GetLocalClientPlayer() )
		return

	array<entity> unstableHarvesters = file.unstableHarvesters
	table<entity,int> harvesterBeamFX
	bool useBeam = false

	OnThreadEnd(
		function() : ( harvesterBeamFX, player )
		{
			if( IsValid( player ) )
			{
				foreach( harvester in file.unstableHarvesters )
				{
					if( !IsValid( harvester ) )
						continue

					if( player in file.playerUsedHarvesters )
					{
						if( file.playerUsedHarvesters[player].contains(harvester) )
						{
							if( harvester in harvesterBeamFX )
							{
								int hBeamFX = harvesterBeamFX[harvester]
								if ( EffectDoesExist( hBeamFX ) )
									EffectStop( hBeamFX, true, true )

								delete harvesterBeamFX[harvester]
							}

						}
					}


				}
			}
		}
	)

	entity lastHarvesterInRange
	bool harvestersCreated

	while( true )
	{
		if( !IsValid( player ) )
			return

		if( file.unstableHarvesters.len() > 0 && !harvestersCreated )
		{
			thread CL_UnstalbeHarvester_DisplayOnMap_Thread( player )
			harvestersCreated = true
		}

		foreach( harvester in file.unstableHarvesters )
		{
			if( !IsValid( harvester )  )
				continue

			if( !( harvester in harvesterBeamFX ) )
			{
				if( useBeam )
				{
					int fxid = GetParticleSystemIndex( PERK_WEAPON_INFUSION_UNSTABLE_BEAM_FX )
					int beamHandleFX = StartParticleEffectInWorldWithHandle( fxid, harvester.GetOrigin(), <0,0,0> )

					harvesterBeamFX[harvester] <- beamHandleFX

					                                                                         
				}

			}

			bool harvesterIsUsed = false

			if( player in file.playerUsedHarvesters )
			{
				if( file.playerUsedHarvesters[player].contains(harvester) )
				{
					if( harvester in harvesterBeamFX )
					{
						harvesterIsUsed = true
						int hBeamFX = harvesterBeamFX[harvester]
						if ( EffectDoesExist( hBeamFX ) )
							EffectStop( hBeamFX, true, true )
					}
				}
			}

			bool inRange = IsUnstableHarvesterInActivationRange( player, harvester )
			if( inRange && !harvesterIsUsed )
			{
				if( harvester != lastHarvesterInRange )
				{
					thread CL_UnstableHarvester_DisplayInfuseWeaponHint_Thread()
					lastHarvesterInRange = harvester
				}
			}
			else
			{
				if( harvester == lastHarvesterInRange )
				{
					Signal( player, "OnLeave_UnstableHarvesterRange" )
					lastHarvesterInRange = null
				}
			}

		}

		WaitFrame()
	}
}

#endif         

#if CLIENT
void function CL_UnstableHarvester_DisplayInfuseWeaponHint_Thread()
{
	entity player = GetLocalViewPlayer()

	if ( !IsValid( player ) )
		return

	if( player != GetLocalClientPlayer() )
		return

	EndSignal( player, "OnDeath" )
	EndSignal( player, "OnDestroy" )
	EndSignal( player, "OnLeave_UnstableHarvesterRange" )

	var rui = CreateCockpitRui( $"ui/unstable_harvester_use_prompt.rpak", HUD_Z_BASE )

	const string PERK_WEAPON_INFUSION_ACTIVATE_HINT = "#WEAPON_INFUSION_ACTIVATE_HINT"
	const string PERK_WEAPON_INFUSION_INVALID_WEAPON_HINT = "#WEAPON_INFUSION_INVALID_WEAPON_HINT"
	const string PERK_WEAPON_INFUSION_INVALID_WEAPON_ALT_HINT = "#WEAPON_INFUSION_INVALID_WEAPON_ALT_HINT"

	OnThreadEnd(
		function() : ( rui )
		{
			RuiDestroyIfAlive( rui )
		}
	)

	while ( IsValid( rui ) )
	{
		entity weapon = SURVIVAL_GetLastActiveWeapon( player )
		entity otherWeapon = GetOtherWeapon ( weapon, player )
		bool mainWeaponIsValid = IsWeaponValidForInfusion( player, weapon )
		bool altWeaponIsValid = true

		if( IsValid( otherWeapon ) )
			altWeaponIsValid = IsWeaponValidForInfusion( player, otherWeapon )                                                                            

		if( mainWeaponIsValid && altWeaponIsValid )
			RuiSetString( rui, "promptText_Use", PERK_WEAPON_INFUSION_ACTIVATE_HINT )
		else if ( mainWeaponIsValid && !altWeaponIsValid )
			RuiSetString( rui, "promptText_Use", PERK_WEAPON_INFUSION_INVALID_WEAPON_ALT_HINT )
		else
			RuiSetString( rui, "promptText_Use", PERK_WEAPON_INFUSION_INVALID_WEAPON_HINT )

		WaitFrame()
	}
}
#endif         


#if CLIENT
void function CL_UnstalbeHarvester_DisplayOnMap_Thread( entity player )
{
	Assert( IsNewThread(), "Must be threaded off" )

	if( player != GetLocalClientPlayer() )
		return

	EndSignal( player, "OnDeath" )
	EndSignal( player, "OnDestroy" )

	                                 
	table< entity, var > harvesterMRUI
	table< entity, var > harvesterFRUI

	array<entity> unstableHarvesters 	= file.unstableHarvesters
	array<entity> initalizedUnstableHarvesters

	OnThreadEnd(
		function() : ( initalizedUnstableHarvesters, player, harvesterMRUI, harvesterFRUI )
		{
			if( IsValid( player ) )
			{
				foreach ( harvester in initalizedUnstableHarvesters )
				{
					if( !IsValid( harvester ) )
						continue

					if( harvester in harvesterMRUI )
					{
						var mmRui = harvesterMRUI[harvester]
						if( mmRui != null )
						{
							Minimap_CommonCleanup( mmRui )
							delete harvesterMRUI[harvester]
						}
					}

					if( harvester in harvesterFRUI )
					{
						var fmRui = harvesterFRUI[harvester]
						if( fmRui != null )
						{
							Fullmap_RemoveRui( fmRui )
							RuiDestroyIfAlive( fmRui )
							delete harvesterFRUI[harvester]
						}
					}

				}
			}
		}
	)

	while ( true )
	{

		foreach( harvester in file.unstableHarvesters )
		{
			if( !IsValid( harvester ) )
				continue

			                                                             
			if( !(initalizedUnstableHarvesters.contains( harvester ) ) )
			{
				vector pos 			= harvester.GetOrigin()
				asset icon 			= $"rui/menu/character_select/utility/util_role_offense"
				vector iconColor 	= GetKeyColor( COLORID_HUD_LOOT_TIER4 ) * ( 1.0 / 255.0 )

				float miniMapScale	= 1.5
				float fullMapScale 	= 8.0

				var minimapRui = Minimap_AddIconAtPosition( pos, <0,90,0>, icon, miniMapScale, iconColor )
				var fullmapRui = FullMap_AddIconAtPos( pos, <0,0,0>, icon, fullMapScale, iconColor )

				initalizedUnstableHarvesters.append( harvester )
				harvesterMRUI[harvester] <- minimapRui
				harvesterFRUI[harvester] <- fullmapRui
			}


			if( player in file.playerUsedHarvesters )
			{
				if( file.playerUsedHarvesters[ player ].contains( harvester ) )
				{
					if( harvester in harvesterMRUI )
					{
						var mmRui = harvesterMRUI[harvester]
						if( mmRui != null )
						{
							Minimap_CommonCleanup( mmRui )
							delete harvesterMRUI[harvester]
						}
					}

					if( harvester in harvesterFRUI )
					{
						var fmRui = harvesterFRUI[harvester]
						if( fmRui != null )
						{
							Fullmap_RemoveRui( fmRui )
							RuiDestroyIfAlive( fmRui )
							delete harvesterFRUI[harvester]
						}
					}

				}
			}


		}

		WaitFrame()
	}
}
#endif         

#if SERVER
                                                                                    
 
	                           
		                                                                           

	                                                                   

	                                         
	                                                                        
	                        

	                                          

	         
 
#endif         

#if SERVER
                                                                                     
 
	                            
	                              


	                                       
	                                                                                           
	                                                                                        
	                           
	                                       
	                                                       

	                                                          
	                                                                                                                                                                                     
	                     
	                                                  
	                     


	            
		                                  
		 
			                    
			 
				              
				            
			 
			                       
			 
				               
			 

		 
	 
	                               

	                                                              
	                  

 
#endif         