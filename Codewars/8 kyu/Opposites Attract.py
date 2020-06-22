def lovefunc(flower1, flower2):
    if flower1 % 2 == 0 and flower2 % 2 == 0:
        return False
    elif flower1 % 2 != 0 and flower2 % 2 != 0:
        return False
    else:
        return True
