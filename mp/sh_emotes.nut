global function ShEmotes_Init
global function ShEmotes_Lobby_Init
global function AreEmotesEnabled
global function GetPlayerGroundEmoteEnabled
global function GetPlayerIsEmoting
global function GetPlayerIs3pEmoting
global function CheckPlayerCanEmote

#if SERVER
                                       
                                         
                                    
                                  
                                                 
                    
                                                 
      
                                           
                                               
                                                       
                                                             
                                                                
#endif

#if CLIENT
global function RequestCharacterEmote
global function ServerCallback_PlayerPerformPodiumScreenEmote
global function ServerCallback_PlayerPerformPodiumScreenFlourish
global function GetOptionTextForEmote
global function ModelPerformEmote
global function IsEmoteEnabledForPodiumScreen
#endif

#if CLIENT
const string SIGNAL_CL_END_EMOTE_OUTRO 		= "ClEndEmoteOutro"
const string SIGNAL_CL_END_EMOTE_NOW 		= "ClEndEmoteNow"
const string SIGNAL_CL_EMOTE_ENDED 			= "ClEmoteEnded"
const string SIGNAL_CL_NEXT_CAMERA_ATTACHMENT 			= "ClNextCameraAttachment"
const string SIGNAL_CL_PREV_CAMERA_ATTACHMENT 			= "ClPrevCameraAttachment"
#endif          

#if SERVER
                                       	         
										          
										          
										           
										         
										                
										          
										           
										        
										                   
										             
										               
										           

                                     
#endif

const string SIGNAL_END_EMOTE_PERFORMANCE 			= "StopEmote"
const string SIGNAL_END_EMOTE_ENDED 				= "EmoteEnded"
global const string SIGNAL_STARTING_EMOTE 			= "StartingEmote"
const string SIGNAL_EMOTE_COMPLETED_FULLY			= "EmoteCompleted"
const string SIGNAL_EMOTE_FLOURISH					= "EmoteFlourish"

#if CLIENT
const string CLIENT_EMOTE_PROMPT_COMMAND = "+jump"
#endif

const string EMOTE_PIN_ACTION_BEGIN 				= "begin"
const string EMOTE_PIN_ACTION_COMPLETE				= "complete"
const string EMOTE_PIN_ACTION_INTERRUPT 			= "interrupted"

#if SERVER
                                                            	                                  

                                                          
                                                                             

                    
                                                     
                                                                     
                                           
                                        

                                                                                      
                                                                                        

                                                                     
      

#endif

                       
             
                       
const string EMOTE_CHAT_SUFFIX_FRIENDLY 		= "_CHAT_FRIENDLY"
const string EMOTE_CHAT_SUFFIX_ENEMY 			= "_CHAT_ENEMY"

                       
                    
                       
const float STATIC_EMOTE_MAX_MOVE_SPEED = 260.0			                                                                

const table< string, int > DEV_CUSTOM_ANIM_DURATIONS = 	{	  [ "bangalore_menu_select_ready_up" ] 	= 70
															, [ "mirage_menu_select_ready_up" ]	 	= 100
															, [ "caustic_menu_ready_up" ]		 	= 124
															, [ "wattson_menu_select_ready_up" ] 	= 60
															, [ "octane_menu_select_ready_up" ] 	= 133
														}

const vector CLEARANCE_HULL_MAXS = < 28, 28, 2 >
const vector CLEARANCE_HULL_MINS = -1 * CLEARANCE_HULL_MAXS
const vector CLEARANCE_HULL_ORIGIN_OFFSET = <0,0,54>

const int MAX_PROPS_ALLOWED_IN_WORLD = 20

                       
                                     
                       
const float CAMPOS_MAX_PITCH_TO_PLAYER 				= 17.5                                                          
const float CAMPOS_MIN_PITCH_TO_PLAYER 				= -25

const float CAM_PITCH_SPEED 						= 0    				                                         
const float CAM_PITCH_SPEED_MAX 					= 5

const float CAM_YAW_SPEED 							= 0    					                                         
const float CAM_YAW_SPEED_MAX 						= 8

const float CAM_SPEED_DRAG 							= 0.95

const float CAM_DIST_SCALAR 						= 128.0

const vector EYE_HEIGHT_OFFSET_APPROX 				= < 0, 0, 64 >

const float DOF_FAR_DISTANCE						= 2750
const float DOF_VARIABLE_BLUR						= 20

const float CAM_BASE_OFFSET_HEIGHT					= -24
const float CAM_OUTRO_EASE_TIME						= 0.2
const float CAM_OUTRO_NO_PREDICT_DEV_BUFFER_TIME	= 0.2

const float EMOTE_CAMERA_BLEND_OUT_TIME = 1.0

global enum eCanEmoteCheckReults
{
	SUCCESS,
	FAIL_TOO_CLOSE_TO_WALL,
	FAIL_GENERIC
}

global struct EmoteCameraData
{
	entity camera
	entity mover

	                                                              
	int emoteFlavorIndex				= -1
	bool animationControlled 			= false
	string activeCameraAttachment		= ""

	                                                          
	float maxPitch				= CAMPOS_MAX_PITCH_TO_PLAYER
	float minPitch				= CAMPOS_MIN_PITCH_TO_PLAYER
	float pitchSpeed			= CAM_PITCH_SPEED
	float pitchSpeedMax			= CAM_PITCH_SPEED_MAX
	float yawSpeed				= CAM_YAW_SPEED
	float yawSpeedMax			= CAM_YAW_SPEED_MAX
	float camSpeedDrag			= CAM_SPEED_DRAG
	float camDistScalar			= CAM_DIST_SCALAR
	vector posAnchorOffset		= EYE_HEIGHT_OFFSET_APPROX		                                                                                                                                                                              
	bool useLookTarget			= true
	float __currentPitchSpeed	= 0
	float __currentYawSpeed		= 0
	string posAnchorAttach		= "ORIGIN"			                             
	string lookTargetAttach		= "HEADFOCUS"		                       

	float dofFarDistance		= DOF_FAR_DISTANCE
	float dofVariableBlur		= DOF_VARIABLE_BLUR
}

                       
              
                       
struct
{
	bool emotesInitialized = false

