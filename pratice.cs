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
