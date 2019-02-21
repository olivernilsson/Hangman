/*
 * Call: drawWarOfAnts();
 * Get:  Ne frame of War of ants on every call.
 */

//background settings
int background_tileHeight = 5;
int background_tileWidth = 10;
int background_tileWidthVariation = 5;

void drawWarOfAnts(int posX, int posY, int boxWidth, int boxHeight){
  noStroke();
  int randint = 0;
  for(int h=posY; h<boxHeight+posY+background_tileHeight; h += background_tileHeight){
    randint = 0;
    for(int w=posX; w<boxWidth+posX+background_tileWidth; w += background_tileWidth){
      
      fill(random(0, 255));
      randint = int(random(-background_tileWidthVariation, background_tileWidthVariation));
      rect(w, h, background_tileWidth + randint, background_tileHeight);
      w += randint;
    }
  }
}