	table<entity, ItemFlavor> emotingPlayers                                                                                     

	#if SERVER
		                              	                  

                      
			                                               
			                                                       
        
	#endif

	#if CLIENT
		string							lastUsedEmoteAttachment
		table< entity, bool >			characterPodiumModelIsEmoting
	#endif          

	table<ItemFlavor, ItemFlavor> characterBaseEmoteMap
} file

                       
                   
                       
const string CMD_REQUEST_EMOTE_START 			= "ClientCallback_RequestEmote"
const string CMD_REQUEST_EMOTE_STOP 			= "ClientCallback_RequestStopEmote"
const string CMD_REQUEST_SET_VIEW_AFTER_EMOTE 	= "ClientCallback_RequestSetViewAfterEmote"

                       
       
                       
void function ShEmotes_Init()
{
	RegisterNetworkedVariable( "canGroundEmote", SNDC_PLAYER_EXCLUSIVE, SNVT_BOOL, true )
	RegisterNetworkedVariable( "isEmoting", SNDC_PLAYER_EXCLUSIVE, SNVT_BOOL, false )
	RegisterNetworkedVariable( "emoteFlourishAvailable", SNDC_PLAYER_EXCLUSIVE, SNVT_BOOL, false )

	if ( !AreEmotesEnabled() )
		return

	RegisterSignal( "EndAntiPeekAfterDelay" )
	RegisterSignal( SIGNAL_END_EMOTE_PERFORMANCE )
	RegisterSignal( SIGNAL_STARTING_EMOTE )
	RegisterSignal( SIGNAL_END_EMOTE_ENDED )
	RegisterSignal( SIGNAL_EMOTE_FLOURISH )

	AddCallback_OnItemFlavorRegistered( eItemType.character, OnItemFlavorRegistered_Character )

	Remote_RegisterServerFunction( CMD_REQUEST_EMOTE_START, "int", INT_MIN, INT_MAX )
	Remote_RegisterServerFunction( CMD_REQUEST_EMOTE_STOP )
	Remote_RegisterServerFunction( CMD_REQUEST_SET_VIEW_AFTER_EMOTE, "vector", -FLT_MAX, FLT_MAX, 32)

#if SERVER
	                                                                

	                                                                             
	                                                                               

	                                                                                                 
	                                                                                                           
	                                                                                               

	                                                                    

	                             

                     
		                                      
		                                                   

		                                  

		                                                                                                      
		                                                                                                                  
       
#endif          

#if CLIENT
	RegisterSignal( SIGNAL_CL_END_EMOTE_OUTRO )
	RegisterSignal( SIGNAL_CL_END_EMOTE_NOW )
	RegisterSignal( SIGNAL_CL_EMOTE_ENDED )
	RegisterSignal( SIGNAL_CL_NEXT_CAMERA_ATTACHMENT )
	RegisterSignal( SIGNAL_CL_PREV_CAMERA_ATTACHMENT )

	array<string> bonesToTry = [
		"CHESTFOCUS",
		"HEADFOCUS",
		"R_FOREARM",
		"L_FOREARM",
		"ORIGIN"
	]

	bool testDistance = GetCurrentPlaylistVarBool( "emotes_antipeek_testDistance", true )
	bool testFoV = GetCurrentPlaylistVarBool( "emotes_antipeek_testFov", false )
	bool testFriendlies = false

	float nearDist = GetCurrentPlaylistVarFloat( "emotes_antipeek_nearDist", 150 )
	float farDist = GetCurrentPlaylistVarFloat( "emotes_antipeek_farDist", 5000 )

	InitAntiPeekSettings( nearDist, farDist, 2.0, testDistance, testFoV, testFriendlies, bonesToTry )

	RegisterNetworkedVariableChangeCallback_bool( "isEmoting", Cl_OnPlayerEmoteStateChanged )
	RegisterNetVarBoolChangeCallback( "emoteFlourishAvailable", ToggleFlourishPrompt )

	AddCallback_OnVictoryCharacterModelSpawned( OnPodiumCharacterModelSpawned )
	AddCallback_OnIntroPodiumCharacterModelSpawned( OnPodiumCharacterModelSpawned )
#endif          

	file.emotesInitialized = true
}

void function ShEmotes_Lobby_Init()
{
	RegisterSignal( SIGNAL_STARTING_EMOTE )
	RegisterSignal( SIGNAL_EMOTE_FLOURISH )

	#if CLIENT
		RegisterSignal( "BaseEmoteMapInitialized" )
	#elseif SERVER
		                                                         
	#endif
}

void function OnItemFlavorRegistered_Character( ItemFlavor characterClass )
{
	if ( ItemFlavor_GetType( characterClass ) != eItemType.character )
		return
}

