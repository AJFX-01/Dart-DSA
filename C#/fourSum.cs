using System; 
using System.Collections.Generic; 
using System.Diagnostics; 

public class Program 
{ 
    public static int[] FindQuadrupletSum(int[] numbers, int target) 
    { 
        foreach (var a in numbers) 
        { 
            foreach (var b in numbers) 
            { 
                foreach (var c in numbers) 
                { 
                    foreach (var d in numbers) 
                    { 
                        if (a + b + c + d == target) 
                        { 
                            return new int[] { a, b, c, d }; 
                        } 
                    } 
                } 
            } 
        } 
        return null; // This should never happen according to the problem statement 
    } 

    public static int[] FindQuadrupletSumFast(int[] numbers, int target)
    {
        Array.Sort(numbers);
        int n = numbers.Length;
        HashSet<string> seen = new HashSet<string>();

        for (int i = 0; i < n - 3; i++)
        {
            for (int j = i + 1; j < n - 2; j++)
            {
                int left = j + 1;
                int right = n - 1;

                while (left < right)
                {
                    int currentSum = numbers[i] + numbers[j] + numbers[left] + numbers[right];

                    if (currentSum == target)
                    {
                        string quadKey = $"{numbers[i]},{numbers[j]},{numbers[left]},{numbers[right]}";
                        if (!seen.Contains(quadKey))
                        {
                            seen.Add(quadKey);
                            return new int[] { numbers[i], numbers[j], numbers[left], numbers[right] };
                        }
                        left++;
                        right--;
                    }
                    else if (currentSum < target)
                    {
                        left++;
                    }
                    else
                    {
                        right--;
                    }
                }
            }
        }

        // This line should never be reached as the problem states there's always a valid quadruplet
        throw new InvalidOperationException("No valid quadruplet found");
    }
    
    public static void RunTestCase(int[] numbers, int target, string testCaseName) 
    { 
        Console.Write(testCaseName.PadRight(25) + "- "); 
        var stopwatch = Stopwatch.StartNew(); 
        var result = FindQuadrupletSumFast(numbers, target); 
        stopwatch.Stop(); 

        if (result == null || result.GetType() != typeof(int[])) 
        { 
            Console.WriteLine($"FAILED: the function returned {result} of type {result?.GetType()}, not an array."); 
            Environment.Exit(1); 
        } 

        if (result.Length != 4) 
        { 
            Console.WriteLine($"FAILED: the result has {result.Length} elements, not 4"); 
            Environment.Exit(1); 
        } 

        if (Sum(result) != target) 
        { 
            Console.WriteLine($"FAILED: the sum of [{string.Join(", ", result)}] is {Sum(result)}, not {target}"); 
            Environment.Exit(1); 
        } 

        if (Array.Exists(result, r => Array.IndexOf(numbers, r) == -1)) 
        { 
            Console.WriteLine("FAILED: one of the numbers is not in the list"); 
            Environment.Exit(1); 
        } 

        Console.WriteLine("PASSED"); 
    } 

    private static int Sum(int[] array) 
    { 
        int sum = 0; 
        foreach (var num in array) 
        { 
            sum += num; 
        } 
        return sum; 
    } 

    public static void Main() 
    { 
        RunTestCase(new int[] { 5, 4, 3, 2, 1, 0 }, 11, "Small testcase"); 
        RunTestCase(new int[] { 54, 3, 42, 16, 4, 24 }, 90, "Solution with duplicates"); 
        RunTestCase(new int[] { 89, -62, -92, -37, 28, 29 }, -7, "With negative numbers"); 
        RunTestCase(new int[] { 39, -57, -53, -79, 83, -6, 27, -97 }, 0, "Target is zero"); 

        var random = new Random(); 
        for (int i = 1; i <= 5; i++) 
        { 
            var numbers = new int[1000]; 
            for (int j = 0; j < 1000; j++) 
            { 
                numbers[j] = random.Next(-100_000_000, 100_000_000); 
            } 
            int target = numbers[^1] + numbers[^2] + numbers[^3] + numbers[^4]; 
            Array.Sort(numbers, (a, b) => random.Next(-1, 2)); // Shuffle the list 
            RunTestCase(numbers, target, $"Large test #{i}"); 
        } 

        Console.WriteLine("Congratulations. You passed all testcases!"); 
    } 
}