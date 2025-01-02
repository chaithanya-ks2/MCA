data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'],
    'Age': [25, 30, 35, 28, 22],
    'City': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'],
    'Score': [85, 90, 88, 92, 95]
}

with open("persons.csv", "w") as myfile:
    keys = list(data.keys())
    myfile.write(",".join(keys))

    recordCount = len(data[keys[0]])

    for i in range(recordCount):
        myfile.write("\n")
        li = []
        for key in data.keys():
            li.append(str(data[key][i]))
        myfile.write(",".join(li))


with open("persons.csv", "r") as file2:
    records = [i.strip() for i in file2.readlines()]
    for i in records:
        print(i)