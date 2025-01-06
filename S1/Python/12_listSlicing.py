colours = input("Enter the colours: ").split()
if len(colours)>1:
    print("first colour:", colours[0])
    print("second colour:", colours[-1])
elif len(colours)==1:
    print("Only one color in the list:", colours[0])
else:
    print("No colours entered.")
