using System;
using System.Collections.Generic;

class Solution
{
    static void Main(string[] args)
    {
        // Example input: the final order of books
        string[] currentPile = new string[]
        {
            "Harry Potter and the Prisoner of Azkaban",
            "Gone With the Wind",
            "Frankenstein or The Modern Prometheus",
            "Band of Brothers",
            "The Caves of Steel",
            "The Grapes of Wrath",
            "Ubik"
        };

        // Calculate how many books need to be reversed
        int booksToReverse = CountBooksToReverse(currentPile);
        Console.WriteLine($"Books to reverse: {booksToReverse}");
    }

    public static int CountBooksToReverse(string[] books)
    {
        if (books == null || books.Length <= 1)
            return 0;

        int count = 1;
        while (count < books.Length)
        {
            if (string.Compare(books[count - 1], books[count], StringComparison.OrdinalIgnoreCase) <= 0)
                break;
            count++;
        }

        return count < books.Length ? count : 0;
    }
}
