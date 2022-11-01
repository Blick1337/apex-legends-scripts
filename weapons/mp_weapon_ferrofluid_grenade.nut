global function MpWeaponFerrofluidGrenade_Init
global function OnProjectileCollision_weapon_ferrofluid_grenade

#if SERVER
                                                
                                      
#endif

        
const asset FERROFLUID_GRENADE_PLANTED_MODEL = $"mdl/props/gibraltar_bubbleshield/gibraltar_bubbleshield.rmdl"
global const asset FERROFLUID_GRENADE_PILLAR_MODEL = $"mdl/fx/ferrofluid_pillar.rmdl"
const asset FERROFLUID_GRENADE_DEBUG_SPHERE_FX = $"debug_sphere_diff_edge"
const asset FERROFLUID_GRENADE_LIQUID_FX = $"P_tday_oil"
const asset FERROFLUID_GRENADE_ELECTRIC_TRAP_FX = $"wpn_grenade_frag_blue"


        
const vector FERROFLUID_GRENADE_FX_COLOR = < 50, 0, 0>
const float FERROFLUID_GRENADE_FX_OPACITY = 0.05
const float FERROFLUID_PLANT_STICKY_DOT = 0.70
const float FERROFLUID_GRENADE_WALL_CLIMB_HEIGHT = 30.0
const float FERROFLUID_GRENADE_WALL_TRACE_STEP = 30.0
const float FERROFLUID_GRENADE_WALL_TRACE_LENGTH = 60.0
const int 	FERROFLUID_GRENADE_MAX_NUM_TRAPS = 4
const float FERROFLUID_GRENADE_PROP_USABLE_DISTANCE = 1500


const float FERROFLUID_GRENADE_TRAP_DAMAGE_INTERVAL = 1.0
const int FERROFLUID_GRENADE_TRAP_DAMAGE_NORMAL = 1
const int FERROFLUID_GRENADE_TRAP_DAMAGE_BLEEDOUT = 5
const float FERROFLUID_GRENADE_TRAP_MOVE_SLOW_SCALAR = 0.5

const vector FERROFLUID_GRENADE_PILLAR_BOUNDING_MIN = <-20, -20, 0>
const vector FERROFLUID_GRENADE_PILLAR_BOUNDING_MAX = <20, 20, 140>
const float FERROFLUID_GRENADE_PILLAR_LIFETIME = 60.0

const string FERROFLUID_GRENADE_TARGETNAME = "ferrofluid_model"
const int FERROFLUID_GRENADE_TRIGGER_RADIUS = 100
const float REPULSOR_MIN_FORCE = 500
const float REPULSOR_MAX_FORCE = 700
const float REPULSOR_TUNING_DEATH_BOX_VEL_SCALE = 1.5
const float REPULSOR_BUFFER_RANGE = 5
const float REPULSOR_MIN_FRACTION_SIDEWAYS_WHEN_MOVING = 0.1
const float REPULSOR_MAX_FRACTION_SIDEWAYS = 0.5
const float REPULSOR_HORIZ_SPEED_THRESHOLD = 150
const float REPULSOR_TUNING_POST_BOUNCE_MAX_Z_VEL = 200.0

struct
{
	#if SERVER
	                                                 
	#endif
}file

void function MpWeaponFerrofluidGrenade_Init()
{
	PrecacheModel( FERROFLUID_GRENADE_PLANTED_MODEL )
	PrecacheModel( FERROFLUID_GRENADE_PILLAR_MODEL )
	PrecacheParticleSystem( FERROFLUID_GRENADE_DEBUG_SPHERE_FX )
	PrecacheParticleSystem( FERROFLUID_GRENADE_LIQUID_FX )
	PrecacheParticleSystem( FERROFLUID_GRENADE_ELECTRIC_TRAP_FX )

	#if CLIENT
		AddCallback_UseEntGainFocus( FerrofluidGrenade_OnGainFocus )
		AddCallback_UseEntLoseFocus( FerrofluidGrenade_OnLoseFocus )
		AddTargetNameCreateCallback( FERROFLUID_GRENADE_TARGETNAME, FerrofluidGrenadeTargetNameCallback )
		RegisterConCommandTriggeredCallback( "+scriptCommand5", OnCharacterButtonPressed )
	#endif

	Remote_RegisterServerFunction( "ClientCallback_TryActivatePillar", "entity" )
}

void function OnProjectileCollision_weapon_ferrofluid_grenade( entity projectile, vector pos, vector normal, entity hitEnt, int hitBox, bool isCritical, bool passthrough )
{
	if ( hitEnt.IsPlayer() )
		return

	DeployableCollisionParams collisionParams
	collisionParams.pos        = pos
	collisionParams.normal     = normal
	collisionParams.hitEnt     = hitEnt
	collisionParams.hitBox     = hitBox
	collisionParams.isCritical = isCritical

	bool result = PlantStickyEntityOnWorldThatBouncesOffWalls( projectile, collisionParams, FERROFLUID_PLANT_STICKY_DOT, <90, 0, 0> )

	if( result )
	{
		thread DeployFerrofluid( projectile )
	}
}

