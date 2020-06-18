def add_binary(a,b):
    total = a + b
    binary = bin(total).replace("0b","")
    return str(binary)