#if SERVER
                                                 
 
	                                                                                                                      

	                                            
	 
		                                    
	 
 

                                                   
 
	                                                 

	                                              
	 
		                                              
		 
			                                                          

			                                                     
				            
		 
	 

	           
 

                                                  
 
	                               

	                                         
		           

	                                                      
	 
		                                               
	 

	                                                                       
 

                                                                               
 
	                               
	                          
	                              
	                 

	                                                               
	                                                   

	                                            
		      

	                                              
	 
		                                                          

		                                                          
		                                                                       
		 
			                                                                
			                                    
			 
				                                                               
				                        
					      
			 
		                                     
		    
		 
			                                                               
			                        
				      
		 
	 

	                                              
	 
		                                                          

		                                                          
		                                                                       
		 
			                                                                
			                                             
			 
				                                                       
				      
			 
		 
		                                   

		                                                               
		                                       
		 
			                                                       
			      
		 
	 

	                                  
	                                                                    
	 
		                                              
		 
			                                                          
			                                                                  

			                                                                     
			 
				                                                                                       
				      
			 
		 

		           
	 

	                                                                                       
 
#endif          

#if CLIENT
void function OnPodiumCharacterModelSpawned( entity characterModel, ItemFlavor character, int eHandle )
{
	file.characterPodiumModelIsEmoting[ characterModel ] <- false

	if ( LocalClientEHI() == eHandle )
	{
		thread TryPromptPodiumScreenEmote( characterModel )
	}
}

bool function CanLocalClientPerformPodiumScreenEmote()
{
	entity localClientPlayer = GetLocalClientPlayer()

	if ( !IsValid( localClientPlayer ) )
		return false

	                                                                                                            
	                                                                       
	if ( !CanPlayerSpeak( localClientPlayer ) )
		return false

	if ( GetPlayerIsEmoting( localClientPlayer ) )
		return false

	EHI playerEHI = LocalClientEHI()
	ItemFlavor character = LoadoutSlot_GetItemFlavor( playerEHI, Loadout_Character() )

	if ( ItemFlavor_GetQuipArrayForCharacter( character, true ).len() == 0 && ItemFlavor_GetFavoredQuipArrayForCharacter( character, true ).len() == 0 )
		return false

	if ( IsEmoteEnabledForPodiumScreen() )
	{
		entity characterModel = GetPodiumScreenCharacterModelForEHI( playerEHI )

		if ( !IsValid( characterModel ) )
			return false

		if ( ! ( characterModel in file.characterPodiumModelIsEmoting ) )
		{
			return false
		}
		else if ( file.characterPodiumModelIsEmoting[ characterModel ] )
		{
			return false
		}
	}
	else
	{
		return false
	}

	return true
}

bool function IsEmoteEnabledForPodiumScreen()
{
	bool isEmoteEnabled = false

	if ( IsShowingVictorySequence() || ( IsShowingIntroPodiumSequence() && GetCurrentPlaylistVarBool( "podium_allow_intro_screen_emotes", false ) ) )
		isEmoteEnabled = true

	return isEmoteEnabled
}

void function TryPromptPodiumScreenEmote( entity characterModel )
{
	EndSignal( GetLocalClientPlayer(), "OnDestroy" )
	EndSignal( characterModel, "OnDestroy" )
	EndSignal( characterModel, SIGNAL_STARTING_EMOTE )

	if ( CanLocalClientPerformPodiumScreenEmote() )
	{
		RegisterConCommandTriggeredCallback( CLIENT_EMOTE_PROMPT_COMMAND, TryPerformPodiumScreenEmote )
		RuiSetBool( GetPodiumSequenceRui(), "emoteAvailable", true )

		OnThreadEnd(
			function() : ()
			{
				DeregisterConCommandTriggeredCallback( CLIENT_EMOTE_PROMPT_COMMAND, TryPerformPodiumScreenEmote )
			}
		)

		WaitForever()
	}
}

void function TryPerformPodiumScreenEmote( entity player )
{
	if ( player != GetLocalClientPlayer() )
		return

	int selectedIndex = -1

	EHI playerEHI        = LocalClientEHI()
	ItemFlavor character = LoadoutSlot_GetItemFlavor( playerEHI, Loadout_Character() )

	array<ItemFlavor> favoredEmotes = ItemFlavor_GetFavoredQuipArrayForCharacter( character, true )
	bool pickFromFavored = favoredEmotes.len() > 0

	array<ItemFlavor> options
	table<ItemFlavor, int> optionToIndex

	entity localPlayer = FromEHI( playerEHI )
	if ( IsValid( localPlayer ) && !CanPlayerSpeak( localPlayer ) )
		return

	entity spawnedCharacterModel = GetPodiumScreenCharacterModelForEHI( playerEHI )

	if ( !IsValid( spawnedCharacterModel ) )
		return

	if ( pickFromFavored )
	{
		for ( int i = 0; i < MAX_FAVORED_QUIPS; i++ )
		{
			LoadoutEntry entry = Loadout_FavoredQuip( character, i )
			ItemFlavor emote    = LoadoutSlot_GetItemFlavor( playerEHI, entry )
			if ( !CharacterQuip_IsTheEmpty( emote ) && ItemFlavor_GetType( emote ) == eItemType.character_emote )
			{
				options.append( emote )
				optionToIndex[ emote ] <- i
			}
		}
	}
	else
	{
		for ( int i = 0; i < MAX_QUIPS_EQUIPPED; i++ )
		{
			LoadoutEntry entry = Loadout_CharacterQuip( character, i )
			ItemFlavor emote    = LoadoutSlot_GetItemFlavor( playerEHI, entry )
			if ( !CharacterQuip_IsTheEmpty( emote ) && ItemFlavor_GetType( emote ) == eItemType.character_emote )
			{
				options.append( emote )
				optionToIndex[ emote ] <- i
			}
		}
	}

	string promptString = "#PING_SAY_CELEBRATE_EMOTE"

	if ( options.len() > 0 )
	{
		ItemFlavor flav = options.getrandom()

		entity emotePlayer = FromEHI( playerEHI )

		if ( !IsValid( emotePlayer ) )
			return

		selectedIndex = optionToIndex[ flav ]
	}

	if ( selectedIndex >= 0 )
	{
		if ( pickFromFavored )
		{
			PodiumScreenPerformFavoredEmoteByIndex( spawnedCharacterModel, selectedIndex, playerEHI )
		}
		else
		{
			PodiumScreenPerformEmoteByIndex( spawnedCharacterModel, selectedIndex, playerEHI )
		}
	}
}

