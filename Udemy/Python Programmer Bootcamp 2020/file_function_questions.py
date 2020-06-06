#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jun  6 15:09:58 2020

@author: esdras
"""


'''
Question 1
Create a function that will calculate the sum of two numbers. Call it sum_two.
'''

def sum_two(a,b):
    '''
    This function calcualates the sum of 2 numbers
    '''
    return a + b

print (f'The sum of 7 and 5 is: {sum_two(7,5)}')


'''
Question 2
Write a function that performs multiplication of two arguments. By default the 
function should multiply the first argument by 2. Call it multiply.
'''

def multiply(a, b = 2):
    '''
    This function multiply two arguments by deafult the 1st one is 
    multiply by 2 if not giving a 2nd argument
    '''
    return a * b

print(f'Multiplying 3 by 5 is: {multiply(3,5)}')
print(f'Multiplying 3 is: {multiply(3)}')


'''
Question 3
Write a function to calculate a to the power of b. If b is not given
its default value should be 2. Call it power.
'''

def power (a, b=2):
    '''
    This functions calcuates the power of a, default value is 2
    '''
    return a**b

print(f'3 to the power of 3 is: {power(3,3)}')
print(f'The square root of 3 is: {power(3)}')


'''
Question 4
Create a new file called capitals.txt , store the names of five capital cities
in the file on the same line.
'''

# file = open('capitals.txt','w')
# file.write('Mexico City, ')
# file.write('Tokyo, ')
# file.write('Manila, ')
# file.write('Canberra, ')
# file.write('Ottawa,')
# file.close()

'''
Question 5 
Write some code that requests the user to input another capital city.
Add that city to the list of cities in capitals. Then print the file to
the screen.
'''


# city = input('Please type a capital city: >>>')
# file = open('capitals.txt', 'a')
# file.write('\n' + city)
# file.close

# file = open('capitals.txt', 'r')
# print(file.read())
# file.close

'''
Question 6
Write a function that will copy the contents of one file to a new file.
'''
# import shutil
# def copy_file(scr, tgt):
#     '''
#     This function copy a file
#     scr = origin route
#     tgt = destination
#     '''
#     shutil.copyfile(scr,tgt)

# copy_file(r'/Users/esdras/Courses/Udemy/Python Programmer Bootcamp 2020/capitals.txt', r'/Users/esdras/Courses/Udemy/Python Programmer Bootcamp 2020/new_cap.txt')

#Other solution

# def copy_file(infile,outfile):
#     ''' Copies the contents of infile to a new file, outfile.'''

#     with open(infile) as file_1:
#         with open(outfile, "w") as file_2:
#             file_2.write(file_1.read()) 



# copy_file('capitals.txt','new_capitals.txt')
















