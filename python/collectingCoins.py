# You are given a 2-d matrix where each cell represents number of coins in that 
# cell. Assuming we start at matrix[0][0], and can only move right or down, find
# the maximum number of coins you can collect by the bottom right corner.

# For example, in this matrix:

# [ [ 0, 3, 1, 1 ],
#   [ 2, 0, 0, 4 ],
#   [ 1, 5, 3, 1 ] ]

# The most we can collect is 0 + 2 + 1 + 5 + 3 + 1 = 12 coins.

def collect(M):
    rows = len(M) - 1
    cols = len(M[0]) - 1

    def traverse(M, row, col):
        val = M[row][col]
        if (row == rows and col == cols):
            return val
        if (row == rows):
            return val + traverse(M, row, col + 1)
        if (col == cols):
            return val + traverse(M, row + 1, col)
        else:
            return val + max(traverse(M, row + 1, col), traverse(M, row, col + 1))

    return traverse(M, 0, 0)

def main():
    test1 = [ [ 0, 3, 1, 1 ],
              [ 2, 0, 0, 4 ],
              [ 1, 5, 3, 1 ] ]
    assert(collect(test1) == 12)

if __name__ == '__main__':
    main()
