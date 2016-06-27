class Player {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  float jumpImpulse;
  float gravity;
  PImage mrpoopy;
  float yVelocity;
  Player() {
    jumpImpulse = -9;
    gravity = 0.75;
    objWidth = 50;
    objHeight = 100;
    xPos = 50;
    yPos = (height/2) - objHeight;
    yVelocity = 0;
  mrpoopy = loadImage ("mrpoopy.png");
}
  
  

  // Shows player.
  void show() {
    // WRITE METHOD
    image (mrpoopy, xPos, yPos, objWidth, objHeight);
  }

  // Moves player down.
  void move() {
    // WRITE METHOD
    yVelocity = yVelocity + gravity;
    yPos = yPos + yVelocity;
  }


  // Moves player up.
  void jump() {
    // WRITE METHOD 
    yVelocity = jumpImpulse;
    
    
    
  }
}