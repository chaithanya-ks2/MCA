class Location:
    def __init__(self, no_of_rows, no_of_columns):
        self.m = no_of_rows
        self.n = no_of_columns
        self.matrix = Location.read_values(self)

    def read_values(self):
        matrix = []
        for i in range(self.m):
            row = []
            for j in range(self.n):
                val = int(input(f"Enter the value at [{i}][{j}]: "))
                row.append(val)
            matrix.append(row)

        return matrix
    
    def find_max(self):
        max_val = self.matrix[0][0]
        for i in range(self.m):
            for j in range(self.n):
                if self.matrix[i][j] > max_val:
                    max_val = self.matrix[i][j]
                    loc = (i, j)
        
        print(f"Largest value in the matrix is {max_val}")
        print(f"{max_val} is located at index {loc}")


a, b = map(int, input("Enter the number of rows and columns: ").split())
obj1 = Location(a, b)
obj1.find_max()
