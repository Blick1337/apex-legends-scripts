global function MpWeaponFerroWall_Init
global function OnWeaponAttemptOffhandSwitch_weapon_ferro_wall

global function OnWeaponActivate_weapon_ferro_wall
global function OnWeaponDeactivate_weapon_ferro_wall
global function OnWeaponTossReleaseAnimEvent_weapon_ferro_wall
global function OnWeaponChargeBegin_weapon_ferro_wall
global function OnWeaponChargeEnd_weapon_ferro_wall
global function OnProjectileCollision_weapon_ferro_wall
global function GetProjectileVelocity_weapon_ferro_wall
global function OnWeaponPrimaryAttack_weapon_ferro_wall

global function FerroWall_BlockScan
#if CLIENT
global function OnCreateClientOnlyModel_weapon_ferro_wall
#endif


        
const asset FERRO_WALL_MODEL_A_SMALL = $"mdl/fx/ferrofluid_ult_wall_01.rmdl"
const asset FERRO_WALL_MODEL_A_MEDIUM = $"mdl/fx/ferrofluid_ult_wall_01_2x.rmdl"
const asset FERRO_WALL_MODEL_A_LARGE = $"mdl/fx/ferrofluid_ult_wall_01_3x.rmdl"
const asset FERRO_WALL_MODEL_B_SMALL = $"mdl/fx/ferrofluid_ult_wall_02.rmdl"
const asset FERRO_WALL_MODEL_B_MEDIUM = $"mdl/fx/ferrofluid_ult_wall_02_2x.rmdl"
const asset FERRO_WALL_MODEL_B_LARGE = $"mdl/fx/ferrofluid_ult_wall_02_3x.rmdl"
const asset FERRO_WALL_MODEL_C_SMALL = $"mdl/fx/ferrofluid_ult_wall_03.rmdl"
const asset FERRO_WALL_MODEL_C_MEDIUM = $"mdl/fx/ferrofluid_ult_wall_03_2x.rmdl"
const asset FERRO_WALL_MODEL_C_LARGE = $"mdl/fx/ferrofluid_ult_wall_03_3x.rmdl"
const asset FERRO_WALL_MODEL_AR = $"mdl/fx/ferrofluid_ult_ar.rmdl"
const asset FERRO_WALL_MODEL_SLOPE = $"mdl/fx/ferrofluid_ult_slope_01_3x.rmdl"
const array< asset > FERRO_WALL_MODEL_A_ARRAY = [ FERRO_WALL_MODEL_A_SMALL, FERRO_WALL_MODEL_A_MEDIUM, FERRO_WALL_MODEL_A_LARGE ]
const array< asset > FERRO_WALL_MODEL_B_ARRAY = [ FERRO_WALL_MODEL_B_SMALL, FERRO_WALL_MODEL_B_MEDIUM, FERRO_WALL_MODEL_B_LARGE ]
const array< asset > FERRO_WALL_MODEL_C_ARRAY = [ FERRO_WALL_MODEL_C_SMALL, FERRO_WALL_MODEL_C_MEDIUM, FERRO_WALL_MODEL_C_LARGE ]
const array< asset > FERRO_WALL_SMALL_MODEL_ARRAY = [ FERRO_WALL_MODEL_A_SMALL, FERRO_WALL_MODEL_B_SMALL, FERRO_WALL_MODEL_C_SMALL ]
const array< asset > FERRO_WALL_MEDIUM_MODEL_ARRAY = [ FERRO_WALL_MODEL_A_MEDIUM, FERRO_WALL_MODEL_B_MEDIUM, FERRO_WALL_MODEL_C_MEDIUM ]
const array< asset > FERRO_WALL_LARGE_MODEL_ARRAY = [ FERRO_WALL_MODEL_A_LARGE, FERRO_WALL_MODEL_B_LARGE, FERRO_WALL_MODEL_C_LARGE ]
const array< array< asset > > FERRO_WALL_MODEL_TYPE_ARRAY = [ FERRO_WALL_MODEL_A_ARRAY, FERRO_WALL_MODEL_B_ARRAY, FERRO_WALL_MODEL_C_ARRAY ]

const asset FERRO_WALL_BASE_FX_A_SMALL = $"P_ferro_wall_SM_A"
const asset FERRO_WALL_BASE_FX_A_MEDIUM = $"P_ferro_wall_MED_A"
const asset FERRO_WALL_BASE_FX_A_LARGE = $"P_ferro_wall_LRG_A"
const asset FERRO_WALL_BASE_FX_B_SMALL = $"P_ferro_wall_SM_B"
const asset FERRO_WALL_BASE_FX_B_MEDIUM = $"P_ferro_wall_MED_B"
const asset FERRO_WALL_BASE_FX_B_LARGE = $"P_ferro_wall_LRG_B"
const asset FERRO_WALL_BASE_FX_C_SMALL = $"P_ferro_wall_SM_C"
const asset FERRO_WALL_BASE_FX_C_MEDIUM = $"P_ferro_wall_MED_C"
const asset FERRO_WALL_BASE_FX_C_LARGE = $"P_ferro_wall_LRG_C"
const array< asset > FERRO_WALL_BASE_FX_A_ARRAY = [ FERRO_WALL_BASE_FX_A_SMALL, FERRO_WALL_BASE_FX_A_MEDIUM, FERRO_WALL_BASE_FX_A_LARGE ]
const array< asset > FERRO_WALL_BASE_FX_B_ARRAY = [ FERRO_WALL_BASE_FX_B_SMALL, FERRO_WALL_BASE_FX_B_MEDIUM, FERRO_WALL_BASE_FX_B_LARGE ]
const array< asset > FERRO_WALL_BASE_FX_C_ARRAY = [ FERRO_WALL_BASE_FX_C_SMALL, FERRO_WALL_BASE_FX_C_MEDIUM, FERRO_WALL_BASE_FX_C_LARGE ]
const array< array< asset > > FERRO_WALL_BASE_FX_TYPE_ARRAY = [ FERRO_WALL_BASE_FX_A_ARRAY, FERRO_WALL_BASE_FX_B_ARRAY, FERRO_WALL_BASE_FX_C_ARRAY ]

const asset FERRO_WALL_BASE_WATER_FX_A_SMALL = $"P_ferro_wall_SM_A_water"
const asset FERRO_WALL_BASE_WATER_FX_A_MEDIUM = $"P_ferro_wall_MED_A_water"
const asset FERRO_WALL_BASE_WATER_FX_A_LARGE = $"P_ferro_wall_LRG_A_water"
const asset FERRO_WALL_BASE_WATER_FX_B_SMALL = $"P_ferro_wall_SM_B_water"
const asset FERRO_WALL_BASE_WATER_FX_B_MEDIUM = $"P_ferro_wall_MED_B_water"
const asset FERRO_WALL_BASE_WATER_FX_B_LARGE = $"P_ferro_wall_LRG_B_water"
const asset FERRO_WALL_BASE_WATER_FX_C_SMALL = $"P_ferro_wall_SM_C_water"
const asset FERRO_WALL_BASE_WATER_FX_C_MEDIUM = $"P_ferro_wall_MED_C_water"
const asset FERRO_WALL_BASE_WATER_FX_C_LARGE = $"P_ferro_wall_LRG_C_water"
const array< asset > FERRO_WALL_BASE_WATER_FX_A_ARRAY = [ FERRO_WALL_BASE_WATER_FX_A_SMALL, FERRO_WALL_BASE_WATER_FX_A_MEDIUM, FERRO_WALL_BASE_WATER_FX_A_LARGE ]
const array< asset > FERRO_WALL_BASE_WATER_FX_B_ARRAY = [ FERRO_WALL_BASE_WATER_FX_B_SMALL, FERRO_WALL_BASE_WATER_FX_B_MEDIUM, FERRO_WALL_BASE_WATER_FX_B_LARGE ]
const array< asset > FERRO_WALL_BASE_WATER_FX_C_ARRAY = [ FERRO_WALL_BASE_WATER_FX_C_SMALL, FERRO_WALL_BASE_WATER_FX_C_MEDIUM, FERRO_WALL_BASE_WATER_FX_C_LARGE ]
const array< array< asset > > FERRO_WALL_BASE_WATER_FX_TYPE_ARRAY = [ FERRO_WALL_BASE_WATER_FX_A_ARRAY, FERRO_WALL_BASE_WATER_FX_B_ARRAY, FERRO_WALL_BASE_WATER_FX_C_ARRAY ]

const asset FERRO_WALL_DARKEYE_VIGNETTE_FX = $"P_ferro_wall_veil_1p"
const asset FERRO_WALL_DEBUG_SPHERE_VISION_LIMIT_FX = $"debug_sphere_invert"
const asset FERRO_WALL_DARK_ZONE_SHROUD_FX = $"P_ferro_wall_veil_3p_enemy"

const asset FERRO_WALL_BASE_FX_A = $"P_ferro_wall_base"
const asset FERRO_WALL_BASE_FX_B = $"P_ferro_wall_base_02"
const asset FERRO_WALL_BASE_FX_C = $"P_ferro_wall_base_03"
const array< asset > FERRO_WALL_BASE_FX_ARRAY = [ FERRO_WALL_BASE_FX_A, FERRO_WALL_BASE_FX_B, FERRO_WALL_BASE_FX_C ]

