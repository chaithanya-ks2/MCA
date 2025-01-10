li = input("Enter the words: ").split()

def max_length(words):
    max = 0
    for word in words:
        if len(word) > max:
            max = len(word)
    
    return max

print(max_length(li))