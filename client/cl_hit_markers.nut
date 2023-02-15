                         
global function ClientCodeCallback_DrawHitMarkers

const float NO_HIT_NPC_TIMEOUT = 2
const float POST_SHOOT_NPC_MAKE_HITS_MISSES_DURATION = 0.5

struct{
	entity playerTarget = null
	float playerNPCLastHitTime = 0
} file

void function ClientCodeCallback_DrawHitMarkers( entity projectile, vector pos, entity hitEnt, bool isCritical, bool isMiss )
{
	if ( !IsValid( hitEnt ) )
		return

	                  
	if ( ShouldShowTrainingHitIndicators() && !hitEnt.IsPlayer() )
	{
		entity player = projectile.GetOwner()

		                                       
		if ( player != GetLocalViewPlayer() )
			return

		if ( !isMiss )
		{
			if ( hitEnt.IsNPC() )
			{
				file.playerTarget = hitEnt
				file.playerNPCLastHitTime = Time()
			}
			else
			{
				if ( (file.playerNPCLastHitTime + POST_SHOOT_NPC_MAKE_HITS_MISSES_DURATION) >= Time() )
				{
					isMiss = true
				}
				else
				{
					file.playerTarget = null
				}
			}
		}

		if( isMiss )
		{
			if ( IsValid(file.playerTarget) && ( (file.playerNPCLastHitTime + NO_HIT_NPC_TIMEOUT) >= Time() ) )
			{
				hitEnt = file.playerTarget

				vector targetPos = hitEnt.GetOrigin()
				vector playerEyes = player.EyePosition()
				vector eyesToHitPosNormalized = Normalize(pos - playerEyes)
				float distToTarget = Distance(playerEyes, targetPos)
				pos = eyesToHitPosNormalized * distToTarget + playerEyes
			}
		}
		var hitDotRui = RuiCreate( $"ui/training_target_hit_dot.rpak", clGlobal.topoFullScreen, RUI_DRAW_HUD, 0 )
		RuiSetResolutionToScreenSize( hitDotRui )
		RuiSetGameTime( hitDotRui, "startTime", Time() )
		RuiSetFloat3( hitDotRui, "pos", pos )
		RuiSetBool ( hitDotRui, "drawInWorldSpace", true )
		RuiSetBool( hitDotRui, "isCrit", isCritical )
		RuiSetBool( hitDotRui, "isMiss", isMiss )

		if ( GetCurrentPlaylistVarBool( "firing_range_hitmarker_pos_update_enabled", true ) )
		{
			thread UpdateHitMarkerPos( hitDotRui, pos, hitEnt )
		}
	}
}

void function UpdateHitMarkerPos( var rui, vector damagePos, entity target )
{
	EndSignal( target, "OnDeath", "OnDestroy" )
	vector offset = damagePos - target.GetOrigin()

	                                                                                                                      
	float endTime = Time() + 3.485
	while ( Time() < endTime )
	{
		                                                                            
		RuiSetFloat3( rui, "pos", offset + target.GetOrigin() )
		WaitFrame()
	}
}
      