void function PodiumScreenPerformEmoteByIndex( entity characterModel, int quipIndex, EHI playerEHI, bool sendCallback = true )
{
	ItemFlavor character = LoadoutSlot_GetItemFlavor( playerEHI, Loadout_Character() )
	ItemFlavor emote     = LoadoutSlot_WaitForItemFlavor( playerEHI, Loadout_CharacterQuip( character, quipIndex ) )

	thread PodiumScreenPerformEmote_Thread( characterModel, emote, playerEHI, sendCallback )
}

void function PodiumScreenPerformFavoredEmoteByIndex( entity characterModel, int quipIndex, EHI playerEHI, bool sendCallback = true )
{
	ItemFlavor character = LoadoutSlot_GetItemFlavor( playerEHI, Loadout_Character() )
	ItemFlavor emote     = LoadoutSlot_WaitForItemFlavor( playerEHI, Loadout_FavoredQuip( character, quipIndex ) )

	thread PodiumScreenPerformEmote_Thread( characterModel, emote, playerEHI, sendCallback )
}

void function PodiumScreenPerformEmoteByGUID( entity characterModel, int emoteGUID, EHI playerEHI, bool sendCallback = true )
{
	ItemFlavor emote = GetItemFlavorByGUID( emoteGUID )

	thread PodiumScreenPerformEmote_Thread( characterModel, emote, playerEHI, sendCallback )
}

void function PodiumScreenPerformEmote_Thread( entity characterModel, ItemFlavor emote, EHI playerEHI, bool sendCallback = true )
{
	Assert( IsNewThread(), "Must be threaded off" )

	entity mover = CreateClientsideScriptMover( $"mdl/dev/empty_model.rmdl", characterModel.GetOrigin(), characterModel.GetAngles() )
	mover.MakeSafeForUIScriptHack()
	characterModel.SetParent( mover )

	if ( sendCallback )
	{
		int emoteGUID = ItemFlavor_GetGUID( emote )
		Remote_ServerCallFunction( "ClientCallback_PlayerPerformPodiumScreenEmote", playerEHI, emoteGUID )
	}

	OnThreadEnd(
		function() : ( characterModel, playerEHI, mover )
		{
			if ( IsValid( characterModel ) )
				characterModel.ClearParent()
		}
	)

	file.characterPodiumModelIsEmoting[ characterModel ] <- true

	vector savedAngles = mover.GetAngles()

	               
	if ( string(ItemFlavor_GetAsset( emote )) == CAUSTIC_SPECIAL_CASE_EMOTE_ASSET_PATH )
	{
		mover.SetAngles( mover.GetAngles() + <0,45,0> )
	}

	waitthread ModelPerformEmote( characterModel, emote, mover )

	file.characterPodiumModelIsEmoting[ characterModel ] <- false

	if ( GetBugReproNum() == 451 )
		thread TryPromptPodiumScreenEmote( characterModel )

	mover.SetAngles( savedAngles )
	thread VictoryScreenEmoteCleanup( characterModel, playerEHI, mover )
}

void function VictoryScreenEmoteCleanup( entity characterModel, EHI playerEHI, entity mover )
{
	if ( !IsValid( characterModel ) )
		return

	EndSignal( characterModel, "OnDestroy" )

	thread FlashMenuModel( characterModel, eMenuModelFlashType.VICTORY_SEQUENCE, MENU_MODELS_DEFAULT_HIGHLIGHT_COLOR / 255 )

	characterModel.SetParent( mover )

	string victoryAnim = GetVictorySquadFormationActivity( characterModel, playerEHI )
	waitthread PlayAnim( characterModel, victoryAnim, mover )

	characterModel.ClearParent()
}
#endif          

#if SERVER
                                                                                                                    
 
	                                                                                  

	                                                                                                                                                  

	                                                                     
	 
		                                         
			        

		                                                                                                                             
	 
 
#endif          

#if CLIENT
void function ServerCallback_PlayerPerformPodiumScreenEmote( int performingPlayerEHI, int emoteGUID )
{
	entity characterModel = GetPodiumScreenCharacterModelForEHI( performingPlayerEHI )

	if ( !IsValid( characterModel ) )
		return

	if ( ! ( characterModel in file.characterPodiumModelIsEmoting ) )
		return

	if ( file.characterPodiumModelIsEmoting[ characterModel ] )
		return

	thread PodiumScreenPerformEmoteByGUID( characterModel, emoteGUID, performingPlayerEHI, false )
}
#endif          

