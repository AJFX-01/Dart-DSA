//Split Array Largest Sum [Hard]
//Given an array which consists of non-negative integers and an integer m, you can split the array into m non-empty continuous subarrays. Write an algorithm to minimize the largest sum among these m subarrays.
// Input:
// nums = [7,2,5,10,8]
// m = 2

// Output:
// 18

// Explanation:
// There are four ways to split nums into two subarrays. The best way is to split it into [7,2,5] and [10,8], where the largest sum among the two subarrays is only 18.

// If you take a close look, you would probably see how similar this problem is with LC 1011 above. Similarly,
// we can design a feasible function: given an input threshold, then decide if we can split the array into several subarrays such that every subarray-sum is less than or equal to threshold. 
// In this way, we discover the monotonicity of the problem: if feasible(m) is True, then all inputs larger than m can satisfy feasible function.
// You can see that the solution code is exactly the same as LC 1011.

import 'utils.dart';

int split(List<int> nums, int m) {
  bool feasible(int threshold) {
    int count = 0;
    int total = 0;

    for(int i = 0; i < nums.length; i++ ) {
      total += nums[i];
      if (total > threshold) {
        total = nums[i];
        count += 1;

        if (count > m) return false;
      }
    }

    return true;

  }

  int left = nums.reduce((a,b) => a > b ? a : b);
  int right = nums.reduce((a,b) => a + b );
 

  while( left < right) {
    var mid = (left + (right - left) ~/ 2);
    feasible(mid) ? right = mid :  left = mid + 1;
  }

  return left;

} 



// 875. Koko Eating Bananas [Medium]
// Koko loves to eat bananas. There are N piles of bananas, the i-th pile has piles[i] bananas. 
// The guards have gone and will come back in H hours. 
// Koko can decide her bananas-per-hour eating speed of K. Each hour,
// she chooses some pile of bananas, and eats K bananas from that pile. 
// If the pile has less than K bananas, she eats all of them instead, 
// and won't eat any more bananas during this hour.

// Koko likes to eat slowly, but still wants to finish eating all the bananas before
// the guards come back. Return the minimum integer K such that she can eat all the bananas within H hours.

// Example :

// Input: piles = [3,6,7,11], H = 8
// Output: 4
// Input: piles = [30,11,23,4,20], H = 5
// Output: 30
// Input: piles = [30,11,23,4,20], H = 6
// Output: 23
// Very similar to LC 1011 and LC 410 mentioned above. 
// et's design a feasible function, given an input speed,
// determine whether Koko can finish all bananas within H hours with hourly eating speed speed.
// Obviously, the lower bound of the search space is 1, and upper bound is max(piles),
// because Koko can only choose one pile of bananas to eat every hour.


int mininumEatingSpeed(List<int> piles, int H) {
  bool feasible(int speed) {

    int total = 0;
    for (int pile in piles) {
      total += (pile + 1) ~/ (speed + 1);
    }

    return total <= H;
  }

  int left = 1;
  int right = maxNum(piles);

  while(left < right) {
    int mid = left + (right - left) ~/ 2;

    feasible(mid) ? right = mid : left = mid + 1;
  }

  return left;
}

// 82. Minimum Number of Days to Make m Bouquets [Medium]
// Given an integer array bloomDay, an integer m and an integer k.
// We need to make m bouquets. To make a bouquet, you need to use k adjacent flowers from the garden.
// The garden consists of n flowers, the ith flower will bloom in the bloomDay[i] and then can be used in exactly one bouquet.
// return the minimum number of days you need to wait to be able to make m bouquets from the garden.
// If it is impossible to make m bouquets return -1.

// Examples:

// Input: bloomDay = [1,10,3,10,2], m = 3, k = 1
// Output: 3
// Explanation: Let's see what happened in the first three days. x means flower bloomed and _ means flower didn't bloom in the garden.
// We need 3 bouquets each should contain 1 flower.
// After day 1: [x, _, _, _, _]   // we can only make one bouquet.
// After day 2: [x, _, _, _, x]   // we can only make two bouquets.
// After day 3: [x, _, x, _, x]   // we can make 3 bouquets. The answer is 3.
// Input: bloomDay = [1,10,3,10,2], m = 3, k = 2
// Output: -1
// Explanation: We need 3 bouquets each has 2 flowers, 
// that means we need 6 flowers. We only have 5 flowers so it is impossible to get the needed bouquets and we return -1.
// Now that we've solved three advanced problems above, 
// his one should be pretty easy to do. The monotonicity of this problem is very clear: if we can make m bouquets after waiting for d days, 
// then we can definitely finish that as well if we wait for more than d days.