const asset FERRO_WALL_LAUNCH_FX_SMALL = $"P_ferro_wall_launch_SM"
const asset FERRO_WALL_LAUNCH_FX_MEDIUM = $"P_ferro_wall_launch_MED"
const asset FERRO_WALL_LAUNCH_FX_LARGE = $"P_ferro_wall_launch_LRG"
const array< asset > FERRO_WALL_LAUNCH_FX_ARRAY = [ FERRO_WALL_LAUNCH_FX_SMALL, FERRO_WALL_LAUNCH_FX_MEDIUM, FERRO_WALL_LAUNCH_FX_LARGE ]

const asset FERRO_WALL_LAUNCH_WATER_FX_SMALL = $"P_ferro_wall_launch_SM_water"
const asset FERRO_WALL_LAUNCH_WATER_FX_MEDIUM = $"P_ferro_wall_launch_MED_water"
const asset FERRO_WALL_LAUNCH_WATER_FX_LARGE = $"P_ferro_wall_launch_LRG_water"
const array< asset > FERRO_WALL_LAUNCH_WATER_FX_ARRAY = [ FERRO_WALL_LAUNCH_WATER_FX_SMALL, FERRO_WALL_LAUNCH_WATER_FX_MEDIUM, FERRO_WALL_LAUNCH_WATER_FX_LARGE ]

const asset FERRO_WALL_IDLE_FX_A = $"P_ferro_wall_idle_A"
const asset FERRO_WALL_IDLE_FX_B = $"P_ferro_wall_idle_B"
const asset FERRO_WALL_IDLE_FX_C = $"P_ferro_wall_idle_C"
const array< asset > FERRO_WALL_IDLE_FX_ARRAY = [ FERRO_WALL_IDLE_FX_A, FERRO_WALL_IDLE_FX_B, FERRO_WALL_IDLE_FX_C ]

const asset FERRO_WALL_IDLE_WATER_FX_A = $"P_ferro_wall_idle_A_water"
const asset FERRO_WALL_IDLE_WATER_FX_B = $"P_ferro_wall_idle_B_water"
const asset FERRO_WALL_IDLE_WATER_FX_C = $"P_ferro_wall_idle_C_water"
const array< asset > FERRO_WALL_IDLE_WATER_FX_ARRAY = [ FERRO_WALL_IDLE_WATER_FX_A, FERRO_WALL_IDLE_WATER_FX_B, FERRO_WALL_IDLE_WATER_FX_C ]

const asset FERRO_WALL_FINISHED_FX_SMALL = $"P_ferro_wall_finish_SM"
const asset FERRO_WALL_FINISHED_FX_MEDIUM = $"P_ferro_wall_finish_MED"
const asset FERRO_WALL_FINISHED_FX_LARGE = $"P_ferro_wall_finish_LRG"
const array< asset > FERRO_WALL_FINISHED_FX_ARRAY = [ FERRO_WALL_FINISHED_FX_SMALL, FERRO_WALL_FINISHED_FX_MEDIUM, FERRO_WALL_FINISHED_FX_LARGE ]

const asset FERRO_WALL_FINISHED_WATER_FX_SMALL = $"P_ferro_wall_finish_SM_water"
const asset FERRO_WALL_FINISHED_WATER_FX_MEDIUM = $"P_ferro_wall_finish_MED_water"
const asset FERRO_WALL_FINISHED_WATER_FX_LARGE = $"P_ferro_wall_finish_LRG_water"
const array< asset > FERRO_WALL_FINISHED_WATER_FX_ARRAY = [ FERRO_WALL_FINISHED_WATER_FX_SMALL, FERRO_WALL_FINISHED_WATER_FX_MEDIUM, FERRO_WALL_FINISHED_WATER_FX_LARGE ]

const asset FERRO_WALL_WALKTHROUGH_SPLASH = $"P_ferro_wall_veil_splash_3p"
const asset FERRO_WALL_PASSTHROUGH_IMPACT = $"P_ferro_wall_impact"

        
const string FERRO_WALL_ACTIVATE_3P = "Catalyst_Ultimate_Activate_3P"
const string FERRO_WALL_COMPLETE_3P = "Catalyst_Ultimate_Wall_Complete_3p"
const string FERRO_WALL_IDLE_3P = "Catalyst_Ultimate_Idle_3p"
const string FERRO_WALL_BASE_RAISE_START = "Catalyst_Ultimate_Activate_FerroWallRise_3p"
const string FERRO_WALL_BASE_LAUNCH_3P = "Catalyst_Ultimate_Launch_Seq_GroundFerroSpikes_3p"
const string FERRO_WALL_BASE_RISING_3P = "Catalyst_Ultimate_Launch_Seq_FerroWallRising_3p"
const string FERRO_WALL_BASE_RISING_WATER_3P = "Catalyst_Ultimate_WallRising_Impact_Water_3p"
const string FERRO_WALL_BASE_FALLING_3P = "Catalyst_Ultimate_Wall_Dissolve_3p"
const string FERRO_WALL_PLAYER_PASSTHROUGH_1P = "flesh_catalyst_ult_ferrowall_damage_1p"
const string FERRO_WALL_PLAYER_PASSTHROUGH_3P = "flesh_catalyst_ult_ferrowall_damage_3p"
const string FERRO_WALL_FRIENDLY_START_PASSTHROUGH_1P = "Catalyst_Ult_FerroWall_Damage_StartLoop_Friendly_1p"
const string FERRO_WALL_FRIENDLY_END_PASSTHROUGH_1P = "Catalyst_Ult_FerroWall_Damage_End_Friendly_1p"
const string FERRO_WALL_ENEMY_START_PASSTHROUGH_1P = "Catalyst_Ult_FerroWall_Damage_StartLoop_Enemy_1p"
const string FERRO_WALL_ENEMY_END_PASSTHROUGH_1P = "Catalyst_Ult_FerroWall_Damage_End_Enemy_1p"
const string FERRO_WALL_FRIENDLY_START_PASSTHROUGH_3P = "Catalyst_Ult_FerroWall_Damage_StartLoop_Friendly_3p"
const string FERRO_WALL_FRIENDLY_END_PASSTHROUGH_3P = "Catalyst_Ult_FerroWall_Damage_End_Friendly_3p"
const string FERRO_WALL_ENEMY_START_PASSTHROUGH_3P = "Catalyst_Ult_FerroWall_Damage_StartLoop_Enemy_3p"
const string FERRO_WALL_ENEMY_END_PASSTHROUGH_3P = "Catalyst_Ult_FerroWall_Damage_End_Enemy_3p"

         
const string KILL_CLIENT_THREAD_SIGNAL = "ferro_wall_kill_client_thread"
const string START_SOUND_SIGNAL = "ferro_wall_start_sound"

               
const string FERRO_WALL_WEAPON_NAME = "mp_weapon_ferro_wall"
const string ABILITY_ACTIVE_MOD = "ability_active_mod"
const string ABILITY_USED_MOD = "ability_used_mod"
const string FERRO_WALL_INFO_TARGET_NAME = "ferro_wall_info"
global const string FERRO_WALL_SEGMENT_TARGET_NAME = "ferro_wall_segment"

           
const bool FERRO_WALL_DEBUG_DRAW = false
const float FERRO_WALL_PILLAR_Z_OFFSET 	= 0
const float FERRO_WALL_STEP_INIT 		= 0
const float FERRO_WALL_STEP 				= 88.0
const float FERRO_WALL_RADIUS 			= FERRO_WALL_STEP / 2.0
const float FERRO_WALL_CLIMB_HEIGHT_INIT		= 80.0
const float FERRO_WALL_CLIMB_HEIGHT 		= 95.0
const float FERRO_WALL_RETRY_CLIMB_HEIGHT_FRAC 		= 0.85
const float FERRO_WALL_RETRY_CLIMB_HEIGHT 		= FERRO_WALL_CLIMB_HEIGHT  * FERRO_WALL_RETRY_CLIMB_HEIGHT_FRAC
const float FERRO_WALL_DOWN_TRACE_LENGTH		= 500.0
const float FERRO_WALL_DEFAULT_FWD_DISTANCE		= 75
const float FERRO_WALL_HEIGHT 		= 120.0
const float FERRO_WALL_WIDTH 		= 15.0
const float FERRO_WALL_WIDTH_SQR 		= FERRO_WALL_WIDTH * FERRO_WALL_WIDTH

const float FERRO_WALL_PILLAR_DURATION = 30.0
const float FERRO_WALL_PILLAR_DELAY_BEFORE_SCALING = 1.2
const float FERRO_WALL_PILLAR_DELAY_FORWARD = 0.05
const float FERRO_WALL_PILLAR_DELAY_HORIZONTAL = FERRO_WALL_PILLAR_DELAY_FORWARD * 2
const float FERRO_WALL_PILLAR_SCALE_TIME = 0.6
const float FERRO_WALL_PILLAR_DESCALE_TIME = 0.85
const int FERRO_WALL_NUM_PILLARS_FORWARD = 24
const int FERRO_WALL_NUM_PILLARS_HORIZONTAL_PER_SIDE = 8
const float FERRO_WALL_PILLAR_HEALTH = 125
const float FERRO_WALL_PILLAR_HEIGHT_CHECK_BUFFER = 25.0 - FERRO_WALL_PILLAR_Z_OFFSET

const float FERRO_WALL_SLOW_SCALER = 0.5
const float FERRO_WALL_SLOW_NPC_SCALER = 0.8
const float FERRO_WALL_SLOW_NPC_TIME_SCALER = 2.0

