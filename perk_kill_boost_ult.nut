global function Perk_KillBoostUlt_Init
#if CLIENT
global function AlertUltGain
#endif

const float ULT_PERCENT_TO_ADD = 0.20
const float BONUS_DEBOUNCE_TIME = 30


struct
{
	#if SERVER || CLIENT
		table<entity, float> lastKnockedBonusTime
		array<entity>		 skirmisherArray
	#endif
} file

void function Perk_KillBoostUlt_Init()
{
	if ( GetCurrentPlaylistVarBool( "disable_perk_kill_boost_ult", true ) )
		return

	PerkInfo killBoostUlt
	killBoostUlt.perkId          = ePerkIndex.KILL_BOOST_ULT
	#if SERVER || CLIENT
		killBoostUlt.activateCallback = OnActivate_KillBoostUlt
		killBoostUlt.deactivateCallback = OnDeactivate_KillBoostUlt

		Remote_RegisterClientFunction( "AlertUltGain", "float", 0.0, 100.0, 16 )
	#endif
	Perks_RegisterClassPerk( killBoostUlt )

	#if SERVER
		                                                                          
		                                                         
	#endif
}

#if SERVER || CLIENT
void function OnActivate_KillBoostUlt( entity player, string characterName )
{
	file.skirmisherArray.append( player )
}

void function OnDeactivate_KillBoostUlt( entity player )
{
	file.skirmisherArray.fastremovebyvalue( player )
}
#endif

#if SERVER
                                                                                            
 
	                                   
 

                                                                                           
 
	                                 	                               
		      

	                                   
 

                                                                                   
 
	                      
	                                                                                                                 
		      

	                                              

	                                                      
	 
		                                                                   
		                                                                           
		 
			                                                                                                                                      
			                                                                                            
			                                                

			                                                                                                     
		 
	 
 

                                                        
 
	                      	                   
	                                                   
	 
		                                                                             
			        

		                                 
		                                                                                                                    
			        

		                                     
		 
			                                                                                
		 
		    
		 
			                                                
		 
	 

	                                 
	                                                       
	 
		                            
		                             
		 
			                                             
			                                                        
				                                
		 
		    
		 
			                                 
		 
	 

	                                           
	                                            
	 
		                                                                                       
	 
 
#endif

#if CLIENT
void function AlertUltGain( float amount )
{
	thread AlertUltGain_Thread( amount )
}

void function AlertUltGain_Thread( float amount )
{
	wait 0.3

	AnnouncementMessageRight( GetLocalClientPlayer(), "Gained Ult Charge: " + string( int( amount ) ) + "%", "", <1,1,1>, $"rui/hud/tactical_icons/tactical_mirage_in_world", 2.5, "ctrl_capturebonus_claimed_1p" )
}
#endif