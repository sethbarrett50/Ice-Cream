//                   x    x 
//      xxxxx  x     x    x 
//     xx    xxx    x    x  
//    x       xx    x    x  
//   xx       xx    x    x  
//  xx         x xxxxxxxxxxx
//  xx              x    x  
//  xx             x    x   
//  xx             x    x   
//  xx           xxxxxxxxxxx
//  xx             x    x   
//   xx        x   x    x   
//   xx       x   x    x    
//    xxx    x    x    x    
//      xxxxx     x    x    

using System;
using System.Collections.Generic;
using System.Text;
// First Ice Cream Project I Wrote
// Haven't worked on in 4 years
// I plan on adding more to this


namespace IceCream
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Persons> peeps = new List<Persons>();
            int _cashTotal = 0;
            int numPpl;
            do {
                Console.WriteLine("Please enter the number of people contributing:");
            }while(!int.TryParse(Console.ReadLine(), out numPpl) || numPpl <= 0 || numPpl > 100);
            Console.Clear();
            for (int i = 0; i < numPpl; i++)
            {
                Console.WriteLine($"Enter Person {i + 1}'s name:");
                peeps.Add(new Persons(Console.ReadLine()));
                int pCash;
                do {
                    Console.WriteLine($"How many dollars is {peeps[i].Name} contributing?");
                }while(!int.TryParse(Console.ReadLine(), out pCash) || pCash <= 0 || pCash > 100);
                peeps[i].Cash = pCash;
                _cashTotal += peeps[i].Cash;
                Console.Clear();
                ListPeeps(peeps, i);
            }
            int _gallonsG;
            do {
                Console.WriteLine("How many gallons total are you getting?");
            }while(!int.TryParse(Console.ReadLine(), out _gallonsG) || _gallonsG <= 0 || _gallonsG > 100);
            Console.Clear();
            Console.WriteLine("Ice Cream Split Up:");
            for (int i = 0; i < numPpl; i++) 
                Console.WriteLine($"{peeps[i].Name} gets {peeps[i].FindPortion(_gallonsG, _cashTotal)} gallons.");
            Console.WriteLine("Press enter to end the program;");
            string end = Console.ReadLine();

            void ListPeeps(List<Persons> peps, int j)
            {
                for (int i = 0; i < j + 1; i++)
                    Console.Write($"{peps[i].Name}:${peps[i].Cash}---");
                Console.WriteLine();
            }
        }
    }
}
