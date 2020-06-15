def better_than_average(class_points, your_points):
    import numpy as np
    if np.mean(class_points) > your_points:
        return False
    else:
        return True
