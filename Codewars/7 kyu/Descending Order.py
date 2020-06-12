def descending_order(num):
    digits = [int(x) for x in str(num)]
    sort = sorted(digits, key=int, reverse=True)
    strings = [str(integer) for integer in sort]
    a_string = "".join(strings)
    return int(a_string)