#if CLIENT
void function PodiumPromptFlourish()
{
	EHI playerEHI = LocalClientEHI()
	entity player = GetLocalClientPlayer()
	entity characterModel = GetPodiumScreenCharacterModelForEHI( playerEHI )

	if ( !player || !characterModel )
		return

	EndSignal( characterModel, SIGNAL_END_EMOTE_PERFORMANCE )
	EndSignal( characterModel, SIGNAL_END_EMOTE_ENDED )
	EndSignal( characterModel, SIGNAL_EMOTE_FLOURISH )
	EndSignal( characterModel, "OnDestroy" )

	OnThreadEnd(
		function() : ( player )
		{
			DeregisterConCommandTriggeredCallback( CLIENT_EMOTE_PROMPT_COMMAND, RequestPodiumFlourish )
			ToggleFlourishPrompt( player, false )
		}
	)

	ToggleFlourishPrompt( player, true )
	RegisterConCommandTriggeredCallback( CLIENT_EMOTE_PROMPT_COMMAND, RequestPodiumFlourish )

	WaitForever()
}

void function RequestPodiumFlourish( entity player )
{
	if ( player != GetLocalClientPlayer() )
		return

	EHI playerEHI = LocalClientEHI()
	entity spawnedCharacterModel = GetPodiumScreenCharacterModelForEHI( playerEHI )

	                   
	if ( spawnedCharacterModel )
		Signal( spawnedCharacterModel, SIGNAL_EMOTE_FLOURISH )

	                      
	Remote_ServerCallFunction( "ClientCallback_PlayerPerformPodiumScreenFlourish", playerEHI )
}
#endif          

#if SERVER
                                                                                                               
 
	                                                                                  

	                           
		      

	                                                                     
	 
		                                         
			        

		                                                                                                                     
	 
 
#endif          

#if CLIENT
void function ServerCallback_PlayerPerformPodiumScreenFlourish( int performingPlayerEHI )
{
	entity characterModel = GetPodiumScreenCharacterModelForEHI( performingPlayerEHI )

	if ( !IsValid( characterModel ) )
		return

	if ( ! ( characterModel in file.characterPodiumModelIsEmoting ) )
		return

	if ( !file.characterPodiumModelIsEmoting[ characterModel ] )
		return

	Signal( characterModel, SIGNAL_EMOTE_FLOURISH )
}
#endif          

#if CLIENT
string function GetOptionTextForEmote( ItemFlavor flavor )
{
	return Localize( ItemFlavor_GetShortName( flavor ) )
}

void function RequestCharacterEmote( entity player, int flavorGUID )
{
	Assert ( file.emotesInitialized )
	Remote_ServerCallFunction( CMD_REQUEST_EMOTE_START, flavorGUID )
}
#endif          

bool function AreEmotesEnabled()
{
	return GetCurrentPlaylistVarBool( "emotes_enable", true )
}

#if CLIENT
void function Cl_OnPlayerEmoteStateChanged( entity player, bool playerIsEmoting )
{
	if ( player != GetLocalViewPlayer() )
		return

	bool antiPeekEnabled = true

	#if DEV
		if ( GetBugReproNum() == 1234 )
		{
			antiPeekEnabled = false
		}
	#endif

	player.Set3PWeaponClonesVisibility( !playerIsEmoting )

	if ( !playerIsEmoting )
	{
		Signal( player, SIGNAL_CL_END_EMOTE_NOW )			         
		thread EndAntiPeekAfterDelay( player )
	}
	else
	{
		vector initialEyeAngles = player.EyeAngles()

		if ( antiPeekEnabled )
		{
			player.Signal( "EndAntiPeekAfterDelay" )
			player.StartAntiPeekTesting()
			thread AntiPeekHintThink( player )
		}
	}
}

void function ToggleFlourishPrompt( entity player, bool show )
{
	if ( player != GetLocalViewPlayer() )
		return

	if ( show )
	{
		AddPlayerHint( 9999.0, 0.25, $"", "#FLOURISH_EMOTE_HINT" )
	}
	else
	{
		HidePlayerHint( "#FLOURISH_EMOTE_HINT" )
	}
}

void function EndAntiPeekAfterDelay( entity player )
{
	player.Signal( "EndAntiPeekAfterDelay" )
	player.EndSignal( "OnDestroy" )
	player.EndSignal( "EndAntiPeekAfterDelay" )

	OnThreadEnd(
		function () : ( player )
		{
			if ( IsValid( player ) )
			{
				player.EndAntiPeekTesting()
			}
		}
	)

	wait CAM_OUTRO_EASE_TIME
}

void function AntiPeekHintThink( entity player )
{
	Signal( player, SIGNAL_CL_END_EMOTE_NOW )
	EndSignal( player, SIGNAL_CL_END_EMOTE_NOW )

	var rui = CreateFullscreenRui( $"ui/anti_peek_hint.rpak", 100 )

	OnThreadEnd(
		function() : ( rui )
		{
			foreach ( p in GetPlayerArray() )
			{
				p.EnableDraw()
			}

			RuiDestroy( rui )
		}
	)

	player.EndSignal( "OnDeath" )
	while ( IsAlive( player ) )
	{
		RuiSetBool( rui, "isVisible", GetGameState() == eGameState.Playing )
		wait 0.1
	}
}

