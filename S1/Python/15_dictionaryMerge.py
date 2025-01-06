keys = input("Enter the keys for first dictionary: ").split()
dict1 = {}
for key in keys:
    value = input(f"Enter the value for {key}: ")
    dict1[key] = value

keys = input("Enter the keys for second dictionary: ").split()
dict2 = {}
for key in keys:
    value = input(f"Enter the value for {key}: ")
    dict2[key] = value

dict3 = dict1
dict3.update(dict2)
print(dict3)
