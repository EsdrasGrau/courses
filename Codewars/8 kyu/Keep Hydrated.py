def litres(time):
    if int(time) == 1:
        return 0
    else:
        return int(time * 0.5)


# other solution
def litres(time):
    return int(time/2)
