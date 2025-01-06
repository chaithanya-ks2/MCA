keys = input("Enter the keys: ").split()
dict1 = {}
for key in keys:
    value = input(f"Enter the value for {key}: ")
    dict1[key] = value
print("Original dictionary")
print(dict1)

keys.sort()

dict_sort_asc = {key:dict1[key] for key in keys}
print("Ascending Order")
print(dict_sort_asc)

keys.sort(reverse=True)

dict_sort_dsc = {key:dict1[key] for key in keys}
print("Descending Order")
print(dict_sort_dsc)