void function DeployFerrofluid( entity projectile )
{
	#if SERVER
		                                    
		                        
		 
			                    
			      
		 

		                                         
		                                          
		                                          

		                                                                                                   
		                                                            
		                                        
		                                  
		                                                  
		                                  
		                          
			                                   
		                              
		                        
		                                                     
		                                                                                                                                                                                             
		                                                                                 
		                                                                          
		                                     


		                                                   
		                                   
		                             
		                                               
		                                                              
		                             
		                           
		                                             
		                                                          
		                                      
		                                        
		                        
		                                 
		                         
		                                                                                                

		                                                                                                                                                                                                                       
		                                    
		                              
		                                              

		                                                                                                                                                                                                                                          
		                                                 
		                                                                     
		                                                                                                                                
		                                                                          
		                                           
		                                                           

		                                                                                                                                                                                                                                       
		                                              
		                                                               
		                                                                                                                             
		                                                                    
		                                        
		                                                        

		                                                                                                                                                                                                                            
		                            
		                                            

		                                                                             

		                    

		                                             
		                                                                      
		 
			                                              
			                             
			 
				                     
			 
		 

		            
			                                                                                                           
			 
				                      
				                                   
				                                
				                    

				                        
					                 

				                             
					                      

				                      
				 
					                                                   
					 
						                                                           
						 
							                                             
							 
								                               
							 
						 
					 
				 
			 
		 

		             
	#endif
}

bool function FerrofluidGrenade_CanUse( entity player, entity ent, int useFlags )
{
	if ( ! IsValid( player ) )
		return false

	int playerTeam = player.GetTeam()

	return IsFriendlyTeam( ent.GetTeam(), playerTeam )  &&
	! GradeFlagsHas( ent, eGradeFlags.IS_BUSY )
}

#if SERVER
                                                                          
 
	                                                                                                             
		                                                      
 

                                                                              
 
	                             
	                               
	                                



	                         
		      

	                                                                                                                           
	                                                                                                                    
	                                                                

	            
		                                                          
		 
			                        
			 
				                                             
				                                            
				                         
			 
		 
	 

	                         
	                                      
	 
		                          
		 
			                                 
			                                                                   
			                                                             
				                                                                                                                                                         
			    
				                                                                                                                                                       

			                                                     
		 

		           
	 
 

                                                     
 
	                                                          
	 
		                                                        
		 
			                      
			  	                                                                
		 
	 
 
                                                                             
 
	                                                
		      

	                                                                                  
		      

	                                     
		      

	                                                  
		      

	                                 
	                                                    
		      

	                                           

	                              
	                                                                                                      
	                           
	                        
	 
		                    
			        

		                         
	 

	                             
	 
		                                                            
	 
	                          
	               
	                                  

	                                                          
	                                                                           
	                                                                            
	                                                        
 

                                                                                      
 
	                             
	                                                    
	                                                 
	                                                                      
	                           

	                                                        

	                                                                                                                                            

	                                        
	                                                   
	                                   
	                                                                                                               
	                                                                           

	                                                                                                                                                   
	                                                                                                                                       
	 
		                                                                                              
		                                                                    
	 

	                                                                                                                            
	                                       

	                                                             
	                

	                                           
	                                     

	                            
	                                     

 

                                                                                                                                             
 
	                               

	                            
	                         
	                      
	                                     
	                      
	                                                                        
	                      

	                                      
	 
		                                            
		                                         

		                                                     
		                                                                                                                                   
		                                 
		 
			     
		 

		                                                                                           
		                                                                                                                                          
		                                                                                                
		 
			                
		 
		    
		 
			                                                                         
			                                                                                                                           
			                                                                              
		 

		               
			     

		                
		 
			                                              
			                  
		 

		          
	 
 

                                                                                     
 
	                                                                                                  
	                                
	                 
	                                   

	            
		                        
		 
			                       
				                
		 
	 

	                        
	                               
	             
	 
		                                                                 
		                             
		                  
			     
		           
	 
	              
	                                  
	                                                                                                       

	                                       
	                                       
 
#endif

#if CLIENT
void function FerrofluidGrenadeTargetNameCallback( entity ent )
{
	AddEntityCallback_GetUseEntOverrideText( ent, FerrofluidGrenade_UseTextOverride )
}

string function FerrofluidGrenade_UseTextOverride( entity ent )
{
	entity player = GetLocalViewPlayer()
	int playerTeam = player.GetTeam()

	if ( !FerrofluidGrenade_CanUse( player, ent, USE_FLAG_NONE ) )
	{
		CustomUsePrompt_Hide()
	}
	else
	if ( IsFriendlyTeam( ent.GetTeam(), playerTeam ) )                             
	{
		CustomUsePrompt_Show( ent )
		CustomUsePrompt_SetSourcePos( ent.GetOrigin() + < 0, 0, -5 > )

		CustomUsePrompt_SetText( Localize("#FERROFLUID_ACTIVATE_PILLAR") )
		                                                                                      
		CustomUsePrompt_SetHintImage( $"" )
		CustomUsePrompt_SetLineColor( <1.0, 0.5, 0.0> )

		if ( PlayerIsInADS( player ) )
			CustomUsePrompt_ShowSourcePos( false )
		else
			CustomUsePrompt_ShowSourcePos( true )
	}

	return ""
}

void function FerrofluidGrenade_OnGainFocus( entity ent )
{
	if ( !IsValid( ent ) )
		return

	if ( ent.GetTargetName() == FERROFLUID_GRENADE_TARGETNAME )
	{
		CustomUsePrompt_Show( ent )
	}
}

void function FerrofluidGrenade_OnLoseFocus( entity ent )
{
	CustomUsePrompt_ClearForAny()
}

void function OnCharacterButtonPressed( entity player )
{
	entity useEnt = player.GetUsePromptEntity()
	if ( !IsValid( useEnt ) || useEnt.GetTargetName() != FERROFLUID_GRENADE_TARGETNAME )
		return

	int playerTeam = player.GetTeam()
	int entTeam = useEnt.GetTeam()

	if ( !IsFriendlyTeam( entTeam, playerTeam ) )
		return

	CustomUsePrompt_SetLastUsedTime( Time() )

	Remote_ServerCallFunction( "ClientCallback_TryActivatePillar", useEnt )
}
#endif


