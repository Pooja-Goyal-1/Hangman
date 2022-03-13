HANGMAN GAME

This is the famous Hangman game written in Perl.

By: Pooja Goyal
Entry Number: 2020CSB1108

Project Description:

1. The word to guess is represented by a row of dashes, giving the number of letters in the word.
2. If the player suggests a letter which occurs in the word, it writes it in all its correct positions.
3. If the suggested letter does not occur in the word, it draws one element of the hanged man stick figure as a tally mark.
4. The game is over when:
	1. The player completes the word, or guesses the whole word correctly – Player Wins!
	2. Number of tries exceeds a limit (completes the hangman diagram) – Player loses!
	
	
How to play the game?

1. At first, the some blanks will be shown on the screen which represents  a word you have to guess.
2. The number of blanks is equal to the number of letters in the word to be guessed.
3. Now, guess a SINGLE CHARACTER that is present in the word.
4. If the letter guessed is present in the word, it will show the correct places of the letter guessed.
4. If the letter is not present in the word, you make one wrong attempt. 
5. Note that atmost 6 wrong attempts can be made. 6th wrong attempt will make you loose the game.
6. Read the current status of the game on the screen before moving forward.


Important Points about the Game
1. The word selection is random from a list of hardcoded words.
2. The game is modularized using sub-routines.
3. 6th wrong attempt will make you loose the game.
4. Uppercase and lowercase letters are treated same.
5. Any other input except the alphabets ("a to z" and "A to Z") and the complete correct word will be treated as wrong attempt.For example: 2, #, &, abcde, etc. are wrong attempts.
