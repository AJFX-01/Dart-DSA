class CombinationSum {
  List<List<int>> combinations= [];
  List<int> combination = [];

  List<List<int>> combinationSum(List<int> candidates, int target) {
    backtrack(candidates, 0, target);
    return combinations;

  }


  void backtrack(List<int> candidates, int start, int target) {
    
    if (target <  0) return;

    if (target == 0) {
      combinations.add(List.from(combination));
    }

    for (int i = start; i < candidates.length; i++) {
      combination.add(candidates[i]);
      backtrack(candidates, i, target - candidates[i]);
      combination.removeLast();
    }
  }
}