class Solution {
  bool canArrange(List<int> arr, int k) {
    // Step 1: Count the frequencies of the remainders
    List<int> remainderCount = List<int>.filled(k, 0);

    for (int num in arr) {
      int remainder = num % k;
      // Handle negative remainders
      if (remainder < 0) {
        remainder += k;
      }
      remainderCount[remainder]++;
    }

    // Step 2: Check pairing conditions
    // For remainder 0, it should be even
    if (remainderCount[0] % 2 != 0) {
      return false;
    }

    // Check if remainderCount[r] matches remainderCount[k - r]
    for (int r = 1; r <= k / 2; r++) {
      if (r == k - r) {
        // Special case for k / 2 when k is even
        if (remainderCount[r] % 2 != 0) {
          return false;
        }
      } else if (remainderCount[r] != remainderCount[k - r]) {
        return false;
      }
    }

    // If all conditions are met, return true
    return true;
  }
}
