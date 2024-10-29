from typing import List

class Solution:
    def maxMove(self, grid: List[List[int]]) -> int:

        # Move up - right (row - 1 , col + 1)
        # Move down - right(row + 1, col + 1)
        # Move right (row, col + 1)
        m, n = len(grid), len((grid)[0])

        memo = {}

        def dfs(row, col):
            if (row, col) in memo:
                return memo[(row, col)]

            max_moves = 0
            directions = [(-1, 1), (0, 1) (1, 1),]


            for dr, dc in directions:
                new_row, new_col = row + dr, col + dc

                if 0 <= new_row < m and 0 <= new_col < n and grid[new_row][new_col] >= grid[row][col]:
                    max_moves = max(max_moves, dfs(new_row, new_col))

            memo[(row, col)] = max_moves
            return max_moves

        max_result = 0
        for row in range(m):
            max_result = max(max_result, dfs(row,0))

            return max_result
        

# Uusing dynamic programming
class Solution:
    def maxMove(self, grid: List[List[int]]) -> int:
        m = len(grid)
        n = len(grid[0])

        res = 0

        dp = [0] * m


        for j in range(1, n):
            leftTop = 0

            found = False

            for i in range(m):
                cur =-1

                nextTopLeft = dp[i]

                if i - 1 >= 0 and leftTop != -1 and grid[i][j] > grid[i -1][j - 1]:
                    cur = max(cur, leftTop + 1)
                if dp[i] != -1 and grid[i][j] > grid[i][j - 1]:
                    cur = max(cur, dp[i] + 1)
                if i + 1 < m and dp[i + 1] and grid[i][j] > grid[i + 1][j -1]:
                    cur = max(cur, dp[i + 1] + 1)

                dp[i] = cur

                found = found or dp[i] != -1

                leftTop = nextTopLeft
            if not found:
                break

            res = j
        return res
                 

