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
from collections import namedtuple

def userInputValidation(quest:str, convType=int):
    while True:
        try: 
            return convType(input(quest))
        except ValueError:
            print(f"Please enter a {convType} input!")

def main():
    numPeeps = userInputValidation(
        "Welcome to Ice Cream Split Up Calculator!\nEnter the number of people are contributing: "
    )
    Peep = namedtuple("Peep", ["name", "dollars", "gals"])
    
    totalGals = userInputValidation("Enter the number of gallons total are you getting: ", float)

    def createPeep(i:int) -> Peep:
        return Peep(
            name=userInputValidation(f'Hello person {i}, enter your name: ', str), 
            dollars=userInputValidation(
                f'Enter how much are you contributing: $', float
            ),
            gals=0
        )
    individuals = tuple(map(createPeep, range(1, numPeeps + 1)))

    totalDollars = sum(p.dollars for p in individuals)
    
    totalPeep = Peep(name="Total", dollars=totalDollars, gals=totalGals)

    determineGals = lambda peepDollar, totalDollar, totalGals: (peepDollar / totalDollar) * totalGals

    updatedIndividuals = tuple(
        p._replace(gals=determineGals(p.dollars, totalDollars, totalGals))
        for p in individuals
    )
    
    peeps = (totalPeep,) + updatedIndividuals
    
    for p in peeps:
        print(f'{p.name} gets {p.gals:.2f}')

if __name__ == '__main__':
    main()