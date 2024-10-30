from typing import List
from bisect import bisect_left

class Solution:
    def minimumMoutainRemoval(self, nums: List[int]) -> int:

        n = len(nums)

        # Step 1: Longest increasing sequenec (LIS) from start to each of index
        lis = [1] * n
        for i in range(1, n):
            for j in range(i):
                if nums[i] > nums[j]:
                    lis[i] = max(lis[i], lis[j] + 1)

        # Step 2: Longest decreasing sequence (LDS) from end to each of index
        lds = [1] * n
        for i in range(n - 2, -1, -1):
            for j in range(i + 1, n):
                if nums[i] > nums[j]:
                    lds[i] = max(lds[i], lds[j] + 1)

        # Step 3: collapse the length of the longest moutain
        max_mountain_len = 0
        for i in range(1, n- 1):
            if lis[i-1] > 0 and lds[i+1] > 0:
                max_mountain_len = max(max_mountain_len, lis[i-1] + lds[i+1] - 1)

        # Step 4: Minium renovals is the total length minus max 
        return n - max_mountain_len


def minimumMountainRemovals(self, nums: List[int]) -> int:
    n = len(nums)

    def getLis(arr):
        res = [0] * n
        stack = []
        for i in range(n):
            if stack and stack[-1] >= arr[i]:
                j = bisect_left(stack, arr[i])
                stack[j] = arr[i]
                res[i] = j+1
            else:
                stack.append(arr[i])
                res[i] = len(stack)
        return res
    
    left, right = getLis(nums), getLis(nums[::-1])[::-1]
    #print(left, right)
    ans = float('inf')
    for i in range(n):
        if left[i] > 1 and right[i] > 1:
            ans = min(ans, n - (left[i] + right[i]-1))

    return ans