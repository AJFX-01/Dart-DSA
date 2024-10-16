using System;
using System.Collections.Generic;
using System.Linq;

public class Solution
{
    public static List<(int strength, decimal start, decimal end)> UnpaintRoadLines(decimal[] coordinates)
    {
        var events = new List<(decimal coord, int delta)>();
        for (int i = 0; i < coordinates.Length; i += 2)
        {
            events.Add((coordinates[i], 1));
            events.Add((coordinates[i + 1], -1));
        }
        events.Sort((a, b) => a.coord.CompareTo(b.coord));

        var result = new List<(int strength, decimal start, decimal end)>();
        var segments = new SortedDictionary<decimal, int>();
        int currentLayers = 0;
        decimal? start = null;

        foreach (var (coord, delta) in events)
        {
            if (start.HasValue && currentLayers > 0)
            {
                int strength = currentLayers >= 5 ? 5 : 1;
                if (result.Count > 0 && result[result.Count - 1].strength == strength && result[result.Count - 1].end == start.Value)
                {
                    result[result.Count - 1] = (strength, result[result.Count - 1].start, coord);
                }
                else
                {
                    result.Add((strength, start.Value, coord));
                }
            }

            currentLayers += delta;
            if (currentLayers == 0)
            {
                start = null;
            }
            else if (!start.HasValue)
            {
                start = coord;
            }
        }

        return result;
    }

        public static void Main(string[] args)
    {
        // Example inputs
        var testCases = new List<decimal[]>
        {
            new decimal[] { 3, 10, 14, 20, 1, 5 },
            new decimal[] { 1, 7, 1, 7, 1, 11, 1, 7, 1, 7 },
            new decimal[] { 1.5m, 3.7m, 2.1m, 4.2m, 3.5m, 6.8m, 1.2m, 2.8m, 5.1m, 7.3m }
        };

        foreach (var testCase in testCases)
        {
            Console.WriteLine("Input: " + string.Join(", ", testCase));
            var result = Solution.UnpaintRoadLines(testCase);
            Console.WriteLine("Output: " + FormatResult(result));
            Console.WriteLine();
        }
    }

    private static string FormatResult(List<(int strength, decimal start, decimal end)> result)
    {
        return string.Join(", ", result.Select(r => $"({r.strength}, {r.start}, {r.end})"));
    }
    //     public void TestUnpaintRoadLines()
    // {
    //     // Arrange
    //     var testCases = new List<(decimal[] input, List<(int strength, decimal start, decimal end)> expected)>
    //     {
    //         // Test case 1: Basic example from the problem description
    //         (
    //             new decimal[] { 3, 10, 14, 20, 1, 5 },
    //             new List<(int, decimal, decimal)> { (1, 1, 10), (1, 14, 20) }
    //         ),
            
    //         // Test case 2: Example with multiple layers
    //         (
    //             new decimal[] { 1, 7, 1, 7, 1, 11, 1, 7, 1, 7 },
    //             new List<(int, decimal, decimal)> { (5, 1, 7), (1, 7, 11) }
    //         ),
            
    //         // Test case 3: Decimal coordinates
    //         (
    //             new decimal[] { 1.5m, 3.7m, 2.1m, 4.2m, 3.5m, 6.8m, 1.2m, 2.8m, 5.1m, 7.3m },
    //             new List<(int, decimal, decimal)> { (1, 1.2m, 7.3m) }
    //         ),
            
    //         // Test case 4: No overlapping
    //         (
    //             new decimal[] { 1, 2, 3, 4, 5, 6 },
    //             new List<(int, decimal, decimal)> { (1, 1, 2), (1, 3, 4), (1, 5, 6) }
    //         ),
            
    //         // Test case 5: Complete overlap
    //         (
    //             new decimal[] { 1, 10, 1, 10, 1, 10, 1, 10, 1, 10 },
    //             new List<(int, decimal, decimal)> { (5, 1, 10) }
    //         )
    //     };

    //     // Act & Assert
    //     foreach (var (input, expected) in testCases)
    //     {
    //         var result = Solution.UnpaintRoadLines(input);
    //         Assert.Equal(expected, result);
    //     }
    // }
}