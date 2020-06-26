def reverse_words(text):
    words = text.split(' ')
    newWords = [word[::-1] for word in words]
    newSentence = " ".join(newWords)
    return newSentence
