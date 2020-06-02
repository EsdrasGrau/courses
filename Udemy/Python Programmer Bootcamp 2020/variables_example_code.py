#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 19:59:32 2020

@author: esdras
"""


#Ask the user for the radious of a circle and print the area

# radius = float(input('Please write the radius of the circle: >>>'))
# pi = 3.1416
# area = pi * radius**2
# print('You entered a radius of: ', radius, 'therefore the area of the circle is: ', area)

#Conver Farenheit to Celsius
# far = float(input('Please enter the temperature in Farenheit >>>'))
# cel = (far - 32) / 1.8
# print(far, 'Farenheit into Celsius is: ', cel)

#Obtein the sum of two integers
# num1 = int(input('Please write the first number: >>>'))
# num2 = int(input('Please write the second number: >>>'))
# print('The sum of the two numbers is: ', num1 + num2 )

#Obtein the product of two numbers
# num1 = int(input('Please write the first number: >>>'))
# num2 = int(input('Please write the second number: >>>'))
# product = num1 * num2
# print('The product of ', str(num1), ' by ', str(num2), ' is: ', product)

## 5 Bob, Ann, Jane and Ashwin want to order pizza - they know they will each eat
# 4 slices of pizza. The local pizza shop sells pizzas of only 6 slices
# What is the minimum number of pizzas needed - Use floor division
total_slices = 4 * 4
number_of_pizzas = (total_slices  + 5 ) // 6
leftover = number_of_pizzas * 6 - total_slices
print('The number of pizzas they need is: ', number_of_pizzas, 
      ' and will be slices leftover of: ', leftover)