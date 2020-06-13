def reverse_seq(n):
    lst = []
    if n > 0:
        for i in range(1,n + 1):
           lst.append(i)

    return lst[::-1]
