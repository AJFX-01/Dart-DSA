using System;
using System.Collections.Generic;

// To execute C#, please define "static void Main" on a class
// named Solution.

class Solution
{


    public static int MaxLoss(List<int> stock) {

        // ensure the empty is not mpty oe null
        if (stock == null ||stock.Count < 2) {
            return 0;
        }

        int maxPrice = stock[0];
        int maxLoss = 0;

        // transverse through thr list of stock and calulate the loss at each index while updating the max loss
        for (int index = 1; index < stock.Count; index++) {

            int currentPrice = stock[index];
            int potentialLoss = currentPrice - maxPrice;

            if (potentialLoss < maxLoss) {
                maxLoss = potentialLoss;
            }

            if (currentPrice > maxPrice) {
                maxPrice = currentPrice;
            }
        }

        return maxLoss;
    }
    static void Main(string[] args)
    {
        List<int> stockPrices1 = new List<int> { 3, 2, 4, 2, 1, 5 };
            Console.WriteLine($"Max Loss: {MaxLoss(stockPrices1)}"); // Expected Output: -3

            // Example 2: No loss
            List<int> stockPrices2 = new List<int> { 1, 2, 3, 4, 5 };
            Console.WriteLine($"Max Loss: {MaxLoss(stockPrices2)}"); // Expected Output: 0

            // Example 3: All prices the same
            List<int> stockPrices3 = new List<int> { 5, 5, 5, 5 };
            Console.WriteLine($"Max Loss: {MaxLoss(stockPrices3)}"); // Expected Output: 
    }
}
