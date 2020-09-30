import re
Regex_Pattern = r'^[0123xsAau.,]{6}$'  # Do not delete 'r'.


print(str(bool(re.search(Regex_Pattern, input()))).lower())
