#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jun  3 18:12:31 2020

@author: esdras
"""

'''
Question 1
Ask the user for two numbers between 1 and 100. Then count from the
lower number to the higher number. Print the results to the screen.
'''

# num1 = int(input('Please input a number between 1 and 100: >>>'))
# num2 = int(input('Please input a number between 1 and 100: >>>'))

# while num1 < 1 or num2 < 1 or num1 > 100 or num2 > 100 or num1==num2:
#     print('Numbers must be differente values and between 1 and 100',
#           'please try again')
#     num1 = int(input('Please input a number between 1 and 100: >>>'))
#     num2 = int(input('Please input a number between 1 and 100: >>>'))
    
# if num1 < num2:
#     for i in range(num1, num2+1):
#         print(i, end = ' ')
# else:
#     for i in range(num2+1, num1):
#         print(i, end= ' ')
        

'''
# Question 2
# Ask the user to input a string and then print it out to the screen in
# reverse order (use a for loop).
# '''

# string = str(input('Please, type a word: >>>'))
# reversedstr = ''
# for char in string:
#     reversedstr =   char + reversedstr
# print(reversedstr)

# #print(word[::-1]) 

'''
Question 3
Ask the user for a number between 1 and 12 and then display a times
table for that number.
'''
# user = input('Please input a number between 1 and 12: >>>')
# while (not user.isdigit()) or int(user) < 1 or int(user) > 12:
#     print('Must be a number between 1 and 12')
#     user = input('Please input a number between 1 and 12: >>>')
# user = int(user)

# print(f'This is the {user} times table')
# print()
# for i in range(1,13):
#     print(f'{i} x {user} = {i*user}')
    
    
'''
Question 4
Can you amend the solution to question 3 so that it just prints out all
times tables between 1 and 12? (no  need to ask user for input)
'''
    
# print('================================')
# print()
# for i in range(1,13):
#     print()
#     print(f'This is the {i} times table')
#     for j in range(1,13):
#         print(f'{j} x {i} = {j*i}') 
        
'''
Question 5
Ask the user to input a sequence of numbers. Then calculate the mean
and print the result
'''

# sequence = input('Please, input a sequence of numbers, type exit to finish: >>>')
# numbers = []
# while sequence.lower()!= 'exit':
#     while not sequence.isdigit():
#           print('Must be a number')
#           sequence = input('Please, try again: >>>')
#     numbers.append(int(sequence))
#     sequence = input('Please enter the following number in the sequence: >>>')
# total = 0
# for e in numbers:
#     total += e

# print(f'Mean is {total/len(numbers)}')    
# print(sum(numbers)/len(numbers))

'''
Question 6
Write code that will calculate 15 factorial. (factorial is product of 
positive ints up to a given number. e.g 5 factorial is 5x4x3x2x1)
'''

# factorial = input('Please input a number greater than 0 : >>>')
# while (not factorial.isdigit()) or int(factorial) <= 0 :
#     print('Must be a number greater than 0')
#     factorial = input('Please input a number greater than 0 : >>>')
# factorial = int(factorial)

# # This doesn't work in spyder because I didn't the math module
# # import math
# # fact = math.factorial(factorial)
# # print(f'The factorial of {factorial} is: {fact}')



# fact = 1
# for i in range(1,factorial+1): 
#     fact = fact * i 
      
# print(f'The factorial of {factorial} is: {fact}')


'''
Question 7
Write code to calculate Fibonacci numbers. Create list containing 
first 20 Fibonacci numbers, (Fib  numbers made by sum of preceeding
two. Series starts 0 1 1 2 3 5 8 13 ....)
'''

# def fib(n):
#     if n == 0:
#         return [0]
#     elif n == 1:
#         return [0, 1]
#     else:
#         lst = fib(n-1)
#         lst.append(lst[-1] + lst[-2])
#         return lst
    
# print(f'The first 20 Fibonacci numbers are, {fib(20)}')    


# # Other solution
# n = 20

# # Set a and b to the first two numbers in the sequence
# a = 0
# b = 1 

# # List in which to store numbers
# fib_nums = []

# # Use a for loop to create the sequence, repeat n times
# for i in range(n):
#     fib_nums.append(a)
#     a,b = b,a+b     
    
# print(f'The first {n} Fibonacci numbers are, {fib_nums}')



'''
Question 9

     *****
     *
     **** 
     *
     *
     *
Can you draw this using python? (comment the solution code)
'''

'''
Question 10
Write some code that will determine all odd and even numbers
between 1 and 100. Put the odds in a list named odd and the evens
in a list named even.
'''


n = 100

evens = []
odds = []

for i in range(n + 1):
    if i % 2 == 0:
        evens.append(i)
    else:
        odds.append(i)
print(f'The evens numbers are {evens}')
print()
print(f'The odds numbers are {odds}')






