myFile = open("random_data.csv", "r")
lines = myFile.readlines()
lines = [line.strip() for line in lines]
print(lines)
myFile.close()
