                               

global function Valentines_S15_Mode_Init
global function Valentines_S15_Map_Init
global function ShGameMode_Valentines_S15_RegisterNetworking

global function IsValentinesS15
global function Valentines_S15_ILoveYouEasterEggEnabled

global function ValentinesIsPlayerInRangeForProximityBuff
global function ValentinesGetPartner

#if SERVER
                                        
                                                         
                                      
       
                                       
                                                  
      
#endif
#if CLIENT
global function ServerToClient_Valentines_Add1pVFX
global function ServerToClient_Valentines_Stop1pVFX
#endif

global const string VALENTINES_S15_PLAYLIST_VAR = "is_valentines_s15"
const string VALENTINES_DISABLE_MAPS_PLAYLIST_VAR = "valentines_disable_maps"
const string VALENTINES_TOGETHER_DISTANCE_PLAYLIST_VAR = "valentines_together_dist"
const string VALENTINES_TOGETHER_DISTANCE_IS_2D_PLAYLIST_VAR = "valentines_together_2d"
const string VALENTINES_TOGETHER_DISTANCE_Z_CLAMP_PLAYLIST_VAR = "valentines_together_z_height"
const string VALENTINES_HEALING_FX_ONLY_ON_HEAL_PLAYLIST_VAR = "valentines_fx_only_heal"
const string VALENTINES_I_LOVE_YOU_PLAYLIST_VAR = "valentines_s16_luv_u"
const string VALENTINES_BOW_RESKIN_PLAYLIST_VAR = "valentines_bow_reskin"
const string VALENTINES_SPAWN_ALL_TICKS_PLAYLIST_VAR = "valentines_spawn_all_ticks"
const string VALENTINES_SPAWN_TICKS_PLAYLIST_VAR = "valentines_spawn_ticks"
const string VALENTINES_TICKS_PER_CLUSTER_PLAYLIST_VAR = "valentines_ticks_per_cluster"

global const string VALENTINES_S15_HEAL_SUCCESS_SIGNAL = "ValentinesHealSuccess"
global const string VALENTINES_S15_HEAL_CANCELED_SIGNAL = "ValentinesHealCancel"
global const string VALENTINES_S15_STOP_1P_FX_SIGNAL = "ValentinesStop1P"
const float VALENTINES_TOGETHER_DISTANCE_DEFAULT = 12 * METERS_TO_INCHES

const VFX_COCKPIT_HEAL = $"P_heal_loop_screen"
const FX_SHIELD_CHARGING = $"P_armor_FP_charging_CP"
const asset VFX_ULT_ACCEL_CONT = $"P_UltAcc_screenSpace_cont"

const asset RANGE_RADIUS_REMINDER_FX = $"P_ar_edge_ring_mid"
const float TROPHY_AR_EFFECT_SIZE = 768.0                                                                       


const int VALENTINES_TICKS_PER_CLUSTER = 4
global const int VALENTINES_SPECIAL_EVENT_LOOT_TIER = 6

const string VALENTINES_BOW_WEAPON_REF = "mp_weapon_bow_cupid"

#if SERVER
                                                                                                                       
                                                                                                         
#endif

enum ValentinesConsumableType
{
	Phoenix,
	Health,
	Shields,
	Ult
}

struct TeamData
{
	bool currentlyInRange
}

struct StatusEffectHandles
{
	int shieldHealHandle
	int healthHealHandle
	int ultChargeHandle
}

struct
{
	table<int, TeamData> teamData

	float togetherSquareDist
	float togetherDist

	#if SERVER
		                                                  
	#endif
} file

bool function IsValentinesS15()
{
	return GetCurrentPlaylistVarBool( VALENTINES_S15_PLAYLIST_VAR, false )
}

bool function Valentines_S15_ILoveYouEasterEggEnabled()
{
	return IsValentinesS15() && GetCurrentPlaylistVarBool( VALENTINES_I_LOVE_YOU_PLAYLIST_VAR, true )
}

bool function Valentines_S15_BowReskinEnabled()
{
	return GetCurrentPlaylistVarBool( VALENTINES_BOW_RESKIN_PLAYLIST_VAR, true )
}

bool function IsValidGameMode()
{
	return !IsRankedGame()
}