const float FERRO_WALL_DARKVISION_FX_ALPHA_START = 0.0
const float FERRO_WALL_DARKVISION_FX_ALPHA_END = 0.9
const float FERRO_WALL_DARKVISION_FX_ALPHA_END_TEAM = 0.3
const float FERRO_WALL_DARKVISION_FX_ALPHA_END_CATALYST = 0.3       
const int FERRO_WALL_DARKVISION_DISTANCE = 200
const float FERRO_WALL_DARKVISION_OPACITY = 0.7
const float FERRO_WALL_DARKVISION_DURATION = 7.0
const float FERRO_WALL_DARKVISION_TEAM_DURATION = 1.0
const float FERRO_WALL_DARKVISION_FX_SCALAR_ENEMY = 0.5
const float FERRO_WALL_DARKVISION_FX_SCALAR_TEAM = 0.5
const float FERRO_WALL_DARKVISION_FX_SCALAR_CATALYST = 0.5
const float FERRO_WALL_DARKZONE_OPACITY = 0.85

const vector FRIENDLY_FERRO_WALL_COLOR = <100, 160, 255>
const vector ENEMY_FERRO_WALL_COLOR = <223, 66, 30>

const vector FERRO_WALL_SOUND_MOVER_OFFSET = < 0, 0, 20>
const float  FERRO_WALL_SOUND_SNAP_DISTANCE = 300
const float FERRO_WALL_SOUND_MOVER_DURATION = 2.5
const float FERRO_WALL_SOUND_MOVER_DESTROY_BEFORE_START_WAIT_TIME = FERRO_WALL_PILLAR_DURATION * 2

const int FERRO_WALL_FX_VERSION = 1
const int FERRO_WALL_SFX_VERSION = 2
const float FERRO_WALL_ENCAP_DELAY = 0.0
const float FERRO_WALL_SLOPE_MODEL_THRESHOLD_DISTANCE_MIN = 25.0
const float FERRO_WALL_SLOPE_MODEL_THRESHOLD_DISTANCE_MAX = 100.0
const float FERRO_WALL_PASSTHROUGH_SOUND_LOOP_END_THRESHOLD_TIME = 2.0
const float FERRO_WALL_PASSTHROUGH_IMPACT_FX_KILL_TIME = 1.2
const int FERRO_WALL_IMPACT_FX_ENABLED = 1
const int FERRO_WALL_MAX_WALLS_PER_PLAYER = 1                               
const int FERRO_WALL_MAX_WALLS_PER_GAME = -1                               

enum eFerroWallOrientation
{
	LEFT_TO_RIGHT
	FORWARD
}

enum eFerroWallModelType
{
	TYPE_A
	TYPE_B
	TYPE_C
	NUM_TYPES
}

enum eFerroWallModelSize
{
	SIZE_SMALL
	SIZE_MEDIUM
	SIZE_LARGE
	NUM_SIZES
}

enum eFerroWallDeployType
{
	DEPLOY_OBJECT_PLACEMENT
	DEPLOY_PROJECTILE
}

struct FerroWallDarkVisionData
{
	int visionHandle
	int moveSlowHandle
	float endTime
}

struct TriggerMoveSlowData
{
	int handle
	int refCount
}

struct FerroWallProjectileData
{
	int lastModel
	float distanceIncrement
	int numSegments
}

struct SoundMoverData
{
	entity groundMover
	entity scaleUpMover
	entity scaleDownMover
}

struct
{
#if SERVER
	                                                       
	                                                 
	                                                      
	                                  
#endif
#if CLIENT
	int colorCorrection = -1
	int darkVisionFXID      = -1               
	int darkVisionLimit0FX  = -1
	int darkVisionLimit1FX  = -1
	int darkVisionLimit2FX  = -1
	int darkVisionLimit3FX  = -1
	float darkVisionFXAlpha = 1.0
	float flashlightFXAlpha = 1.0
#endif         

	             
	float 	duration
	float	forwardDelay
	float 	scaleUpDelay
	float 	scaleUpTime
	float 	scaleDownTime
	int 	numSegments
	float	darkVisionFXMaxAlphaEnemy
	float	darkVisionFXMaxAlphaTeam
	float	darkVisionFlashlightOpacity
	float	darkVisionDurationEnemy
	float	darkVisionDurationTeam
	float	soundMoverDuration
	float	soundMoverDestroyIfNotStartedTime
	int 	impactFxEnabled
	float	slowServerityPlayer
	float	slowServerityNPC
	float	darkVisionDurationNPC
	int		maxWallsPerPlayer
	int		maxWallsPerGame


}file

void function MpWeaponFerroWall_Init()
{
	#if SERVER
		                                  
		                                    
		                                                                            
	#endif         

	#if CLIENT
		RegisterSignal( "DarkVisionMode_StopColorCorrection" )
		RegisterSignal( "DarkVisionMode_StopActivationScreenFX" )
		RegisterSignal( "DarkVisionMode_CancelFadeOut" )
		RegisterSignal( KILL_CLIENT_THREAD_SIGNAL )
		file.colorCorrection = ColorCorrection_Register( "materials/correction/ability_hunt_mode.raw_hdr" )
		StatusEffect_RegisterEnabledCallback( eStatusEffect.ferro_darkvision, FerroWallDarkVision_StartVisualEffect )
		StatusEffect_RegisterDisabledCallback( eStatusEffect.ferro_darkvision, FerroWallDarkVision_StopVisualEffect )
		StatusEffect_RegisterEnabledCallback( eStatusEffect.ferro_darkvision_team, FerroWallDarkVision_StartVisualEffect )
		StatusEffect_RegisterDisabledCallback( eStatusEffect.ferro_darkvision_team, FerroWallDarkVision_StopVisualEffect )
		AddTargetNameCreateCallback( FERRO_WALL_INFO_TARGET_NAME, OnFerroWallPillarCreated )
	#endif

	PrecacheModel( FERRO_WALL_MODEL_A_SMALL )
	PrecacheModel( FERRO_WALL_MODEL_A_MEDIUM )
	PrecacheModel( FERRO_WALL_MODEL_A_LARGE )
	PrecacheModel( FERRO_WALL_MODEL_B_SMALL )
	PrecacheModel( FERRO_WALL_MODEL_B_MEDIUM )
	PrecacheModel( FERRO_WALL_MODEL_B_LARGE )
	PrecacheModel( FERRO_WALL_MODEL_C_SMALL )
	PrecacheModel( FERRO_WALL_MODEL_C_MEDIUM )
	PrecacheModel( FERRO_WALL_MODEL_C_LARGE )
	PrecacheModel( FERRO_WALL_MODEL_AR )
	PrecacheModel( FERRO_WALL_MODEL_SLOPE )
	PrecacheParticleSystem( FERRO_WALL_DARKEYE_VIGNETTE_FX )
	PrecacheParticleSystem( FERRO_WALL_DEBUG_SPHERE_VISION_LIMIT_FX )
	PrecacheParticleSystem( FERRO_WALL_DARK_ZONE_SHROUD_FX )
	PrecacheParticleSystem( FERRO_WALL_WALKTHROUGH_SPLASH )
	PrecacheParticleSystem( FERRO_WALL_PASSTHROUGH_IMPACT )

	AddCallback_OnPassThrough( FerroWallPassThroughFX )

	foreach ( fx in FERRO_WALL_BASE_FX_ARRAY )
	{
		PrecacheParticleSystem( fx )
	}
	foreach ( fx in FERRO_WALL_LAUNCH_FX_ARRAY )
	{
		PrecacheParticleSystem( fx )
	}
	foreach ( fx in FERRO_WALL_LAUNCH_WATER_FX_ARRAY )
	{
		PrecacheParticleSystem( fx )
	}
	foreach ( fx in FERRO_WALL_IDLE_FX_ARRAY )
	{
		PrecacheParticleSystem( fx )
	}
	foreach ( fx in FERRO_WALL_IDLE_WATER_FX_ARRAY )
	{
		PrecacheParticleSystem( fx )
	}
	foreach ( fx in FERRO_WALL_FINISHED_FX_ARRAY )
	{
		PrecacheParticleSystem( fx )
	}
	foreach ( fx in FERRO_WALL_FINISHED_WATER_FX_ARRAY )
	{
		PrecacheParticleSystem( fx )
	}

	foreach ( ar in FERRO_WALL_BASE_FX_TYPE_ARRAY )
	{
		foreach ( fx in ar )
		{
			PrecacheParticleSystem( fx )
		}
	}

	foreach ( ar in FERRO_WALL_BASE_WATER_FX_TYPE_ARRAY )
	{
		foreach ( fx in ar )
		{
			PrecacheParticleSystem( fx )
		}
	}

	             
	file.duration 							= GetCurrentPlaylistVarFloat( "catalyst_wall_duration", FERRO_WALL_PILLAR_DURATION )
	file.forwardDelay						= GetCurrentPlaylistVarFloat( "catalyst_wall_forwardDelay", FERRO_WALL_PILLAR_DELAY_FORWARD )
	file.scaleUpDelay 						= GetCurrentPlaylistVarFloat( "catalyst_wall_scaleUpDelay", FERRO_WALL_PILLAR_DELAY_BEFORE_SCALING )
	file.scaleUpTime 						= GetCurrentPlaylistVarFloat( "catalyst_wall_scaleUpTime", FERRO_WALL_PILLAR_SCALE_TIME )
	file.scaleDownTime 						= GetCurrentPlaylistVarFloat( "catalyst_wall_scaleDownTime", FERRO_WALL_PILLAR_DESCALE_TIME )
	file.numSegments 						= GetCurrentPlaylistVarInt( "catalyst_wall_numSegments", FERRO_WALL_NUM_PILLARS_FORWARD )
	file.darkVisionFXMaxAlphaEnemy 			= GetCurrentPlaylistVarFloat( "catalyst_wall_darkVisionFXMaxAlphaEnemy", FERRO_WALL_DARKVISION_FX_ALPHA_END )
	file.darkVisionFXMaxAlphaTeam 			= GetCurrentPlaylistVarFloat( "catalyst_wall_darkVisionFXMaxAlphaTeam", FERRO_WALL_DARKVISION_FX_ALPHA_END_TEAM )
	file.darkVisionFlashlightOpacity 		= GetCurrentPlaylistVarFloat( "catalyst_wall_darkVisionFlashlightOpacity", FERRO_WALL_DARKVISION_OPACITY )
	file.darkVisionDurationEnemy 			= GetCurrentPlaylistVarFloat( "catalyst_wall_darkVisionDurationEnemy", FERRO_WALL_DARKVISION_DURATION )
	file.darkVisionDurationTeam 			= GetCurrentPlaylistVarFloat( "catalyst_wall_darkVisionDurationTeam", FERRO_WALL_DARKVISION_TEAM_DURATION )
	file.soundMoverDuration 				= GetCurrentPlaylistVarFloat( "catalyst_wall_soundMoverDuration", FERRO_WALL_SOUND_MOVER_DURATION )
	file.soundMoverDestroyIfNotStartedTime 	= GetCurrentPlaylistVarFloat( "catalyst_wall_soundMoverDestroyIfNotStartedTime", FERRO_WALL_SOUND_MOVER_DESTROY_BEFORE_START_WAIT_TIME )
	file.impactFxEnabled				 	= GetCurrentPlaylistVarInt( "catalyst_wall_impactFxEnabled", FERRO_WALL_IMPACT_FX_ENABLED )
	file.slowServerityPlayer				= GetCurrentPlaylistVarFloat( "catalyst_wall_slowServerityPlayer", FERRO_WALL_SLOW_SCALER )
	file.slowServerityNPC				 	= GetCurrentPlaylistVarFloat( "catalyst_wall_slowServerityNPC", FERRO_WALL_SLOW_NPC_SCALER )
	file.darkVisionDurationNPC				= GetCurrentPlaylistVarFloat( "catalyst_wall_darkVisionDurationNPC", FERRO_WALL_SLOW_NPC_TIME_SCALER )
	file.maxWallsPerPlayer					= GetCurrentPlaylistVarInt( "catalyst_wall_maxWallsPerPlayer", FERRO_WALL_MAX_WALLS_PER_PLAYER )                               
	file.maxWallsPerGame					= GetCurrentPlaylistVarInt( "catalyst_wall_maxWallsPerGame", FERRO_WALL_MAX_WALLS_PER_GAME )                               
}


