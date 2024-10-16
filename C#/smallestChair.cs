using System;
using System.Collections.Generic;

public class Solution {
    public int SmallestChair(int[][] times, int targetFriend) {
        int n = times.Length;
        var A = new List<int[]>();  // List to store (arrival, leaving, index)
        
        // Step 1: Create the info array A
        for (int i = 0; i < n; i++) {
            A.Add(new int[] { times[i][0], times[i][1], i });
        }
        
        // Step 2: Sort A by arrival times
        A.Sort((a, b) => a[0].CompareTo(b[0]));

        // Step 3: Free chairs heap (min-heap), initialized with chairs 0 to n-1
        List<int> freeChairs = new List<int>();
        for (int i = 0; i < n; i++) {
            freeChairs.Add(i);
        }
        freeChairs.Sort();  // Sorting in ascending order for the min-heap behavior
        
        // Priority queue to store the leaving times and corresponding chairs
        var usedChairs = new SortedSet<(int leavingTime, int chair)>();
        
        // Step 4: Process each friend
        foreach (var t in A) {
            int arrival = t[0], leaving = t[1], index = t[2];
            int chair;
            
            // Step 5: Release the chairs by friends who have already left before the current arrival
            while (usedChairs.Count > 0 && usedChairs.Min.leavingTime <= arrival) {
                chair = usedChairs.Min.chair;
                usedChairs.Remove(usedChairs.Min);
                freeChairs.Add(chair);  // Free the chair
                freeChairs.Sort();  // Keep it sorted as a min-heap
            }

            // Step 6: Assign the smallest free chair
            chair = freeChairs[0];
            freeChairs.RemoveAt(0);  // Remove the assigned chair
            
            // Step 7: If this is the target friend, return their chair
            if (index == targetFriend) {
                return chair;
            }

            // Step 8: Add this friend's leaving time and chair to the usedChairs heap
            usedChairs.Add((leaving, chair));
        }

        return -1;  // In case no valid chair is found (which shouldn't happen)
    }
}
