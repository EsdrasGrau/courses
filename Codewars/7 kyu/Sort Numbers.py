def solution(nums):
    if nums == None:
        return []
    else:
        nums.sort(key=int)
        return nums
