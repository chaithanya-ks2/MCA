states = input("Enter the states: ").split()
state_dict = {state: len(state) for state in states}

# sort dictionary by value
def sort_dict(dicts):
    state_dict_sorted = dict(sorted(dicts.items(), key=lambda items: items[1]))
    return state_dict_sorted

# writing into csv file
def write_csv(state_dict_sorted):
    with open("states.csv", "w") as myfile:
        for state, length in state_dict_sorted.items():  
            myfile.write(",".join([state, str(length)]))
            myfile.write("\n")

#reading from csv file
def read_csv():
    with open("states.csv", "r") as myfile:
        lines = myfile.readlines()
        lines = [line.strip() for line in lines]
        for line in lines:
            print(line, end=" ")
            print()

sorted = sort_dict(state_dict)
write_csv(sorted)
read_csv()

# updating state list
ans = input("Do you want to update states (y/n): ")
if ans == "y":
    state = input("Enter the state: ")
    state_dict[state] = len(state)

    sorted = sort_dict(state_dict)
    write_csv(sorted)
    read_csv()