void function OnWeaponActivate_weapon_ferro_wall( entity weapon )
{
	entity ownerPlayer = weapon.GetWeaponOwner()
	Assert( ownerPlayer.IsPlayer() )

	bool serverOrPredicted = IsServer() || (InPrediction() && IsFirstTimePredicted())
	if ( serverOrPredicted )
	{
		weapon.AddMod( ABILITY_ACTIVE_MOD )
		weapon.RemoveMod( ABILITY_USED_MOD )
	}

	#if CLIENT
		if( IsValid( ownerPlayer ) && ownerPlayer == GetLocalViewPlayer() && weapon.GetWeaponSettingEnum( eWeaponVar.fire_mode, eWeaponFireMode ) == eWeaponFireMode.offhandHybrid )
			thread WeaponActive_Client( ownerPlayer, weapon )
	#endif
	#if SERVER
		                         
	#endif
}


void function OnWeaponDeactivate_weapon_ferro_wall( entity weapon )
{
	entity ownerPlayer = weapon.GetWeaponOwner()
	Assert( ownerPlayer.IsPlayer() )

	#if CLIENT
		if( ownerPlayer == GetLocalViewPlayer() )
			weapon.Signal( KILL_CLIENT_THREAD_SIGNAL )
	#endif

	#if SERVER
		                       
		 
			                                                            
			                         
		 
	#endif

	bool serverOrPredicted = IsServer() || (InPrediction() && IsFirstTimePredicted())
	if ( serverOrPredicted )
	{
		weapon.RemoveMod( ABILITY_ACTIVE_MOD )
	}
}


bool function OnWeaponAttemptOffhandSwitch_weapon_ferro_wall( entity weapon )
{
	if( file.maxWallsPerGame == 0 || file.maxWallsPerPlayer == 0 )
		return false

	return true
}


var function OnWeaponTossReleaseAnimEvent_weapon_ferro_wall( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	return FerroWallAttack_Common( weapon, attackParams )
}

var function OnWeaponPrimaryAttack_weapon_ferro_wall( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	return FerroWallAttack_Common( weapon, attackParams )
}

var function FerroWallAttack_Common( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	entity ownerPlayer = weapon.GetWeaponOwner()
	Assert( ownerPlayer.IsPlayer() )


	vector targetOrigin
	entity targetParent
	vector startAngles = ZERO_VECTOR
	vector ownerOrigin = ownerPlayer.EyePosition()
	                                                                                                                                    
	int deployMethod = GetPlaylistVarInt( GetCurrentPlaylistName(), "ferro_wall_deploy_type", eFerroWallDeployType.DEPLOY_OBJECT_PLACEMENT )
	if( deployMethod == eFerroWallDeployType.DEPLOY_OBJECT_PLACEMENT )
	{
		
		entity placementParent = weapon.GetObjectPlacementParent()
		array<entity> ignoreArray = GetFerroWallIgnoreArray()
		if( weapon.ObjectPlacementHasValidSpot() && ( !IsValid( placementParent ) || !ignoreArray.contains( placementParent ) ) )
		{
			targetOrigin = weapon.GetObjectPlacementOrigin()
		}
		else
		{
			TraceResults fwdTrace = TraceLine( ownerOrigin, ownerOrigin + FlattenNormalizeVec( ownerPlayer.GetViewVector() ) * FERRO_WALL_DEFAULT_FWD_DISTANCE, ignoreArray, TRACE_MASK_NPCSOLID_BRUSHONLY, TRACE_COLLISION_GROUP_NONE )
			TraceResults downTrace = TraceLine( fwdTrace.endPos, fwdTrace.endPos + < 0, 0, -400 >, ignoreArray, TRACE_MASK_NPCSOLID_BRUSHONLY, TRACE_COLLISION_GROUP_NONE )
			if( downTrace.fraction == 1.0 )
			{
				#if CLIENT
					AddPlayerHint( 1, 0.0, $"", "#WPN_FERRO_WALL_WARNING_NO_GROUND" )
					EmitSoundOnEntity( ownerPlayer, "Survival_UI_Ability_NotReady" )
				#endif
				return 0
			}
			targetOrigin = downTrace.endPos
		}

		vector angles = < 0, startAngles.y, 0 >
		#if SERVER
			                                                                                                          
			                                           
			 
				                                                                                                                    
			 
			                                                      
			 
				                   
				                                                                                                                                                                                                                           
				                                                                                                                                                                            
				                                                                                                                                                                             
			 
			    
			 
				                                                                                                                    
			 
		#endif

	}
	else if( deployMethod == eFerroWallDeployType.DEPLOY_PROJECTILE )
	{
		#if CLIENT
			if ( !weapon.ShouldPredictProjectiles() )
				return
		#endif

		WeaponFireGrenadeParams fireGrenadeParams
		fireGrenadeParams.pos = attackParams.pos
		fireGrenadeParams.vel = attackParams.dir
		fireGrenadeParams.scriptTouchDamageType = damageTypes.projectileImpact
		fireGrenadeParams.scriptExplosionDamageType = damageTypes.explosive
		fireGrenadeParams.clientPredicted = true
		fireGrenadeParams.lagCompensated = true
		fireGrenadeParams.useScriptOnDamage = true
		entity grenade = weapon.FireWeaponGrenade( fireGrenadeParams )

		#if SERVER
			                        
			 
				                                           
				                                        
				                            
				                                               
				                                        
				                    
				                                      
				                                               
			 
		#endif


	}

	PlayerUsedOffhand( ownerPlayer, weapon, true, null, { pos = targetOrigin } )
	#if SERVER
		                                                                
		                        
		                                                          
	#endif
	#if CLIENT
		if( ownerPlayer == GetLocalViewPlayer() )
			weapon.Signal( KILL_CLIENT_THREAD_SIGNAL )
	#endif

	bool serverOrPredicted = IsServer() || ( InPrediction() && IsFirstTimePredicted() )
	if ( serverOrPredicted )
	{
		weapon.AddMod( ABILITY_USED_MOD )
	}

	int ammoReq = weapon.GetAmmoPerShot()
	return ammoReq
}

bool function OnWeaponChargeBegin_weapon_ferro_wall( entity weapon )
{
	return true
}

void function OnWeaponChargeEnd_weapon_ferro_wall( entity weapon )
{
	entity ownerPlayer = weapon.GetWeaponOwner()
	Assert( ownerPlayer.IsPlayer() )
}

