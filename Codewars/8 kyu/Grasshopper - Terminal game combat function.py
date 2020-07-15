def combat(health, damage):
    if damage > health:
        return 0
    else:
        return health - damage
