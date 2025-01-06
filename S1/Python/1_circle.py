import math
r = int(input("Enter the radius: "))
perimeter = round(2*math.pi*r, 2)
area = round(math.pi*r*r, 2)

print(f"Area: {area}\n Perimeter: {perimeter}")
