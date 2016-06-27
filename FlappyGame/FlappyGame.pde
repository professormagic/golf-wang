import processing.sound.*;
int score;

int gameState; // 0 = start, 1 = running, 2 = over
PImage Buns;
Pipe pipeOne;
SoundFile bgMusic;
SoundFile death;
Player mrpoopybutthole;
void setup() {
  size(500, 500);
  score = 100;
  gameState = 0;
  mrpoopybutthole = new Player();
  pipeOne = new Pipe(1);
  Buns = loadImage("avatar in space.jpg");
pipeOne = new Pipe(1);
bgMusic = new SoundFile ( this, "bgMusic.mp3");
bgMusic.loop();
death = new SoundFile (this,"death.mp3");
}


void draw() {
  
  image(Buns,0,0,width,height);
  if (gameState == 0) {
    // game start
    textSize(45);
    fill(255);
    text(" Golf Wang", 200, 200);
    mrpoopybutthole.show();
  } else if (gameState == 1) {
    // game running
    // PHYSCIS
    mrpoopybutthole.move();
    mrpoopybutthole.show();
    pipeOne.show();
    pipeOne.move();

    //GAME LOGIC
    //check if player is off screen
    if (mrpoopybutthole . yPos < 0 || mrpoopybutthole . yPos + mrpoopybutthole.objHeight > height)
    {
      boolean play = false;
      death.play();
      gameState = 2;
      if (play = true) {
        bgMusic.stop();
      }bgMusic.stop();
    }
    // check if player hits pipe
    if (mrpoopybutthole.xPos < pipeOne.xPos+ pipeOne.objWidth
      && mrpoopybutthole.xPos + mrpoopybutthole.objWidth > pipeOne.xPos
      && mrpoopybutthole.yPos < pipeOne.yPos + pipeOne.objHeight
      && mrpoopybutthole.yPos + mrpoopybutthole.objHeight> pipeOne.yPos) {
        bgMusic.stop();
      gameState = 2;
    }
    // increase score when pipe is passsed
    if (pipeOne.counted == false && pipeOne.xPos + pipeOne . objWidth < mrpoopybutthole.xPos) {
      score = score + 1;
      pipeOne.counted = true;
    }

    text(score, 55, 85);
  } else { // gameState == 2
    // game over
    text(score, 55, 85);
    fill(0);
    textSize(50);
    text("game over ", width/2, height/2);
  }
}
void keyPressed() {
  if (key == ' ' && gameState == 0)
    gameState = 1;

  if (key == ' ' && gameState == 1) {
    mrpoopybutthole.jump();
    
    
    
  }
   if (key == ' ' && gameState == 2) {
    mrpoopybutthole.jump();
    score = 0;
    gameState = 1;
    mrpoopybutthole = new Player();
    pipeOne = new Pipe(1);
    mrpoopybutthole.jump();
    bgMusic.loop();
}}