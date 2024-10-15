class MinAddToMakeValid {

  int minAddToMakeValid(String s) {

    int open = 0;
    int close = 0;
    

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        open++;
      } else {
        if (open > 0) {
          open--;
        } else {
          close++;
        }
      }
    }

    return open + close;
  }
}

 List<int> stack = [];

  // Build the stack of indices with decreasing values
  for (int i = 0; i < nums.length; i++) {
    if (stack.isEmpty || nums[stack.last] > nums[i]) {
      stack.add(i);  // Store indices of decreasing values
    }
  }

  int maxWidth = 0;
  
  // Traverse the array from right to left
  for (int j = nums.length - 1; j >= 0; j--) {
    // Try to find the largest possible width ramp
    while (stack.isNotEmpty && nums[stack.last] <= nums[j]) {
      maxWidth = max(maxWidth, j - stack.removeLast());
    }
  }

  return maxWidth;