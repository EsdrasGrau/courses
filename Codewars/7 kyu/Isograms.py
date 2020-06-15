def is_isogram(string):
    string = string.lower()
    return len(set(string)) == len(string)
