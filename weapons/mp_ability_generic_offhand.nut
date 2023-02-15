global function MpGenericOffhand_Init
global function OnWeaponAttemptOffhandSwitch_GenericOffhand
global function GenericOffhand_AddSunglasses

#if CLIENT
global function Thread_GenericOffhand_PlaySunglassesVFX
#endif



global const string GENERIC_OFFHAND_WEAPON_NAME = "mp_ability_generic_offhand"
global const int GENERIC_OFFHAND_INDEX = 7
global const float SUNGLASSES_FX_STARTUP = 0.90
global const float SUNGLASSES_FX_DURATION = 1
const asset SUNGLASSES_ACTIVATION_SCREEN_FX = $"P_sonar"


global function ActivateGenericOffhand

struct
{
	int screeFxHandle
	int colorCorrection
} file

void function MpGenericOffhand_Init()
{
	PrecacheWeapon( GENERIC_OFFHAND_WEAPON_NAME )
	PrecacheParticleSystem( SUNGLASSES_ACTIVATION_SCREEN_FX )
}

bool function OnWeaponAttemptOffhandSwitch_GenericOffhand( entity weapon )
{
	entity player = weapon.GetWeaponOwner()
	if ( !IsValid( player ) )
		return false

	array <entity> activeWeapons = player.GetAllActiveWeapons()
	if ( activeWeapons.len() > 1 )
	{
		entity offhandWeapon = activeWeapons[1]

		if ( IsValid( offhandWeapon ) )
		{
			return false
		}
	}
	return true
}


void function ActivateGenericOffhand( entity player)
{
	entity weapon = player.GetOffhandWeapon( GENERIC_OFFHAND_INDEX )

	if ( !IsValid( weapon ) )
		return

	if ( weapon.GetWeaponClassName() != GENERIC_OFFHAND_WEAPON_NAME )
		return

                         
                       
  
                                               
                                  
  
      

	thread __ActivateGenericOffhand( player )
}

void function __ActivateGenericOffhand( entity player )
{
	player.EndSignal( "OnDestroy" )
	player.TrySelectOffhand( GENERIC_OFFHAND_INDEX )
#if CLIENT
                         
                      
                                                        
                                   
#endif
	                                                                                              

}


void function GenericOffhand_AddSunglasses (entity player)
{
	entity weapon = player.GetOffhandWeapon( GENERIC_OFFHAND_INDEX )
	weapon.AddMod( "sunglasses" )
}

#if CLIENT
void function Thread_GenericOffhand_PlaySunglassesVFX (entity player)
{
		entity cockpit = player.GetCockpit()
		file.colorCorrection = ColorCorrection_Register( "materials/correction/area_sonar_scan.raw_hdr" )
		wait(SUNGLASSES_FX_STARTUP)
		thread ColorCorrection_LerpWeight( file.colorCorrection, 0, 1, 0.5 )
		thread ColorCorrection_LerpWeight( file.colorCorrection, 1, 0, 1 )
}
#endif

#if CLIENT
void function ColorCorrection_LerpWeight( int colorCorrection, float startWeight, float endWeight, float lerpTime = 0 )
{
	float startTime = Time()
	float endTime = startTime + lerpTime
	ColorCorrection_SetExclusive( colorCorrection, true )

	while ( Time() <= endTime )
	{
		WaitFrame()
		float weight = GraphCapped( Time(), startTime, endTime, startWeight, endWeight )
		ColorCorrection_SetWeight( colorCorrection, weight )
	}

	ColorCorrection_SetWeight( colorCorrection, endWeight )
}
#endif         