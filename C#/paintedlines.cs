using System;
using System.Collections.Generic;
using System.Linq;

class Solution
{
    public static void Main(string[] args)
    {
        // Example usage
        double[] coords = { 3, 10, 14, 20, 1, 5 };
        var result = AnalyzePaintLogs(coords);
        
        Console.WriteLine($"Result: {FormatResult(result)}");
    }

    public static List<int> AnalyzePaintLogs(double[] coords)
    {
        // Find the maximum coordinate to size the layers array
        double maxCoord = GetMax(coords);
        int size = (int)Math.Ceiling(maxCoord) + 1; // To ensure we cover up to maxCoord
        int[] layers = new int[size];

        // Naive painting algorithm to count layers
        for (int coord_i = 0; coord_i < coords.Length; coord_i += 2)
        {
            double start = coords[coord_i];
            double end = coords[coord_i + 1];
            for (int paint_idx = (int)start; paint_idx < (int)end; paint_idx++)
            {
                layers[paint_idx]++;
            }
        }

        // Prepare the result list
        List<int> result = new List<int>();
        bool previousPainted = false;
        int? intervalStart = null;

        for (int i = 0; i < layers.Length; i++)
        {
            if (layers[i] > 0 && !previousPainted)
            {
                // Found new interval start
                intervalStart = i;
            }

            if (layers[i] == 0 && previousPainted && intervalStart.HasValue)
            {
                // Found current interval end
                int strength = layers[intervalStart.Value] < 5 ? 1 : 5; // Light or strong solvent
                result.Add(strength);
                result.Add(intervalStart.Value);
                result.Add(i); // End of interval
                intervalStart = null; // Reset for next interval
            }

            // Remember previous cell state
            previousPainted = layers[i] > 0;
        }

        // Handle case where the last interval does not end at the maximum coordinate
        if (previousPainted && intervalStart.HasValue)
        {
            int strength = layers[intervalStart.Value] < 5 ? 1 : 5; // Light or strong solvent
            result.Add(strength);
            result.Add(intervalStart.Value);
            result.Add(size); // Ending at the maximum coordinate
        }

        return result; // Return the result as a list of integers
    }

    private static double GetMax(double[] coords)
    {
        double max = 0;
        foreach (double coord in coords)
        {
            if (coord > max)
            {
                max = coord;
            }
        }
        return max;
    }

    private static string FormatResult(List<int> result)
    {
        return string.Join(", ", result);
    }
}
