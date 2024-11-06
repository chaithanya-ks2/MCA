#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX_TRIES 6
#define WORD_LIST_SIZE 5

void printWordWithGuesses(const char *word, const char *guesses);
int checkGuess(const char *word, char guess);
void displayHangman(int tries);
int isWordGuessed(const char *word, const char *guesses);

int main() {
    const char *wordList[WORD_LIST_SIZE] = {"programming", "hangman", "computer", "science", "challenge"};
    char word[50];
    char guesses[50] = {0};
    char guess;
    int tries = 0, wordIndex;

    // Seed the random number generator
    srand(time(NULL));
    
    // Select a random word from the list
    wordIndex = rand() % WORD_LIST_SIZE;
    strcpy(word, wordList[wordIndex]);

    printf("Welcome to Hangman!\n");
    while (tries < MAX_TRIES) {
        // Display current state of the word with guessed letters
        printWordWithGuesses(word, guesses);

        // Get user input
        printf("Enter a letter: ");
        scanf(" %c", &guess);
        guess = tolower(guess);

        // Check if the guessed letter is in the word
        if (checkGuess(word, guess)) {
            printf("Good guess!\n");
        } else {
            printf("Incorrect guess.\n");
            tries++;
        }

        // Check if the word has been completely guessed
        if (isWordGuessed(word, guesses)) {
            printf("Congratulations! You've guessed the word: %s\n", word);
            return 0;
        }

        // Display hangman status
        displayHangman(tries);
    }

    printf("Game over! The word was: %s\n", word);
    return 0;
}

void printWordWithGuesses(const char *word, const char *guesses) {
    int length = strlen(word);
    for (int i = 0; i < length; i++) {
        if (strchr(guesses, word[i])) {
            printf("%c ", word[i]);
        } else {
            printf("_ ");
        }
    }
    printf("\n");
}

int checkGuess(const char *word, char guess) {
    return strchr(word, guess) != NULL;
}

void displayHangman(int tries) {
    printf("\nHangman Status:\n");
    switch (tries) {
        case 0:
            printf("  \n  \n  \n  \n  \n  \n");
            break;
        case 1:
            printf("  |\n  \n  \n  \n  \n  \n");
            break;
        case 2:
            printf("  |\n  O\n  \n  \n  \n  \n");
            break;
        case 3:
            printf("  |\n  O\n  |\n  \n  \n  \n");
            break;
        case 4:
            printf("  |\n  O\n /|\n  \n  \n  \n");
            break;
        case 5:
            printf("  |\n  O\n /|\\\n  \n  \n  \n");
            break;
        case 6:
            printf("  |\n  O\n /|\\\n / \n  \n  \n");
            break;
    }
    printf("\n");
}

int isWordGuessed(const char *word, const char *guesses) {
    int length = strlen(word);
    for (int i = 0; i < length; i++) {
        if (!strchr(guesses, word[i])) {
            return 0; // Word is not fully guessed
        }
    }
    return 1; // Word is fully guessed
}
