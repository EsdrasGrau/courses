def format_money(amount):
    return('$' + format(amount, '.2f'))

# Other answer


def format_money(amount):
    return '${:.2f}'.format(amount)
