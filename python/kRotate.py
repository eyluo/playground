# Write a function that rotates a list by k elements. For example, 
# [1, 2, 3, 4, 5, 6] rotated by two becomes [3, 4, 5, 6, 1, 2]. Try solving this 
# without creating a copy of the list. How many swap or move operations do you 
# need?

def kRotateCopy(L, k):
    r = k % len(L)
    return L[r:] + L[:r]

def kRotate(L, k):
    return 42

def main():
    return 42

if __name__ == '__main__':
    main()