def arr(n=None):
    empty = []
    if n is None:
        return empty
    elif n == 0:
        return empty
    else:
        return list(range(0, n))
