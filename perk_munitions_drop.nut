global function Perk_MunitionsDrop_Init

#if CLIENT
global function ServerToClient_DisplayMunitionsDropMessage
#endif

#if SERVER || CLIENT
#endif

const float PERK_MUNITIONS_DROP_ICON_DRAW_DISTANCE = 3000

struct
{
	array<entity> respawnBeacons
} file

void function Perk_MunitionsDrop_Init()
{
	if ( GetCurrentPlaylistVarBool( "disable_perk_munitions_drop", true ) )
		return

	PerkInfo munitionsDrop
	munitionsDrop.perkId          = ePerkIndex.MUNITIONS_DROP
	#if SERVER || CLIENT
		munitionsDrop.activateCallback = OnActivate_PerkMunitionsDrop
		munitionsDrop.deactivateCallback = null
	#endif
	Perks_RegisterClassPerk( munitionsDrop )

	Remote_RegisterClientFunction( "ServerToClient_DisplayMunitionsDropMessage" )
	RegisterSignal( "Update_TrackRespawnBeacons" )

	#if SERVER
		                                                                     
		                                                                                 
		                                                                                       
	#endif
}

#if SERVER || CLIENT
void function OnActivate_PerkMunitionsDrop( entity player, string characterName )
{
	#if SERVER
		                            
		                                                                              
		                                                                                    

		                                  
		 
			                                                
				                                    
		 

		                                              
		                                                  
	#endif
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

#if CLIENT
void function ServerToClient_DisplayMunitionsDropMessage()
{
	entity player = GetLocalViewPlayer()

	if ( !IsValid( player ) )
		return

	AddPlayerHint( 2.0, 0.25, $"", "#MUNITIONS_DROP_HINT" )
}
#endif