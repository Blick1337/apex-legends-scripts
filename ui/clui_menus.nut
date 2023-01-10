global function GetCharacterButtonRows
                   
                                            
                                    
      
global function GetCharacterButtonRowSizes
global function LayoutCharacterButtons
global function SetNavUpDown
global function SetNav
#if UI
global function LocalizeAndShortenNumber_Int
global function LocalizeAndShortenNumber_Float
#endif
global function IsTenThousandOrMore


struct RowData
{
	int xPos
	int yPos
	bool hasLeadingSpace
}

array< array<var> > function GetButtonRows( array<int> rowSizes, array<var> buttons )
{
	array< array<var> > buttonRows

	int buttonIndex = 0
	foreach ( rowSize in rowSizes )
	{
		array<var> row
		int last = buttonIndex + rowSize

		while ( buttonIndex < last )
		{
			row.append( buttons[buttonIndex] )
			buttonIndex++
		}

		buttonRows.append( row )
	}

	return buttonRows
}


array< array<var> > function GetCharacterButtonRows( array<var> buttons )
{
	array<int> rowSizes = GetCharacterButtonRowSizes( buttons.len() )

	return GetButtonRows(rowSizes, buttons)
}

                   
                                                                                                                   
 
                                                               

                                        
 


                                                                              
 
                      
                         
                    
                      
                      

                                          
  
                                                       

                         
   
                  
   
                              
   
                     
   
                              
   
                
   
                              
   
                  
   
                              
   
                  
   
  

                    
                       
                                
                          
                                   
                     
                              
                       
                                
                       
                                

                
 
      


array<int> function GetCharacterButtonRowSizes( int numButtons )
{
	Assert( numButtons > 0 )

	int numRows = 1
	if ( numButtons > 18 )
		numRows = 4
	else if ( numButtons > 10 )
		numRows = 3
	else if ( numButtons > 5 )
		numRows = 2

#if NX_PROG || PC_PROG_NX_UI
	if( IsNxHandheldMode() && numButtons > 18 )
	{
		numRows = 3
	}
#endif
	int fullRowSize  = int( ceil( numButtons / float( numRows ) ) )
	int shortRowSize = fullRowSize - 1
	int remainingSlots = numButtons
	int numShortRows = 0

	while ( remainingSlots % fullRowSize > 0 )
	{
		numShortRows++
		remainingSlots -= shortRowSize
	}

	Assert( remainingSlots % fullRowSize == 0 )
	int numFullRows = remainingSlots / fullRowSize

	                            
	                                     
	                               
	                                       
	                                         
	                                       
	                                         

	array<int> rowSizes
	bool prepend = false

	for ( int i = 0; i < numFullRows; i++ )
		rowSizes.append( fullRowSize )

	for ( int i = 0; i < numShortRows; i++ )
	{
		if ( i > 0 )
			prepend = !prepend

		if ( prepend )
			rowSizes.insert( 0, shortRowSize )
		else
			rowSizes.append( shortRowSize )
	}

	                                  
	  	                          

	return rowSizes
}


                                       
void function LayoutCharacterButtons( array< array<var> > buttonRows )
{
	Assert( buttonRows.len() > 0 && buttonRows[0].len() > 0 )
	int buttonWidth        = Hud_GetWidth( buttonRows[0][0] )
	int buttonHeight       = Hud_GetHeight( buttonRows[0][0] )
	                                                          
	                                       

	                                                                                          
	                                                                                         
	                                       
	                                   

	int spaceShift         = int( buttonWidth * 0.6237113402061856 )
	int rowShift
                   
                       
     
	rowShift           = int( buttonWidth * 0.2061855670103093 )
      

	                                     
	                                 

	array<RowData> rowData
	foreach ( row in buttonRows )
	{
		RowData data
		rowData.append( data )
	}

	foreach ( rIndex, row in buttonRows )
	{
		foreach ( bIndex, button in row )
		{
			                                                  
			if ( bIndex == 0 )
			{
				                                                                           
				rowData[rIndex].yPos = buttonHeight * -1 * rIndex
			}
			else
			{
				Hud_SetPinSibling( button, Hud_GetHudName( row[bIndex - 1] ) )
				Hud_SetX( button, (spaceShift * -1) )
				Hud_SetY( button, 0 )
			}
		}
	}

	array<int> rowSizes
	foreach ( row in buttonRows )
		rowSizes.append( row.len() )

	int baseRowIndex = int( floor( (rowSizes.len() - 1) / 2.0 ) )
	array<var> baseRow = buttonRows[baseRowIndex]

	                                                                                             
	int baseRowScreenWidth = buttonWidth + ((baseRow.len() - 1) * spaceShift)
	int baseRowXPos = baseRowScreenWidth / 2

	foreach ( rIndex, row in buttonRows )
	{
		bool hasLeadingSpace = rIndex > baseRowIndex && row.len() < baseRow.len()

		rowData[rIndex].hasLeadingSpace = hasLeadingSpace
		rowData[rIndex].xPos = baseRowXPos + (rowShift * (rIndex - baseRowIndex)) + (hasLeadingSpace ? (spaceShift * -1) : 0 )

		foreach ( bIndex, button in row )
		{
			if ( bIndex == 0 )
			{
				Hud_SetPinSibling( button, "Anchor" )
				Hud_SetX( button, rowData[rIndex].xPos )
				Hud_SetY( button, rowData[rIndex].yPos )
			}
		}
	}

	foreach ( row in buttonRows )
		SetNav( row )

                   
                         
     
	array< array<var> > buttonColumns
	int numColumns = baseRow.len()

	                                                                        
	for ( int cIndex = 0; cIndex < numColumns; cIndex++ )
	{
		array<var> column
		foreach ( rIndex, row in buttonRows )
		{
			int desiredIndex = rowData[rIndex].hasLeadingSpace ? cIndex - 1 : cIndex
			if ( desiredIndex >= 0 && desiredIndex < row.len())
				column.append( row[desiredIndex] )
		}

		buttonColumns.append( column )
	}

	foreach ( column in buttonColumns )
		SetNav( column )
      

}


