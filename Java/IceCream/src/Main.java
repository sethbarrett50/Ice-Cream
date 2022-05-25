  // xxx    x      xxx  xxx     x     
   // x     x       x    x      x     
   // x    x x      x    x     x x    
   // x    x x       x  x      x x    
   // x   x   x      x  x     x   x   
   // x   xxxxx       x x     xxxxx   
   // x   x   x       x x     x   x   
// x  x  x     x       x     x     x  
 // xx  xxx   xxxx     x    xxx   xxxx

// Need to add error checking later for non-integer values
import java.util.ArrayList;
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        System.out.println("Ice Cream Split Up Calculator");
        Scanner in = new Scanner(System.in);
        ArrayList<Persons> peeps = new ArrayList<Persons>();
        int numPpl;
        System.out.println("Please enter the number of people contributing:");
        numPpl = Integer.parseInt(in.nextLine());
        for (int i = 0; i < numPpl; i++)
        {
            System.out.println("Enter Person " + (i + 1) + "\'s name:");
            peeps.add(new Persons(in.nextLine()));
            int pCash;
            System.out.println("How many dollars is " + peeps.get(i).GetName() + " contributing?");
            pCash = Integer.parseInt(in.nextLine());
            peeps.get(i).SetCash(pCash);
        }
        int _gallonsG;
        System.out.println("How many gallons total are you getting?");
        _gallonsG = Integer.parseInt(in.nextLine());
        System.out.println("Ice Cream Split Up:");
        for (int i = 0; i < numPpl; i++)
            System.out.println(peeps.get(i).GetName() + " gets " + peeps.get(i).FindPortion(_gallonsG) + " gallons.");
        System.out.println("Press enter to end the program;");
        String end = in.nextLine();
    }
}


class Persons
{
    private static int cashTotal = 0;
    private String name;
    public String GetName() {return name;}
    public void SetName(String nameP) {name = nameP;}
    private int cash;
    public int GetCash() { return cash;}
    public void SetCash(int cashP) { cash = cashP; cashTotal += cashP;}

    public Persons(String Name)
    {
        name = Name;
    }
    public float FindPortion(int gallonG)
    {
        return ((float)(cash) / (float)(cashTotal)) * (float)gallonG;
    }
}