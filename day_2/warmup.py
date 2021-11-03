#Square(n) sum
#Create a function that given a list of integers squares each number passed into it and then sums the results together.
#Example Input: [1, 2, 2]
#Example Output: 9 
#Explanation: 1^2 + 2^2 + 2^2 = 9
#Example Input: [3, 4, 5]
#Example Output: 50

def squaredsum(ints):
    return(sum([x**2 for x in ints]))


print(squaredsum([3,4,5]))
