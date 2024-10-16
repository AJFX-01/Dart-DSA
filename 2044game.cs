using System;
using System.Text;
using System.Linq;
using System.Collections.Generic;

public enum Direction
{
    UP,
    DOWN,
    LEFT,
    RIGHT
}

public class The2048Bonacci
{
    private int[][] game_area;
    private int width;
    private int height;
    private static List<int> fibonacciNumbers;

    public The2048Bonacci(int[][] game_area)
    {
        this.game_area = game_area;
        this.width = game_area[0].Length;
        this.height = game_area.Length;

        // Generate the Fibonacci sequence up to a reasonable limit (e.g., 2048)
        fibonacciNumbers = GenerateFibonacciUpTo(2048);
    }

    public int GetTile(int x, int y)
    {
        return game_area[y][x];
    }

    public void SetTile(int x, int y, int fib_value)
    {
        game_area[y][x] = fib_value;
    }

    public string GetDescription()
    {
        StringBuilder str_lines = new StringBuilder();
        for (int i = 0; i < game_area.Length; i++)
        {
            for (int j = 0; j < game_area[i].Length; j++)
            {
                str_lines.Append(game_area[i][j].ToString("D2")).Append(" ");
            }
            str_lines.AppendLine();
        }
        return str_lines.ToString();
    }

    // Generate Fibonacci sequence up to a limit
    private static List<int> GenerateFibonacciUpTo(int limit)
    {
        List<int> fib = new List<int> { 1, 1 };
        while (fib.Last() < limit)
        {
            fib.Add(fib[fib.Count - 1] + fib[fib.Count - 2]);
        }
        return fib;
    }

    // Find index of a number in the Fibonacci sequence
    private static int FindFibIndex(int num)
    {
        return fibonacciNumbers.IndexOf(num);
    }

    // Check if two numbers can merge (they must be identical or consecutive Fibonacci numbers)
    private static bool CanMerge(int a, int b)
    {
        if (a == b && FindFibIndex(a) >= 0)
            return true;

        int indexA = FindFibIndex(a);
        int indexB = FindFibIndex(b);

        return indexA >= 0 && indexB >= 0 && Math.Abs(indexA - indexB) == 1;
    }

    // Slide and merge a row or column in the specified direction
    private int[] SlideAndMergeLine(int[] line)
    {
        List<int> result = line.Where(num => num != 0).ToList();  // Remove zeros
        List<int> merged = new List<int>();
        bool skip = false;

        for (int i = 0; i < result.Count; i++)
        {
            if (skip)
            {
                skip = false;
                continue;
            }

            if (i < result.Count - 1 && CanMerge(result[i], result[i + 1]))
            {
                int mergedValue;

                if (result[i] == result[i + 1])
                {
                    // Merge identical numbers
                    int index = FindFibIndex(result[i]);
                    mergedValue = fibonacciNumbers[index + 1];
                }
                else
                {
                    // Merge consecutive numbers
                    int higher = Math.Max(result[i], result[i + 1]);
                    int index = FindFibIndex(higher);
                    mergedValue = fibonacciNumbers[index + 1];
                }

                merged.Add(mergedValue);
                skip = true;
            }
            else
            {
                merged.Add(result[i]);
            }
        }

        // Fill the rest of the line with zeros
        while (merged.Count < line.Length)
        {
            merged.Add(0);
        }

        return merged.ToArray();
    }

    // Rotate the game area 90 degrees clockwise
    private int[][] RotateClockwise()
    {
        int[][] newGrid = new int[width][];
        for (int i = 0; i < width; i++)
        {
            newGrid[i] = new int[height];
            for (int j = 0; j < height; j++)
            {
                newGrid[i][j] = game_area[height - j - 1][i];
            }
        }
        return newGrid;
    }

    // Rotate the game area 90 degrees counterclockwise
    private int[][] RotateCounterClockwise()
    {
        int[][] newGrid = new int[width][];
        for (int i = 0; i < width; i++)
        {
            newGrid[i] = new int[height];
            for (int j = 0; j < height; j++)
            {
                newGrid[i][j] = game_area[j][width - i - 1];
            }
        }
        return newGrid;
    }

    // Apply a move in a specified direction
    public void Move(Direction direction)
    {
        if (direction == Direction.LEFT)
        {
            for (int i = 0; i < height; i++)
            {
                int[] row = game_area[i];
                game_area[i] = SlideAndMergeLine(row);
            }
        }
        else if (direction == Direction.RIGHT)
        {
            for (int i = 0; i < height; i++)
            {
                int[] row = game_area[i].Reverse().ToArray();
                int[] newRow = SlideAndMergeLine(row).Reverse().ToArray();
                game_area[i] = newRow;
            }
        }
        else if (direction == Direction.UP)
        {
            game_area = RotateClockwise();
            Move(Direction.LEFT); // Treat up as left in rotated grid
            game_area = RotateCounterClockwise();
        }
        else if (direction == Direction.DOWN)
        {
            game_area = RotateClockwise();
            Move(Direction.RIGHT); // Treat down as right in rotated grid
            game_area = RotateCounterClockwise();
        }
    }

    // Add a new random Fibonacci tile (1 or 2)
    public void AddRandomTile()
    {
        List<(int, int)> emptyTiles = new List<(int, int)>();

        // Find all empty tiles
        for (int i = 0; i < height; i++)
        {
            for (int j = 0; j < width; j++)
            {
                if (game_area[i][j] == 0)
                {
                    emptyTiles.Add((j, i));
                }
            }
        }

        if (emptyTiles.Count > 0)
        {
            // Randomly select an empty tile
            Random rand = new Random();
            (int x, int y) = emptyTiles[rand.Next(emptyTiles.Count)];

            // Randomly place a 1 or 2 (Fibonacci numbers)
            game_area[y][x] = fibonacciNumbers[rand.Next(2)];
        }
    }
}
