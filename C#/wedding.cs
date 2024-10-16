using System;
using System.Collections.Generic;

// To execute C#, please define "static void Main" on a class
// named Solution.

class Solution
{
    public class WeddingHatAllocator
    {
        private Dictionary<int, HashSet<int>> graph;
        private List<(int weddingId, HashSet<string> attendees)> weddings;

        public WeddingHatAllocator()
        {
            graph = new Dictionary<int, HashSet<int>>();
            weddings = new List<(int, HashSet<string>)>();
        }

        // Add a wedding with its attendees
        public void AddWedding(int weddingId, HashSet<string> attendees)
        {
            weddings.Add((weddingId, attendees));
            // Create edges based on shared attendees
            for (int i = 0; i < weddings.Count - 1; i++)
            {
                var otherWedding = weddings[i];
                if (HasCommonAttendees(attendees, otherWedding.attendees))
                {
                    if (!graph.ContainsKey(weddingId))
                        graph[weddingId] = new HashSet<int>();
                    if (!graph.ContainsKey(otherWedding.weddingId))
                        graph[otherWedding.weddingId] = new HashSet<int>();

                    graph[weddingId].Add(otherWedding.weddingId);
                    graph[otherWedding.weddingId].Add(weddingId);
                }
            }
        }

        // Check if two sets have common attendees
        private bool HasCommonAttendees(HashSet<string> set1, HashSet<string> set2)
        {
            foreach (var attendee in set1)
            {
                if (set2.Contains(attendee))
                    return true;
            }
            return false;
        }

        // Assign hats based on the graph coloring algorithm
        public (Dictionary<int, int> hatAssignment, int totalHats) AssignHats()
        {
            var hatAssignment = new Dictionary<int, int>();
            int totalHats = 0;

            foreach (var weddingId in graph.Keys)
            {
                // Find used hats for adjacent weddings
                var usedHats = new HashSet<int>();
                if (graph.ContainsKey(weddingId))
                {
                    foreach (var neighbor in graph[weddingId])
                    {
                        if (hatAssignment.ContainsKey(neighbor))
                        {
                            usedHats.Add(hatAssignment[neighbor]);
                        }
                    }
                }

                // Assign the lowest numbered hat that is not used
                int currentHat = 1;
                while (usedHats.Contains(currentHat))
                {
                    currentHat++;
                }

                // Assign the hat to the wedding
                hatAssignment[weddingId] = currentHat;
                // Update the total hats used
                totalHats = Math.Max(totalHats, currentHat);
            }

            return (hatAssignment, totalHats);
        }
    }

    static void Main(string[] args)
    {
        var allocator = new WeddingHatAllocator();
        allocator.AddWedding(1, new HashSet<string> { "Alice", "Bob", "Charlie" });
        allocator.AddWedding(2, new HashSet<string> { "David", "Eve", "Alice" });
        allocator.AddWedding(3, new HashSet<string> { "Charlie", "Frank" });
        allocator.AddWedding(4, new HashSet<string> { "Bob", "David" });

        var (hatAssignment, totalHats) = allocator.AssignHats();

        Console.WriteLine("Hat Assignments:");
        foreach (var assignment in hatAssignment)
        {
            Console.WriteLine($"Wedding {assignment.Key}: Hat {assignment.Value}");
        }
        Console.WriteLine($"Total Hats Used: {totalHats}");
    }
}