void function OnProjectileCollision_weapon_ferro_wall( entity projectile, vector pos, vector normal, entity hitEnt, int hitbox, bool isCritical, bool isPassthrough )
{
	projectile.SetVelocity( ZERO_VECTOR )
	#if SERVER
		                    
	#endif
}

vector function GetProjectileVelocity_weapon_ferro_wall( entity projectile, float timeElapsed, float timeStep )
{
	#if SERVER
		                                                 
		                                                             
		                                              
		                                                 
		                                                       
		                                                               
		                                              
		                                               
		                                                
		                                              
		                                                                                 

		                                         
			                               

		                                                                       
		                      
		                                                           
		                                                                  

		                                                                                                                                                  
		 
			                           

			                                                              
			                                                         

			                             

			                                                                             
			                                                   
			                                   
			                                
			                                                                                                                                    
			                                   
			 
				                                                                   
				                                            
				                                                                                                                                                                                                            
				                                                                       

				                                                                                          
					                                          
				                                                                                               
					                                           
				    
					                                          

				                                                          
				                                   
				 
					                                                      
				 
				                                                       
				                                                                   
				                               
				                                                                         
				                   
				                                                                                                                                                                                                                   
				                                               
			 
		 
		                                                                                                                     
	#endif

	return projectile.GetVelocity()
}

bool function FerroWall_BlockScan( vector startPos, vector endPos )
{
	entity ent = TraceGetTargetNameEntAlongLine( FERRO_WALL_SEGMENT_TARGET_NAME, startPos, endPos )
	if ( IsValid( ent ) )
		return ent.GetTargetName() == FERRO_WALL_SEGMENT_TARGET_NAME

	return false
}

#if SERVER
                                                                
 
	                        
		      

	                                                                       
	                                                                                                     
	 
		                                                       
		                         
	 
 

                                                                    
 
	                                 
	                                     
	                                   

	                                            
		                                    
			                                     
		                        
				                 
		   

	                                                                       
	 
		            
	 
 
                                                                                                                  
 
	                                                                         
	                                                   
	                            
		                                

	                                                                                                                         

	                         
 

                                                                 
 
	                                    

	                              

	                                               
		                           
			                    
	   

	            
	                                                                                                    

	                                                                   
		      

	                               

	                                      

	                            
 

                                                                         
 
	                                    
	                               
	                                     

	                                                      
		                                                                             
		 
			                                                    
			                        
			 
				                     
					              
			 

			                                                     
			 
				                                                               
				 
					                                               
					 
						                                   
					 
				 
			 

			                      
			 
				                                                         
				 
					                                                                   
					 
						                                                   
						 
							                                       
						 
					 
				 
			 

			                           
				                    
		 
	   

	                                           
 

                                                                                                                                             
 
	                                

	                            
	                                      
	                         
	                      
	                                     
	                                                       

	                            

	                      
	                                                                
	                      
	                                              
	                                              
	                   
	                   
	                                 

	                                                              
		      

	                          
	                              
	 
		                                                               
		 
			                                                  
			                             
			 
				                     
			 
		 
	 

	                          
	                                
	 
		                                                                     
		 
			                                                       
			                             
			 
				                     
			 
		 
	 

	                                                 
	                                
	                                           
	                                                                  
	                                                        
	                             
	                           
	                                                    
	                                    
	                                               
	                                                   

	                   
	                                                      
	                                        
	                                      
	                                                      
	                                                                      
	                                                       
	                                         
	                                       
	                                                       
	                                                                       
	                                                         
	                                           
	                                         
	                                                         
	                                                                          

	                                      
	 
		                                                     

		                                                    
		                            
		                                                                                                     
		 
			                                                                       
		 

		                                                     
		                                                                                                                                    
		                                 
		 
			                                                                                 
			                                                                                                                                       
			                           
			                                                                                    
			                                                                                                                       
			                                 
				     
		 
		                                
			                                                                         
		      

		                                                                                   
		                                                                                                                                           
		                               
		 
			                
		 
		    
		 
			                                                                   
			                                          
			                                                                                                                                                                                                            
			                                                                       

			                                                                                          
				                                          
			                                                                                               
				                                           
			    
				                                          

			                                                          
			                                                  
			 
				                                                      
			 
			                         

			                    
			                                                                                                                                                           
			                                     
				              

			                                                                   
			                               
			                                                                         
			                                                         
			                                              
			 
				                                                     
			 
			                     
			                                                  
			                                                                                                                                                                                                       
			                                                                 
			             
			                                                                      
			            
			 
				                                                                                                                                             
			 
		 
		                                
			                                                                              
		      

		               
			     

		                
		 
			                           
			                  
		 

		          
	 

	                           
	 
		                                                    
		                            
		                                     
		 
			                           
			 
				                                   
				                    
					                                                                                                                                                     
				     
			 
		 
	 
 
                                                       
 
	                                

	            
		                        
		 
			                       
				                
		 
	 

	           

	             
	 
		                                     
		                          
		 
			                                                 
			                                          
			 
				      
			 

			                                                 
			                                              
			 
				      
			 
		 
		           
	 
 

                                                 
 
	                                                         
		             

	                                     
	                                                                                    
		                

	           
 

                                                                                                                                                                                                                                                                
 
	                                                                        
	                                                                                                                         
	                                                              
	                                                          
	                                   
	                                   
	                                                                                          
	                                                        
	                                     
	                                     
	                                
	              
	                         
	                           
	                                                       
	                                                                                      
	                                                    
	                                         

	                           
	 
		                            
		                                            
		                              

		                                                 
		 
			                                                    
			                            
			                    
			 
				                            
				                         
				 
					                                                                        
					                                                                                                                                
					 
						                         
						                                                   
						 
							                                                           
						 

						                                         
						                             
						                                                                      
						 
							                                           
							                                            
							                      
							                               
							                               
								                                    
						 
					 
				 

			 
		 

	 

	                                                                                         
		                             

	            
		                        
		 
			                       
				                
		 
	 

	                     
	                       
	                     
	                         

	                                
	 
		                                                                                                                                                                                                                   
		                                                                                                                                                         
		                                                                                      
		                                                                           
		                                                                        
		                                                   
		                                 

		            
			                                        
			 
				                               
					                            
			 
		 
	 
	                                     
	 
		                                                                                                                                                                           
		                                                                                                                                                             
		                                                                                        
		                                                                             
		                                                                          
		                                                     
		                                   

		            
			                                 
			 
				                                 
					                              
			 
		 

		                                                                                                                                                                              
		                                                                                                                                                         
		                                                                                      
		                                                                           
		                                                                        
		                                                   
		                                 

		            
			                                 
			 
				                               
					                            
			 
		 
	 

	                                              
	                           
	 
		                             
		 
			                                                                                          
			                                       
			                               
		 

		                                                                                             
		 
			                           
			                                                                             
		 
		    
		 
			                                                                                                              
		 
	 


	                        
	                                             
	                     
	                         
	 
		                                                                                                                    
		 
			                 
			                    
		 
		           
	 

	                                                       
		                    

	                                                   
	                             
	                                         
	                                              
	                                                               
	                           
	                                       
	                                       
	                                                
	                                   
	                                      
	                                        
	                            
	                        
	                                    
	                           
	                                    
	                                 

	                                        
	                          
	 
		                             
		 
			                                                                                               
			                                       
			                               
		 

		             
			                                                                                                   

		                                                                                             
		 
			                           
			                                                                             
		 
		    
		 
			                                                                                                              
		 
	 

	                             
		                                                   

	                  
	                                      
	                
	             
	 
		                                                                                                                    
		 
			                 
			                    
		 

		                                                                 
		                             
		                  
			     
		           
	 

	                                                       
		                    


	                                
	 
		                                 
			                              
	 

	                                
		                                         
		                                                                                                                                                                        
		                                                                                                                                                                                                      
		                                                                     
		                                                                                                                                                                                            
	      

	                  

	                                          
	                          
	 
		                             
		 
			                                       
			                               
		 

		                                                                                             
		 
			                           
			                                                                             
		 
		    
		 
			                                                                                                              
		 
	 

	                                
	 
		                               
			                            
		
		                                                                                                                                                                                
		                                                                                                                                                                 
		                                                                                          
		                                                                               
		                                                                            
		                                                       
		                                     

		            
			                                    
			 
				                                   
					                                
			 
		 
	 

	                                
	 
		                               
			                            

		                                                                                                                                                                                
		                                                                                                                                                                 
		                                                                                          
		                                                                               
		                                                                            
		                                                       
		                                     

		            
			                                    
			 
				                                   
					                                
			 
		 
	 

	                  
	                                        
	                
	             
	 
		                                                                                                                    
		 
			                 
			                    
		 

		                                                                 
		                             
		                  
			     
		           
	 

	                                                       
		                    

	                           
 

                                                                
 
	                                                                                                                                                   
		                                                 
 

                                                                 
 
	                                                                                                                                      
 

                                                                      
 
	                                 
	                             
	                    
		                           

	                             
	                     
	                              
	                            

	            
		                                 
		 
			                                                                    
			 
				                                    
				                                             
				 
					                                                          
					                                
				 
			 
		 
	 

	                         

	                                  
	 
		                     
			      

		                                          
		                                  
		                                                                                   
		                                                                                   
		                                                                                            
		                                                   
		                                                               
		                                                                               
		                                                                
		                                            

		                                                                                   
		                              
		                                      
		                        

		                          
		 
			                      
			           
			        
		 

		                 
		                                                                                      
		 
			                     
			 
				                   

				                                              
			 

			                                
			 
				                  
				                                                                                         
				 
					                                                                                              
				 
				    
				 
					                                      
				 
				                                                      
			 
			                          
			 
				                                          
				              
				 
					                                                       
					                                                 
				 
				                                                                                                                         
				                         
			 
			                     
		 
		                                 
		    
		 
			                    
			 
				                                    
				                                             
				 
					                                                          
					                                
				 
			 
			    
			 
				                                                                                                                               
				                                                     
				                                                                     
				 
					                                               
					                                
					 
						                  
						                                                                                         
						 
							                                                                                              
						 
						    
						 
							                                      
						 
						                                                      
					 
				 
			 
			                                                           
			                      
		 
		                 
		                       
		           
	 
 

                                                                                        
 
	                                                                                   
	                              
	                                      
	                        

	                                
	 
		                                                                                                                     
		 
			                                            
		 
		                                                                                                                    
		 
			               
				                                                
		 
	 
	                                                
	 
		              
			                                                
	 
	    
	 
		                                                              
		                 
			                                            
	 

	                                    
	 
		                   
		 
			                        
			                                                                                             
			                                              
			                                                                                 
			                 
			                                 
		 

		                                 
		 
			              
			 
				                                                                             
				                                                                           
			 
			    
			 
				                                                          
			 
		 
		                                 
		 
			                                                                  
			                                                                  
			                                                               
			                                                               
			                                                                
			                                                                
			                                                             
			                                                             

			                                           
			 
				              
				 
					                                                                                     
					                                                                                   
				 
				    
				 
					                                                                  
				 
			 
			    
			 
				              
				 
					                                                                                  
					                                                                                
				 
				    
				 
					                                                               
				 
			 
		 

	 
	    
	 
		                    
			                                    
	 

	                                                                         
	 
		                              
		                                                      
	 
 

                                                          
 
	                             
	                              
	                                  
	                    
		                           
	                                         

	                                      
	                              
	                        
	                            
	              
		                                                                                       
	    
		                      

	                       
		                                                                                                    
	    
		                        
	                                                                                                               

	                                  

	                                                                           
	                                                       
	         
	                                          
		                                                                                                 
	    
		                                                                                                             
	                                                                            
	                                                            
	                  

	            
		                         
		 
			                   
				                

			                                
			 
				                    
				 
					                                                               
					                                                               
					                                                                 
					                                                                   
				 
				                                 
			 
		 
	 

	                        
	             
	 
		                                     
			      

		                                                 
			      

		                                                         
		                                                                                   
		 
			                    
			              
			 
				                                                                                
				                                                                              
			 
			    
			 
				                                                             
			 
		 
		           
	 
 

                                                              
 
	                             
	                              
	                                  
	                    
		                           
	                                         

	                            
	                                                                                            
	                                                   

	                                  

	            
		                       
		 
			                                
			 
				                    
				 
					                                                                  
					                                                                  
					                                                                 
				 
				                                 
			 
		 
	 

	             
	 
		                                     
			      

		                                                 
			      

		           
	 
 
                                                                                                
 
	                              
	                                                                                                                                                                                                                                       
	                         
	 
		                                                                            
		                       
	 

	            
		                    
		 
			                    
				                
		 
	 
	                                               
 
#endif          