bool function IsValidMap( string map )
{
	array<string> disabledMaps = split( GetCurrentPlaylistVarString( VALENTINES_DISABLE_MAPS_PLAYLIST_VAR, "" ), "," )
	return !disabledMaps.contains( map )
}

bool function Valentines_S15_SpawnTicks()
{
	return GetCurrentPlaylistVarBool( VALENTINES_SPAWN_TICKS_PLAYLIST_VAR, true )
}

bool function DebugAllValentinesTicks()
{
	return GetCurrentPlaylistVarBool( VALENTINES_SPAWN_ALL_TICKS_PLAYLIST_VAR, false )
}

void function Valentines_S15_Map_Init( bool precacheLootTicks = true )
{
	#if SERVER
		                        
		 
			                                                                                        
			                         
		 
		                          
		                                              

		                          
		                                            

	#endif
}

void function Valentines_S15_Mode_Init()
{
	PrecacheParticleSystem( RANGE_RADIUS_REMINDER_FX )
	PrecacheParticleSystem( VFX_ULT_ACCEL_CONT )
	if ( !IsValentinesS15() )
		return

	if ( !IsValidGameMode() )
		return

	#if CLIENT
		                                                                                       
		GameMode_AddClientInit( SURVIVAL, ClValentines_Init )
	#endif

	float togetherDist = GetCurrentPlaylistVarFloat( VALENTINES_TOGETHER_DISTANCE_PLAYLIST_VAR, VALENTINES_TOGETHER_DISTANCE_DEFAULT )
	file.togetherDist       = togetherDist
	file.togetherSquareDist = togetherDist * togetherDist

	RegisterSignal( VALENTINES_S15_HEAL_SUCCESS_SIGNAL )
	RegisterSignal( VALENTINES_S15_HEAL_CANCELED_SIGNAL )
	RegisterSignal( VALENTINES_S15_STOP_1P_FX_SIGNAL )

	#if SERVER
		                                         

		                                        
			                                           

		                                  
		 
			                                                                                                                          
			                                                
		 
	#endif
}


void function ShGameMode_Valentines_S15_RegisterNetworking()
{
	Remote_RegisterClientFunction( "ServerToClient_Valentines_Add1pVFX", "float", 0.0, 99.0, 8, "int", 0, 126, "int", 0, 101 )
	Remote_RegisterClientFunction( "ServerToClient_Valentines_Stop1pVFX" )
}

#if CLIENT
void function ClValentines_Init()
{
	                                           
	SurvivalCommentary_SetStringCallback( Valentines_S15_GetString )

	thread SetupClientTeamMonitoring_Thread()
}
#endif


#if SERVER
                                          
 

 
#endif

bool function ValentinesIsPlayerInRangeForProximityBuff( entity player )
{
	if ( !IsValentinesS15() )
		return false

	if ( !IsValid( player ) || !player.IsPlayer() )
		return false

	if ( player.IsShadowForm() )
		return false

	if ( player.IsPhaseShifted() )
		return false

	int team = player.GetTeam()

	if ( team in file.teamData )
	{
		return file.teamData[team].currentlyInRange
	}

	return false
}

entity function ValentinesGetPartner( entity self )
{
	if ( !IsValentinesS15() )
		return null

	if ( !IsValid( self ) || !self.IsPlayer() )
		return null

	int team = self.GetTeam()

	array<entity> teammates = GetPlayerArrayOfTeam_Alive( team )

	if ( teammates.len() != 2 )
		return null

	if ( teammates[0] == self )
		return teammates[1]

	return teammates[0]
}

#if SERVER
                                                
 
	                             
	                          
	                                     
	 
		                
		                              
		                                          
	 
 
#endif

#if CLIENT
void function SetupClientTeamMonitoring_Thread()
{
	entity player
	while( true )
	{
		player = GetLocalClientPlayer()
		if ( IsValid( player ) && player.IsPlayer() && player.GetTeam() >= TEAM_IMC )
			break

		WaitFrame()
	}

	int playerTeam = player.GetTeam()

	TeamData newData
	file.teamData[playerTeam] <- newData
	MonitorTeamProximity_Thread( playerTeam )
}

void function UpdateClientHUD( int team )
{

}
#endif         

