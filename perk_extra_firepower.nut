global function Perk_ExtraFirepower_Init

const float EXTRA_FIREPOWER_GRENADE_SPAWN_CHANCE = 0.2

void function Perk_ExtraFirepower_Init()
{
	if ( GetCurrentPlaylistVarBool( "disable_perk_extra_firepower", false ) )
		return

	PerkInfo extraFirepower
	extraFirepower.perkId          = ePerkIndex.EXTRA_FIREPOWER
	#if SERVER || CLIENT
		extraFirepower.activateCallback = ExtraFirepower_Activate
		extraFirepower.deactivateCallback = ExtraFirepower_Deactivate
	#endif
	Perks_RegisterClassPerk( extraFirepower )
}

#if SERVER || CLIENT
void function ExtraFirepower_Activate( entity player, string characterName )
{
	#if SERVER
		                         
			      

		                                                                                      

		                                                             
		                                             
	#endif
}

void function ExtraFirepower_Deactivate( entity player )
{
	#if SERVER
		                         
			      

		                                                                         
		                                                                                                  

		                                                                                      

		                                                             
		                                                             
		                                             
	#endif
}
#endif

#if SERVER
                                                                                                                                                                                                 
 
	                                                                                                                                                      
		      

	                                                                      
		      

	                                                                
		      

	                                       
	 
		                                 
		                                

		         

		                                                                             

		                      
		                                               
		                                                              
		                                                                  
		                                                                                
		                                  
		                                  
		                                                    
	   
 
#endif