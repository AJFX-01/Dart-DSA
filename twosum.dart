class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final seen = <int, int>{};

    for (int x = 0; x < nums.length; x++) {
      int complement = target - nums[x];
      // sum is 9, current value is 4, compliment is 5, { 0, 5}
      if (seen.containsKey(complement)) {
        return [seen[complement]!, x];
      }
      seen[nums[x]] = x;
    }
    return [];
  }
}

void main() {
  List<int> numbers = [3,2,4];
  int target = 6;

  Solution solution = Solution();
  List<int> result = solution.twoSum(numbers, target);

  print(result);
}
