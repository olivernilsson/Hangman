/*
 * Call: randomWordFromList("words.txt");
 * Get:  Random word (char[]) from the file words.txt
 */

StringList words = new StringList();

//Returns a new random word as a char array from a predefined list.
char[] randomWordFromList(String documentPath) {
  if (words.size() == 0) loadDocument(documentPath); //(re)loads the list if empty
  int randomInt = int(random(0, words.size())); //Randomizes an index within "words"
  String word = words.get(randomInt); //Gets said word
  words.remove(randomInt); //Removes that word form the list: prenvents it from occuring agian.
  char[] splitString = {
  };
  for (int i=0; i<word.length (); i++) {
    splitString = append(splitString, word.charAt(i)); //Splits the word into chars for convenient looping
  }
  println("Word is: " + word);
  return splitString;
}

//Loads the text file containing the random words.
//-- Used by randomWordFromList() --
void loadDocument(String documentPath) {
  String[] lines = loadStrings(documentPath); //Load lines into an array
  if (lines == null) println("Error, couldn't load file"); //Check if it worked
  println("Loaded " + lines.length + " lines"); //For debugging
  for (int i=1; i<lines.length; i++) words.append(lines[i]); //Convert array to StringList, starts at 1 to dissregard the instruction in words.txt
  println("Trimmed down to " + words.size() + " words"); //For debugging
}

