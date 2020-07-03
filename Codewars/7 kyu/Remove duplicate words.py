def remove_duplicate_words(s):
    # Correct but takes more time because the for loop in large cases might
    # not work very well.
    #l = s.split()
    #k = []
    # for i in l:
    #    if (s.count(i)>1 and (i not in k) or s.count(i)==1):
    #        k.append(i)
    # return(' '.join(k))
    words = s.split()
    return (" ".join(sorted(set(words), key=words.index)))
