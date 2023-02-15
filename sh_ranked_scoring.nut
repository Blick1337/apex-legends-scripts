global function Sh_RankedScoring_Init

#if SERVER
                                                 
                                                                
                                                 
                                                   
                                                             
                                                         
                                       
                                                
                                      
                                     
                                 
                                                
                               
                                           
                                       
#endif

global function Ranked_GetPointsPerKillForPlacement
global function Ranked_GetPlacementMultipler
global function Ranked_GetPlacementKillScore
global function Ranked_GetKillsAndAssistsPointCap
global function Ranked_GetPointsForPlacement
global function Ranked_GetPointsForKillsPlacement

#if SERVER && DEV
                                              
                                                            
#endif                 

                 
global function GetKillPointsWithTierDiff
global function GetTierDifference
global function GetTierDifferenceByEntity
global const RANKED_MAX_KILL_SCORE_BY_SKILL = 175
global const float PARTICIPATION_MODIFIER = 0.5
global function Ranked_GetParticipationMutlipler

struct
{
	array<void functionref( entity attacker, entity victim )> onPlayerParticipationCallbacks
	array<void functionref(entity, entity, int) >  Callbacks_OnPlayerGameSummaryKillParticipation
	array< RankedPlacementScoreStruct > placementScoringData
} file


void function Sh_RankedScoring_Init()
{
	Ranked_InitPlacementScoring()
}

void function Ranked_InitPlacementScoring()
{
	var dataTable = GetDataTable( $"datatable/ranked_placement_scoring.rpak" )                 
	int numRows   = GetDataTableRowCount( dataTable )

	file.placementScoringData.clear()

	for ( int i = 0; i < numRows; ++i )
	{
		RankedPlacementScoreStruct placementScoringData
		placementScoringData.placementPosition            = GetDataTableInt( dataTable, i, GetDataTableColumnByName( dataTable, "placement" ) )
		placementScoringData.placementPoints              = GetDataTableInt( dataTable, i, GetDataTableColumnByName( dataTable, "placementPoints" ) )
		placementScoringData.pointsPerKill                = GetDataTableInt( dataTable, i, GetDataTableColumnByName( dataTable, "pointsPerKill" ) )
		placementScoringData.pointsPerAssist              = GetDataTableInt( dataTable, i, GetDataTableColumnByName( dataTable, "pointsPerAssist" ) )
		placementScoringData.sumOfKillsAndAssistsPointCap = GetDataTableInt( dataTable, i, GetDataTableColumnByName( dataTable, "sumOfKillsAndAssistsPointCap" ) )
		placementScoringData.placementKillBonus           = GetDataTableInt( dataTable, i, GetDataTableColumnByName( dataTable, "placementKillBonus" ) )
		placementScoringData.multiplier                   = GetDataTableFloat (dataTable, i, GetDataTableColumnByName( dataTable, "multiplier" ) )
		placementScoringData.killByPlacement              = GetDataTableInt (dataTable, i, GetDataTableColumnByName( dataTable, "killByPlacement" ) )
		file.placementScoringData.append( placementScoringData )
	}
}


#if SERVER
                                       
 
	                                                                        
	                                                                            
	                                                                                         
 
#endif


int function Ranked_GetPointsPerKillForPlacement( int placement )
{
	int lookupPlacement    = minint( file.placementScoringData.len() - 1, placement )
	int csvValue           = file.placementScoringData[ lookupPlacement ].placementKillBonus
	string playlistVarName = "rankedPointsPerKillForPlacement_" + lookupPlacement
	return GetCurrentPlaylistVarInt( playlistVarName, csvValue )
}


float function Ranked_GetPlacementMultipler( int placement )
{
	int lookupPlacement    = minint( file.placementScoringData.len() - 1, placement )
	float csvValue           = file.placementScoringData[ lookupPlacement ].multiplier
	string playlistVarName = "ranked_placementMultipler_" + lookupPlacement
	return GetCurrentPlaylistVarFloat( playlistVarName, csvValue )
}


int function Ranked_GetPlacementKillScore( int placement )
{
	int lookupPlacement    = minint( file.placementScoringData.len() - 1, placement )
	int csvValue           = file.placementScoringData[ lookupPlacement ].killByPlacement
	string playlistVarName = "ranked_placementKill_" + lookupPlacement
	return GetCurrentPlaylistVarInt( playlistVarName, csvValue )
}


