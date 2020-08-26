def get_grade(s1, s2, s3):
    # Code here
    score = (s1+s2+s3)/3
    if score <= 100 and score >= 90:
        return 'A'
    elif score < 90 and score >= 80:
        return 'B'
    elif score < 80 and score >= 70:
        return 'C'
    elif score < 70 and score >= 60:
        return 'D'
    else:
        return 'F'
