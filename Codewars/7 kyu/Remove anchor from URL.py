def remove_url_anchor(url):
    split_string = url.split("#", 1)
    substring = split_string[0]
    return substring
