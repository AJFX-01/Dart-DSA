class NQueen {
  List<List<String>> solveNQueens(int n) {
    List<List<String>> solutions = [];
    List<int> queens = List.filled(n, -1);

    Set<int> cols = {};
    Set<int> diagonals1 = {};
    Set<int> diagonals2 = {};

    //create board

    List<String> createBoard(List<int> queens, int n) {
      List<String> board = [];
      

      for (int i =0; i < n; i++) {
        List<String> row = List.filled(n, '.');
        row[queens[i]] = 'Q';
        board.add(row.join());
      }

      return board;
    }

    void backTrack(int row) {
      if (row == 0) {
        solutions.add(createBoard(queens, n));
        return;
      }

      for (int col = 0; col < n; col++) {
        if (cols.contains(col) || diagonals1.contains(row + col) || diagonals2.contains(row - col)) {
          continue;
        }

        queens[row] = col;
        cols.add(col);
        diagonals1.add(row + col);
        diagonals2.add(row - col);

        backTrack(row + 1);

        cols.remove(col);
        diagonals1.remove(row + col);
        diagonals2.remove(row - col);
      }
    }

    backTrack(0);
    return solutions;
    //bactrack
  }
}
