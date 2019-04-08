class Rectangle{
  int x,y,w,h;
  boolean highlighted,clicked;
  Rectangle(int x, int y, int w, int h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  void highlight(){
     if ((mouseX>=this.x && mouseX<=this.x+this.w) &&
        (mouseY>=this.y && mouseY<=this.y+this.h)){
        highlighted = true;  
      }  
      else{
        highlighted = false;
      }
  }
  void click(boolean state){
     if ((mouseX>=this.x && mouseX<=this.x+this.w) &&
        (mouseY>=this.y && mouseY<=this.y+this.h)){
        clicked = state;  
      } 
  }
  void show(){
    if (clicked == true){
      fill(255,0,0);
    }
    else if ( highlighted == true){
      fill(125);
    }
    else{
      fill(255);
    }
    rect(this.x,this.y,this.w,this.h);
  }
  
}
