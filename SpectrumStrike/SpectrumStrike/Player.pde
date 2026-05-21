class Player {
  float xpos; float ypos;
  color playerColor = color(255);
  
  Player(){
    xpos = SCREENX/2;
    ypos = SCREENY - MARGIN;
  }
  
  //Move the player
  void move() {
      if(movingLeft1 == true && xpos>=PLAYER_WIDTH/2+SCREEN_BORDER){
        if(currentPowerUp == 1){ 
          xpos-= 6;
        }
        else{
          xpos-=3;
        }
      }
      if(movingRight1 == true && xpos<= SCREENX-PLAYER_WIDTH/2-SCREEN_BORDER){
        if(currentPowerUp == 1){
          xpos+= 6;
        }
        else{
          xpos+=3;
        }
      }
  }
  
  //Draw the player
  void draw(){
    // Draw target type indicator around the player
    if(currentTargetType == 1){
      // Pink triangle for Invader1
      noFill();
      stroke(255, 20, 147);
      strokeWeight(3);
      triangle(xpos, ypos - PLAYER_HEIGHT*1.8,
               xpos - PLAYER_WIDTH*0.9, ypos + PLAYER_HEIGHT*1.0,
               xpos + PLAYER_WIDTH*0.9, ypos + PLAYER_HEIGHT*1.0);
    }
    else if(currentTargetType == 2){
      // Cyan circle for Invader2
      noFill();
      stroke(0, 191, 255);
      strokeWeight(3);
      ellipse(xpos, ypos, PLAYER_WIDTH*0.8, PLAYER_HEIGHT*1.6);
    }
    else if(currentTargetType == 3){
      // Green square for Invader3
      noFill();
      stroke(50, 255, 50);
      strokeWeight(3);
      rectMode(CENTER);
      rect(xpos, ypos, PLAYER_WIDTH*1.5, PLAYER_HEIGHT*3.0);
      rectMode(CORNER);
    }
    
    // Draw the player
    fill(playerColor);
    noStroke();
    ellipse(xpos,SCREENY-MARGIN,PLAYER_WIDTH/2,PLAYER_HEIGHT/2);
    rect(xpos-PLAYER_WIDTH/2,ypos,PLAYER_WIDTH,PLAYER_HEIGHT/2);
    rect(xpos-PLAYER_WIDTH/8,ypos-PLAYER_WIDTH/2,PLAYER_WIDTH/4,PLAYER_HEIGHT);
  }
  
  //See if the player has been shot
  void explode(Projectile invaderProjectile){
    if(invaderProjectile.xpos <= xpos+PLAYER_WIDTH/2 && invaderProjectile.xpos >= xpos-PLAYER_WIDTH/2 && invaderProjectile.ypos>= ypos-PLAYER_HEIGHT  && invaderProjectile.ypos <= ypos+PLAYER_HEIGHT){
    bottomHit = true;
    gameSetup = true;}
  }
}
