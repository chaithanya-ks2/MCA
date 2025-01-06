# Character frequency
'''
string = input("Enter the string: ")
ch = input("Enter the character to search: ")
count = 0
for i in string:
    if i == ch:
        count += 1

print(count)
'''
string = input("Enter the string: ").lower()
unique = set(string)


for i in unique:
    count = 0
    for j in string:
        if i == j:
            count += 1
    print(f"count of {i} in {string} is {count}")