void function SetNavUpDown( array< array<var> > buttons )
{
	Assert( buttons.len() > 0 )

	foreach (rIndex, array<var> row in buttons )
	{
		bool isFirstRow = ( rIndex == 0 )
		bool isLastRow =  ( rIndex == buttons.len() - 1 )

		foreach (cIndex, var character in row )
		{
			array<var> previousRow = buttons[ isFirstRow ? (buttons.len() - 1) : (rIndex - 1) ]
			int previousCharacter = int(clamp(cIndex, 0, (previousRow.len()-1)))
			Hud_SetNavUp( character, previousRow[previousCharacter] )

			array<var> nextRow = buttons[ isLastRow ? 0 : (rIndex + 1) ]
			int nextCharacter = int(clamp(cIndex, 0, (nextRow.len()-1)))
			Hud_SetNavDown( character, nextRow[nextCharacter] )
		}
	}

}


void function SetNav( array<var> buttons )
{
	Assert( buttons.len() > 0 )

	var first = buttons[0]
	var last  = buttons[buttons.len() - 1]
	var prev
	var next
	var button

	for ( int i = 0; i < buttons.len(); i++ )
	{
		button = buttons[i]

		if ( button == first )
			prev = last
		else
			prev = buttons[i - 1]

		if ( button == last )
			next = first
		else
			next = buttons[i + 1]

		Hud_SetNavLeft( button, prev )
		Hud_SetNavRight( button, next )

		                                                                                    
		                                                                                      
	}
}



#if UI
const array<string> LANGUAGES_WITHOUT_TRAILING_ZEROS_WHEN_TRUNCATED = [
	"german",
	"italian",
	"korean",
	"spanish",
	"schinese",
	"tchinese",
	"japanese",
]

string function LocalizeAndShortenNumber_Int( int number, int maxDisplayIntegral = 3, int maxDisplayDecimal = 0 )
{
	return LocalizeAndShortenNumber_Float( float(number), maxDisplayIntegral, maxDisplayDecimal )
}

                                                                                                                            
                                                                                      
