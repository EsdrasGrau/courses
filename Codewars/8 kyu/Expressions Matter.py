def expression_matter(a, b, c):
    opt1 = a * (b + c)
    opt2 = a * b * c
    opt3 = a + b * c
    opt4 = (a + b) * c
    opt5 = a + b + c
    if   opt1 >= opt2 and opt1 >= opt3 and opt1 >= opt4 and opt1 >= opt5:
        return opt1
    elif opt2 >= opt1 and opt2 >= opt3 and opt2 >= opt4 and opt2 >= opt5:
        return opt2
    elif opt3 >= opt1 and opt3 >= opt2 and opt3 >= opt4 and opt3 >= opt5:
        return opt3
    elif opt4 >= opt1 and opt4 >= opt2 and opt4 >= opt3 and opt4 >= opt5:
        return opt4
    elif opt5 >= opt1 and opt5 >= opt2 and opt5 >= opt3 and opt5 >= opt4:
        return opt5
