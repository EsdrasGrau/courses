def disemvowel(string):
    import re
    result = re.sub(r'[AEIOU]', '', string, flags=re.IGNORECASE)
    return result
