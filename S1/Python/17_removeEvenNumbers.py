numbers = map(int, input("Enter the numbers separated by space: ").split())
odd = [num for num in numbers if num%2 != 0]
print(odd)