void function MonitorTeamProximity_Thread( int team )
{
	file.teamData[team].currentlyInRange = false

	                                                                              
	                                    
	while ( true )
	{
		array<entity> teammates = GetPlayerArrayOfTeam( team )

		if ( teammates.len() == 2 )
			break

		WaitFrame()
	}

	while( true )
	{
		                                                                    
		                                                              
		#if CLIENT
			UpdateClientHUD( team )
		#endif         
		WaitFrame()

		bool previouslyInRange               = file.teamData[team].currentlyInRange
		                                                                                                     
		file.teamData[team].currentlyInRange = false

		array<entity> teammates = GetPlayerArrayOfTeam( team )
		int numberOfTeammates   = teammates.len()

		                             
		if ( numberOfTeammates == 0 )
			break

		if ( teammates.len() != 2 )
			continue

		int numInvalidPlayers = 0
		bool allPlayersValid  = true
		foreach ( entity player in teammates )
		{
			if ( !IsValid( player ) )
			{
				numInvalidPlayers++
				allPlayersValid = false
			}

			if ( numInvalidPlayers > 0 )
				continue

			if ( !IsValidPlayerForProximityBuff( player ) )
			{
				allPlayersValid = false
				break
			}
		}

		if ( numInvalidPlayers == teammates.len() )
			break

		if ( !allPlayersValid )
			continue

		bool isPairInRange = IsPairInRangeForProximityBuff( teammates[0], teammates[1] )

		file.teamData[team].currentlyInRange = isPairInRange
		if ( isPairInRange )
		{
			#if CLIENT
				                                                                        
				                                                                        
			#endif
		}
	}

	                                            
	file.teamData[team].currentlyInRange = false
}

bool function IsValidPlayerForProximityBuff( entity player )
{
	Assert( IsValid( player ) && player.IsPlayer() )

	if ( !IsAlive( player ) )
		return false

	if ( Bleedout_IsBleedingOut( player ) )
		return false

	return true
}

#if SERVER
                                                                        
 
	                         
		            

	                                                 
		            

	                                                        
 
#endif         

bool function IsPairInRangeForProximityBuff( entity player1, entity player2 )
{
	Assert( IsValid( player1 ) && IsValid( player2 ) )

	vector from1To2 = player2.GetOrigin() - player1.GetOrigin()

	float maxZHeight = 0.0
	float zHeight    = 0.0
	if ( GetCurrentPlaylistVarBool( VALENTINES_TOGETHER_DISTANCE_IS_2D_PLAYLIST_VAR, true ) )
	{
		maxZHeight = GetCurrentPlaylistVarFloat( VALENTINES_TOGETHER_DISTANCE_Z_CLAMP_PLAYLIST_VAR, file.togetherDist )
		if ( maxZHeight != 0.0 )
		{
			zHeight = fabs( from1To2.z )
		}
		from1To2 = FlattenVec( from1To2 )
	}

	if ( LengthSqr( from1To2 ) < file.togetherSquareDist )
	{
		if ( zHeight <= maxZHeight )
		{
			return true
		}
	}

	return false
}

bool function WillBenefitFromUltAccel( entity ent )
{
	entity ultimateAbility = ent.GetOffhandWeapon( OFFHAND_INVENTORY )
	if ( IsValid( ultimateAbility ) )
	{
		int ammo    = ultimateAbility.GetWeaponPrimaryClipCount()
		int maxAmmo = ultimateAbility.GetWeaponPrimaryClipCountMax()
		if ( ammo < maxAmmo && ultimateAbility.IsReadyToFire() && !ultimateAbility.HasMod( MOBILE_HMG_ACTIVE_MOD ) && !ultimateAbility.HasMod( ULTIMATE_ACTIVE_MOD_STRING ) )
			return true
	}
	return false
}

#if CLIENT
void function ServerToClient_Valentines_Add1pVFX( float duration, int shieldHealAmount, int healthHealAmount )
{
	thread Valentines_Add1pVFX_Thread( duration, shieldHealAmount, healthHealAmount )
}

void function ServerToClient_Valentines_Stop1pVFX()
{
	entity self = GetLocalClientPlayer()
	if ( !self )
		return

	Signal( self, VALENTINES_S15_STOP_1P_FX_SIGNAL )
}

