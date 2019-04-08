void saveFile(){
  String fileName = "Character "+"font16"+number+".txt";
  println(fileName);
  File c_file = new File(fileName);
  {
    try{
      PrintWriter c_values = new PrintWriter(c_file);
      for (int j=0; j<y_pixels/8; j++){
          for (int i=0; i<x_pixels; i++){
            if ( j == 0 ){
            c_values.print((val[i]&255)+", ");
            }
            else{
            c_values.print((val[i]>>8)+", ");
            }
          }
          c_values.println();
        }
        c_values.close();
        number++;
    }
    catch(IOException ex){
    
    }
  }
}
