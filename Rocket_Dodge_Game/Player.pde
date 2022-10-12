public class Player{
  
  
  
  float PlayerXpos;
  float PlayerYpos;
  
  
  Player(){
      
   
      
  }
  
  void display(){
     
    
    //Makes hitbox of player invisible
    rectMode(CENTER);
    noFill();
    noStroke();
    rect(mouseX,mouseY,75,75); 
    
    float PlayerXpos = mouseX;
    float PlayerYpos = mouseY;
    
  }
  
  //makes hit player hit box follow the mouse
  void newPos(){
    PlayerXpos = mouseX;
    PlayerYpos = mouseY;
  }
  
  
 }
