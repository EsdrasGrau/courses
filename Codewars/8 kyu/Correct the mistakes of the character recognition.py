def correct(string):
    res = string.translate(str.maketrans({"5": "S", "0": "O", "1": "I"}))
    return res
