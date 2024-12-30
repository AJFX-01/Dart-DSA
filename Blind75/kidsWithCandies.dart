class Kidswithcandies {
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    // find the current maxium number of candies
    int maxCandies = candies.reduce((a, b) => a > b ? a : b);

    // check if each kid can have the greatest number of candies

    return candies.map((candy) => candy + extraCandies >= maxCandies).toList();
  }
}

// Without using map or reduce

class KidsWithCandies {
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    int n = candies.length;

    List<bool> res = [];

    int max = candies[0];

    for (int nums in candies) {
      if (nums > max) {
        max = nums;
      }
    }

    for (int i = 0; i < n; i++) {
      if ((extraCandies + candies[i]) >= max) {
        res.add(true);
      } else {
        res.add(false);
      }
    }

    return res;
  }
}
