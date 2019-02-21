class Button {
  //args
  float x;
  float y;
  float w;
  float h;
  String text;
  color colorHover;
  boolean clicked = false;
  
  //other
  boolean hover = false;
  color colorNormal = 0;
  
  Button(String text_, float x_, float y_, float w_, float h_, color colorHover_) {
    //args
    text = text_;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    colorHover = colorHover_;
  }
  
  void update(){
    hover();
    display();
  }
  
  void display(){
    if(hover) fill(colorHover);
    else fill(colorNormal);
    
    strokeWeight(h);
    strokeCap(ROUND);
    stroke(255);
    line(x-(w/2), y+(h/2), x+(w/2), y+(h/2));
    
    textSize(48);
    textAlign(CENTER, CENTER);
    text(text, x, y+(h/2));
  }
  
  
  void hover(){
    if(checkBoxBoundorys()){
      hover = true;
    }else if(checkRoundedEdges()){
      hover = true;
    }else{
      hover = false;
    }
  }
  boolean checkBoxBoundorys(){
    if(mouseX > x-(w/2) && mouseX < x+(w/2) && mouseY > y && mouseY < (y + h)) return true;
    else return false;
  }
  boolean checkRoundedEdges(){
    if      (dist(mouseX, mouseY, x-(w/2), y+(h/2)) <= h/2) return true;
    else if (dist(mouseX, mouseY, x+(w/2), y+(h/2)) <= h/2) return true;
    else return false;
  }
}

