def binary_array_to_number(arr):
    binary = ''.join(str(e) for e in arr)
    binary = int(binary)
    decimal, i, n = 0, 0, 0
    while(binary != 0):
        dec = binary % 10
        decimal = decimal + dec * pow(2, i)
        binary = binary//10
        i += 1
    return(decimal)
