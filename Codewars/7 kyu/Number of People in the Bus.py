def number(bus_stops):
    in_outtotal = [(i - j) for i, j in bus_stops]
    counter = 0
    for i in in_outtotal:
        counter += i
    return counter
