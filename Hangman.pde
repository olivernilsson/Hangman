import ddf.minim.*;

AudioPlayer player;
Minim minim;

Button play;
Button quit;

char[] word;
int maxWrongGuesses = 9;

int stage = 1; //Where in the program you are

void setup() {
  size(1000, 600);
  bigFont = loadFont("SpaceAge-78.vlw");
  font = loadFont("SpaceAge-48.vlw");
  
  minim = new Minim(this);
  player = minim.loadFile("music.mp3");
  player.play();
  
  play = new Button("Play", (width/2)-200, 500, 200, 50, color(0,255,0));
  quit = new Button("Quit", (width/2)+200, 500, 200, 50, color(255,0,0));
  
  loadImages();
  textFont(font, 48);
}

void draw() {
  drawStage();
}

void mouseClicked() {
  if(play.hover){
    resetForNewGame();
    stage = 2;
    play.hover = false;
  }else if(quit.hover){
    exit();
  }
}
