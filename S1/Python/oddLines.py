myFile = open("sample.txt", "r")
lines = myFile.readlines()
lines = [line.strip() for line in lines]
myFile.close()

file2 = open("myfile.txt", "w")
for i in range(0, len(lines), 2):
    file2.write(lines[i])
file2.close()



