def words_to_marks(s):
    import string
    dic = dict(zip(string.ascii_lowercase, range(1, 27)))
    res = 0
    for letter in s:
        res += dic.get(letter, 0)
        # dict.get(key, defaultvalue)
    return res
