import pandas as pd


def sum_two_smallest_numbers(numbers):
    numbers.sort()
    res = numbers[0] + numbers[1]
    return res


print('Is working')
