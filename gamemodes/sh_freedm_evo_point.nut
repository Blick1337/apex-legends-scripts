                       

global function EvoPointRegister
global function EvoPointInit
global function EvoCapturePointHackLocations

const asset OBJ_RADIUS_FX = $"P_radius_marker"                         
const asset EVOCAPTURE_BEAM_FX = $"P_workbench_stock_beam_LT"
const asset EVO_POINT_ADD_FX = $"P_lootpod_door_open"
const int defaultCaptureRadius = 500

void function EvoPointRegister()
{
	FreeDM_RegisterObjectiveType( "evo", EvoPointInit, EvoPointCreate )
}

void function EvoPointInit()
{
    PrecacheParticleSystem( OBJ_RADIUS_FX )
	PrecacheParticleSystem( EVOCAPTURE_BEAM_FX )
	PrecacheParticleSystem( EVO_POINT_ADD_FX )
}

#if CLIENT
                            
void function EvoPointCreate( entity eventWP, FreeDM_ObjectiveData location )
{}
#endif

#if SERVER
                                                                                  
 
	                                         

	                                                  
	                                                

	                       
	                                                                                   
	                                                                                                 
	                                                                                             

	                   
	                                                                                                           
	                      
	                                                          
	                                                         
	                                         
	                                               

                                                                                                                                
	                                                                                        
	                                                                                  

	                                                                                                                                 

	           
	 
		                                                      
		 
			                              
				                      
                                      
                                  
			                          
				                  
		 
	 

	                                 
	                     

	                                       
	                             
	                                                                            

 

                                                                        
 
	                                                        
 

                                                                               
 
	                                 
	                                

	                               
		      

	              
	 
		                                    
		 
			      
		 

		        

		                                                                   
		                                 
		 
			                                                                  
			                                                                                                                                                       
		 

		                                                                  
	 
 


                                                                       
 
	                               
	      
 
#endif

int function GetEvoCapturePointRate()
{
	return GetCurrentPlaylistVarInt( "evo_capture_point_rate", 20 )
}

                                    
array< FreeDM_ObjectiveData > function EvoCapturePointHackLocations()
{
	array< vector > locations
	                                  
	switch ( GetMapName() )
	{
		case "mp_rr_exoplanet":
			                      		      
			locations.append( <  1270, -5469, -144 > )
			                       		      
			locations.append( <  -1897, -1326, -320 > )
			                   			      
			locations.append( <  -1761, 3275, -443 > )
			                   			      
			locations.append( <  3034, 2104, 190 > )
			            				      
			locations.append( <  1148, 1599, -68 > )
			                  			      
			locations.append( <  3612, -2554, -332 > )
			                    		     
			locations.append( <  1397, -1606, -230 > )
			break

		case "mp_rr_homestead":
			                  			      
			locations.append( <  -4626, 2256, -12 > )
			                      		      
			locations.append( <  3985, -3208, 132 > )
			                 			      
			locations.append( <  7110, 433, -172 > )
			                 			      
			locations.append( <  -3511, -1966, -51 > )
			                      		      
			locations.append( <  -1727, -3571, -109 > )
			                      		      
			locations.append( <  -862, 2188, 74 > )
			                    	     
			locations.append( <  1333, -950, -113 > )
			break

		case "mp_rr_angel_city":
			            			      
			locations.append( <  -4259, 1267, 230 > )
			                  		      
			locations.append( <  -1947, 4638, 181 > )
			                 		      
			locations.append( <  -76, 886, 108 > )
			             			      
			locations.append( <  2859, -1594, 200 > )
			              			      
			locations.append( <  1687, -3307, 200 > )
			                  		      
			locations.append( <  80, -2218, 21 > )
			                      	     
			locations.append( <  -99, 1933, 244 > )
			break

		case "mp_rr_black_water_canal":
			                    		      
			locations.append( <  1469, 4670, -126 > )
			           					      
			locations.append( <  -1352, 3801, -256 > )
			                   			      
			locations.append( <  2395, 2834, -224 > )
			             				      
			locations.append( <  2454, -5187, -191 > )
			                    		      
			locations.append( <  3378, -2725, -176 > )
			                 			      
			locations.append( <  1103, -3345, -32 > )
			             				     
			locations.append( <  365, -130, -8 > )
			break

		case "mp_rr_boneyard":
			                  			      
			locations.append( <  -76, -2130, 175 > )
			            				      
			locations.append( <  -3424, -3792, 46 > )
			                   			      
			locations.append( <  -3419, -992, 56 > )
			                    		      
			locations.append( <  2124, 1441, 502 > )
			            				      
			locations.append( <  -430, 3309, 460 > )
			             				      
			locations.append( <  -2000, 1976, 157 > )
			                       		     
			locations.append( <  -283, 1722, 148 > )
			break

        case "mp_rr_crashsite":
                   		      
            locations.append( <  449, 1221, 648 > )
                   		      
            locations.append( <  -734, -1066, 641 > )
                   			      
            locations.append( <  -953, -3028, 930 > )
                   			      
            locations.append( <  -8717, -2854, 638 > )
                   				      
            locations.append( <  -7041, -746, 1008 > )
                   			      
            locations.append( <  -5224, -3593, 985 > )
                   		     
            locations.append( <  -6328, 1550, 1416 > )
            break

		case "mp_rr_rise":
			      
			locations.append( <  -3183, -174, 384 > )
			      
			locations.append( <  1239, 1739, 120 > )
			      
			locations.append( <  -1222, 673, 376 > )
			break

        case "mp_rr_eden":
                  
            locations.append( <  2740, -1120, 328 > )
                  
            locations.append( <  1172, 480, 121 > )
                  
            locations.append( <  -1569, -1415, 96 > )
                  
            locations.append( <  -1786, 680, 63 > )
            break

        case "mp_rr_colony":
                  
            locations.append( <  1526, -1992, 243 > )
                  
            locations.append( <  -1368, -2136, 184 > )
                  
            locations.append( <  -41, 2665, 11 > )
                  
            locations.append( <  1317, 560, 115 > )
            break

		default:
			locations.append( <  0, 0, 0 > )
			locations.append( <  1, 1, 1 > )
			locations.append( <  2, 2, 2 > )
	}

	array< FreeDM_ObjectiveData > data
	foreach( location in locations )
	{
		FreeDM_ObjectiveData newData
		newData.location = location
		newData.radius = defaultCaptureRadius
		data.append( newData )
	}

	return data
}

      