bool function ShouldCullPlayer( entity localPlayer, entity p, vector initialEyeAngles )
{
	if ( p.p.nextTraceCheckTime > Time() )
		return false

	if ( !IsEnemyTeam( localPlayer.GetTeam(), p.GetTeam() ) )
		return false

	if ( !IsInCameraFOV( localPlayer, p ) )
		return false

	float distToPlayer = Distance2D( localPlayer.GetOrigin(), p.GetOrigin() )
	if ( distToPlayer < 400 )                                               
		return false

	if ( distToPlayer > 5000 )                         
		return false

	array<string> bonesToTry = [
		"CHESTFOCUS",
		"HEADFOCUS",
		"R_FOREARM",
		"L_FOREARM",
		"ORIGIN"
	]

	foreach ( bone in bonesToTry )
	{
		int attachIndex = p.LookupAttachment( bone )
		TraceResults result = TraceLine( localPlayer.EyePosition(), p.GetAttachmentOrigin( attachIndex ), GetPlayerArray(), TRACE_MASK_VISIBLE, TRACE_COLLISION_GROUP_NONE )

		if ( result.fraction >= 0.95 )
		{
			                                                                                                         
			p.p.nextTraceCheckTime = Time() + 3.0
			return false
		}
		else
		{
			                                                                                    
		}
	}

	return true
}

bool function IsInCameraFOV( entity player, entity ent )
{
	float minDot = deg_cos( DEFAULT_FOV )

	             
	float dot = DotProduct( Normalize( ent.GetWorldSpaceCenter() - player.CameraPosition() ), AnglesToForward( player.CameraAngles() ) )
	if ( dot < minDot )
		return false

	return true
}

bool function IsInFrontLockedFOV( entity player, entity ent, vector initialEyeAngles )
{
	float minDot = deg_cos( DEFAULT_FOV )

	float dot = DotProduct( Normalize( ent.GetWorldSpaceCenter() - player.GetOrigin() ), AnglesToForward( initialEyeAngles ) )
	if ( dot < minDot )
		return false

	return true
}
#endif          

                                                                                                             
  
                                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                              
  
                                                                                                             


bool function GetPlayerGroundEmoteEnabled( entity player )
{
	return player.GetPlayerNetBool( "canGroundEmote" )
}

bool function GetPlayerIsEmoting( entity player )
{
	return player.GetPlayerNetBool( "isEmoting" )
}

bool function GetPlayerIs3pEmoting( entity player )
{
	return player.GetPlayerNetBool( "isEmoting" )
}

ItemFlavor function GetEmotingPlayerEmote( entity player )
{
	return file.emotingPlayers[ player ]
}

int function CheckPlayerCanEmote( entity player )
{
	if ( !GetPlayerGroundEmoteEnabled( player ) )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.Anim_IsActive() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.ContextAction_IsBusy() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.ContextAction_IsActive() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( !player.IsOnGround() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.IsTraversing() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.IsMantling() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.IsWallRunning() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.IsWallHanging() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.IsPhaseShifted() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.Player_IsSkywardFollowing() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.Player_IsSkywardLaunching() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( StatusEffect_HasSeverity( player, eStatusEffect.placing_phase_tunnel ) )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.GetParent() != null )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.GetPlayerNetBool( "isHealing" ) )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.IsUsingOffhandWeapon( eActiveInventorySlot.mainHand ) )
	{
		entity offhandWeapon = player.GetActiveWeapon( eActiveInventorySlot.mainHand )
		var offhandAllowsInteract = offhandWeapon.GetWeaponInfoFileKeyField( "offhand_allow_player_interact" )
		if ( !offhandAllowsInteract || offhandAllowsInteract <= 0 )
			return eCanEmoteCheckReults.FAIL_GENERIC
	}
	if ( player.IsUsingOffhandWeapon( eActiveInventorySlot.altHand ) )
		return eCanEmoteCheckReults.FAIL_GENERIC
	                                                   
	  	            
	if ( player.PlayerMelee_GetState() != PLAYER_MELEE_STATE_NONE )
		return eCanEmoteCheckReults.FAIL_GENERIC
	#if SERVER
	                                           
		                                        
	#elseif CLIENT
	if ( IsValid( player.GetPlayerNetEnt( "Translocation_ActiveProjectile" ) ) )
		return eCanEmoteCheckReults.FAIL_GENERIC
	#endif
	if ( player.IsSlipping() )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( player.IsCrouched() && !player.CanStand() )
		return eCanEmoteCheckReults.FAIL_TOO_CLOSE_TO_WALL
	int playerMatchState = PlayerMatchState_GetFor( player )
	if ( playerMatchState < ePlayerMatchState.NORMAL && playerMatchState != ePlayerMatchState.STAGING_AREA )
		return eCanEmoteCheckReults.FAIL_GENERIC
	if ( IsPlayerTooCloseToWall( player ) )
	{
		return eCanEmoteCheckReults.FAIL_TOO_CLOSE_TO_WALL
	}

	return eCanEmoteCheckReults.SUCCESS
}

                                                                                    
   
  	                                                                   
  
  	                                 
  
  	                                                       
  	                                                                                             
  	                                                                             
  	 
  		                                                                                 
  		                                                                                              
  	 
  
  	                     
   

bool function IsPlayerTooCloseToWall( entity player )
{
	TraceResults result = TraceHull( player.GetOrigin() + CLEARANCE_HULL_ORIGIN_OFFSET, player.GetOrigin() + CLEARANCE_HULL_ORIGIN_OFFSET, CLEARANCE_HULL_MINS, CLEARANCE_HULL_MAXS, GetPlayerArray_AliveConnected(), TRACE_MASK_PLAYERSOLID, TRACE_COLLISION_GROUP_PLAYER )

	if ( IsValid( result.hitEnt ) )
		return true

	return false
}

