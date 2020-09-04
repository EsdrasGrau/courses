def enough(cap, on, wait):
    if (on + wait) <= cap:
        return 0
    else:
        return abs(cap - on - wait)
