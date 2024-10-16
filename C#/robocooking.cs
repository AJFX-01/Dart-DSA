using System;
using System.Collections.Generic;

// To execute C#, please define "static void Main" on a class
// named Solution.

class Solution
{
    static void Main(string[] args)
    {
        // initialize the list of the logs
        List<string> ingridents = new List<string>{
            "bread", "bread", "bread", "ham", 
            "cheese", "ham", "ham", "cheese"
        };

        var storage = CalculateStorage(ingridents);

        Console.WriteLine($"Bread: {storage[0]}, Cheese: {storage[1]}, Ham: {storage[2]}");
        
    }

    public static int[] CalculateStorage(List<string> logs) {

        int breadCount = 0, cheeseCount = 0, hamCount = 0;
        int maxBread = 0, maxCheese = 0, maxHam = 0, burgerMade = 0;


        foreach (var log in logs) {
            switch(log) {
                case "bread": 
                    breadCount++;
                    maxBread = Math.Max(maxBread, breadCount);
                    break;
                case "cheese":
                    cheeseCount++;
                    // check ig we can make a burgerMade
                    if (breadCount > 0 && hamCount > 0) {
                        burgerMade++;
                        breadCount--;
                        hamCount--;
                        cheeseCount--;
                    }
                    maxCheese = Math.Max(maxCheese, cheeseCount);
                    break;
                case "ham":
                    hamCount++;
                    maxHam = Math.Max(maxHam, hamCount);
                    break;
            }
        }

        return new int[] { maxBread, maxCheese, maxHam };
    }
}