entity function FerroWall_CreateTrapPlacementProxy( asset modelName )
{
	#if SERVER
		                                                                   
	#else
		entity proxy = CreateClientSidePropDynamic( <0, 0, 0>, <0, 0, 0>, modelName )
	#endif
	proxy.EnableRenderAlways()
	proxy.kv.rendermode = 3
	proxy.kv.renderamt = 1
	proxy.Hide()

	return proxy
}

void function EndThreadOn_DarkVisionCommon( entity player )
{
	player.EndSignal( "OnDeath" )
	player.EndSignal( "OnDestroy" )
	player.EndSignal( "BleedOut_OnStartDying" )

	#if SERVER
		                                        
	#endif          
}

#if CLIENT
void function OnCreateClientOnlyModel_weapon_ferro_wall( entity weapon, entity model, bool validHighlight )
{
	model.Hide()
}

void function FerroWallDarkVision_UpdatePlayerScreenVFX_Thread( entity player, int statusEffect )
{
	if ( !IsValid( player ) || !IsLocalClientPlayer( player ) )
		return

	EndThreadOn_DarkVisionCommon( player )
	player.EndSignal( "DarkVisionMode_StopColorCorrection" )

	ColorCorrection_SetExclusive( file.colorCorrection, true )
	ColorCorrection_SetWeight( file.colorCorrection, 1.0 )

	                                                            
	int index = GetParticleSystemIndex( FERRO_WALL_DARKEYE_VIGNETTE_FX )
	file.darkVisionFXID = StartParticleEffectOnEntity( player, index, FX_PATTACH_POINT_FOLLOW, player.GetCockpit().LookupAttachment( "CAMERA" ) )
	EffectSetIsWithCockpit( file.darkVisionFXID, true )

	                                                                                                                           
	if ( StatusEffect_HasSeverity( player, eStatusEffect.ferro_darkvision ) )
	{
		int debuglimitFXID = GetParticleSystemIndex( FERRO_WALL_DEBUG_SPHERE_VISION_LIMIT_FX )
		if ( !PlayerHasPassive( player, ePassives.PAS_LOCKDOWN ) )
		{
			file.darkVisionLimit1FX = StartParticleEffectOnEntity( player, debuglimitFXID, FX_PATTACH_POINT_FOLLOW, player.GetCockpit().LookupAttachment( "CAMERA" ) )
			EffectSetControlPointVector( file.darkVisionLimit1FX, 2, <50, 50, 50> )

			file.darkVisionLimit2FX = StartParticleEffectOnEntity( player, debuglimitFXID, FX_PATTACH_POINT_FOLLOW, player.GetCockpit().LookupAttachment( "CAMERA" ) )
			EffectSetControlPointVector( file.darkVisionLimit2FX, 2, <50, 50, 50> )

			file.darkVisionLimit3FX = StartParticleEffectOnEntity( player, debuglimitFXID, FX_PATTACH_POINT_FOLLOW, player.GetCockpit().LookupAttachment( "CAMERA" ) )
			EffectSetControlPointVector( file.darkVisionLimit3FX, 2, <5, 5, 5> )
		}
		else                                                      
		{
			file.darkVisionLimit0FX = StartParticleEffectOnEntity( player, debuglimitFXID, FX_PATTACH_POINT_FOLLOW, player.GetCockpit().LookupAttachment( "CAMERA" ) )
			EffectSetControlPointVector( file.darkVisionLimit0FX, 2, <5, 5, 5> )
		}
	}


	OnThreadEnd(
		function() : ( player )
		{
			ColorCorrection_SetWeight( file.colorCorrection, 0.0 )
			ColorCorrection_SetExclusive( file.colorCorrection, false )

			if ( EffectDoesExist( file.darkVisionFXID ) )
			{
				EffectStop( file.darkVisionFXID, false, true )
			}
			if ( EffectDoesExist( file.darkVisionLimit0FX ) )
			{
				EffectStop( file.darkVisionLimit0FX, false, true )
			}
			if ( EffectDoesExist( file.darkVisionLimit1FX ) )
			{
				EffectStop( file.darkVisionLimit1FX, false, true )
			}
			if ( EffectDoesExist( file.darkVisionLimit2FX ) )
			{
				EffectStop( file.darkVisionLimit2FX, false, true )
			}
			if ( EffectDoesExist( file.darkVisionLimit3FX ) )
			{
				EffectStop( file.darkVisionLimit3FX, false, true )
			}
		}
	)

	                           
	float fadeTime = 0.5
	thread FerroWallDarkVision_FadePlayerScreenVFX_Thread( player, fadeTime, file.darkVisionFXID, file.darkVisionLimit0FX, file.darkVisionLimit1FX, file.darkVisionLimit2FX, file.darkVisionLimit3FX, file.darkVisionFXAlpha, file.flashlightFXAlpha, false, statusEffect )

	WaitForever()
}

