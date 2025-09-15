class Solution {
  int threeSumClosest(List<int> nums, int target) {
    nums.sort();
    int closestSum = nums[0] + nums[1] + nums[2];
    int minDiff = (closestSum - target).abs();


    for (int i = 0; i < nums.length - 2; i++) {
      int j = i + 1;
      int k = nums.length - 1;

      while (j < k) {
        print(nums[i] + nums[j] + nums[k]);
        int sum = nums[i] + nums[j] + nums[k];
        int currDiff = (sum - target).abs();

        if (currDiff < minDiff) {
          minDiff = currDiff;
          closestSum = sum;
        }

        if (sum == target) {
          return sum;
        } else if (sum < target) {
          j++;
        } else {
          k--;
        }
      }
    }
    return closestSum;
  }
}

void main() {
  Solution s = new Solution();
  List<int> nums = [0, 1, 2];
  int target = 1;

  print(s.threeSumClosest(nums, target));
}
