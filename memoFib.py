from sys import argv
from time import time

def nthMemoFib(n):
    def memoFib(n, d):
        if n in d:
            return d[n]
        else:
            result = memoFib(n - 1, d) + memoFib(n - 2, d)
            d[n] = result
            return result

    d = {0:0, 1:1}
    
    return memoFib(n, d)

def nthFib(n):
    if n < 2:
        return n
    else:
        return nthFib(n - 1) + nthFib(n - 2)

def main():
    t0 = time()
    print('nth fibonacci num memoized = %d' % nthMemoFib(int(argv[1])))
    t1 = time()
    print('Solved in %0.5f s' % (t1 - t0))
    if (len(argv) > 2):
        t2 = time()
        print('nth fibonacci num = %d' % nthFib(int(argv[1])))
        t3 = time()
        print('Solved in %0.5f s' % (t3 - t2))

if __name__=="__main__":
    main()
