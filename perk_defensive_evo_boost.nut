global function Perk_DefensiveEvoBoost_Init
#if SERVER
                                                
                                                     
#endif
#if CLIENT
global function Perk_DefensiveEvoBoost_SetBoostMultiplier
#endif

const float BOOST_RANGE = 15 * METERS_TO_INCHES
const float BOOST_RANGE_SQR = BOOST_RANGE * BOOST_RANGE
const float BOOST_MULTIPLIER = 2.0
const asset BOOST_IMAGE = $"rui/menu/character_select/utility/util_role_defense"

struct
{
	#if SERVER
		                                                   
	#endif
} file

void function Perk_DefensiveEvoBoost_Init()
{
	if ( GetCurrentPlaylistVarBool( "disable_perk_defensive_evo_boost", true ) )
		return

	PerkInfo defensiveEvoBoost
	defensiveEvoBoost.perkId          = ePerkIndex.DEFENSIVE_EVO_BOOST
	#if SERVER
		                                                                 
		                                                                     
		                                           
		                                             
	#endif
	Perks_RegisterClassPerk( defensiveEvoBoost )

	#if SERVER || CLIENT
		Remote_RegisterClientFunction( "Perk_DefensiveEvoBoost_SetBoostMultiplier", "float", 0.0, 5.0, 16 )
	#endif
}

#if SERVER
                                                                                   
 
	                                          
	 
		                                                    
		           
	 

	            
 

                                                                                 
 
	                                         
	                                         
 

                                                             
 
	                                             
 

                                                       
 
	                                           
	                                

	            
		                       
		 
			                                          
				                                        
		 
	 

	                                           
 

                                                         
 
	                                                                                        

	            
		                       
		 
			                        
				                                                                                         
		 
	 

	                            
	             
	 
		                                  

		                                             
			      

		                                                       

		                                                      
		                                             
		 
			                      
			                                                                                                      
		 
		                                                 
		 
			                       
			                                                                                         
		 
	 
 

                                                                
 
	                                                                                                                
	 
		                                                   
		                      
			                       
	 

	          
 

                                                 
 
	                                                        
	 
		                         
			        	                    

		                                                                              
		 
			           
		 
	 

	            
 
#endif

#if CLIENT
void function Perk_DefensiveEvoBoost_SetBoostMultiplier( float multiplier )
{
	SetEvoArmorModifier( multiplier, BOOST_IMAGE )
}
#endif