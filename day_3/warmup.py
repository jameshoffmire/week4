#Move Zeros
#Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
#Example:
#Input: [0,1,0,3,12]
#Output: [1,3,12,0,0]
#Example Input: [0,0,11,2,3,4]
#Example Output: [11,2,3,4,0,0]

def move_zeros(lst):
    lst = list(filter(lambda a: a != 0, lst)) + [0 for x in range(lst.count(0))]
    return lst

print(move_zeros([0,1,0,3,12]))