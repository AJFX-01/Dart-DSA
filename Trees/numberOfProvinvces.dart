class NumberOfProvision {
  int findCircleNum(List<List<int>> isConnected) {
    int n = isConnected.length;

    List<bool> visited = List.filled(n, false);

    int provinces = 0;

    void dfs(int city) {
      visited[city] = true;

      for (int neighbor = 0; neighbor < n; neighbor++) {
        // check if the city is connected and not visited yet, contiue dfs
        if (isConnected[city][neighbor] == 1 && !visited[neighbor]) {
          dfs(neighbor);
        }
      }
    }

    // loop through the city and find connected components
    for (int city = 0; city < n; city++) {
      if (!visited[city]) {
        dfs(city);
        provinces++;
      }
    }

    return provinces;
  }
}
