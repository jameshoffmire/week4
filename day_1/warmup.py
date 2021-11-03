#Electric Company
#Create a function that given a list which represents street lights given as a parameter(l_street), determine if an outage has occurred. A street with a total number of "F" greater than or equal to 2 returns "Outage", anything below returns "Power"
#Example Input: [ T, F, F, F ]
#Example Output: "Outage"

from collections import Counter

def func1(l_street):
    return 'Outage' if l_street.count('F') > 1 else 'Power'



print(func1(['T','T','F']))
print(func1(['T','T','F','F']))
    
