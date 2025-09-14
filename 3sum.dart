class Solution {
  List<List<int>> threeSum(List<int> nums) {
    nums.sort();
    print(nums);
    List<List<int>> res = [];

    for (int i = 0; i < nums.length - 2; i++) {
      //let skip duplicates
      if (i > 0 && nums[i] == nums[i - 1]) continue;

      int j = i + 1;
      int k = nums.length - 1;

      while (j < k) {
        int sum = nums[i] + nums[j] + nums[k];

        if (sum == 0) {
          res.add([nums[i], nums[j], nums[k]]);
          while(j < k && nums[j] == nums[j + 1]) j++;
          while(j < k && nums[k] == nums[k - 1]) k--;
          j++;
          k--;
        } else if (sum < 0) {
          j++;
        } else {
          k--;
        }
      }
    }
    return res;
  }

  // bool isDup(List<List<int>> res, List<int> triplet) {
  //   // convert the array to hashset of string
  //   String hashTriplet = triplet.join(',');
  //   Set seen = res.map((e) => e.join(',')).toSet();
  //   return seen.contains(hashTriplet);
  // }
}

void main() {
  Solution s = new Solution();
  // List<List<int>> nums = [
  //   [0, 0, 0],
  //   [0, 0, 0]
  // ];
  List<int> nums = [-100, -70, -60, 110, 120, 130, 160];

  print(s.threeSum(nums));
  // print(s.isDup(nums, [0, 0, 0]));
}

// class Solution {
//   List<List<int>> threeSum(List<int> nums) {
//      List<List<int>> res = [];
//   nums.sort();
//   for(int i = 0 ; i<nums.length;i++){
//     int a = nums[i];
//     if(a>0) break;
//     if(i>0 && nums[i] == nums[i-1]) continue;
//     int l = i+1;
//     int r = nums.length -1;
//     while(l<r){
//         int s = a + nums[l] + nums[r];
//         if(s<0){
//             l++;
//         } else if(s>0){
//             r--;
//         } else {
//             res.add([a,nums[l],nums[r]]);
//             l++;
//             r--;
//             while (l < r && nums[l] == nums[l - 1]) {
//           l++;
//         }
//         }
//     }
//   }
//   return res;
//   }
  
// }
