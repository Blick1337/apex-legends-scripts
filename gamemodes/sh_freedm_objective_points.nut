                       

                                                                                                                                           
                                            
               
             
                 
               
                      

                                                    
                                           

global function FreeDM_ObjectivePointsInit
global function FreeDM_RegisterObjectiveType
global function FreeDM_IsObjectiveTypeActive

const string OBJECTIVE_CLASSNAME = "info_target"
const string OBJECTIVE_EDITOR_CLASSNAME = "info_freedm_objective"
const string OBJECTIVE_TYPENAME = "type_name"
const string OBJECTIVE_DATANAME_RAIDUS = "radius"
global const vector FREEDM_DEFAULT_OBJECTIVE_COLOR = <69, 221, 224>

global const int FREEDM_WP_STRING_OBJECTIVE_DISPLAY_NAME = 0
global const int FREEDM_WP_STRING_OBJECTIVE_DISPLAY_DESC = FREEDM_WP_STRING_OBJECTIVE_DISPLAY_NAME + 1
global const int FREEDM_WP_VECTOR_OBJECTIVE_COLOR = 0

global struct FreeDM_ObjectiveData
{
	vector location
	float radius
}

struct ObjectiveTypeData
{
	void functionref( ) initFunc
	void functionref( entity, FreeDM_ObjectiveData ) createFunc
	string type = ""
}

struct
{
	array< ObjectiveTypeData > registeredTypeInfos
	array< string > activeObjectiveTypes
	table< array< FreeDM_ObjectiveData > > objectiveData
} file

void function FreeDM_ObjectivePointsInit()
{
	                                                             

	ParseActiveTypes()

	                                                       
	EvoPointRegister()

	#if SERVER
		                                                         
	#endif

	InitActiveObjectives()

	if( file.activeObjectiveTypes.len() > 0 )
		RegisterTimedEvents()
}

void function FreeDM_RegisterObjectiveType( string objectiveType, void functionref( ) initFunc, void functionref( entity, FreeDM_ObjectiveData ) createFunc )
{
	ObjectiveTypeData data
	data.type = objectiveType.tolower()
	data.initFunc = initFunc
	data.createFunc = createFunc

	file.registeredTypeInfos.append( data )
}

bool function FreeDM_IsObjectiveTypeActive( string typeName )
{
	return file.activeObjectiveTypes.find( typeName ) >= 0
}

#if SERVER
                                                             
 
	                                                    
		      

	                                                             
		      

	                                                                      
	                          
		      

	                                               
	 
		                                         
		 
			                                  
			                                      
		 

		                            
		                                      
		                                                                 
		                                                
	 
 
#endif

void function ParseActiveTypes( )
{
	string activeTypeString = GetCurrentPlaylistVarString( "active_objective_types", "" )

	if ( activeTypeString != "" )
		file.activeObjectiveTypes = GetTrimmedSplitString( activeTypeString, " " )

	int numTypes = file.activeObjectiveTypes.len()
	for( int i = 0; i < numTypes; i++ )
		file.activeObjectiveTypes[i] = file.activeObjectiveTypes[i].tolower()
}

void function RegisterTimedEvents()
{
	               
	TimedEventData eventData

	#if SERVER
		                                 
		                                           
		                                                        
		                             
		                             
		                          
	#endif

	#if CLIENT
		eventData.infoOverrideFunctionThread = GetEventDisplayData
	#endif

	TimedEvents_RegisterTimedEvent( eventData )
}

void function InitActiveObjectives()
{
	foreach( type in file.activeObjectiveTypes )
	{
		bool found = false
		foreach( typeInfo in file.registeredTypeInfos )
		{
			if ( type == typeInfo.type )
			{
				found = true
				typeInfo.initFunc()
				break
			}
		}

		Assert( found, "Could not find objective type: '" + type + "' in registeredTypeInfos, verify spelling (should be case insensitive), and that any newly created types properly registered" )
	}
}

#if SERVER
                                                                         
 
	                      
	                                         
		                                                                 

	                                                              

	                                               
	 
		                                                                    
		 
			                                                                 
			     
		 
	 
 
#endif

#if SERVER
                                                              
 
	                                                                                                                          

	                     
	                                               
		                                                                      

	                                                       
 
#endif

#if CLIENT
void function GetEventDisplayData( entity wp, TimedEventLocalClientData data )
{
	while( IsValid( wp ) )
	{
		data.eventName     = wp.GetWaypointString( FREEDM_WP_STRING_OBJECTIVE_DISPLAY_NAME )
		data.eventDesc     = wp.GetWaypointString( FREEDM_WP_STRING_OBJECTIVE_DISPLAY_DESC )
		data.colorOverride = wp.GetWaypointVector( FREEDM_WP_VECTOR_OBJECTIVE_COLOR )

		WaitFrame()
	}
}
#endif          

      