void function FerroWallDarkVision_FadePlayerScreenVFX_Thread( entity player, float fadeTime, int darkVisionFXID, int darkVisionLimit0FX, int darkVisionLimit1FX, int darkVisionLimit2FX, int darkVisionLimit3FX, float darkVisionFXAlpha, float flashlightFXAlpha, bool isFadeOut, int statusEffect )
{
	if ( !IsValid( player ) || !IsLocalClientPlayer( player ) )
		return
	EndSignal( player, "OnDestroy" )
	EndSignal( player, "OnDeath" )
	EndSignal( player, "DarkVisionMode_CancelFadeOut" )

	                                  
	const LERP_IN_TIME = 0.0125                                                                         
	float lerpPercent = 0.0
	float lerpTime    = fadeTime
	float startTime   = Time()
	float endTime     = Time() + (lerpTime)
	float darkVisionAlphaStart = 1.0
	float darkVisionAlphaEnd = 1.0
	float flashlightFXAlphaStart = 0.0
	float flashlightFXAlphaEnd = 1.0

	if (isFadeOut)                                            
	{
		darkVisionAlphaEnd = 0
		flashlightFXAlphaEnd = 0

		if ( !PlayerHasPassive( player, ePassives.PAS_LOCKDOWN ) )
		{
			if ( statusEffect == eStatusEffect.ferro_darkvision_team )
			{
				darkVisionAlphaStart = file.darkVisionFXMaxAlphaTeam
				flashlightFXAlphaStart = file.darkVisionFlashlightOpacity*FERRO_WALL_DARKVISION_FX_SCALAR_TEAM
			}
			if ( statusEffect == eStatusEffect.ferro_darkvision )
			{
				darkVisionAlphaStart = file.darkVisionFXMaxAlphaEnemy
				flashlightFXAlphaStart = file.darkVisionFlashlightOpacity*FERRO_WALL_DARKVISION_FX_SCALAR_ENEMY
			}
		}
		else
		{
			darkVisionAlphaStart = FERRO_WALL_DARKVISION_FX_ALPHA_END_CATALYST
			flashlightFXAlphaStart = file.darkVisionFlashlightOpacity*FERRO_WALL_DARKVISION_FX_SCALAR_CATALYST
		}
	}
	else                                            
	{
		darkVisionAlphaStart = FERRO_WALL_DARKVISION_FX_ALPHA_START
		flashlightFXAlphaStart = 0.0

		if ( !PlayerHasPassive( player, ePassives.PAS_LOCKDOWN ) )
		{

			if ( statusEffect == eStatusEffect.ferro_darkvision_team )
			{
				darkVisionAlphaEnd = file.darkVisionFXMaxAlphaTeam
				flashlightFXAlphaEnd = file.darkVisionFlashlightOpacity*FERRO_WALL_DARKVISION_FX_SCALAR_TEAM
			}
			if ( statusEffect == eStatusEffect.ferro_darkvision )
			{
				darkVisionAlphaEnd = file.darkVisionFXMaxAlphaEnemy
				flashlightFXAlphaEnd = file.darkVisionFlashlightOpacity*FERRO_WALL_DARKVISION_FX_SCALAR_ENEMY
			}
		}
		else
		{
			darkVisionAlphaEnd = FERRO_WALL_DARKVISION_FX_ALPHA_END_CATALYST
			flashlightFXAlphaEnd = file.darkVisionFlashlightOpacity*FERRO_WALL_DARKVISION_FX_SCALAR_CATALYST
		}
	}

	                  
	while ( (Time() <= endTime ) )
	{
		lerpPercent = 1 - ((endTime - Time()) / lerpTime)

		file.darkVisionFXAlpha = LerpFloat( darkVisionAlphaStart, darkVisionAlphaEnd, lerpPercent )
		file.flashlightFXAlpha = LerpFloat( flashlightFXAlphaStart, flashlightFXAlphaEnd, lerpPercent )

		if ( EffectDoesExist( darkVisionFXID ) )
		{
			EffectSetControlPointVector( darkVisionFXID, 1, <file.darkVisionFXAlpha, 0, 0> )
		}
		if(EffectDoesExist( darkVisionLimit0FX ))
		{
			EffectSetControlPointVector( darkVisionLimit0FX, 1, < FERRO_WALL_DARKVISION_DISTANCE, 0, file.flashlightFXAlpha > )
		}
		if(EffectDoesExist( darkVisionLimit1FX ))
		{
			EffectSetControlPointVector( darkVisionLimit1FX, 1, < FERRO_WALL_DARKVISION_DISTANCE, 0, file.flashlightFXAlpha > )
		}
		if(EffectDoesExist( darkVisionLimit2FX ))
		{
			EffectSetControlPointVector( darkVisionLimit2FX, 1, < FERRO_WALL_DARKVISION_DISTANCE + 250, 0, file.flashlightFXAlpha > )
		}
		if(EffectDoesExist( darkVisionLimit3FX ))
		{
			EffectSetControlPointVector( darkVisionLimit3FX, 1, < FERRO_WALL_DARKVISION_DISTANCE + 500, 0, file.flashlightFXAlpha > )
		}

		float weight = StatusEffect_GetSeverity( player, eStatusEffect.ferro_darkvision )
		weight = GraphCapped( Time() - startTime, 0, LERP_IN_TIME, 0, weight )
		ColorCorrection_SetWeight( file.colorCorrection, weight*0.5 )

		WaitFrame()
	}

	if ( ( StatusEffect_GetTimeRemaining( player, eStatusEffect.ferro_darkvision ) <= 0 ) && ( StatusEffect_GetTimeRemaining( player, eStatusEffect.ferro_darkvision_team ) <= 0 ) )
	{
		player.Signal( "DarkVisionMode_StopColorCorrection" )
		player.Signal( "DarkVisionMode_StopActivationScreenFX" )
	}
}

void function FerroWallDarkVision_StartVisualEffect( entity ent, int statusEffect, bool actuallyChanged )
{
	if ( !actuallyChanged && GetLocalViewPlayer() == GetLocalClientPlayer() )
		return

	if ( ent != GetLocalViewPlayer() )
		return

	if ( ent.IsBot() )
		return

	ent.Signal( "DarkVisionMode_CancelFadeOut" )
	ent.Signal( "DarkVisionMode_StopColorCorrection" )

	if( statusEffect == eStatusEffect.ferro_darkvision )
		GfxDesaturateOn()

	thread FerroWallDarkVision_UpdatePlayerScreenVFX_Thread( ent, statusEffect )
}

void function FerroWallDarkVision_StopVisualEffect( entity ent, int statusEffect, bool actuallyChanged )
{
	if ( !actuallyChanged && GetLocalViewPlayer() == GetLocalClientPlayer() )
		return

	if ( ent != GetLocalViewPlayer() )
		return

	if( statusEffect == eStatusEffect.ferro_darkvision )
		GfxDesaturateOff()

	                     
	float fadeTime = 1.5
	thread FerroWallDarkVision_FadePlayerScreenVFX_Thread( ent, fadeTime, file.darkVisionFXID, file.darkVisionLimit0FX, file.darkVisionLimit1FX, file.darkVisionLimit2FX, file.darkVisionLimit3FX, file.darkVisionFXAlpha, file.flashlightFXAlpha, true, statusEffect )
	thread FerroWallDarkVision_ClearPlayerScreenFX_Thread( ent, fadeTime)


}

void function FerroWallDarkVision_ClearPlayerScreenFX_Thread( entity ent, float fadeTime )
{
	EndSignal( ent, "DarkVisionMode_CancelFadeOut" )

	wait fadeTime

	ent.Signal( "DarkVisionMode_StopColorCorrection" )
	ent.Signal( "DarkVisionMode_StopActivationScreenFX" )
}

void function WeaponActive_Client( entity ownerPlayer, entity weapon )
{
	EndSignal( weapon, KILL_CLIENT_THREAD_SIGNAL )
	EndSignal( weapon, "OnDestroy" )
	EndSignal( ownerPlayer, "OnDestroy" )

	wait 0.2

	array< entity > proxies
	int maxCharges = file.numSegments
	for( int i = 0; i < maxCharges; i++ )
	{
		entity proxy = FerroWallCreatePlacementProxy( FERRO_WALL_MODEL_AR )
		proxy.EnableRenderAlways()
		proxy.Show()
		                                   
		proxies.append( proxy )
	}

	OnThreadEnd(
		function () : ( ownerPlayer, maxCharges, proxies )
		{
			for( int i = 0; i < maxCharges; i++ )
			{
				if ( IsValid( proxies[ i ] ) )
				{
					proxies[ i ].Destroy()
				}
			}
		}
	)

	int lastCharges = 0
	bool lastGroundValid = true
	while( true )
	{

		for( int i = 0; i < maxCharges; i++ )
		{
			proxies[ i ].Hide()
		}

		vector targetOrigin
		entity targetParent
		vector startAngles = ZERO_VECTOR
		vector ownerOrigin = ownerPlayer.EyePosition()
		entity placementParent = weapon.GetObjectPlacementParent()
		array<entity> ignoreArray = GetFerroWallIgnoreArray()
		if( weapon.ObjectPlacementHasValidSpot() && ( !IsValid( placementParent ) || !ignoreArray.contains( placementParent ) ) )
		{
			targetOrigin = weapon.GetObjectPlacementOrigin()
		}
		else
		{
			TraceResults fwdTrace = TraceLine( ownerOrigin, ownerOrigin + FlattenNormalizeVec( ownerPlayer.GetViewVector() ) * FERRO_WALL_DEFAULT_FWD_DISTANCE, ignoreArray, TRACE_MASK_NPCSOLID_BRUSHONLY, TRACE_COLLISION_GROUP_NONE )
			TraceResults downTrace = TraceLine( fwdTrace.endPos, fwdTrace.endPos + < 0, 0, -400 >, ignoreArray, TRACE_MASK_NPCSOLID_BRUSHONLY, TRACE_COLLISION_GROUP_NONE )
			if( downTrace.fraction == 1.0 )
			{
				WaitFrame()
				continue
			}
			targetOrigin = downTrace.endPos
		}
		CreatePlacementWall( proxies, targetOrigin, ownerPlayer.GetViewForward() )
		WaitFrame()
	}
}

entity function FerroWallCreatePlacementProxy( asset modelName )
{
	entity proxy = CreateClientSidePropDynamic( <0, 0, 0>, <0, 0, 0>, modelName )
	proxy.EnableRenderAlways()
	proxy.kv.rendermode = 2
	proxy.kv.renderamt = 175
	proxy.Hide()

	return proxy
}

