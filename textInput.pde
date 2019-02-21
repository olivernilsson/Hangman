//Global variables
char[] guessesCorrect = new char[0];
char[] guessesFalse = new char[0];
String currentString = ""; //Contains the string to print including underscores, e.g: u n d _ r s c o r _ s

void keyPressed() {
  //Only handle text input on stage 2 (game stage)
  if(stage == 2){
    checkGuess(key);
    currentProgressString();
    consolePrint();
  }
  
  //Temp stage switcher
  if(int(key) >= 49 && int(key) <= 53){
    stage = int(key)-48;
  }
}


//Checks the input and handles where it goes.
// -- Triggerd by keyPressed() -- 
void checkGuess(char input) {
  if (input >= 'A' && input <= 'z') {   //check if it's a char
    if (!alreadyGuessed(input)) {       //Makes sure the char hasnt been guessed already
      if (isInWord(input)) {            //Check if guessed char is part of the word
        guessesCorrect = append(guessesCorrect, key); //Add correct guess to correct guess list
        //println(key + " is correct");
      } else {
        guessesFalse = append(guessesFalse, key);     //Add false guess to false guess list
        //println(key + " is false");
      }
    }
  }
}


//Checks if the guess is in the word
//-- Used by checkGuess --
boolean isInWord(char input) {
  for (int i=0; i<word.length; i++) {
    if (key == word[i]) return true;
  }
  return false;
}


//Checks if the inputted char has already been guessed
//If yes, nothing happens.
//-- Used by checkGuess() --
boolean alreadyGuessed(char input) {
  for (int i=0; i<guessesCorrect.length; i++) {
    if (input == guessesCorrect[i]) return true;
  }
  for (int i=0; i<guessesFalse.length; i++) {
    if (input == guessesFalse[i]) return true;
  }
  return false;
}


//Checks if the player has guessed the word yet.
boolean checkAwnser() {
  for (int i=0; i<word.length; i++) {
    boolean contains = false;
    for (int j=0; j<guessesCorrect.length; j++) {
      if (guessesCorrect[j] == word[i]) {
        contains = true;
        break;
      }
    }
    if (!contains) return false;
  }
  return true;
}


//Updates global currentString
// -- Triggerd by keyPressed() -- 
void currentProgressString() {
  currentString = "";
  for (int i=0; i<word.length; i++) {
    boolean contains = false;
    for (int j=0; j<guessesCorrect.length; j++) {
      if (guessesCorrect[j] == word[i]) {
        contains = true;
        break;
      }
    }
    if (contains) currentString = currentString+ word[i] + " ";
    else currentString = currentString + "- ";
  }
}


//resets all variables containing live game info and calls a new word.
void resetForNewGame() {
  guessesCorrect = new char[0];
  guessesFalse = new char[0];
  currentString = "";
  println("------------------------------");
  println("New game:");
  word = randomWordFromList("words.txt");
  currentProgressString();
}


//Temp function to play the game in the console without GUI
void consolePrint() {
  print(currentString + "[Errors: " + guessesFalse.length + "/" + maxWrongGuesses + "][Taken: ");
  for (int i = 0; i<guessesFalse.length; i++) {
    print(guessesFalse[i] + " ");
  }
  println("]");
  if (guessesFalse.length >= maxWrongGuesses) {
    println("You lose.");
    stage = 3; //Lost
    //    if(endScreen==false){
    //    resetForNewGame();
    //    }
  }
  if (checkAwnser()) {
    println("You win!");
    stage = 4; //Won
    //    if(endScreen==false){
    //    resetForNewGame();
    //    }
  }
}

