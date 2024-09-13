class PowersetsRecursive {
    List<List<int>> subsets(List<int> nums) {

      nums.sort();
      List<List<int>> powersets = [];
      List<int> subset = [];

      void backtrack(int start) {
          powersets.add(List.from(subset));

          for (int i = start; i <  nums.length; i++) {

            if (i > start && nums[i] == nums[i - 1]) continue;
            subset.add(nums[i]);
            backtrack(i + 1);
            subset.removeLast();
          }
      }

      backtrack(0);
      return powersets;
    }
}


class PowersetsIterative{
  List<List<int>> subsets(List<int> nums) {

    nums.sort();
    List<List<int>> powersets = [[]];

    for (int num in nums) {

      int currentSize = powersets.length; 

      for (int i = 0; i < currentSize; i++) {
        if(nums[i] == nums[i - 1]) continue;
        List<int> newSubset = List.from(powersets[i]..add(num));
        powersets.add(newSubset);
      } 
    }


    return powersets;
  }
  
}


class PowersetsIterativeWithDup {
  List<List<int>> subsetsWithDup(List<int> nums) {

    nums.sort();
    List<List<int>> powersets = [[]];

    int startIndex = 0;
    int endIndex = 0;

    for (int i = 0; i < nums.length; i++) {
      startIndex = 0;

      // If current element is the same as the previous element, 
      // start from the end index of the subsets added in the previous step.
      if(i > 0 && nums[i] == nums[i - 1]) {
        startIndex = endIndex + 1;
      }

      endIndex = powersets.length - 1;
      // Iterate over subsets formed so far and add the current number to each subset
      for (int j = startIndex; j <= endIndex; j++ ) {
        List<int> newsubsets = List.from(powersets[j]);
        newsubsets.add(nums[i]);
        powersets.add(newsubsets);
      }
      
    }

    return powersets;
  }
}