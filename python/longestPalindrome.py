class Solution:
    # Using brute force
    def longestPalindrome1(self, s: str) -> str:

        n = len(s)
        if n <= 1:
            return s
        
        max_len = 1
        max_str = [0]

        for i in range(n - 1):
            for j in range(i + 1, n):
                if j - i + 1 > max_len and s[i:j+1] == s[i:j+1][::-1]:
                    max_len = j - i + 1
                    max_str = s[i:j+1]

        return max_str
    
    # Using Expand around the center
    def longestPalindrome2(self, s: str) -> str:
        n = len(s)

        if (n <= 1):
            return s
        
        def expand_around_center(left, right):
            while (left >= 0 and right < n and s[left] == s[right]):
                left -= 1
                right += 1
            return s[left+1:right]
        
        max_str = s[0]

        for i in range(n -1):
            odd = expand_around_center(i, i)
            even = expand_around_center(i, i + 1)

            if len(odd) > len(max_str):
                max_str = odd
            if len(even) > len(max_str):
                max_str = even

        return max_str
    

    # Using Manacher's Algorithm
    # def longestPalindrome(self, s: str) -> str:
    #     return s