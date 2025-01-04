import 'dart:math';

class Maxsubarray {
  int maxSubArray(List<int> nums) {
    int maxSum = nums[0];
    int currentSum = nums[0];

    for (int i = 0; i < nums.length; i++) {
      currentSum = max(nums[i], currentSum + nums[i]);
      maxSum = max(maxSum, currentSum);
    }

    return maxSum;
  }
}
