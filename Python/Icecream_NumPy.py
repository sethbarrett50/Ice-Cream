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
import numpy as np

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

    peeps = np.zeros((2, numPeeps + 1)) # First array inside is $, second is gallons
    peepNames = np.empty(numPeeps + 1, dtype='<U20')
    peepNames[0] = "Total"  # First column in both arrays is reserved for totals

    for i in range(1, numPeeps + 1):
        peepNames[i] = userInputValidation(f'Hello person {i}, enter your name: ', str)
        peeps[0, i]= userInputValidation(
            f'Enter how much are you contributing, {peepNames[i]}: $',
            float
        )
    peeps[0, 0] = np.sum(peeps[0, 1:])

    peeps[1, 0] = userInputValidation("Enter the number of gallons total are you getting: ", float)

    peeps[1, 1:] = (peeps[0, 1:] / peeps[0, 0]) * peeps[1, 0] if peeps[1,0] > 0 else 0

    for name, gals in zip(peepNames[1:], peepNames[1, 1:]):
        print( f"{name} gets {gals} gallons" )

if __name__ == "__main__":
    main()