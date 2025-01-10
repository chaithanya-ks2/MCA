import math

string = input("Enter the string: ").strip()
n = int(input("Enter the number of lines: "))
# calculating characters per line
m = math.ceil(len(string)/n)

for i in range(n):
    start = i * m
    end = start + m
    print(string[start:end])
          

