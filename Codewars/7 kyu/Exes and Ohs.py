def xo(s):
    min_o = s.count('o')
    min_x = s.count('x')
    may_o = s.count('O')
    may_x = s.count('X')

    if (min_o + may_o) == (min_x + may_x):
        return True
    else:
        return False
