class Solution {
  int threeSumSmaller(List<int> nums, int target) {
    nums.sort();
    int count = 0;
    int n = nums.length;

    for (int i = 0; i < n - 2; i++) {
      int j = i + 1;
      int k = n - 1;
      while (j < k) {
        if (nums[i] + nums[j] + nums[k] < target) {
          count += (k - j);
          j++;
        } else {
          k--;
        }
      }
    }
    return count;
  }

}