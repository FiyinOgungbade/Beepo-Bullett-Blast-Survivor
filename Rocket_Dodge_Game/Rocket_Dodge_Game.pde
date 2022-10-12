
int difficulty = 15;  // Establish amount of Rockets Spawned

//Import Images
PImage playerImage;
PImage playerImage2;
PImage rocketImageL;  
PImage rocketImageR;


Rocket[] rocket = new Rocket[difficulty];
Player player = new Player();


; // create a opy of our object

int score = 0;
int timeThrough =  1 ;
int FTT = 0;  // First time through?
boolean alive = true;
boolean flicker = false ;


void setup(){
  
  size (600,1000);
  noCursor();
  for(int i = 0; i < rocket.length; i++) {
    rocket[i] = new Rocket(i);
    
    

  }
  
  imageMode(CENTER);
  
  playerImage = loadImage("RGPlayerV4.png");
  playerImage2 = loadImage("RGPlayerV2.png");
  rocketImageL = loadImage("RGRocketV4L.png");
  rocketImageR = loadImage("RGRocketV4R.png");
}






void draw(){
  
  
  
  
  if(alive == true){
     
    
  background(#808080);
  

  
  
  //displays the player and the rockets
  player.display();
  
  for(int i = 0; i < rocket.length; i++) {
    
   rocket[i].display(rocketImageL, rocketImageR);
   rocket[i].move();


// Increase rocket speed every 10 seconds
if (frameCount % 600 == 0){
    rocket[i].speedUp();   
    }
    println(FTT);
    
   // println(alive);

//draws the graphic of the player (Not the hitbox)
image(playerImage, mouseX, mouseY);






//Ends Game if you get hit by a rocket that is currently drawn on screen

  if(rocket[i].visual == true){
  //test if player hitbox is colliding with a rocket hit box
    if(mouseX > rocket[i].RocketXpos -150 && mouseX < rocket[i].RocketXpos + 150  ){
      println("oh no"); //debugging
    
      if(mouseY > rocket[i].RocketYpos - 65 && mouseY < rocket[i].RocketYpos + 80){
    
        println("Your are dead");  // Debugging
      
      
        background(#808080);
        fill(#FF0000);
       
        text("You Have Died!", 200, 375);
        fill(0);
        text("Your Score is : " + score, 190, 475);
      
        alive=false;
        break;
    
      }
    else{
      println("Your are alive"); // Debugging
      
     
    }
  }
  else{
    println("Your are alive"); // Debugging
   
  }
  
  }
  else {
    println("Your are alive"); // Debugging
   
  }



  }
  
  
  
  //allow a new rocket to be visualized every 5 seconds
    if(timeThrough < difficulty){
      if (frameCount % 300 == 0){
      rocket[timeThrough].visual();
      
      timeThrough++;
    }
    }


  
  // draw current Score
  textSize(30);
  fill(0);
  
  
 if (frameCount % 30 == 0){  
  score = score+1;
 }
  textAlign(LEFT);
  text("Your Score is : " + score, 15, 35);
  
  
  
  if(FTT==0){
  if (frameCount < 600){
    rectMode(CENTER);
    stroke(3);
    fill(255);
    rect(300,230,550,200);
    
    textMode(CENTER);
    textAlign(CENTER);
    textSize(30);
    fill(0);
    text("Welcome to Beepo's Bullet Blitz \n Dodge the Rockets with the mouse \n Press Enter to restart" , 300, 200);
    
    
    
    
    }
  }
  
  if (frameCount > 300){
    FTT = 1;
    }
  
  
  
  
  }
  else{
    //Draw Death Screen (Score, Text, and Image)
    background(#808080);
    image(playerImage2, 300, 750);
    fill(#FF0000);
    textAlign(LEFT);
    textSize(55);
    text("You Have Died!", 100, 200);
    fill(0);
    text("Your Score is : " + score, 60, 375);
    
    
  }
}



// Restarts the Game if Enter is Pressed
void keyPressed() {
    if(key == ENTER)
    {
       alive = true;
       score = 0;
       timeThrough =  1 ;
       
       
       for(int i = 0; i < rocket.length; i++) {
    
   rocket[i].restart();
    }
  }
}
   

  
