//Images
PImage tv;
PImage meteor;
PImage meteorRain;
PImage tree;

//Font
PFont bigFont;
PFont font;

//Posistions
int falseGuessX=40;
int falseGuessY=520;
int index=100;
String wrongGuesses="";

void loadImages(){
  tv = loadImage("tv.png");
  meteor=loadImage("meteor.png");
  meteorRain=loadImage("meteorrain.png");
  tree=loadImage("tree.png");
}

void drawStage(){
  switch(stage){
    case 1:
      //Start screen
      drawBackground();
      drawTrees();
      drawTV();
      drawOverlay();
      textAlign(CENTER);
      fill(255);
      textFont(bigFont, 78);
      text("Save the world!", width/2, 150);
      strokeWeight(8);
      strokeCap(ROUND);
      stroke(255);
      line(width/4, 205, (width/4)*3, 205);
      textFont(font, 48);
      text("A  comet  is  coming,  the", width/2, 300);
      text("Earth  is  doomed  unless", width/2, 350);
      text("you  can  save  it!", width/2, 400);
      play.update();
      quit.update();
      break;
      
    case 2:
      //Playing the game
      drawBackground();
      drawMeteor();
      drawTrees();
      drawTV();
      correctGuessDrawn();
      alreadyGuessedDrawn();
      break;
    
    case 3:
      //Lost the game
      drawWarOfAnts(100,110,560,400);
      drawTV();
      drawOverlay();
      textAlign(CENTER);
      fill(255);
      textFont(bigFont, 78);
      text("Pathetic.", width/2, 150);
      strokeWeight(8);
      strokeCap(ROUND);
      stroke(255);
      line(width/4, 205, (width/4)*3, 205);
      textFont(font, 48);
      text("The  world  is  ruined", width/2, 300);
      text("and  your  bunker  won't", width/2, 350);
      text("save  you  from  hunger.", width/2, 400);
      play.hover();
      play.display();
      quit.hover();
      quit.display();
      break;
    
    case 4:
      //Won the game
      drawBackground();
      drawTrees();
      drawTV();
      drawOverlay();
      textAlign(CENTER);
      fill(255);
      textFont(bigFont, 78);
      text("Amazeballs!", width/2, 150);
      strokeWeight(8);
      strokeCap(ROUND);
      stroke(255);
      line(width/4, 205, (width/4)*3, 205);
      textFont(font, 48);
      text("You  saved  the", width/2, 300);
      text("world  using  " + doGrammar(), width/2, 350);
      text(currentString, width/2, 400);
      play.update();
      quit.update();
      break;
  }
}

String doGrammar(){
  String[] vowels = {"a", "e", "i", "o", "u", "y"};
  boolean isVowel = false;
  String firstLetter = currentString.substring(0,1);
  for(int i = 0; i<vowels.length; i++){
    if(firstLetter.equals(vowels[i])){
      isVowel = true;
      break;
    }
  }
  if(isVowel) return "an  ";
  else return "a  ";
}

void drawOverlay(){
  noStroke();
  fill(0,0,0,200);
  rect(0,0,width,height);
}
void drawTV() {
  image(tv, 0, 0);
}
void drawBackground(){
  image(meteorRain, 0, 0);
}
void drawMeteor() {
  float shake = random(0,(guessesFalse.length+1)/2);
  image(meteor, 50+shake, (height/2-150)+shake, 50*(guessesFalse.length+2), 30*(guessesFalse.length+2));
}
void drawTrees(){
  image(tree, -150, 200, 480, 582);
  image(tree, 500, 150, 480, 582);
}


void alreadyGuessedDrawn() {
  fill(255);
  textFont(font, 48);
  for (int i=0; i< guessesFalse.length; i++) {  
    text(guessesFalse[i], falseGuessX+(index*i), falseGuessY);
  }
}
void correctGuessDrawn() {
  fill(220);
  textFont(font, 48);
  textAlign(CENTER);
  text(currentString, width/2, 480);
}

