//      xxxxx  x                         
//     xx    xxx      x           x      
//    x       xx      x           x      
//   xx       xx      x           x      
//  xx         x      x           x      
//  xx                x           x      
//  xx           xxxxxxxxxxx xxxxxxxxxxx 
//  xx                x           x      
//  xx                x           x      
//  xx                x           x      
//   xx        x      x           x      
//   xx       x       x           x      
//    xxx    x                           
//      xxxxx                            
// Ice Cream Split Up Calculator
#include <iostream>
#include <string>
#include <iterator>
#include <list>

class peep {
    public:            
        std::string name;
        peep(std::string nameP, int cashP){
            name = nameP;
            cash = cashP;
            totalCash += cash;
        }
        float GetNumGal(float numGalsP) {
            return numGalsP * (cash / totalCash);
        }        
    private:
        static float totalCash;
        float cash;
};

float peep::totalCash = 0;


int main()
{
    std::string input;
    std::list<peep> peeps;
    
    int numPeeps;
    float numDollars;
    float numGals;
    
    std::cout << "Welcome to Ice Cream Split Up Calculator!" << std::endl << "Enter the number of people contributing: ";
    std::cin >> input;
    numPeeps = std::stoi(input);
    std::cout << "Enter the total number of dollars being contributed: " << "$";
    std::cin >> input;
    numDollars = std::stoi(input);
    std::cout << "Enter the total number of gallons aquired: ";
    std::cin >> input;
    numGals = std::stoi(input);
    for (int i = 0; i < numPeeps; i++)
    {
        std::string temp;
        std::string peepName;
        int peepCash; 
        float peepGals;
        std::cout << "Person " << i + 1 << " please enter your name: ";
        std::cin >> peepName;
        std::cout << peepName << ", please enter how much you are contributing: $";
        std::cin >> temp;
        peepCash = std::stoi(temp);
        peep person(peepName, peepCash);
        peeps.push_front(person);
    }
    std::cout << "Split of Ice Cream:" << std::endl;
    std::list<peep>::iterator it;
    for (it = peeps.begin(); it != peeps.end(); it++)
    {
        std::string name = it->name;
        float gals = it->GetNumGal(numGals);
        std::cout << name << " :: " << gals << std::endl;
    }

    return 0;
}
