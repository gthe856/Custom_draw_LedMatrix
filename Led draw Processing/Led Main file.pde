int x_start=25, y_start=25;
int x_pixels=8, y_pixels=16;
int sep=1;
Rectangle[][] R = new Rectangle[x_pixels][y_pixels];
int[] val = new int[x_pixels];
int number=0;
char num;
void setup(){
  size(400,800);
  int w = (width-2*x_start)/x_pixels - sep;
  int h = (height-2*y_start)/y_pixels - sep;
  //println(w," ",h);
  int y=y_start,x=x_start;
  for (int i = 0; i<y_pixels; i++){
    for(int j=0; j<x_pixels; j++){
      if (j == 0){
        x = x_start;
      }
      else{
        x = x+w+sep;
      }
      R[j][i] = new Rectangle(x,y,w,h);
    }
    y = y+h+sep;
  }
}

void draw(){
 background(175);
 if (number >=0 && number <=9){
   num = (char)map(number, 0,9,'0','9');
 }
 else if (number >9 && number <=35){
   num = (char)map(number, 10,35,'A','Z');
 }
 else if (number >35 && number <=61){
   num = (char)map(number, 36,61,'a','z');
 }
 text(num, 10,10);
 text(number, 10,20);
 
  for (int i=0; i<x_pixels; i++){
    val[i]=0;
    for (int j=0; j<y_pixels; j++){
      if (R[i][j].clicked == true){
        val[i] = val[i] + (int)pow(2,j);
      } 
      
    }
    text(val[i], R[i][0].x,15);
    text(rev(val[i]),R[i][0].x, height-15); 
    //println(val[i]);
  }
  for (int i=0; i<y_pixels; i++){
    for (int j=0; j<x_pixels; j++){
      R[j][i].highlight();
      R[j][i].show();
      
    }
  }
  if (mousePressed){
       if (mouseButton == LEFT){
        for (int i=0; i<y_pixels; i++){
          for (int j=0; j<x_pixels; j++){
           R[j][i].click(true);   
          }
        }
     }
     else if (mouseButton == RIGHT){
        for (int i=0; i<y_pixels; i++){
          for (int j=0; j<x_pixels; j++){
           R[j][i].click(false);   
          }
        }
     }
  }
}
void keyPressed(){
  if (key == 'R'){
    for (int i=0; i<y_pixels; i++){
      for (int j=0; j<x_pixels; j++){
        R[j][i].clicked=false;
      }
    }
  }
  else if (key == ' '){
    println("save file ",number);
    saveFile();
  }
  if ( keyCode == LEFT){
    number--;
  }
  else if ( keyCode == RIGHT){
    number++;
  }
}
int rev(int val){
   int new_byte=0;
  for (int i=0,j=7; i<8; i++,j--){
    int v = val>>j & 1;
    new_byte = new_byte+ (v *(1<<i));
  }
  return new_byte;
}
