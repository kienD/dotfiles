#!/usr/bin/python

import functools

print ("Electricity Bill Calc")

carDailyUsage = 3

def calcMonthlyCarCost():
    kwhCarCost = float(input("kwh car cost: "))
    kwhCarUsage = float(input("kwh car usage: "))

    return kwhCarCost * carDailyUsage * kwhCarUsage

def splitBill(totalBill, peopleCount):
    return (totalBill - calcMonthlyCarCost()) / peopleCount

def main():
    totalBill = float(input("Total Bill Amount: "))
    peopleCount = float(input("Total Amount of People that are involved: "))

    print (splitBill(totalBill, peopleCount))

    return 

main()
