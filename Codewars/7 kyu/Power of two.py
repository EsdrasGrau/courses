def power_of_two(x):
    if (x == 0):
        return False
    while (x != 1):
        if (x % 2 != 0):
            return False
        x = x // 2

    return True

# refactoring


def power_of_two(x):
    return (x and (not(x & (x - 1))))
