# Given a string which we can delete at most k, return whether you can make a 
# palindrome.

# For example, given 'waterrfetawx' and a k of 2, you could delete f and x to 
# get 'waterretaw'.

def isPalindrome(s):
    return s == s[::-1]

def kDeletePalindrome(s, k):
    def kdpHelper(s, k):
        if (k == 0):
            return isPalindrome(s)
        for i in range(len(s)):
            temp = s[0:i] + s[i + 1:]
            result = kdpHelper(temp, k - 1)
            if (result):
                return result
        return False

    return kdpHelper(s, k)
        
def main():
    print('Testing kDeletePalindrome... ', end='')
    assert(kDeletePalindrome('waterrfetawx', 2))
    assert(kDeletePalindrome('raceecar', 1))
    assert(not kDeletePalindrome('panadqmaengap', 3))
    assert(kDeletePalindrome('panadqmaengap', 4))
    print('done!')

if __name__ == '__main__':
    main()
