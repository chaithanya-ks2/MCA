class Person:
    def __init__(self, name, code):
        self.name = name
        self.code = code


class Account(Person):
    def __init__(self, name, code, pay):
        Person.__init__(self, name, code)
        self.pay = pay


class Admin(Person):
    def __init__(self, name, code, experience):
        Person.__init__(self, name, code)
        self.experience = experience
        

class Employee(Account, Admin):
    def __init__(self, name, code, pay, experience):
        Account.__init__(self, name, code, pay)
        Admin.__init__(self, name, code, experience)

    def display(self):
        print("Name:", self.name)
        print("Code:", self.code)
        print("Pay:", self.pay)
        print("Experience:", self.experience)


emp1 = Employee("Adam", "E0230", 15000, 2)
emp1.display()