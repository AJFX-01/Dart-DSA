class PowersetsRecursive {
    List<List<int>> subsets(List<int> nums) {

      List<List<int>> powersets = [];
      List<int> subset = [];

      void backtrack(int start) {
          powersets.add(List.from(subset));

          for (int i = start; i <  nums.length; i++) {
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

    List<List<int>> powersets = [[]];

    for (int num in nums) {

      int currentSize = powersets.length; 

      for (int i = 0; i < currentSize; i++) {
        List<int> newSubset = List.from(powersets[i]..add(num));
        powersets.add(newSubset);
      } 
    }


    return powersets;
  }
  
}