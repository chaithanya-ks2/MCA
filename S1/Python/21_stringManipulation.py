# string manipulation 3
string = input("Enter the string: ")

if string[-3:] == 'ing':
    string += 'ly'
else:
    string += 'ing'

print(string)
