import 'dart:collection';

class NumberOfProvisionDFS {
  int findCircleNum(List<List<int>> isConnected) {
    int n = isConnected.length;
    List<bool> visited = List.filled(n, false);
    int provinces = 0;

    // loop through the city and find connected components
    for (int city = 0; city < n; city++) {
      if (!visited[city]) {
        dfs(city, isConnected, visited);
        provinces++;
      }
    }

    return provinces;
  }

  void dfs(int city, List<List<int>> isConnected, List<bool> visited) {
    visited[city] = true;

    for (int neighbor = 0; neighbor < isConnected.length; neighbor++) {
      // check if the city is connected and not visited yet, contiue dfs
      if (isConnected[city][neighbor] == 1 && !visited[neighbor]) {
        dfs(neighbor, isConnected, visited);
      }
    }
  }
}

class NumberProvinceBFS {
  int findCircleNum(List<List<int>> isConnected) {
    int n = isConnected.length;
    List<bool> visited = List.filled(n, false);
    int provinces = 0;

    // loop through the city and find connected components
    for (int city = 0; city < n; city++) {
      if (!visited[city]) {
        bfs(isConnected, city, visited);
        provinces++;
      }
    }

    return provinces;
  }

  void bfs(List<List<int>> isConnected, int startCity, List<bool> visited) {
    Queue<int> queue = Queue();
    queue.add(startCity);
    visited[startCity] = true;
    
    while (queue.isNotEmpty) {
      int city = queue.removeFirst();
      // check all cities connected to current city

      for (int neighbor = 0; neighbor < isConnected.length; neighbor++) {
        if (isConnected[city][neighbor] == 1 && !visited[neighbor]) {
          visited[neighbor] = true;
          queue.add(neighbor);
        }
      }
    }
  }
}
