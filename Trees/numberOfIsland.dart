class NumberOfIsland {
  int numsIslands(List<List<String>> grid) {
    if (grid.isEmpty || grid[0].isEmpty) return 0;

    int numRows = grid.length;
    int numCols = grid[0].length;
    int numberOfIslands = 0;

    //Tranverse the entire grid
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        // if we find 1 its a new island
        if (grid[i][j] == "1") {
          // increment the count of islands
          numberOfIslands++;

          // perform dfs on the island
          dfs(grid, j, i);
        }
      }
    }

    return numberOfIslands;
  }

  void dfs(List<List<String>> grid, int col, int row) {
    if (col < 0 ||
        col >= grid[0].length ||
        row < 0 ||
        row >= grid.length ||
        grid[row][col] == '0') {
      return;
    }

    grid[row][col] = '0';

    // peform df in all four directions
    dfs(grid, col, row - 1); //up
    dfs(grid, col, row + 1); //down
    dfs(grid, col - 1, row); // left
    dfs(grid, col + 1, row); // right
  }
}
