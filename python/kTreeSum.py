# Given the root of a binary search tree, and a target K, return two nodes in 
# the tree whose sum equals K.

# For example, given the following tree and K of 20:

#     10
#    /   \
#  5      15
#        /  \
#      11    15

# Return the nodes 5 and 15.

class Tree(object):
    def __init__(self, val, L, R):
        self.val = val
        self.left = L
        self.right = R

def kTreeSum(T, sum):
    if (T.val > sum):
        kTreeSum(T.left, sum)
    else:
        return 42

def main():
    T0 = Tree(5, None, None)
    T1 = Tree(15, None, None)
    T2 = Tree(10, T0, Tree(15, Tree(11, None, None), T1))
    assert(kTreeSum(T2, 20) == (T0, T1))
