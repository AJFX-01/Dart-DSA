class arrayRank {
  List<int>  arrayRankTransform(List<int> arr) {
    if (arr.isEmpty) return [];
    List<List<int>> arrWithIndex = [];

    // sort array with original indices 
    for (int i = 0; i < arr.length; i++) {
      arrWithIndex.add([arr[i], i]);
    }
    // sort the elements based on the 
    arrWithIndex.sort((a,b) => a[0].compareTo(b[0]));

    // assign them ranks
    List<int> ranks = List<int>.filled(arr.length, 0);
    int rank = 1;

    ranks[arrWithIndex[0][1]] = rank;

    for(int i = 1; i < arrWithIndex.length; i++) {
      //check if the previous elements 
      if (arrWithIndex[i][0] != arrWithIndex[i - 1][0]) {
        rank++;
      }

      // assign ranks to the original index of the elmets
      ranks[arrWithIndex[i][0]] = rank;
    }

    return ranks;
  }
}