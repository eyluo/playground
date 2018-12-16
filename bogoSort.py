from random import shuffle
from time import time
from sys import argv

def bogoSort(R):
    t0 =  time()
    L = list(range(R))
    shuffle(L)
    sortedL = list(range(R))
    i = 0
    while (L != sortedL):
        shuffle(L)
        i += 1
    t1 = time()
    print("bogoSort on size %d took %0.5f seconds, %d iterations" % (R, (t1 - t0), i))
    return L

def main():
    num = int(argv[1])
    for i in range(num):
        bogoSort(i + 1)

if __name__ == "__main__":
    main()
