#                             xx                            
# xxxxxxxxx                  xxx                            
#   xx    xx             x    xx                            
#   xx     xx           xx    xx                            
#   xx     xx           xx    xx                            
#   xx     xx xxxx  xxxxxxxx  xx  xxx      xxx     xx  xxx  
#   xx     xx xxx    x  xx    xxxx  xx   xx  xxx  xxxxx  xx 
#   xx    xx   xx    x  xx    xx    xx   x    xx   xx    xx 
#   xxxxxxx     xx  x   xx    xx    xx  xx     xx  xx    xx 
#   xx          xx  x   xx    xx    xx  xx     xx  xx    xx 
#   xx          xx  x   xx    xx    xx  xx     xx  xx    xx 
#   xx           xxx    xx    xx    xx  xx     xx  xx    xx 
#   xx           xxx    xx    xx    xx   xx    x   xx    xx 
#   xx            xx    xx  x xx    xx   xx   xx   xx    xx 
# xxxxxx          x      xxx xxxx  xxxx   xxxx    xxxx  xxxx
#                 x                                         
#                x                                          
#             xxxx                                          
#             xxx                                           
# Ice Cream Split Up Calculator
def IceCreamSplitUp():
    print( "Welcome to Ice Cream Split Up Calculator! How many people are contributing?" )
    numPeeps = int( input( ) )

    # First list inside is names, second is $, third is gallons
    peeps = [ [ "Total" ] ,[ 0 ] , [ 0 ] ]

    # Peeps input
    i = 1
    while i <= numPeeps:
        peeps[ 0 ].append( input( f'Hello person { i }, what is your name?\n' ) )
        peeps[ 1 ].append( int( input( f'How much are you contributing, { peeps[ 0 ][ i ] }?\n' ) ) )
        peeps[ 1 ][ 0 ] += peeps[ 1 ][ i ]
        i += 1

    # Gallon total input
    print( "How many gallons total are you getting?" )
    peeps[ 2 ][ 0 ] = int( input( ) )

    # Gallon/peep output
    i = 1
    while i <= numPeeps:
        peeps[ 2 ].append( ( peeps[ 1 ][ i ] / peeps[ 1 ][ 0 ] ) * peeps[ 2 ][ 0 ] )
        print( f"{ peeps[ 0 ][ i ] } gets { peeps[ 2 ][ i ] } gallons\n" )
        i += 1

def main():
    IceCreamSplitUp()


if __name__ == '__main__':
    main()