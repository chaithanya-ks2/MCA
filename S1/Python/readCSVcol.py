myFile = open("random_data.csv", "r")
lines = myFile.readlines()
lines = [line.strip().split(",") for line in lines]
myFile.close()

for i in range(len(lines[0])):
    for j in range(len(lines)):
        print(lines[j][i], end=" ")
    print()