string function LocalizeAndShortenNumber_Float( float number, int maxDisplayIntegral = 3, int maxDisplayDecimal = 0 )
{
	printf( "ShortenNumberDebug: Shortening %f with max Integrals of %i and max decimals of %i\n", number, maxDisplayIntegral, maxDisplayDecimal )

	if ( number == 0.0 )
		return "0"

	bool hideTrailingZeros		= true                                                                            
	string thousandsSeparator   = Localize( "#THOUSANDS_SEPARATOR" )
	string decimalSeparator     = Localize( "#DECIMAL_SEPARATOR" )
	string integralString       = ""
	string integralSuffixLocKey = ""

	float integral = floor( number )
	int digits = int( integral ) > 0 ? int( floor( log10( integral ) + 1 ) ) : 0

	if ( digits > maxDisplayIntegral )
	{
		printf( "ShortenNumberDebug: Number too large for display (%i digits). Shortening to 3 digits\n", digits )
		float displayIntegral = integral / pow( 10, (digits - 3) )
		displayIntegral = floor( displayIntegral )
		integralString = format( "%0.0f", displayIntegral )

		printf( "ShortenNumberDebug: Number shortened to %s", integralString )

		if ( digits/16 >= 1 )
			integralSuffixLocKey = "#STATS_VALUE_QUADRILLIONS"
		else if ( digits/13 >= 1 )
			integralSuffixLocKey = "#STATS_VALUE_TRILLIONS"
		else if ( digits/10 >= 1 )
			integralSuffixLocKey = "#STATS_VALUE_BILLIONS"
		else if ( digits/7 >= 1 )
			integralSuffixLocKey = "#STATS_VALUE_MILLIONS"
		else if ( digits/4 >= 1 )
			integralSuffixLocKey = "#STATS_VALUE_THOUSANDS"
	}
	else
	{
		integralString = format( "%0.0f", integral )
	}

	if ( integralString.len() > 3 )
	{
		string separatedIntegralString = ""
		int integralsAdded = 0

		printf( "ShortenNumberDebug: Adding integral separators to %s\n", integralString )

		for ( int i = integralString.len(); i > 0; i-- )
		{
			string num = integralString.slice( i-1, i )
			if ( (separatedIntegralString.len() - integralsAdded) % 3 == 0 && separatedIntegralString.len() > 0 )
			{
				integralsAdded++
				separatedIntegralString = num + thousandsSeparator + separatedIntegralString
			}
			else
			{
				separatedIntegralString = num + separatedIntegralString
			}

			printf( "ShortenNumberDebug: Separated Integral Progress: %s\n", separatedIntegralString )
		}

		printf( "ShortenNumberDebug: Separated Integral String Complete: %s\n", separatedIntegralString )
		integralString = separatedIntegralString
	}

	string decimalString = ""
	if ( integralString.len() <= 3 && integralString != "0" && digits > 3 )
	{
		printf( "ShortenNumberDebug: Four or larger digit number shrunk to 3 or fewer digits! Making the number a decimal and adding a suffix (value = %s, digits = %i, maxDisplayIntegral = %i)\n", integralString, digits, maxDisplayIntegral )

		int separatorPos
		if ( maxDisplayIntegral == 3 )
			separatorPos = (digits - maxDisplayIntegral) % 3
		else
			separatorPos = ((digits - maxDisplayIntegral) % 3) + 1

		if( separatorPos != 0 && separatorPos != 3 )
		{
			decimalString = integralString.slice( separatorPos, integralString.len() )
			integralString = integralString.slice( 0, separatorPos )

			maxDisplayDecimal = 3 - integralString.len()
		}
	}

	bool roundUp = false
	if( decimalString == "" )
	{
		float decimal = number % 1                                                                         
		decimalString = string( decimal )
		printf( "ShortenNumberDebug: decimalString = %s\n", decimalString )
		if ( decimalString.find( "0." ) != -1 )
			decimalString = decimalString.slice( 2 )
	}

	if ( decimalString.len() > maxDisplayDecimal )
	{
		int lastDigit = int( decimalString.slice( maxDisplayDecimal, maxDisplayDecimal + 1 ) )
		decimalString = decimalString.slice( 0, maxDisplayDecimal )
		if ( lastDigit >= 5 )
			roundUp = true
	}

	if( hideTrailingZeros )
	{
		int leadingZeros = decimalString.len() - string( int( decimalString ) ).len()
		int decimalNumber = int(decimalString)

		if ( roundUp )
		{
			if ( decimalString.len() == 0 )
			{
				integralString = string( int( integralString ) + 1 )                                                                                      
			}
			else
			{
				decimalNumber = decimalNumber + 1
				if ( decimalNumber % int( pow( 10, maxDisplayDecimal ) ) == 0 )
				{
					integralString = string( int( integralString ) + 1 )                                                                                          
					decimalNumber  = 0
				}
			}
		}

		while( decimalNumber % 10 == 0 && decimalNumber > 0 )
		{
			decimalNumber = decimalNumber / 10
		}

		if( decimalNumber > 0 )
		{
			decimalString = string( decimalNumber )
			while ( leadingZeros != 0 && decimalString.len() <= maxDisplayDecimal )
			{
				decimalString = "0" + decimalString
				leadingZeros--
			}
		}
		else
		{
			decimalString = ""
		}
	}

	string finalDisplayNumber = integralString

	if ( maxDisplayDecimal > 0 && decimalString != "" )
	{
		printf( "ShortenNumberDebug: Attaching decimal value %s to final display %s (original number = %f)\n", decimalString, finalDisplayNumber, number )
		finalDisplayNumber += decimalSeparator + decimalString
	}

	if ( integralSuffixLocKey != "" )
		finalDisplayNumber = Localize( integralSuffixLocKey, finalDisplayNumber )

	return finalDisplayNumber
}
#endif

bool function IsTenThousandOrMore( var value )
{
	return value >= 10000
}