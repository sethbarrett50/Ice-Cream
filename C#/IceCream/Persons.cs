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

namespace IceCream
{
    class Persons
    {
        private static int count = 0;
        private string name;
        public string Name { get => name; set => name = value; }
        private int cash;
        public int Cash 
        { 
            get => cash; 
            set => cash = (value > 9999 || value <= 0) ? value : throw new ArgumentException("Cash must be between $1 and $9999"); 
        }
        public Persons(string name = "Person")
        {
            Name = name;
            count++;
        }
        public decimal FindPortion(int gallonG, int cashT)
        {
            return ((decimal)(cash) / (decimal)(cashT)) * (decimal)gallonG;
        }
    }
}