void function Valentines_Add1pVFX_Thread( float duration, int shieldHealAmount, int healthHealAmount )
{
	entity self = GetLocalClientPlayer()
	if ( !self )
		return

	entity cockpit = self.GetCockpit()
	if ( cockpit && !IsSpectating() )
	{
		EndSignal( self, "OnDeath", "OnDestroy", VALENTINES_S15_STOP_1P_FX_SIGNAL )

		StatusEffectHandles effectHandles
		effectHandles.healthHealHandle = 0
		effectHandles.shieldHealHandle = 0
		effectHandles.ultChargeHandle  = 0

		int healthFxID = GetParticleSystemIndex( VFX_COCKPIT_HEAL )
		int shieldFxID = GetParticleSystemIndex( FX_SHIELD_CHARGING )
		int ultFxID    = GetParticleSystemIndex( VFX_ULT_ACCEL_CONT )

		OnThreadEnd(
			function() : ( effectHandles )
			{
				if ( EffectDoesExist( effectHandles.healthHealHandle ) )
					EffectStop( effectHandles.healthHealHandle, false, true )
				if ( EffectDoesExist( effectHandles.shieldHealHandle ) )
					EffectStop( effectHandles.shieldHealHandle, false, true )
				if ( EffectDoesExist( effectHandles.ultChargeHandle ) )
					EffectStop( effectHandles.ultChargeHandle, false, true )
			}
		)

		bool wasInRange     = false
		float endTime       = Time() + duration
		float fxRestartTime = 0
		while ( Time() < endTime )
		{
			bool gettingHealth  = false
			bool gettingShields = false
			bool gettingUlt     = false
			bool inRange        = ValentinesIsPlayerInRangeForProximityBuff( self )
			if ( inRange )
			{
				wasInRange = true
				if ( shieldHealAmount > 0 )
				{
					int currentShields  = self.GetShieldHealth()
					int shieldHealthMax = self.GetShieldHealthMax()
					if ( shieldHealthMax > 0 && currentShields < shieldHealthMax )
					{
						gettingShields = true
					}
				}

				if ( healthHealAmount > 0 )
				{
					int currentHealth = self.GetHealth()
					int healthMax     = self.GetMaxHealth()
					if ( currentHealth < healthMax )
					{
						gettingHealth = true
					}
				}

				if ( healthHealAmount == 0 && shieldHealAmount == 0 )
				{
					gettingUlt = WillBenefitFromUltAccel( self )
				}
			}
			else if ( !inRange && wasInRange )
			{
				wasInRange = false
			}

			bool showHealthFX = inRange && gettingHealth && !gettingShields
			bool showShieldFX = inRange && gettingShields
			bool showUltFX    = inRange && gettingUlt

			if ( !showUltFX )
			{
				if ( EffectDoesExist( effectHandles.ultChargeHandle ) )
					EffectStop( effectHandles.ultChargeHandle, false, true )
			}
			else
			{
				if ( !EffectDoesExist( effectHandles.ultChargeHandle ) )
				{
					effectHandles.ultChargeHandle = StartParticleEffectOnEntity( cockpit, ultFxID, FX_PATTACH_ABSORIGIN_FOLLOW, ATTACHMENTID_INVALID )
					EffectSetIsWithCockpit( effectHandles.ultChargeHandle, true )
					EffectSetControlPointVector( effectHandles.ultChargeHandle, 1, <255, 208, 56> )
				}
			}

			if ( !showHealthFX )
			{
				if ( EffectDoesExist( effectHandles.healthHealHandle ) )
					EffectStop( effectHandles.healthHealHandle, false, true )
			}
			else
			{
				if ( !EffectDoesExist( effectHandles.healthHealHandle ) )
				{
					effectHandles.healthHealHandle = StartParticleEffectOnEntity( self, healthFxID, FX_PATTACH_ABSORIGIN_FOLLOW, ATTACHMENTID_INVALID )
					EffectSetIsWithCockpit( effectHandles.healthHealHandle, true )
				}
			}

			if ( !showShieldFX )
			{
				if ( EffectDoesExist( effectHandles.shieldHealHandle ) )
				{
					EffectStop( effectHandles.shieldHealHandle, false, true )
				}
				fxRestartTime = FLT_MAX
			}
			else
			{
				if ( fxRestartTime == FLT_MAX )
				{
					fxRestartTime = 0
				}
				if ( Time() >= fxRestartTime )
				{
					int armorTier      = EquipmentSlot_GetEquipmentTier( self, "armor" )
					vector shieldColor = GetFXRarityColorForTier( armorTier )

					if ( EffectDoesExist( effectHandles.shieldHealHandle ) )
					{
						EffectStop( effectHandles.shieldHealHandle, false, true )
					}
					effectHandles.shieldHealHandle = StartParticleEffectOnEntity( cockpit, shieldFxID, FX_PATTACH_ABSORIGIN_FOLLOW, ATTACHMENTID_INVALID )
					EffectSetIsWithCockpit( effectHandles.shieldHealHandle, true )
					EffectSetControlPointVector( effectHandles.shieldHealHandle, 1, shieldColor )

					fxRestartTime = Time() + .23
				}
			}

			WaitFrame()
		}
	}
}
#endif         

