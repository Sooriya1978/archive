# -*- coding: utf-8 -*-
"""
Created on Tue May 28 20:11:53 2013

@author: thiago
"""

grades = [100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]

def grades_sum(grades):
    total = 0
    for i in grades:
        total +=i
    return total
def grades_average(grades):
    return grades_sum(grades)/len(grades)
print grades_average(grades)

def grades_variance(grades,average):
    variance = 0
    for i in grades:
        variance += (i - average)**2
    return variance/len(grades)
print grades_variance(grades,grades_average(grades))

def grade_std_deviation(variance):
    return variance**0.5
print grade_std_deviation(grades_variance(grades,grades_average(grades)))