int function Ranked_GetPointsForKillsBySkill(int victimTier, int killerTier)
{
	int tierDiff = GetTierDifference(victimTier, killerTier)
	return GetKillPointsWithTierDiff(tierDiff)
}


int function Ranked_GetPointsForKillsPlacement( int placement )
{
	int lookupPlacement    = minint( file.placementScoringData.len() - 1, placement )
	int killByPlacement           = file.placementScoringData[ lookupPlacement ].killByPlacement
	return  killByPlacement
}


float function Ranked_GetPointsForKillsBySkillAndPlacement(int placement, int victimTier, int killerTier)
{
	float killByPlacement           = float ( Ranked_GetPointsForKillsPlacement ( placement ) )
	int tierDiff = GetTierDifference(victimTier, killerTier)
	float killValuePercentage =  float (GetKillPointsWithTierDiff(tierDiff)) /10.0
	return  (killValuePercentage == 0 ) ? 0.0 : max ( 1.0, killByPlacement  * killValuePercentage )
}


int function GetTierDifference( int victimTierIndex, int killerTierIndex )
{
	return victimTierIndex - killerTierIndex
}


int function GetTierDifferenceByEntity( entity victim, entity killer)
{
	                                                                                                                
	SharedRankedTierData victimTierData = GetCurrentRankedDivisionFromScore( GetPlayerRankScore(victim) ).tier
	SharedRankedTierData killerTierData = GetCurrentRankedDivisionFromScore( GetPlayerRankScore(killer) ).tier
	int tierDiff = GetTierDifference(victimTierData.index, killerTierData.index)
	return GetKillPointsWithTierDiff(tierDiff)
}


int function GetKillPointsWithTierDiff(int tierDiff )
{
	tierDiff = minint (tierDiff, 3)

	if ( GetCurrentPlaylistVarBool( "ranked_kill_invalidation", true ))
	{
		tierDiff = maxint ( tierDiff, -4 )
	}
	else
	{
		tierDiff = maxint (tierDiff, -3)
	}

	switch (tierDiff)
	{
		case -4:
			return GetCurrentPlaylistVarInt ( "ranked_survival_kill_rp_tier_minus_4", RANKED_RP_TIER_MINUS_4)
			break
		case -3:
			return GetCurrentPlaylistVarInt ( "ranked_survival_kill_rp_tier_minus_3", RANKED_RP_TIER_MINUS_3)
			break
		case -2:
			return GetCurrentPlaylistVarInt ( "ranked_survival_kill_rp_tier_minus_2", RANKED_RP_TIER_MINUS_2)
			break
		case -1:
			return GetCurrentPlaylistVarInt ( "ranked_survival_kill_rp_tier_minus_1", RANKED_RP_TIER_MINUS_1)
			break
		case 0:
			return GetCurrentPlaylistVarInt ( "ranked_survival_kill_rp_tier_equal"  , RANKED_RP_TIER_EQUAL)
			break
		case 1:
			return GetCurrentPlaylistVarInt ( "ranked_survival_kill_rp_tier_plus_1" , RANKED_RP_TIER_PLUS_1)
			break
		case 2:
			return GetCurrentPlaylistVarInt ( "ranked_survival_kill_rp_tier_plus_2" , RANKED_RP_TIER_PLUS_2)
			break
		case 3:
			return GetCurrentPlaylistVarInt ( "ranked_survival_kill_rp_tier_plus_3" , RANKED_RP_TIER_PLUS_3)
			break
		default:
			          
			return GetCurrentPlaylistVarInt ( "ranked_survival_kill_rp_tier_equal"  , RANKED_RP_TIER_EQUAL)
			break
	}
	unreachable
}


bool function Ranked_IsKillValid( int points )
{
	return points >  0
}


float function Ranked_GetPointsForKills( int placement, array<int> killsByTiers, int currentRankTier)
{
	float totalPoints = 0.0
	totalPoints += Ranked_GetPointsForKillsBase ( placement,  killsByTiers, currentRankTier )
	return totalPoints
}


                                                                                            
float function Ranked_GetPointsForKillsBase( int placement, array<int> killsByTiers, int currentRankTier)
{
	float totalPoints = 0
	for (int i = 0; i < killsByTiers.len(); i++)
	{
		int numberOfKills = killsByTiers[i]
		                                                                                        
		float pointsPerKill = Ranked_GetPointsForKillsBySkillAndPlacement ( placement, i, currentRankTier )
		totalPoints += numberOfKills * pointsPerKill
	}
	return totalPoints
}


