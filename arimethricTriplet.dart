class Solution {
  int arithmeticTriplets(List<int> nums, int diff) {
    int res = 0;

    for (int i = 0; i < nums.length; i++) {
      int j = i + 1;
      int k = nums.length - 2;

      while (j < k) {
        if (nums[j] - nums[i] == diff && nums[k] - nums[j] == diff) {
          res++;
          k--;
          j++;
        } else if (nums[j] - nums[i] < diff) {
          j++;
        } else {
          k--;
        }
      }
    }

    return res;
  }
}

void main() {
  Solution s = new Solution();
  List<int> nums = [0, 1, 4, 6, 7, 10];
  int diff = 3;

  print(s.arithmeticTriplets(nums, diff));
}
