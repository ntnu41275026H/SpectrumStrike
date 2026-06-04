
//Method for drawing different parts of the screen
void drawLayout(){
  //Draw top bar
  fill(255);
  rect(0,0,SCREENX,30);
  textFont(gameFont,25);
  textAlign(CENTER);
  fill(0);
  text("Spectrum Strike",SCREENX/2,23);
  textAlign(LEFT);
  text("Score: ",SCREEN_BORDER+2,23);
  text(score,60,23);
  stroke(255);
  line(0,0,0,SCREENY);
  line(1,0,1,SCREENY);
  line(SCREENX-1,0,SCREENX-1,SCREENY);
  line(SCREENX-2,0,SCREENX-2,SCREENY);
  line(0,SCREENY-1,SCREENX,SCREENY-1);
  line(0,SCREENY-2,SCREENX,SCREENY-2);
  line(0,SCREENY-2*MARGIN,SCREENX,SCREENY-2*MARGIN);
  if(stash==0){}
  //If player has power-up, draw it on the top bar, with its particular power-up configuration
  else{ 
    fill(255);
    stroke(255,0,0);
    ellipse(SCREENX-100,MARGIN/2,13,13);
    noStroke();
    fill(255,0,0);
    if(stash==1){
      triangle(SCREENX-100,MARGIN/2-.3*POWER_UP_HEIGHT,SCREENX-100,MARGIN/2,SCREENX-100-.2*POWER_UP_WIDTH,MARGIN/2);
      triangle(SCREENX-100,MARGIN/2+.3*POWER_UP_HEIGHT,SCREENX-100,MARGIN/2,SCREENX-100+.2*POWER_UP_WIDTH,MARGIN/2);
    }
    else if(stash==2){
      ellipse(SCREENX-100,MARGIN/2,.2*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    }
    else if(stash==3){
      textAlign(CENTER);
      text("3",SCREENX-98,MARGIN/2+10);
    }
    else if(stash==4){
      rect(SCREENX-100-.2*POWER_UP_WIDTH,MARGIN/2-.2*POWER_UP_HEIGHT,.4*POWER_UP_WIDTH,.4*POWER_UP_HEIGHT);
    }
  }
  //If the player is using a power-up, draw the time left with it
  if(currentPowerUp != 0){
    textAlign(RIGHT);
    fill(255,0,0);
    text("PU "+powerUpTime,POWER_UP_COUNTDOWN_X,POWER_UP_COUNTDOWN_Y);
  }
}

void switchTargetType(int targetType){
  if(currentTargetType != targetType){
    currentTargetType = targetType;
    modeSwitchEffectTimer = FRAMES_PER_SECOND/4;
    invaderDeath.rewind();
    invaderDeath.play();
  }
}

void drawTransientEffects(){
  if(modeSwitchEffectTimer > 0){
    noFill();
    strokeWeight(2);
    if(currentTargetType == 1){
      stroke(255,20,147,180);
      triangle(thePlayer.xpos, thePlayer.ypos - PLAYER_HEIGHT*2.2,
               thePlayer.xpos - PLAYER_WIDTH*1.2, thePlayer.ypos + PLAYER_HEIGHT*1.2,
               thePlayer.xpos + PLAYER_WIDTH*1.2, thePlayer.ypos + PLAYER_HEIGHT*1.2);
    }
    else if(currentTargetType == 2){
      stroke(0,191,255,180);
      ellipse(thePlayer.xpos, thePlayer.ypos, PLAYER_WIDTH*1.6, PLAYER_HEIGHT*3.2);
    }
    else if(currentTargetType == 3){
      stroke(50,255,50,180);
      rectMode(CENTER);
      rect(thePlayer.xpos, thePlayer.ypos, PLAYER_WIDTH*2.1, PLAYER_HEIGHT*3.8);
      rectMode(CORNER);
    }
    modeSwitchEffectTimer--;
  }
  if(playerHitEffectTimer > 0){
    noStroke();
    fill(255,0,0,70);
    rect(0,0,SCREENX,SCREENY);
    fill(255,120,120,200);
    ellipse(thePlayer.xpos, thePlayer.ypos, PLAYER_WIDTH*2.2, PLAYER_HEIGHT*2.2);
    playerHitEffectTimer--;
  }
}


//Deal with any key being pressed at any stage of the game
void keyPressed(){
  
  //MENU SCREEN
  if(onMenuScreen==true){
    if(keyPressed){
        if(keyCode==UP){currentSelection+=1;}
        else if(keyCode==DOWN){currentSelection-=1;
      }
        else if(selection1 == true && key=='\n'){
          score =0 ;
          onMenuScreen = false;
          gameSetup = true;
          // Reset shield initializer arrays to original pattern
          shieldPiece1ArrayInitialiser = new int[][] {
            { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
            { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
            { 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0 },
            { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 },
            { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }};
          shieldPiece2ArrayInitialiser = new int[][] {
            { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
            { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
            { 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0 },
            { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 },
            { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }};
          shieldPiece3ArrayInitialiser = new int[][] {
            { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
            { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
            { 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0 },
            { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 },
            { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }};
          shieldPiece4ArrayInitialiser = new int[][] {
            { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
            { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
            { 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0 },
            { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 },
            { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }};
          // Reset shield arrays to initial positions (off-screen)
          for(int i=0;i<shieldPiece1Array[0].length;i++){
            for(int j=0;j<shieldPiece1Array.length;j++){
              shieldPiece1Array[j][i] = new ShieldPiece(999,999);
              shieldPiece2Array[j][i] = new ShieldPiece(999,999);
              shieldPiece3Array[j][i] = new ShieldPiece(999,999);
              shieldPiece4Array[j][i] = new ShieldPiece(999,999);
            }
          }
        }
        else if(selection2 == true && key=='\n'){
          onMenuScreen = false;
          onHowToPlayScreen = true;
        }
        else if(selection3 == true && key=='\n'){
          onMenuScreen = false;
          onHighScoresMenu = true;
        }
      }
  }
  
  //HIGH SCORE MENU
  else if(onHighScoresMenu==true){
    if(keyPressed){
      if(key == '\n' && typing.length()>0) {
        saved = typing;
        typing = "";
        initialsEntered = true;
      }
      else if (keyCode == BACKSPACE && typing.length()>0) {
        typing = typing.substring(0, typing.length()-1);
      } 
      else if (keyCode == LEFT) {
        onHighScoresMenu = false;
        onMenuScreen = true;
        // Reset shield arrays when returning to menu
        for(int i=0;i<shieldPiece1Array[0].length;i++){
          for(int j=0;j<shieldPiece1Array.length;j++){
            shieldPiece1Array[j][i] = new ShieldPiece(999,999);
            shieldPiece2Array[j][i] = new ShieldPiece(999,999);
            shieldPiece3Array[j][i] = new ShieldPiece(999,999);
            shieldPiece4Array[j][i] = new ShieldPiece(999,999);
          }
        }
      }
      else{
        if(typing.length()<3 && (('a'<=key && key<='z')||('A'<=key && key<='Z'))){
          typing = typing + key;
          typing = typing.toUpperCase();
        }
      }
    }
  }
  
  //HOW TO PLAY SCREEN
  else if(onHowToPlayScreen==true){
    if(keyPressed){
      if (keyCode == LEFT) {
        onHowToPlayScreen = false;
        onMenuScreen = true;
        // Reset shield arrays when returning to menu
        for(int i=0;i<shieldPiece1Array[0].length;i++){
          for(int j=0;j<shieldPiece1Array.length;j++){
            shieldPiece1Array[j][i] = new ShieldPiece(999,999);
            shieldPiece2Array[j][i] = new ShieldPiece(999,999);
            shieldPiece3Array[j][i] = new ShieldPiece(999,999);
            shieldPiece4Array[j][i] = new ShieldPiece(999,999);
          }
        }
      }
    }
  }
        
  //PAUSED GAME
  else if(paused){
    if(keyPressed){
      if(key == 'p' || key == 'P'){
        paused = false;
      }
    }
  }
        
   //IN A GAME
   else{
     if(keyPressed){
       if(keyCode==LEFT){
         movingLeft1 = true;
       }
       if(keyCode==RIGHT){
         movingRight1 = true;
       }
       if(key == 'p' || key == 'P'){
         paused = true;
       }
       // Switch target type with a, s, d keys
       if(key == 'a' || key == 'A'){
         switchTargetType(1);
       }
       if(key == 's' || key == 'S'){
         switchTargetType(2);
       }
       if(key == 'd' || key == 'D'){
         switchTargetType(3);
       }
     }
   }
}

//Deal with a key being release at any stage of the game (most actions occur on a "key-press")
void keyReleased(){
  if(keyCode==LEFT){movingLeft1 = false;}
  if(keyCode==RIGHT){movingRight1 = false;}
}
