def gimme(input_array):
    i = sorted(input_array)[len(input_array) // 2]
    return input_array.index(i)
