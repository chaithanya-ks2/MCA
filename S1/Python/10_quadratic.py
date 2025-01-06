import math
import cmath

a = int(input("Enter the coefficient of x^2: "))
b = int(input("Enter the coefficient of x: "))
c = int(input("Enter the constant: "))

d = b**2 - (4*a*c)

if (d<0):
    #print("No solution")
    root1 = (-b+cmath.sqrt(d))/(2*a)
    root2 = (-b-cmath.sqrt(d))/(2*a)
    print(f"Result: {root1}, {root2}")
elif (d==0):
    root1 = (-b/(2*a))
    print("Result:", root1)
else:
    root1 = (-b+math.sqrt(d))/(2*a)
    root2 = (-b-math.sqrt(d))/(2*a)
    print(f"Result: {root1}, {root2}")

