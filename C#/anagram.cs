using System.Collections.Generic;
using System;
using System.Linq;

public class Anagram {

    public static bool IsItAnagrams(string s1, string s2) {

        // if length of the two strings are not the same they cannot be annagrams
        if (s1.Length != s2.Length) return false;

        return String.Concat(s1.Orderby(c => c)) ==  String.Concat(s2.Orderby(c => c));
    }


    public static void Main(string[] args) {
        string str1 = "listen";
        string str2 = "silent";

        if (AreAnagrams(str1, str2))
        {
            Console.WriteLine($"{str1} and {str2} are anagrams.");
        }
        else
        {
            Console.WriteLine($"{str1} and {str2} are not anagrams.");
        }
    }
}