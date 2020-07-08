def solution(a, b):
    if len(a) > len(b):
        return f'{b}{a}{b}'
    else:
        return f'{a}{b}{a}'
