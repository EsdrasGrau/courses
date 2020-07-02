def validate_pin(pin):
    import re
    if re.fullmatch("\d{4}|\d{6}", pin):
        return True
    else:
        return False
