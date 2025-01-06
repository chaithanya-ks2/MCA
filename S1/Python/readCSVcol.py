myFile = open("random_data.csv", "r")

lines = myFile.readlines()
lines = [line.strip().split(",") for line in lines]

headings = lines[0]
print("The columns are:",headings)
col = input("Enter the column to be printed: ")

index = headings.index(col)
for i in range(len(lines)):
    print(lines[i][index], end=" ")
