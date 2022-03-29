#if SERVER
                                      
#endif

#if CLIENT
global function ClCommonStoryEvents_Init
#endif

              
global function S12E06_IsEnabled
      

struct
{
              
#if SERVER
	                    
#endif
      
} file


                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
  
                               
                            
                            
                            
                            
                            
                            
  
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    


#if SERVER
                                      
 
	                                              
               
 	                                                                        
       
 
#endif


#if CLIENT
void function ClCommonStoryEvents_Init()
{
	AddCallback_EntitiesDidLoad( EntitiesDidLoad )
               
		AddCreateCallback( "prop_dynamic", OnPropDynamicCreated )
       
}
#endif

#if SERVER || CLIENT
void function EntitiesDidLoad()
{
               
	if ( !S12E06_IsEnabled())
		return

	#if SERVER
		                         
	#endif
       
}
#endif                    

              
#if SERVER || CLIENT
bool function S12E06_IsEnabled()
{
	if ( !Control_IsModeEnabled() )
		return false

	int currentUnixTime  = GetUnixTimestamp()
	if ( currentUnixTime < expect int( GetCurrentPlaylistVarTimestamp( "s12e06_enabled", UNIX_TIME_FALLBACK_2038 ) ) )
	{
		return false
	}
	else if ( currentUnixTime >= expect int( GetCurrentPlaylistVarTimestamp( "s12e06_disabled", UNIX_TIME_FALLBACK_2038 ) ) )
	{
		return false
	}

	return true
}
#endif

#if SERVER
                                  
 
	                                     
 

                                       
 
	                             
	             
	             

	                  
	 
		                           
			                              
			                   
			     
		                             
			                               
			                   
			     
		                         
			                               
			                  
			     
		        
			      
			     
	 

	                                                         
 
#endif

#if CLIENT
void function OnPropDynamicCreated( entity prop )
{
	if ( prop.GetScriptName() != AD_DRONE_PROJECTOR_MODEL_SCRIPTNAME )
		return

	if ( GetGameState() >= eGameState.PickLoadout )
		return

	vector origin
	string mapName = GetMapName()
	switch ( mapName )
	{
		case "mp_rr_tropic_island":
			origin = <-10900, -20350, 536>
			break
		case "mp_rr_canyonlands_mu3":
			origin = <8200, -26360, 3200>
			break
		case "mp_rr_olympus_mu2":
			origin = <-2000, -2100, -5600>
			break
		default:
			return
			break
	}

	if ( DistanceSqr(prop.GetOrigin(), origin) > 500 )
		return

	ServerCallback_AdDroneKillBillboardVFX( prop )
	ServerCallback_AdDroneSetBillboardVFX( prop, 8 )
}
#endif
      