#if SERVER
                                          
 
	               
	 
		                                      
			                                           

		                                     
			                                        

		                                      
			                                       

		                                  
			                                        
	 
	                                                          
	         
 

                                        
 
	               
	 
		                                      
			                                            

		                                     
			                                         

		                                      
			                                        

		                                  
			                                         
	 
	                                                        
	         
 

                                                                                                                                                            
 
	                                                                                   
	                                            

	                                                             

	                                                           
	 
		                            
		                           
		 
			                                                      
			                                                         
			                              
			                                                                                   
			 
				                      
			 
		 
		                                               
		 
			                                               
			                                                  
			                             
			                                              
			 
				                      
			 
		 
		                                                                         
		 
			                                                    
		 

		                      
		 
			                                                              
			                                                                         
			                                                                                 
		 
	 
 

                                                                                                                 
 
	                                                   

	                          
		      

	                                                                                                                        
	                                            
	                                 
	                                  
	                                  
	                                  
	                                                                                                             

	                                                                               
	                                                                                 

	                                                     
	                                                     
	 
		                                             
	 
	                                                        
	 
		                                                 
	 
	                                
	 
		                                                
	 
	                                
	 
		                                                 
	 
	    
	 
		                                                   
	 

	            
		                                                                       
		 
			                            

			                          
				      

			                                          
			 
				                                                            
			 
			                                          
			 
				                                                            
			 

			                                                              
				                                                                         

			                                                                            

			                                                      
		 
	 

	                                                            

	                                                                                                                                     

	                                                                                                                                                           

	                                 
	                                 
	              
	 
		                              
		                              
		                             
		                                     
		                                     

		                                                                             

		                           
		 
			                                                      
			                                                         
			                              
			                                                                                   
			 
				                               
				              
				 
					                        
					                         
					                                          
					 
						                                                                                   
						                                                                                                                       
					 
				 
			 
		 

		                           
		 
			                                               
			                                                  
			                             
			                                              
			 
				                               
				              
				 
					                    
					                                          
					 
						                                                                                                              
						                                                                                                                     
					 
				 
			 
		 

		              
		 
			                                                     
			 
				                                         
				 
					                   
				 
			 

			                                    
			 
				                                           
				 
					                                                                                   
						                                                                                                
				 
				                           
			 
			    
			 
				                            
			 

			                 

			                                                                                                                                              
		 
		                                  
		 
			                  
			                                          
			 
				                                                            
				                                  
			 
			                                          
			 
				                                                            
				                                  
			 
			                           
			 
				                                                              
					                                                                         
				                                                                                 
			 
		 

		                                                                                                                      

		                                      
		                                      
		                            
		 
			                        
			 
				                                     
			 
			    
			 
				                                     
			 
		 
		                                                                        
		                                                                        

		           
	 
 

                                                         
 
	                             
		      

	                                                         
 

                                                                                    
 
	                                                                                                                        

	                                                                  
	                                                                                                                                    
	                                                                                          
	                                                                      
	                         
	                                   
	                                                                              

	            
		                               
		 
			                    
			 
				            
			 
		 
	 

	                 
 
#endif