float function Ranked_GetPointsForAssists( int placement, array<int> AssistsByTiers, int currentRankTier )
{
	float totalPoints = 0.0
	totalPoints += Ranked_GetPointsForAssistsBase ( placement, AssistsByTiers, currentRankTier )
	return 	totalPoints
}


float function Ranked_GetPointsForAssistsBase( int placement, array<int> assistsByTiers, int currentRankTier )
{
	float totalPoints = 0
	for (int i = 0; i < assistsByTiers.len(); i++)
	{
		int numberOfKills = assistsByTiers[i]
		float pointsPerKill = Ranked_GetPointsForKillsBySkillAndPlacement ( placement, i, currentRankTier )
		totalPoints += numberOfKills * pointsPerKill
	}
	return 	totalPoints
}


float function Ranked_GetPointsForParticipation( int placement, array<int> participationByTiers, int currentRankTier )
{
	float totalPoints = 0.0
	totalPoints += Ranked_GetPointsForParticipationBase ( placement, participationByTiers, currentRankTier )
	return 	totalPoints
}


float function Ranked_GetPointsForParticipationBase( int placement, array<int> participationByTiers, int currentRankTier )
{
	float totalPoints = 0
	for (int i = 0; i < participationByTiers.len(); i++)
	{
		int numberOfKills = participationByTiers[i]
		float pointsPerKill =  Ranked_GetPointsForKillsBySkillAndPlacement ( placement, i, currentRankTier )  * Ranked_GetParticipationMutlipler()

		if (pointsPerKill > 0.0)
			pointsPerKill = max ( 1.0, pointsPerKill )

		totalPoints += numberOfKills * pointsPerKill
	}
	return 	totalPoints
}


float function Ranked_GetParticipationMutlipler( )
{
	return GetCurrentPlaylistVarFloat( "ranked_participation_mod", PARTICIPATION_MODIFIER )
}


int function Ranked_GetKillsAndAssistsPointCap( int placement )
{
	return GetCurrentPlaylistVarInt ( "ranked_kp_cap" , RANKED_MAX_KILL_SCORE_BY_SKILL )
}


int function Ranked_GetPointsForPlacement( int placement )
{
	int lookupPlacement    = minint( file.placementScoringData.len() - 1, placement )
	int csvValue           = file.placementScoringData[ lookupPlacement ].placementPoints
	string playlistVarName = "rankedPointsForPlacement_" + lookupPlacement

	return GetCurrentPlaylistVarInt( playlistVarName, csvValue )
}


int function Ranked_GetPenaltyPointsForAbandon( SharedRankedDivisionData currentRank , int rankedPoint = 0)
{
	SharedRankedTierData tierData = currentRank.tier
	int tierIndex                 = tierData.index
	string playlistVarString      = "ranked_abandon_cost_" + tierIndex
	return GetCurrentPlaylistVarInt( playlistVarString, Ranked_GetCostForEntry( currentRank , rankedPoint ) )
}