#if CLIENT
void function ModelPerformEmote( entity model, ItemFlavor item, entity mover, bool oneShot = true, bool autoFlourish = false )
{
	EndSignal( model, "OnDestroy" )
	EndSignal( mover, "OnDestroy" )

	Signal( model, SIGNAL_STARTING_EMOTE )
	EndSignal( model, SIGNAL_STARTING_EMOTE )

	OnThreadEnd(
		function() : ( model )
		{
			if ( IsValid( model ) && IsEmoteEnabledForPodiumScreen() )
			{
				Signal( model, SIGNAL_END_EMOTE_ENDED )
			}
		}
	)

	int flashType = IsEmoteEnabledForPodiumScreen() ? eMenuModelFlashType.VICTORY_SEQUENCE : eMenuModelFlashType.DEFAULT
	vector flashColor = MENU_MODELS_DEFAULT_HIGHLIGHT_COLOR / 255
	thread FlashMenuModel( model, flashType, flashColor )

	if ( IsEmoteEnabledForPodiumScreen() && !CanLocalClientPerformPodiumScreenEmote() )
		RuiSetBool( GetPodiumSequenceRui(), "emoteAvailable", false )

	bool isLocalPlayerModel = ( GetPodiumScreenCharacterModelForEHI( LocalClientEHI() ) == model )

	string anim3p     = CharacterQuip_GetAnim3p( item )
	string loopAnim3p = CharacterQuip_GetAnimLoop3p( item )

	bool usesLoop = loopAnim3p != ""

	waitthread PlayAnim( model, anim3p, mover )

	float BASE_WAIT = 0.2
	float LOOP_WAIT = 0.3

	wait BASE_WAIT                                                                               

	if ( usesLoop )
	{
		float loopTime = 0

		loopTime = DEV_CharacterEmote_GetCustomAnimSequenceTime( loopAnim3p )
		if ( loopTime < 0 )
			loopTime = model.GetSequenceDuration( loopAnim3p )

		while ( true )
		{
			string flourishSeq = ""
			var flourishBlock = CharacterQuip_SelectWeightedAnimFlourish3p( item )

			if ( flourishBlock )
				flourishSeq = GetSettingsBlockString( flourishBlock, "sequence" )

			if ( flourishSeq == "" )
			{
				                                             
				waitthread PlayAnim( model, loopAnim3p, mover )
				break
			}

			float flourishTime = DEV_CharacterEmote_GetCustomAnimSequenceTime( flourishSeq )
			if ( flourishTime < 0 )
				flourishTime = model.GetSequenceDuration( flourishSeq )

			thread PlayAnim( model, loopAnim3p, mover )

			if ( autoFlourish )
			{
				wait loopTime
			}
			else
			{
				if ( isLocalPlayerModel )
					thread PodiumPromptFlourish()

				WaitSignal( model, SIGNAL_EMOTE_FLOURISH )
			}

			thread PlayAnim( model, flourishSeq, mover )
			wait flourishTime

			if ( !autoFlourish && GetSettingsBlockBool( flourishBlock, "flourishEndsLoop" ) )
				break
		}
	}
	else if ( !oneShot )
	{
		wait LOOP_WAIT - BASE_WAIT

		while ( true )
		{
			waitthread PlayAnim( model, anim3p, mover )
			wait LOOP_WAIT
		}
	}
}
#endif          


#if SERVER
                                                    
 
	                                                  
	 
		                                                                                         
	 

	                                                                 
	                                                                            
 

                                                       
 
	                                                  
	 
		                                                                                            
	 

	                                                                    
	                                                                               
 

                                                                     
 
	                                                     
 

                                                                       
   
  	                                                                   
  
  	                                                                                 
   


                                                                  
 
	                                                                                   
	                                                                            
	                                                                                      

	                                       
	                                            
	                               
 

                                                   
 
	                                                                                   
	                                                                                  

	                                    
	                                             
	                                  
 

                                                                          
 
	                          
		      

	                         
		      

	                                           
		      

	                                                     
	                                           
 

                                                              
 
	                         
		      

	                            
 

                                                 
 
	                                              
 

                                                           
 
	                           
 

                                                                
 
	                                                            
	 
		                                                                     
	 
 

                                                          
 
	                           
 

                                         
 
	                                                 
	                               
	 
		                         
			        

		                                    
			        

		                            
	 
 

                                                                           
 
	                                                                    
		      

	                                   
	 
		                                                         
		                             
			                       

		                            
		      
	 

	                                                                                                                       

	                                             
	 
		                                           
	 
	    
	 
		                                             
		 
			                                                                                                                                                              
		 
	 
 

                                                                    
 
	                              
	                                
	                                    
	                                            
	                                
	                                                 

	                                  
	                                       
	                                  
	                   
	                                                                    

	                                                                  

	            
		                                                                                      
		 
			                        
			 
				                     
				                                             

				                                   
				 
					                  

					                                
					 
						                                         
						 
							                                     
							                                                  
							                                        
							                                                
						 
						    
						 
							                                 
						 
					 

					                                                                   
					                        
					                                   
					                                                      

					                              
					                                        
				 
			 
		 
	 

	                                               
	                                             

	                                                                                                  
	                                                 
	                                                         

	                                                                        
	                    
		                                                

	                         
	                        

	                                     
	                       
	                                 
	                                 
	                                      
	                                                                         
	                            
	                             
	                         

	                        
	                       

	                               
	                                
	                                                
	                                               

	                                                                        
	                                                                                                                                                       

	                                
	 
		                                                   
		                                                                
		                                             
		                                           
		                                   
		                                  
		                                       
		                                      
		                                                
		                                                                                
		                                        
		                                                
		                                                        
		                               
	 

	                       
		                                                                    
	    
	 
		                                                                   
	 

	                                                  
	                                                  
 

                                                                          
 
	                           
	                                         

	            
		                       
		 
			                        
			 
				                        
				                                
			 
		 
	 

	          
 

                                                                                        
 
	                         
		      

	                                  
	                       
 

                                                                                                         
                                                                 
 
	                              

	                                                     
	                                      
	                                           
	                          
	 
		                                                        
			        

		                                                    
			                                    
	 

	                                           
	                                        
	                                        
	 
		                                                   
			                                      
	 

	                                                                                                                        
	                                                               
	                                                       
	                           
	 
		                            
		 
			                                      
		 
		    
		 
			                                           
			                        
			                                                  
			 
				                                                                                                          
				                             
				 
					                      
					                
				 
			 

			                      
				                                               
		 
	 

	           
 

                                                                                                               
 
	                                                 
	                                           
	                                

	                  

	                                                      

	              
	 
		           
		                                                                          
		                            
		                             

		                       

		                                                                        

		                    
			                                                                 

		                        
			      

		                                                                                
		                       
			                                                        

		                                             

		                                           

		                                                                              
		                            
		                             

		                 

		                                                                
			                            
	 
 

                                                                 
 
	                                                          
	                                                  
	                                          
	                                

	            
		                                     
		 
			                                                                                    

			                                                        
			                                             
				                                                                                    

			                                                          
		 
	 

	                                                         

	                                                                                       
	                                                                                 

	             
 

                                              
 
	                                       
 

                                                                                                        
 
	                                                 
	                                           
	                                

	                       
	                       

	            
		                                             
		 
			                       
				                                                                                                                                               
		 
	 

	             

	                     

	                            
 

                                                           
 
	                                                 
	                                           
	                                

	              
	               

	                             

	                                          
	              
	 
		                                        
		                                      

		                       
		 
			                                                                                                  
				     
		 
		    
		 
			                                                                                                  
				                       
		 

		                           
			     

		           
	 

	                            
 

                                                                                               
 
	                                        

	                                   
		                            
 

                                                                 
 
	                                       
 

                                                                           
 
	                                        
 

                                                                 
 
	                                   
		                            
 

                                                                     
 
	                                              
		      

	                            
 

                                                                                                     
 
	                              
		      

	                            
 
