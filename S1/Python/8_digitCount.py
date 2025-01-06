count = 0
num = int(input("Enter the number: "))
temp = abs(num)
while (temp>0):
    count += 1
    temp //= 10
res = lambda num:count if abs(num)>0 else 1
print(f"Number of digits in {num} is {res(num)}")
