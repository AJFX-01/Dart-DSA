class Solution {
  int minSubArray(List<int> nums, int p) {
    int n = nums.length;
    int totalSum = nums.reduce((value, element) => value + element);

    // check the remainder and if sum is divisible by p
    int target = totalSum % p;
    if (target == 0) return 0;

    Map<int, int> prefixMod = {0: -1};
    int currentPrefixSum = 0;
    int minLength = n;

    for (int i = 0; i < n; i++) {
      currentPrefixSum = (currentPrefixSum + nums[i]) % p;

      // find required value that would make currntPrefixSum  equal to taget
      int neededMod = (currentPrefixSum - target + p) % p;

      if (prefixMod.containsKey(neededMod)) {
        minLength = (i - prefixMod[neededMod]!).clamp(1, minLength);
      }

      prefixMod[currentPrefixSum] = i;
    }

    return minLength == n ? -1 : minLength;
  }
}
