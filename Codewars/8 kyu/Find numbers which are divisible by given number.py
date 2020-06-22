def divisible_by(numbers, divisor):
    res = []
    for e in numbers:
        if e % divisor == 0:
            res.append(e)
    return res
