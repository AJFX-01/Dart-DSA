import 'dart:collection';
import 'dart:js_interop';

class CombinationSum {
  List<List<int>> combinations = [];
  List<int> combination = [];

  List<List<int>> combinationSum(List<int> candidates, int target) {
    backtrack(candidates, 0, target);
    return combinations;
  }

  void backtrack(List<int> candidates, int start, int target) {
    if (target < 0) return;

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

class CombinationSumBFS {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    List<List<int>> combinations = [];
    Queue<MapEntry<List<int>, int>> queue = Queue();

    // // Initialize the queue with an empty combination and the target
    queue.add(MapEntry([], target));

    while (queue.isNotEmpty) {
      MapEntry<List<int>, int> current = queue.removeFirst();
      List<int> currentCombination = current.key;

      int currentTarget = current.value;

      // If the current target is zero, add the combination to the result
      if (currentTarget == 0) {
        combinations.add(currentCombination);
        continue;
      }

      //explore further
      for (int candidate in candidates) {
        if (currentCombination.isNotEmpty &&
            candidate < currentCombination.last) {
          continue;
        }

        int newTarget = currentTarget - candidate;
        if (newTarget >= 0) {
          List<int> newCombination = List.from(currentCombination)
            ..add(candidate);

          queue.add(MapEntry(newCombination, newTarget));
        }
      }
    }

    return combinations;
  }
}

class CombinationSumWithDups {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    List<List<int>> combinations = [];
    List<int> combination = [];

    // Sort the candidates in ascending order for efficient use of binary search
    candidates.sort();

    void backtrack(int start) {
      if (target < 0) {
        return;
      }

      if (target == 0) {
        combinations.add(List.from(combination));
      }

      for (int i = start; i < candidates.length; i++) {
        // skip duplicates
        if (i > start &&
            i < candidates.length &&
            candidates[i] == candidates[i - 1]) {
          return;
        }

        combination.add(candidates[i]);
        backtrack(i + 1 // start from the next unique element
            );
          combination.removeLast();
      }
    }

    backtrack(0);
    return combinations;
  }
}
