from random import randint

# You have 100 fair coins and you flip them all at the same time. Any that come 
# up tails you set aside. The ones that come up heads you flip again. How many 
# rounds do you expect to play before only one coin remains?

# Write a function that, given n, returns the number of rounds you'd expect to 
# play until one coin remains.

###

# In expectation, you remove one half of the coins per round. This means we 
# expect to run lg(100) rounds before only one coin is left.

def flip(n):
    count = 0
    while (n > 1):
        temp = 0
        for _ in range(n):
            if (randint(0, 1) == 0):
                temp += 1
        n = temp
        count += 1
    return count

def simulation(N, n):
    if (N < 1):
        return 0
    else:
        total = 0
        for _ in range(N):
            total += flip(n)
        return total / N

def main():
    while(True):
        N = input('Number of trials: ')
        expected = simulation(int(N), 100)
        print('Expected number of coin flips = %0.2f' % expected)

if __name__ == '__main__':
    main()
