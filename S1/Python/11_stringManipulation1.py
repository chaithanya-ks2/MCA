word = input("Enter a word: ")
if len(word)>1:
    word2 = word[-1] + word[1:-1] + word[0]
    print(word2)
else:
    print("Length of word is too small to swap. The word remains", word)