#if SERVER
                                                                                  
 

	       
		                                                                                                   
		                                                                           
		                                                              
		                                                                    
		                                                                        
		                                                              
		                                                                                                
		                                                                                            
		                                                                                                              
		                                                                
	      


	                                                                                     
	                                                                        
	                                                                              
	                                                                                  
	                                                                        
	                                                                                                          
	                                                                                                      
	                                                                                                                        
	                                                                          

	                                                  
	 
		                                              
		                                                                                                            
		                                                                                                  

	 

	                         
	 
		       
			                                          
		      
		                                                                                                              
		                                                                                                                                                     
	 
	    
	 
		       
			                                              
		      
		                                                                                                                                
	 

	                                                                             
	 
		       
			                                                           
		      
		                                                                                                                                  
	 

	                                                                                                                                   
 


                                                                  
 
	                                            
	                                                 
	                       
	                                                                                                                                                                            

	                                                                          
	                                                                                            

	                                                                                                                               
 


                                                                                                                                                                     
                                                                                                                        
 
	                                                                                                                                                                                                       

	                                                                                                        
	                                                                                                                                                                                       

	                                                                                           

	                              
	                                 

	                                                             
	                                                                      
	                                            
	                                             

	       
		          
		                                                      
	      

	                                               
 


                                                                                             
 
	                       
	 
		            
	 

	                                                                          
	                               
	                               
	                               
	                               
	                               
	                               
	                             
	                             
	                             

	       
		                                            
		 
			                                                         
			                                                                              
			                                    
			                                        
		 
	      

	                                                                     
	                                                                                                                                                                
	                                                                                                      
	                                               
	                                               

	       
		                                            
		 
			                                                        
			                                                                              
			                                    
			                                        
		 
	      

	            
 


                                                                                         
 
	                     
	 
		            
	 

	                                       

	                                      
	 
		                                                                
		                               
	 

	            
 


                                                                               
 
	                                                                                                                                                                
	                                                                                                                                                              

	                       
	                                                                                                      
	 
		                                                       
		                                                                                                       
		 
			                
			                                                                          
			                                                                   
			                                                
		 
		    
		 
			               
			                                                        
			                                                                       

			                                                                          
			                                                          

			                                                         
		 
	 

	            
 


                                                                                
 

	                                                                                                                                                                
	                                                                                                                                                              

	                                                                                          
	 
		                                                       
		                                                                                                              
		                                   
		 
			                                                     
		 

		                                                                                                            

		                                                           
		                                                              
	 

	            
 


                                                                      
 
	                                                     
 


                                                                                
 
	                                                                        
	 

		                          
			        

		                         
			        

		                                                               
			        

		                       
		 
			                                                                                                          
			                                                    
			                                                   
		 
	 
 


                                                                                                                  
 
	                                                                                                                                                              
	                                                          
 


                                                                                                                    
 
	                                                                                         
	                                                                          
 


                                                                               
 
	                                                               
	 
		                              
	 
 


                                                                                            
 
	                                          
		      

	                     
		      

	                                                                               
	 
		                                         
	 
 


                                                                        
 
	                                                                                         
	                                                                 

	                                                    
 


                                                             
 
	                                      
	 
		                                                   
	 
 


                                                                        
 
	                                                                                    
	 
		      
	 

	                                                                 

	                                                             
	                                                                                    
	                                                                                
	                                                                 

 


                                                                        
 

	                                                               
	                                                                                 

	                                                   
	                                      

	                                                    
	                                                        
	                                                                    

	       
		                                                                
		                                                                             
	      
	                                                                                                                                

	                                

	             
 


                                                                                                                                                                       
                                                                                                                                        
 
	       
		                                                 
		                                                                                             
	      

	                                                                                                                                                           
	                                      
	                                                          

	                    

	                                         
	                                             
	                                                 
	                                                              

	                                             
	                                                
	                                
	                                    
	                                                

	                         
	                                                                         
	                                                                              

	                                          
	                                                                                      

	                        
	                                                                                    
	                                                                                            
	                                                                                                       
	                                                                                                               

	                                                                                                     
	                                
	                                           
	 
		                                                                                             
		                                         
		 
			                                             
		 
	 

	                                             
	 
		                                                                                             
		                                           
		 
			                                            
		 
	 

	                                                   
	 
		                                                                                             
		                                                 
		 
			                                                                                  
		 
	 

	                          
	                                                       

	                       
	                                                     
	 
		                                    
		 
			                                                                                                                                                      
			                        

			       
				                                                                
			      
		 
	 

	                                                                  
	                                   

	                     
	                                                                               

	                                                                        
	                                                                                        
	                                            

	                        
	                                                

	                                                                                

	                                                  

	       
		                                                          
		                                                                     
		                                                      
		                                                 
	      

	             
 


                                                           
 
	                                 

	                                            
		          

	                                  
		                           

	                                                              
	                                                                                
 


                                                   
 
	                                
	             
	                                       
		                   

	            
 


                                                                                    
 
	       
		                                                                                                                                 
		                                                                                                                             
		                                                             
	      

	                                                       
	                                                                                                 

	                                                                           
	                                        
 


                                                                                      
 
	       
		                                                                                                                                
		                                                                                                                              
		                                                             
	      

	                                                       
	                                                                                                 

	                                                                           
	                                          
 


                                                                                                 
 
	                                   
	                       
		      

	       
		                                                                                                                                 
		                                                                                                                                      
		                                                             
	      

	                                                       
	                                                                                                 

	                                                                           
	                                                
 
#endif          