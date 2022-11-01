global function MpAbilityUpswell_Init
global function OnWeaponTossReleaseAnimEvent_ability_upswell
global function OnWeaponTossPrep_ability_upswell

const asset UPSWELL_IGNITION_FX = $"P_wpn_grav_lift_ignition"
const asset UPSWELL_TOP_FX = $"P_wpn_grav_lift_top"
const asset UPSWELL_SHAFT_FX = $"p_wpn_grav_lift_column"
const float UPSWELL_SHAFT_SPACING = 160
const float UPSWELL_SHAFT_BOTTOM_SPACING = 150
const asset FX_FERROFLUID_UPSWELL = $"debug_sphere_soft"                                     
const asset FX_FERROFLUID_UPSWELL_GOOP = $"P_ferro_pas_impact"

const float UPSWELL_TUNING_HEIGHT = 2200                         
const float UPSWELL_LIFETIME = 20.0

const bool JUMP_PAD_NEW_DEPLOY_FUNC = true

void function MpAbilityUpswell_Init()
{
	PrecacheParticleSystem( FX_FERROFLUID_UPSWELL )
	PrecacheParticleSystem( FX_FERROFLUID_UPSWELL_GOOP )
}


var function OnWeaponTossReleaseAnimEvent_ability_upswell( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	int ammoReq = weapon.GetAmmoPerShot()
	weapon.EmitWeaponSound_1p3p( GetGrenadeThrowSound_1p( weapon ), GetGrenadeThrowSound_3p( weapon ) )

	entity deployable = ThrowDeployable( weapon, attackParams, 1.0, OnUpswellPlanted, null, null )
	if ( deployable )
	{
		entity player = weapon.GetWeaponOwner()
		PlayerUsedOffhand( player, weapon, true, deployable )

		#if SERVER
		                                      
		                                                                   

		                                                            
		                            
			                                                

		                                         
		#endif

		#if SERVER
			                                                           
		#endif
	}

	return ammoReq
}

void function OnWeaponTossPrep_ability_upswell( entity weapon, WeaponTossPrepParams prepParams )
{
	weapon.EmitWeaponSound_1p3p( GetGrenadeDeploySound_1p( weapon ), GetGrenadeDeploySound_3p( weapon ) )
}

void function OnUpswellPlanted( entity projectile, DeployableCollisionParams collisionParams )
{
#if SERVER

	                                                                                                                                            
	                 	     
	                 	                                                              
	               		                                                              
	                                                                                                                             
	                                    
	 
		                                                             
		                                                                                  
		                                        
	 

	                                                          
#endif              
}

#if SERVER
                                                                        
 
	                                                
	                             
		      

	                                                                                            
	                                       
	                                      
	                                       
	                        
		      

	                    

	                                                                         
	                           
	                        
	                                      
	                                      
	                                                                                       
	              

	                       
	                         
		                                         

	                                                          
	                                                             

                 
                                  
       

	                                                     

	             
	                                                      
	                                    
	                           

	                          
		      

	                                    
 

                                                  
 
	                                                
	                                

	                                                     
	                                   

	                                                         
	                                           
	                           
	                               
	                            
	                                                                                                                                                    
	                           
	                           
	                                     
	                                                           
	                                        
	                                       
	                           
	                                          
	                        
	                                                      

	                                                                                                                                                                  
	                                                          

	                            

	                                                                                                                                                                                                         
	                                   

	                                                                                                                                                                             
	                               

	                                                                                                                                                                        
	                                                             
	                               

	                                                                                                        
	                                                         

	                               
	                     
	                    
	                                          
	 
		                                                                                                                                                                                             
		                                                          
		                                      

		                                 
	 

	                                                                                                                                                                                                                                 
	                                      

	            
		                                                 
		 
			                                
			 
				                    
				 
					                
					            
				 
			 
			                      

			                         
				                 

			                         
				                 
		   

	                     
 


                                                                      
 
	                                                                                
 


                                                                                                
 
	                                                   
	 
		                     
		 
			                        

			                                                    
		 
		    
		 
			                                                   
			                                                   
		 
	 
 


                                                                            
 
	                         
		      

	                             
	                               
	                               
	                                  
	                     
	                      

	                                                                            
	                                                                            

	                        
	                                                         
	                                            

	                                                       

	            
		                                   
		 
			                        
			 
				                      
				                     
				                                                      
				                                                       
			 
		 
	 

	                              

	            	                                                

	                            
	                                 
	 
		                                         
		                           			                                                   
			     

		                     
		 
			                            
		 
		    
		 
			                        

			                                  
			                                    	                                                  
				     
			    
				                            
		 

		           
	 

	                               
		                                                            
 


                                                                    
 
	                       
		            
                          
                                 
               
       

	                         
		            

	                           
		            

	           
 
#endif