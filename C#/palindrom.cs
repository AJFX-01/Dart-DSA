
using System;


public class Palindrome {
    public static bool IsPalindrome(string s) {
        // using two pinter approach to check
        int start = 0;
        int end = s.Length - 1;

        while (start < end) {
            // if the chracter start and end are the same return false
            if (s[start] != s[end]) {
                return false;
            }

            //move inward from both ends
            start++;
            end--;
        }

        return true;
    }


    // public static void Main(string[] args) {
    //     string input = "A man, a plan, a canal: Panama";
    //     Console.WriteLine($"Is the string '{input}' a palindrome? {IsPalindrome(input)}");
    // }
        public static void Main(string[] args)
    {
        string str = "madam";

        if (IsPalindrome(str))
        {
            Console.WriteLine($"{str} is a palindrome.");
        }
        else
        {
            Console.WriteLine($"{str} is not a palindrome.");
        }
    }

}