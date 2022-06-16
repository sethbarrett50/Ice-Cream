// xxxx  xxxx xxxxxxxxxx 
//  xx    x   x    x   x 
//  xx   x    x    x   x 
//  xx  x     x    x   x 
//  xx  x          x     
//  xx x           x     
//  xxx            x     
//  xxxx           x     
//  xx x           x     
//  xx  x          x     
//  xx  xx         x     
//  xx   x         x     
//  xx    x        x     
//  xx    xx       x     
// xxxx  xxxxx   xxxxx   
                      
                      
                      

object Main {
    @JvmStatic
    fun main(args: Array<String>) {
        println("Ice Cream Split Up Calculator")
        val `in` = Scanner(System.`in`)
        val peeps = ArrayList<Persons>()
        val numPpl: Int
        println("Please enter the number of people contributing:")
        numPpl = `in`.nextLine().toInt()
        for (i in 0 until numPpl) {
            println("Enter Person " + (i + 1) + "\'s name:")
            peeps.add(Persons(`in`.nextLine()))
            var pCash: Int
            println("How many dollars is " + peeps[i].GetName() + " contributing?")
            pCash = `in`.nextLine().toInt()
            peeps[i].SetCash(pCash)
        }
        val _gallonsG: Int
        println("How many gallons total are you getting?")
        _gallonsG = `in`.nextLine().toInt()
        println("Ice Cream Split Up:")
        for (i in 0 until numPpl) println(peeps[i].GetName() + " gets " + peeps[i].FindPortion(_gallonsG) + " gallons.")
        println("Press enter to end the program;")
        val end = `in`.nextLine()
    }
}

internal class Persons(private var name: String) {
    fun GetName(): String {
        return name
    }

    fun SetName(nameP: String) {
        name = nameP
    }

    private var cash = 0
    fun GetCash(): Int {
        return cash
    }

    fun SetCash(cashP: Int) {
        cash = cashP
        cashTotal += cashP
    }

    fun FindPortion(gallonG: Int): Float {
        return cash.toFloat() / cashTotal.toFloat() * gallonG.toFloat()
    }

    companion object {
        private var cashTotal = 0
    }
}