class Canplaceflowers {
//   Traverse the flowerbed:
// Check each position to see if it is 0 (empty).
// Ensure the previous and next positions are also 0 or out of bounds.
// If all conditions are met, plant a flower there (set it to 1) and decrease n.
// Early Exit:
// If at any point n becomes 0, return true immediately.
// Return the Result:
// If the loop ends and n > 0, return false.

  bool canPlaceFlowers(List<int> flowerbed, int n) {
    int l = flowerbed.length;

    for (int i = 0; i < l; i++) {
      if (flowerbed[i] == 0) {
        // check previous and next postion is not filled
        bool isPrevEmpty = (i == 0 || flowerbed[i - 1] == 0);
        bool isNextEmpty = (i == l - 1 || flowerbed[i + 1] == 0);

        if (isNextEmpty && isPrevEmpty) {
          // plant the flower and decresae n
          flowerbed[i] = 1;
          n--;

          if (n == 0) return true;
        }
      }
    }

    return n <= 0;
  }
}