void function CreatePlacementWall( array< entity > proxies, vector pos, vector dir, float initalStep = FERRO_WALL_STEP_INIT )
{
	float traceStep = initalStep
	dir = <dir.x, dir.y, 0.0>
	dir = Normalize( dir )
	vector angles = VectorToAngles( dir )
	angles = RotateAnglesAboutAxis( angles, UP_VECTOR, 90 )

	bool firstTrace = true
	vector traceStart = pos + < 0, 0, FERRO_WALL_CLIMB_HEIGHT_INIT >
	bool endTraces = false

	int numPillars = proxies.len()

	for ( int i = 0; i < numPillars; i++ )
	{
		array<entity> ignoreArray = GetFerroWallIgnoreArray()

		vector traceFwdEnd = traceStart + ( dir * traceStep )
		TraceResults forwardTrace = TraceLine( traceStart, traceFwdEnd, ignoreArray, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )
		if( forwardTrace.fraction < 1.0 )
		{
			vector traceUpEnd = forwardTrace.endPos + < 0, 0, FERRO_WALL_RETRY_CLIMB_HEIGHT >
			TraceResults upTrace = TraceLine( forwardTrace.endPos, traceUpEnd, ignoreArray, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )
			traceStart = upTrace.endPos
			traceFwdEnd = traceStart + ( dir * ( traceStep * ( 1.0 - forwardTrace.fraction ) ) )
			forwardTrace = TraceLine( traceStart, traceFwdEnd, ignoreArray, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )
			if( forwardTrace.fraction < 1.0 )
				break
		}
		#if DEV && FERRO_WALL_DEBUG_DRAW
			                                                                         
		#endif

		vector traceDownEnd = forwardTrace.endPos + < 0, 0, -FERRO_WALL_DOWN_TRACE_LENGTH >
		TraceResults downTrace = TraceLine( forwardTrace.endPos, traceDownEnd, ignoreArray, TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )
		if( downTrace.fraction == 1.0 )
		{
			endTraces = true
		}
		else
		{
			proxies[ i ].SetOrigin( downTrace.endPos + < 0, 0, FERRO_WALL_PILLAR_Z_OFFSET > )
			proxies[ i ].SetAngles( angles )
			proxies[ i ].Show()
			traceStart = downTrace.endPos + < 0, 0, FERRO_WALL_CLIMB_HEIGHT >
		}
		#if DEV && FERRO_WALL_DEBUG_DRAW
			                                                                              
		#endif

		if( endTraces )
			break

		if( firstTrace )
		{
			traceStep = FERRO_WALL_STEP
			firstTrace = false
		}
	}
}

void function OnFerroWallPillarCreated( entity infoTarget )
{
	if( IsValid( infoTarget ) )
		thread OnFerroWallPillarCreatedThread( infoTarget )
}

void function OnFerroWallPillarCreatedThread( entity infoTarget )
{
	EndSignal( infoTarget, "OnDestroy" )

	entity localPlayer = GetLocalViewPlayer()
	if( !IsValid( localPlayer ) )
		return
	EndSignal( localPlayer, "OnDestroy" )

	entity clientAG = CreateClientSideAmbientGeneric( infoTarget.GetOrigin() , FERRO_WALL_IDLE_3P, 0 )
	clientAG.RemoveFromAllRealms()
	clientAG.AddToOtherEntitysRealms( infoTarget )
	clientAG.SetParent( infoTarget, "", true )
	SetTeam( clientAG, infoTarget.GetTeam() )

	OnThreadEnd(
		function() : ( clientAG )
		{
			if ( IsValid( clientAG ) )
			{
				clientAG.Destroy()
			}
		}
	)

	while( true )
	{
		clientAG.RemoveSegmentEndpoints()
		array< entity > segments = infoTarget.GetLinkEntArray()
		clientAG.SetEnabled( ( segments.len() > 0 ) )
		foreach( wallSegment in segments )
		{
			if( IsValid( wallSegment ) && wallSegment.GetModelScale() >= 1.0 )
			{
				vector startPoint = wallSegment.GetOrigin() + < 0, 0, FERRO_WALL_HEIGHT * 0.75 > + wallSegment.GetRightVector() * FERRO_WALL_RADIUS
				vector endPoint = wallSegment.GetOrigin() + < 0, 0, FERRO_WALL_HEIGHT * 0.75 > - wallSegment.GetRightVector() * FERRO_WALL_RADIUS
				clientAG.AddSegmentEndpoints( startPoint, endPoint )
			}
		}
		WaitFrame()
	}
}
void function FerroWallPassThroughFXThread_Client( entity hitOwner, entity wall, vector hitPos )
{
	EndSignal( wall, "OnDestroy" )
	int handle = StartParticleEffectInWorldWithHandle( GetParticleSystemIndex( FERRO_WALL_PASSTHROUGH_IMPACT ), hitPos, wall.GetAngles() )

	OnThreadEnd(
		function () : ( handle )
		{
			if ( EffectDoesExist( handle ) )
				EffectStop( handle, false, true )
		}
	)

	wait FERRO_WALL_PASSTHROUGH_IMPACT_FX_KILL_TIME
}
#endif         

void function FerroWallPassThroughFX( entity hitOwner, entity wall, vector hitPos )
{
#if CLIENT
	if( IsValid( hitOwner ) && hitOwner == GetLocalViewPlayer() && InPrediction() )
#endif
	{
		if( file.impactFxEnabled != 0 && IsValid( wall ) && wall.GetTargetName() == FERRO_WALL_SEGMENT_TARGET_NAME )
		{
			float maxHeight = 0
			if( FERRO_WALL_SMALL_MODEL_ARRAY.contains( wall.GetModelName() ) )
			{
				maxHeight = FERRO_WALL_HEIGHT - ( FERRO_WALL_PILLAR_HEIGHT_CHECK_BUFFER * 0.3 )
			}
			else if( FERRO_WALL_MEDIUM_MODEL_ARRAY.contains( wall.GetModelName() ) )
			{
				maxHeight = FERRO_WALL_HEIGHT * 2.0 - ( FERRO_WALL_PILLAR_HEIGHT_CHECK_BUFFER * 0.6 )
			}
			else if( FERRO_WALL_LARGE_MODEL_ARRAY.contains( wall.GetModelName() ) )
			{
				maxHeight = FERRO_WALL_HEIGHT * 3.0 - FERRO_WALL_PILLAR_HEIGHT_CHECK_BUFFER
			}
			else if( wall.GetModelName() == FERRO_WALL_MODEL_SLOPE )
			{
				maxHeight = FERRO_WALL_HEIGHT * 3.0 - FERRO_WALL_PILLAR_HEIGHT_CHECK_BUFFER - 20.0
			}
			else
			{
				return
			}

			vector testPoint = wall.GetOrigin() + ( wall.GetUpVector() * maxHeight )

			if( IsPointInFrontofLine( hitPos, testPoint, wall.GetUpVector() ) )
				return

			#if CLIENT
			thread FerroWallPassThroughFXThread_Client( hitOwner, wall, hitPos )
			#endif
			#if SERVER
			                                                                    
			#endif
		}
	}
}

array<entity> function GetFerroWallIgnoreArray()
{
	array<entity> ignoreArray

	ignoreArray.extend( GetPlayerArray() )
	ignoreArray.extend( GetAllResinShards() )
	ignoreArray.extend( GetNPCArray() )
	ignoreArray.extend( GetEntArrayByScriptName( TROPHY_SYSTEM_NAME ) ) 					             
	ignoreArray.extend( GetEntArrayByScriptName( TESLA_TRAP_NAME ) )						               
	ignoreArray.extend( GetEntArrayByScriptName( DIRTY_BOMB_TARGETNAME ) )					              
	ignoreArray.extend( GetEntArrayByScriptName( DEATH_TOTEM_TARGETNAME ) )					                
	ignoreArray.extend( GetEntArrayByScriptName( BLACKHOLE_PROP_SCRIPTNAME ) )				              
	ignoreArray.extend( GetEntArrayByScriptName( BLACK_MARKET_SCRIPTNAME ) )				                   
	ignoreArray.extend( GetEntArrayByScriptName( BASE_WALL_SCRIPT_NAME ) )					              
	ignoreArray.extend( GetEntArrayByScriptName( MOUNTED_TURRET_PLACEABLE_SCRIPT_NAME ) )	                
	ignoreArray.extend( GetEntArrayByScriptName( ECHO_LOCATOR_SCRIPT_NAME ) )				          
	ignoreArray.extend( GetEntArrayByScriptName( SHIELD_THROW_SCRIPTNAME ) )				                     
	ignoreArray.extend( GetEntArrayByScriptName( MOBILE_SHIELD_SCRIPTNAME ) )				                            
	ignoreArray.extend( GetEntArrayByScriptName( CRYPTO_DRONE_SCRIPTNAME ) )				               
	ignoreArray.extend( GetEntArrayByScriptName( VANTAGE_COMPANION_SCRIPTNAME ) )			      
	ignoreArray.extend( GetPlayerDecoyArray() )												               
	ignoreArray.extend( GetEntArrayByScriptName( "LootRoller" ) )
	ignoreArray.extend( GetAllDeathBoxes() )
	ignoreArray.extend( GetEntArrayByScriptName( WORKBENCH_CLUSTER_SCRIPTNAME ) )
	ignoreArray.extend( GetEntArrayByScriptName( HOVER_VEHICLE_SCRIPTNAME ) )

	return ignoreArray
}