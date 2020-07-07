def find_longest(string):
    a = string.split(' ')
    return len(max(a, key=len))
