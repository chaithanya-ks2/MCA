num = int(input("Enter the number: "))
for i in range(1, num+1):
    print()
    for j in range(i):
        print("*", end=' ')
for i in range(num, 0, -1):
    print()
    for j in range(i-1):
        print("*", end=' ')
        

