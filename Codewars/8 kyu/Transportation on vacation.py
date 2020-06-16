def rental_car_cost(d):
    if d < 7 and d >= 3:
        return (40 * d) - 20
    elif d >= 7:
        return (40 * d) -50
    else:
        return 40 * d 
