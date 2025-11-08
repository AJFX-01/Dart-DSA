class FindMedianSortedArrays {

  public findMedianSortedArraysBruteforce(nums1: number[], nums2: number[]): number {


  }

  public findMedianSortedArraysPartition(nums1: number[], nums2: number[]): number {

    if(nums1.length > nums2.length) {
      [nums1, nums2] = [nums2, nums1];
    }

    const n1 = nums1.length;
    const n2 = nums2.length;

    let left = 0
    let right = n1

    while( left <= right) {

      const part1 = Math.floor((left + right) / 2);
      const part2 = Math.floor( (n1 + n2 + 1) / 2) - part1;

      const maxLeft1 = part1 === 0 ? -Infinity : nums1[part1 - 1];
      const maxLeft2 = part2 === 0 ? -Infinity : nums2[part2 - 1];

      const minRight1 = part1 === n1 ? Infinity : nums1[part1];
      const minRight2 = part2 === n2 ? Infinity : nums2[part2];

      if(maxLeft2 <= minRight1 && maxLeft1 <= minRight2) {

        if((n1 + n2) % 2 !== 0) {
          return Math.max(maxLeft1, maxLeft2);
        } else {
          return (Math.max(maxLeft1, maxLeft2) + Math.min(minRight1, minRight2)) / 2
        }
      } else if (maxLeft1 > minRight2) {
        right = part1 - 1;
      } else {
        left = part1 + 1;
      }
    }
  }
    
}