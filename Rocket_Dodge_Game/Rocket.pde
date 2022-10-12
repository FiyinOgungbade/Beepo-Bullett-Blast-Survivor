 class Rocket{
  
  
  // define variables - local to object
  
  int objectID;
  float y;
  float diameter;
  
  float RocketXpos = 0;
  float xspeed = 20;
  
  float RocketYpos = 0;
  
  int directionPos = 1;
  int directionNeg = -1;
  
  float LoR;
  
  boolean hit;
  boolean visual;
  boolean gameOn = true;
  
  
  
  // initializes a rocket
  Rocket (int myObjectID){
      
    objectID = myObjectID;
      
      
      //decides if a rocket faces the left or right
    LoR = int(random(1,3));
      
      
    if ( LoR == 1){
        
      RocketXpos = -25;
      RocketYpos = random(30,970);
        
      xspeed = .75 * directionPos ;
        
    }
    if ( LoR == 2){
        
      RocketXpos = 600;
      RocketYpos = random(30,970);
        
      xspeed = .75 * directionNeg ;
        
    }
      
      
  }
 
  
  
  void restart(){
    visual = false;
    xspeed = 0;
    
    LoR = int(random(1,3));
  
    if ( LoR == 1){   
      xspeed = +.5;
    }
    if ( LoR == 2){
      xspeed = -.5; 
    }
  
  
  }
  
  
  
  
  //visualizes a rocket (only visualized rockets have a hit box)
  void visual(){
    
    visual = true;
    
    if ( LoR == 1){
        RocketXpos = -25;
      
        
    }
    if ( LoR == 2){
        RocketXpos = 600;
      
        
    }
    
    
  }
  
  
  //Rockets require a Left facing image and a right facing image
  void display(PImage rocketImageL, PImage rocketImageR){
    
    
    
    if (visual == true){
   float myShapeXpos = RocketXpos;
   float myShapeYpos = RocketYpos;
   
   
   //makes the hitbox of the rocket invisible so that it does not disturb the flow of immersement 
   noFill();
   noStroke();
   rect(myShapeXpos,myShapeYpos, 200, 60);
   
   
   if(LoR == 1){
   image(rocketImageR, myShapeXpos,myShapeYpos);
   
    }
    
   if(LoR == 2){
   
   image(rocketImageL, myShapeXpos,myShapeYpos);
   
    }
   
   
   
   
    }
    
    println(hit);
  
}
  

  
  //moves the rocket
  void move(){
    RocketXpos = RocketXpos + xspeed;
    
    
    
    if(LoR == 1){
    
      if (RocketXpos > width+25) {
        RocketXpos = -25;  
        RocketYpos = random(30,970);
       // LoR = int(random(1,3));
      }
     
    }
    
    
    if(LoR == 2){
    
      if (RocketXpos < -25) {
        RocketXpos = 625;
        RocketYpos = random(30,970);
       // LoR = int(random(1,3));
      }
     
    }
    
    
 
  }
  
  
  
  void speedUp(){
    
    if(LoR == 1){
    
      xspeed = xspeed + .5;
      
      if(xspeed >= 8)
        xspeed = random(4,8);
      }
     
    
    
    if(LoR == 2){
    
     xspeed = xspeed - .5;
      
      if(xspeed <= -8)
        xspeed = random(-4,-8);
     
    }
    
  }
  
  
  
  
  // Unused method, moved to main program to make the program work but kept here for documentation
 boolean checkIfDead(){

   
  if(visual == true){
  
  if(mouseX > RocketXpos && mouseX < RocketXpos + 200  ){
    println("oh no");
    
    if(mouseY > RocketYpos && mouseY < RocketYpos + 60 ){
    
      println("Your are dead");
      hit = true;
      
      background(#808080);
    fill(#FF0000);
    text("You Have Died!", 200, 375);
    fill(0);
    text("Your Score is : " + score, 190, 475);
      
      gameOn=false;
    return false;
    
    }
    else{
      println("Your are alive");
     return true; 
     
    }
  }
  else{
    println("Your are alive");
   return true; 
  }
  
  }
  else {
    println("Your are alive");
   return true; 
  }
  
  


 }
  
  
}
