using System;
using System.Collections.Generic;

// To execute C#, please define "static void Main" on a class
// named Solution.

class Solution
{

    static void Main(string[] args)
    {

        // get the sum of the total pages 
        int totalPage = 5000;
        long expectedSum = (long)totalPage * (totalPage + 1) / 2;
        // tranverse through the page and compute the thier sum 

        List<int> pages = new List<int>();

        // subtract the sum from the remaining the total expected page
        for (var i = 1; i <= totalPage; i++)
        {
            pages.Add(i);
        }

        pages.Remove(1234); /// page ates up by the dog

        long actualSum = 0;
        foreach (int page in pages) {
            actualSum += page;
        }

        long missingPage = expectedSum - actualSum;

        Console.WriteLine($"The missing page is: {missingPage}");
    }
}