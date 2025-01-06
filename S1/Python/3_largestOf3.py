a, b, c = [int(num) for num in input("Enter 3 numbers: ").split()]

if (a>b and a>c):
    print(a, "is largest")
elif (b>a and b>c):
    print(a, "is largest")
else:
    print(c, "is largest")

