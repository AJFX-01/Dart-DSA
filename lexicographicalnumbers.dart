class LexicoGraphicalOrderNums {
  List<int> lexicalOrder(int n) {
    List<int> result = [];

    void dfs(int current) {
      if (current > n) return;

      result.add(current);
      for (int i = 0; i < 9; i++) {
        int next = current * 10 + i;
        if (next > n) break;
        dfs(next);
      }
    }

    for (int num = 1; num < 9; num++) {
      if (num > n) break;
      dfs(num);
    }

    return result;
  }
}

class LexicoGraphicalOrderNumsk {
  int findKthNumber(int n, int k) {
    List<int> result = [];

    void dfs(int current) {
      if (current > n) return;

      result.add(current);
      for (int i = 0; i < 9; i++) {
        int next = current * 10 + i;
        if (next > n) break;
        dfs(next);
      }
    }

    for (int num = 1; num < 9; num++) {
      if (num > n) break;
      dfs(num);
    }
    

    return k;
  }
}
