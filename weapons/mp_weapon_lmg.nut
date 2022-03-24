global function MpWeaponLmg_Init

global function OnWeaponActivate_weapon_lmg

#if CLIENT

                 
global function WeaponLmg_TryNextPaintballMod
global function ServerCallback_HACK_OnPlayerAddPaintballWeaponMod
      

#endif              

#if SERVER

                 
                                                 
      

#endif

                 
const vector GRAFFITI_UI_COLOR_0 = <175, 135, 255>                               
const vector GRAFFITI_UI_COLOR_1 = <236, 158, 50>                 
const vector GRAFFITI_UI_COLOR_2 = <113, 208, 14>
const vector GRAFFITI_UI_COLOR_RANDOM = <255, 255, 225>
      


struct
{
	#if CLIENT
                   
			array<vector> grafittiUiColors
        
	#endif
}file
void function MpWeaponLmg_Init()
{
	BasicBoltPrecache()

                  
		Remote_RegisterServerFunction( "ClientCallback_NextPaintballColor", "entity" )
       

	#if CLIENT

                   
			file.grafittiUiColors = [ SrgbToLinear( GRAFFITI_UI_COLOR_0 / 255 ), SrgbToLinear( GRAFFITI_UI_COLOR_1 / 255 ), SrgbToLinear( GRAFFITI_UI_COLOR_2 / 255 ), ( GRAFFITI_UI_COLOR_RANDOM / 255 ) ]
        

	#endif         
}


void function OnWeaponActivate_weapon_lmg( entity weapon )
{
#if SERVER

                 
	                                                
	 
		                   
		                                               
		 
			                                                 
			 
				                   
			 
			                                                      
			 
				                   
			 
			                                                      
			 
				                   
			 
			                                                           
			 
				                   
			 
			    
			 
				                                                                                            
				                                    
				                   
			 

			                                                                                                                                
			                                
			                                           
				                                                                                                                                  
		 
		    
		 
			                                                                       
			                                                 
			 
				                                       
			 
			                                                      
			 
				                                       
			 
			                                                      
			 
				                                       
			 
			                                                           
			 
				                                            
			 
		 
	 
                       

#endif          

	#if CLIENT
		UpdateViewmodelAmmo( false, weapon )

                   
			SetFiringModeIndicatorColorOverrides( file.grafittiUiColors )
        

	#endif              
}

#if CLIENT

                 
void function WeaponLmg_TryNextPaintballMod( entity player, entity weapon, int currentColorIdx )
{
	if ( !IsValid( player ) || !IsValid( weapon ) )
		return

	Remote_ServerCallFunction( "ClientCallback_NextPaintballColor", weapon )
}
                      

#endif         

#if SERVER

                 
                                                                               
 
	                          
	 
		                                                                          
		      
	 

	                         
		      

	                           
		      

	                                            
	                        
	                        
	                        

	                                                 
	 
		                                
		                                
		                   
	 
	                                                      
	 
		                                
		                                
		                   
	 
	                                                      
	 
		                                
		                                     
		                   
	 
	                                                           
	 
		                                     
		                                
		                   
	 

	                       
		                              

	                       
		                           

	                                                                                                                                   
 
                      

#endif         


#if CLIENT

                 
void function ServerCallback_HACK_OnPlayerAddPaintballWeaponMod( entity player, entity weapon, int currentColorIdx, bool shouldShowFireSelectHint )
{
	if ( shouldShowFireSelectHint )
	{
		string message = ""
		vector altStyle3OverrideColor

		if ( currentColorIdx == 0 )
		{
			message = "#FIRE_MODE_ANNOUNCE_PAINT_01"
			altStyle3OverrideColor = file.grafittiUiColors[0] * 2.0
		}
		else if ( currentColorIdx == 1 )
		{
			message = "#FIRE_MODE_ANNOUNCE_PAINT_02"
			altStyle3OverrideColor = file.grafittiUiColors[1] * 2.0
		}
		else if ( currentColorIdx == 2 )
		{
			message = "#FIRE_MODE_ANNOUNCE_PAINT_03"
			altStyle3OverrideColor = file.grafittiUiColors[2] * 2.0
		}
		else if ( currentColorIdx == 3 )
		{
			message = "#FIRE_MODE_ANNOUNCE_PAINT_04"
			altStyle3OverrideColor = file.grafittiUiColors[3] * 2.0
		}

		if ( message != "" )
		{
			AnnouncementMessageRight( player, Localize( "#FIRE_MODE_COLON_PAINTBALL", Localize( message ) ), "", <1, 1, 1>, $"", 1.0, "", altStyle3OverrideColor )
		}
	}

	OnSelectedWeaponChanged( weapon )
}
                      

#endif         