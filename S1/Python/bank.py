class Bank:
    def __init__(self, acc_num, name, acc_type, balance=0):
        self.acc_num = acc_num
        self.name = name
        self.acc_type = acc_type
        self.balance = balance
        print("----Welcome to XYZ bank...---\n")

    def display_details(self):
        print("Account Number:", self.acc_num)
        print("Name:", self.name)
        print("Account Type:", self.acc_type)
        print("Balance:", self.balance)
        print("\n")

    def deposit(self):
        amount = int(input("Enter the amount to be deposited: "))
        if (amount>=0):
            self.balance += amount
            print(f"{amount} deposite successfully!")
            print(f"Current balance is {self.balance}\n")
        else:
            print("Amount cannot be less than 0\n")

    def withdraw(self):
        amount = int(input("Enter the amount to be withdrawn: "))
        if (amount<self.balance):
            self.balance -= amount
            print(f"{amount} withdrawn successfully!")
            print(f"Current balance is {self.balance}\n")
        else:
            print("Insufficient balance\n")


user1 = Bank("123456789", "Arjun", "current", 1000)
user1.display_details()
user1.deposit()
user1.withdraw()