#if SERVER || CLIENT
global function ShFiringRangeStoryEvents_Init
#endif

              
#if SERVER
                                        
#endif

#if CLIENT
global function ServerCallback_FRC_FinaleShowUI
#endif

const vector S12E04_FINALE_ORIGIN = <-1758.6, -43515.3, 179>
const vector S12E04_FINALE_ANGLES = <6.5, -93.3, 0.0>
const string S12E04_SKYBOX_TARGETNAME = "skybox_cam_tropics_level"
const asset S12E04_BOTTLE = $"mdl/props/bottle/bottle.rmdl"

const asset CHARACTER_ASSET_BANGALORE = $"settings/itemflav/character/bangalore.rpak"
const asset S12E04_LEGEND_MODEL =  $"mdl/humans/class/medium/pilot_medium_bangalore.rmdl"
      

struct RealmStoryData
{
}

struct
{
	vector bottleOrigin
	table< int,  RealmStoryData > realmStoryDataByRealmTable
} file


                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
  
                               
                            
                            
                            
                            
                            
                            
  
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    

#if SERVER || CLIENT
void function ShFiringRangeStoryEvents_Init()
{
	if ( GetMapName() != "mp_rr_canyonlands_staging" )                                                  
		return

	if ( !IsFiringRangeGameMode() )
		return

	AddCallback_EntitiesDidLoad( EntitiesDidLoad )

	#if SERVER
               
		                              
		                               
		                                           
       
	#endif
}
#endif

#if SERVER || CLIENT
void function EntitiesDidLoad()
{
               
	#if SERVER
	                                                                      
	                         
		      

	                                          
	                    
	#endif
       
}
#endif                    

              
#if SERVER
                                                       
 
	                        
		      

	                                

	                                                                        
	                                                                           

	                                                                                   

	                                  
	                                                         
	                                                         
	                                                      
	                                                     
	                                    
	                                               
	                                                   
	                               

	                              

	                                        
	                                        

	                        

	                                      
	                                    
	                                          

	        

	                                        
	                                       
	                       

	                                                                              
 

                                                        
 
	                         
		      

	                                

	                                                                                                                  
	             
	                                                                                                            
	             

	                                      
 

                                                    
 
	                         
		      

	                                              
	                                                                                                                  
	                              
	                                          

	                                                                                                  

	            
		                         
		 
			                         
				                  
		 
	 

	             
 

                                                  
 
	                        
		      

	                                

	                                                                                                
	                  
	                                            
	                                                
	                                                                                          
	                                    
	                            
	                            
	                                        
	                                                                

	            
		                       
		 
			                       
				                
		 
	 

	             
 


                                                    
 
	                                

	                                                                                                                                                         
	                                           
	                              
	                                          
	                                                           

	            
		                         
		 
			                        
				                  
		 
	 
	
	                                                                    
	                                                          

	        

	                                                           
	                                                                                                                                                                      
 

                                                                                 
 
	                                      
	 
		                                                
			      

		                                

		            
			                       
			 
				                      
					                
			 
		 

		                                                    
		                   
		                                                                    

		                                              
		                                           

		                    
		                                          

		                                                                                          

		                                        
		                                                 
		                                                           
		                               
		                                 
		                                              
		                                    
		                        
		                                                    

		                                                

		                                              
		                                               

		                                            
		                                                      
		                                                        

		                                   

		                                        
		                                                                          

		                        
		                               

		                                                

		                                          
		                                
		                                
		                                  
		                                  

		                                                                                                                    
		                                                                                                                                          
		                                                    
		                                                                              
		                                                  

		                        
		                                 
		                                 
		                                             

		                      
		 
			             
			             
		 

		                                
		                                
		                  

		            
			                            
			 
				                           
					                     
			 
		 

		                                                                                                 
		        
		                                                                       
		                  
		                                                   

		       

		                                                                              
		                                                 

		        

		                                                 
		                                              

		                                       

		        

		                            
		 
			                                  
		 
		    
		 
			                           
			                                
		 
	   
 

                                                                      
 
	                         
	 
		                                                                                                 
		                                                        
		 
			                      
			                                                  
		 
	 
 


                                                       
 
	                                

	        

	                         
		             
 

                                                    
 
	                              
	                         
		      

	                                                                                  
	                                                                              
 

                                                       
 
	                         
		      

	                            
	                                                                              
 
#endif


#if CLIENT
void function ServerCallback_FRC_FinaleShowUI( int index )
{
	switch ( index )
	{
		case 0:
			AddOnscreenPromptFunction( "attack", OnscreenPrompt_DoNothing, 4.0,"#FR_FINALE_ONSCREEN_PROMPT", 100 )
			break
		case 1:
		{
			entity player = GetLocalViewPlayer()
			if ( IsValid( player ) )
				TryOnscreenPromptFunction( player, "attack" )

			break
		}
		case 2:
			thread ServerCallback_S12E04_FinaleCameraThread()
			break
		case 3:
			thread S12E04_MapLocationRUIThread()
			break
	}
}

void function S12E04_MapLocationRUIThread()
{
	PushLockFOV( 0.2 )

	wait 2.0

	var rui = CreateFullscreenRui( $"ui/map_zone_intro_title.rpak", 0 )
	OnThreadEnd(
		function() : ( rui )
		{
			RuiDestroyIfAlive( rui )
		}
	)
	RuiSetString( rui, "titleText", "#MP_RR_TROPIC_ISLAND")
	RuiSetBool( rui, "minimapIsDisabled", false )

	wait 5.0
}

void function ServerCallback_S12E04_FinaleCameraThread()
{
	var titleRui = CreateFullscreenRui( $"ui/s10e04_logo_shake.rpak", 1 )
	RuiSetBool(titleRui, "startAnim", true)
}

void function OnscreenPrompt_DoNothing( entity player )
{

}
#endif
      


