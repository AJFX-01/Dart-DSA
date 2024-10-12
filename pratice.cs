using System;

// To execute C#, please define "static void Main" on a class
// named Solution.

class Solution
{   
    static int[] removeEven(int[] arr, int size) {

        int m = 0;

        for (int i = 0; i < arr.Length; i++) {
            if (arr[i] % 2 != 0) {
                arr[m] = arr[i];
                ++m;
            }
        }

        int[] temp = new int[m];
        for(int i = 0; i < m; i++){
            temp[i] = arr[i];
        }
        arr = temp;
        return arr;
    }


}


class Solution
{
    static void Main(string[] args)
    {
        List<string> piles = new List<string> {
            "flower-decorated plate",
            "light green plate",
            "light green plate",
            "big blue plate",
            "big blue plate"
        };

        // Test1 
        (int index1, bool reverse1) = findInsertPosition(piles, "light green plate", "light green plate");
        Console.WriteLine($"Insert at index : {index1}, Reserve :{reverse1}");
        InsertPlates(piles, index1, "light green plate", "light green plate", reverse1);
        PrintPiles(piles);

        (int index2, bool reverse2) = findInsertPosition(piles, "big blue plate", "light green plate");
        Console.WriteLine($"Insert at index: {index2}, Reverse: {reverse2}");
        InsertPlates(piles, index2, "big blue plate", "light green plate", reverse2);
        PrintPiles(piles);

    }

    static (int, bool) findInsertPosition(List<string> pile, string plate1, string plate2) {
        // check if both plates are the same and find the lowesr possible index
        if (plate1 == plate2) {
            int index = pile.IndexOf(plate1);
            if (index == -1)
                index = pile.Count;
            return (index, false);
        }

        // if the plates are different
        int index1 = pile.IndexOf(plate1);
        int index2 = pile.IndexOf(plate2);

        // ensure both group exist
        if (index1 == -1 || index2 == -1) {
            throw new ArgumentException("plate does not exist");
        } 

        if (index1 < index2) {
            return(index2, true);
        } else {
            return (index1, false);
        }
    }

    static void InsertPlates(List<string> piles, int index, string plate1, string plate2, bool reverse) {

        if(!reverse) {
            piles.Insert(index, plate1);
            piles.Insert(index + 1, plate2);
        }
        piles.Insert(index, plate2);
        piles.Insert(index, plate1);
    }

    static void PrintPiles(List<string> piles) {
        Console.WriteLine("Current plate pile");
        foreach (var i in piles) {
            Console.WriteLine(i);
        }
        Console.WriteLine();
    }
}