#endif          

                                                                                                             
  
                                                                                                                                   
                                                                                                                                       
                                                                                                            
                                                                                                       
                                                                                                                  
                                                                                                              
                                                                                                             

bool function IsPlayerMovingTooQuicklyForEmote( entity player )
{
	vector playerVel = player.GetVelocity()
	float player2DSpeed = Length2D( playerVel )

	return player2DSpeed > STATIC_EMOTE_MAX_MOVE_SPEED
}

float function DEV_CharacterEmote_GetCustomAnimSequenceTime( string animName )
{
	const float FRAMERATE = 30.0
	if ( animName in DEV_CUSTOM_ANIM_DURATIONS )
		return DEV_CUSTOM_ANIM_DURATIONS[ animName ] / FRAMERATE
	else
		return -1

	unreachable
}

#if SERVER
                                             
 
	          
	                                       
	                                                    
	 
		                       
			                                   
		    
			                     
	 
	                                                          
	 
		                                                 
	 
	             
 

                                                                                                     
 
	                                                      
	                    
	 
		                                                                                                                          
		      
	 
	                                                      

	                                                                                                                                            

	                                                       
 

                                                              
 
	                                                                                        
	                  
	 
		              
			                   
			     
		                      
			                            
			     
                    
		                      
			                            
			     
      
		        
		 
			                                                                                                                 
			                  
		 
	 

	           
 

                                                                            
 
	                                     
	                              
	                                


	                                                                                                                                                                              

	                               
	 
		                                      

		                                            

		                                                                                                                                                                 

		                                         

		                                     
	 
	    
	 
		                                            

		                                            
	 
 

                                                                 
 
	                                                                    
	 
		                                  
		                               

		                                                              
		 
			                                                    
			 
				                           
				     
			 
			                                                      
			 
				                                     
				                                          
			 
		 

		                                 
		 
			                                                                       
			                              
				                                             
		 
		    
			                                                                                                                                                
	 
	                                            
		                                     

	                                                        
 

                    
                                                                                                                      
 
	                                 
	                                                        

	                                                                                                  

	                                  
	                          

	                          
		                                    

	                            
		                                    

	                                  
	                                                                           
 

                                                                                                                
 
	                                     
	                              
	                                
	                                     

	            
		                                    
		 
			                                                            
			                                                                                                     
			  	                                                            
			                           
		 
	 

	                                        
	                                                                         

	                                                                                                                              

	                               
	 
		                                                               

		                                      
		                                         
		                                                          

		            
		                  
		                                                                 
		                                                                                     
		 
			                                                                         
			                                                         
		 
		    
		 
			                                                    
		 
		                                       

		                
		                                                                                                                          
		                                                                                                                          
		                                                                                                                          
		                                                                                                                          

		                  
		                    
		                     
		                   
		                      

		                                                                                                        

		                                
		 
			                                                                           
			                                                                              
			 
				                                                 
				                           
				     
			 
			                                                   
		 

		                                                            
		                                       

		                          
			                              
		    
			                          
	 
	    
	 
		                                                                  
		                                                                                    
		                                                                          

		                                                          
		                          
	 
 

                                         
 
	                       
		      

	                                                   
	                                                                            

	                                                                                                                     
	              
 

                                                   
 
	                          
		            

	                        
		            

	                         
	                                                                                                                                                                        
		            

	           
 

                                                                               
 
	                                                                           
	                                                                                   

	                                                              

	                                                                                                        
 

      
#endif