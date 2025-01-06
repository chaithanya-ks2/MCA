a = int(input("Enter the first number: "))
b = int(input("Enter the second number: "))

running = True
while (running):
    print("""
1)+    2)-
3)*    4)/
5)Exit
""")
    n = int(input("Enter your choice: "))

    if (n==1):
        print(f"{a}+{b}= {a+b}")
    elif (n==2):
        print(f"{a}-{b}= {a-b}")
    elif (n==3):
        print(f"{a}*{b}= {a*b}")
    elif (n==4):
        if b==0:
            print("Cannot be divided by zero")
        else:
            print(f"{a}/{b}= {round(a/b, 2)}")
    elif n==5:
        running = False
    else:
        print("Invalid option")

