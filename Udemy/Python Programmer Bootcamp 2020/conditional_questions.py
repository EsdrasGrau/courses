#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 21:17:47 2020

@author: esdras
"""


'''
Question 1
Write code that asks the user to input a number between 1 and 5 inclusive.
The code will take the integer value and print out the string value. So for
example if the user inputs 2 the code will print two. Reject any input that
is not a number in that range
'''

# user_input = int(input('Please write a number between 1 and 5: >>>'))
# if user_input == 1:
#     print('one')
# elif user_input == 2:
#     print('two')
# elif user_input == 3:
#     print('three')
# elif user_input == 4:
#     print('four')
# elif user_input == 5:
#     print('five')
# else:
#    print('Beyond selection or is not a integer number')
    

'''
Question 2
Repeat the previous task but this time the user will input a string and the
code will ouput the integer value. Convert the string to lowercase first.
'''

# user_input = str(input('Please write a string between One and Five: >>>'))
# user_input = user_input.lower()
# if user_input == 'one':
#     print(1)
# elif user_input == 'two':
#     print('2')
# elif user_input == 'three':
#     print('3')
# elif user_input == 'four':
#     print('4')
# elif user_input == 'five':
#     print('5')
# else:
#     print('Beyond selection')

'''
Question 3
Create a variable containing an integer between 1 and 10 inclusive. Ask the
user to guess the number. If they guess too high or too low, tell them they
have not won. Tell them they win if they guess the correct number.
'''

# secret = 6
# user_input = input('Please input a number between 1 and 10: >>>')
# if user_input.isdigit():
#     user_input = int(user_input)
#     if user_input == secret:
#         print('NICE, you win!!!!')
#     elif user_input < secret and user_input >= 1 :
#         print('You guessed too low!!. You lose!')
#     elif user_input > secret and user_input <= 10 :
#         print('You guessed too high!!. You lose!')
#     else:
#         print('Beyond selection')
# else:
#     print('That is not a number or integer4')

'''
Question 4
Ask the user to input their name. Check the length of the name. If it is
greater than 5 characters long, write a message telling them how many characters
otherwise write a message saying the length of their name is a secret
'''

# name = input('Please, write your name: >>>')
# name_len = len(name)

# if name_len > 5:
#     print('Your name has 16', name_len, ' characters')
# else:
#     print('The lenght of your name is secret')


'''
Question 5
Ask the user for two integers between 1 and 20. If they are both greater than
15 return their product. If only one is greater than 15 return their sum, if
neither are greater than 15 return zero
'''

num1 = int(input('Please, input a number between 1 and 20: >>>'))
num2 = int(input('Please, input a second number between 1 and 20: >>>'))

if num1 >= 15 and num2 >= 15:
    print(num1 * num2)
elif num1 >= 15 or num2 >= 15:
    print(num1 + num2)
else:
    print(0)








