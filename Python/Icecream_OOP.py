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
class Peep:
    total_dollars = 0.0
    total_gals = 0.0

    def __init__(self):
        self._name = ""
        self._dols = 0.0

    def __str__(self) -> str:
        return f'{self.name} gets {self.gals} gallons'

    @property
    def name(self) -> str:
        return self._name
    
    @name.setter
    def name(self, name:str) -> None:
        self._name = name

    @property
    def dols(self) -> float:
        return self._dols
    
    @dols.setter
    def dols(self, dols:float) -> None:
        self._dols = dols
        Peep.total_dollars += dols

    @property
    def gals(self) -> float:
        return (self.dols / Peep.total_dollars) * Peep.total_gals if Peep.total_gals > 0 else 0

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
    peeps = []
    for i in range(0, numPeeps):
        newPeep = Peep()
        newPeep.name = userInputValidation(f"Please enter person {i + 1}'s name: ", str)
        newPeep.dols = userInputValidation(f"Please enter how many dollars {newPeep.name} is contributing: $", float)
        peeps.append(newPeep)
    
    Peep.total_gals = userInputValidation(f"Please enter the total number of gallons acquired: ", float)
    print('\n'.join(map(str, peeps)))

if __name__ == '__main__':
    main()