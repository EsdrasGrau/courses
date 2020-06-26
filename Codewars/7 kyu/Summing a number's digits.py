def sum_digits(number):
    res = [int(i) for i in str(abs(number))]
    return sum(res)
