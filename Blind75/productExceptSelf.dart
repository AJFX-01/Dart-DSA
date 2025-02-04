class Productexceptself {
  List<int> productExceptSelf(List<int> nums) {
    int n = nums.length;
    List<int> answer = List.filled(n, 1);

    // compute the prefix sum
    int prefixsum = 1;
    int suffixsum = 1;

    for (int i = 0; i < n; i++) {
      answer[i] = prefixsum;
      prefixsum *= nums[i];
    }
    // compute the suffix sum

    for (int i = (n - 1); i > (n - 1); i--) {
      answer[i] *= suffixsum;
      suffixsum *= nums[i];
    }

    return answer;
  }
}