#if SERVER
                                                                 
 
	                                            
	 
		                                      
	 
 

                                                    
 
	        
	                     
	 
		                                                              
		                                                               
		                                         
	 
 
#endif

#if SERVER
                                 
 
	                         
 

                                
 
	                       
	 
                    
                              
                               
      

		                             
			                       
			      

		                         
			                    
			      

		                          
			                        
			      
	 
 

                                     
 
	    
	                           
		                             
		                             
		                            
		                                                    
		                           
		                             
	 

	    
	                           
		                            
		                         
		                              
		                              
		                              
		                              
	 

	   
	                           
		                              
		                              
		                               
		                               
		                               
		                               
		                              
		                              
	 

	                                                      
 

                                  
 
	    
	                           
		                             
		                               
		                               
		                               
		                               
		                              
	 

	    
	                           
		                             
		                              
		                              
		                            
		                                                        
		                               
	 

	   
	                           
		                              
		                            
		                              
		                              
		                            
		                           
	 

	                                                      
 

                                      
 
	    
	                           
		                             
		                            
		                             
		                             
		                             
		                              
	 

	   
	                           
		                            
		                           
		                            
		                            
		                             
		                             
	 

	    
	                           
		                                                        
		                             
		                             
		                              
		                             
		                              
	 

	                                                      
 

                                                                
 
	                          
 

                                               
 
	                                
	 
		                               
	 
 

                                                                                                              
 
	                                
	 
		                                 
		                           
		                           
		                      
	 
	    
	 
		                                 
		                                 
		                                 
	 
 

                                                            
 
	                                                
	 
		                                                 
		                                
		                                  
	 
 

                                               
 
	                                                  
	                                                                                                                     
	                             
 

                                           
 
	                           
	                             

	                                                            
	                                                                                                                      
	                                                                          
	            
		                       
		 
			                
		 
	 

	             
 

       
                                           
                                                      
 
	                                                  
	                          
	                                 
	                                                                  
 

                                                                 
 
	                                                                                                 

	                                                  
	                          
	                                                                  
 
      
#endif

#if CLIENT
string function Valentines_S15_GetString( int infoId )
{
	string retVal = ""
	switch ( infoId )
	{
		case eSurvivalCommentary_SringtoPrint.NEWKILLLEADER_OBIT:
			retVal = "#SURVIVAL_NEWKILLLEADER_OBIT_DATE_NIGHT"
			printt( "Passed Valentines String - NEWKILLLEADER_OBIT - Shicks" )

			break

		case eSurvivalCommentary_SringtoPrint.YOUAREKILLLEADER:
			retVal = "#SURVIVAL_YOUAREKILLLEADER_DATE_NIGHT"
			printt( "Passed Valentines String - YOUAREKILLLEADER - Shicks" )

			break

		case eSurvivalCommentary_SringtoPrint.CHAMPION_OBIT:
			retVal = "#SURVIVAL_CHAMPION_OBIT_DATE_NIGHT"
			printt( "Passed Valentines String - CHAMPION_OBIT - Shicks" )

			break

		case eSurvivalCommentary_SringtoPrint.YOUKILLED_CHAMPION:
			retVal = "#SURVIVAL_YOUKILLED_CHAMPION_DATE_NIGHT"
			printt( "Passed Valentines String - YOUKILLED_CHAMPION - Shicks" )

			break

		case eSurvivalCommentary_SringtoPrint.KILLLEADER_OBIT:
			retVal = "#SURVIVAL_KILLLEADER_OBIT_DATE_NIGHT"
			printt( "Passed Valentines String - KILLLEADER_OBIT - Shicks" )

			break

		case eSurvivalCommentary_SringtoPrint.KILLLEADER_KILLS:
			retVal = "#SURVIVAL_KILLLEADERKILLS_DATE_NIGHT"

			break

		case eSurvivalCommentary_SringtoPrint.YOUKILLED_KILLLEADER:
			retVal = "#SURVIVAL_YOUKILLED_KILLLEADER_DATE_NIGHT"
			printt( "Passed Valentines String -  YOUKILLED_KILLLEADER - Shicks" )

			break

		default:
			SurvivalCommentary_GetCommentaryString( infoId )
			printt( "Passed DEFAULT String" )

			break
	}
	return retVal
}
#endif

                                    