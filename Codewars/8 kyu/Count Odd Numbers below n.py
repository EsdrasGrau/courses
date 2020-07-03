def odd_count(n):
    # This work on test but takes too much time.
    #counter = 0
    # for num in range(0, n):
    #     if num % 2 != 0:
    #        counter += 1
    return len(range(1, n, 2))
