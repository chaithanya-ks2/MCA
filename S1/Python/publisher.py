class Publisher:
    def __init__(self, name):
        self.publisherName = name

    def display(self):
        print("Publisher:", self.publisherName)


class Book(Publisher):
    def __init__(self, publisher, title, author):
        super().__init__(publisher)
        self.title = title
        self.author = author

    def display(self):
        print("Title:", self.title)
        print("Author:", self.author)
        super().display()


class Python(Book):
    def __init__(self, publisher, title, author, price, no_of_pages):
        super().__init__(publisher, title, author)
        self.price = price
        self.no_of_pages = no_of_pages

    def display(self):
        super().display()
        print("Price:", self.price)
        print("No of pages:", self.no_of_pages)


book1 = Python(" Prentice Hall", "Core Python Programming", "Wesley J. Chun", 800, 1136)
book1.display()
