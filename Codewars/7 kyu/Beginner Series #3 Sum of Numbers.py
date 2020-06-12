def get_sum(a,b):
    sum = 0
    if a == b:
        return a
    else:
        for i in range(a, b + 1):
          sum += i

    return sum
