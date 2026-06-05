class Projectile {
  float xpos; float ypos;
  color projectileColor = color(255,0,0);
  int dy;
  boolean isEnemy = false;
  
  Projectile(float shootingPositionX,float shootingPositionY){
    xpos = shootingPositionX;
    ypos = shootingPositionY;
    dy = 1;
  }
  
  Projectile(float shootingPositionX,float shootingPositionY, boolean enemy){
    xpos = shootingPositionX;
    ypos = shootingPositionY;
    dy = 1;
    isEnemy = enemy;
  }
  
  //Move a projectile upwards
  void move(){
    if(projectileOnScreen){
    ypos-= 10;}
  }
  
  //Move a projectile downwards
  void drop(){
    if(projectileOnScreen){
    ypos+= 10*dy;}
  }
  
  //Draw a projectile
  void draw(){
    if(projectileOnScreen){
      noStroke();
      if (isEnemy) {
        fill(0, 191, 255); // Cyan
        ellipse(xpos, ypos, PROJECTILE_WIDTH, PROJECTILE_HEIGHT);
      } else {
        if (currentTargetType == 1) {
          fill(255, 20, 147); // Pink
          triangle(xpos, ypos - PROJECTILE_HEIGHT, xpos - PROJECTILE_WIDTH, ypos + PROJECTILE_HEIGHT, xpos + PROJECTILE_WIDTH, ypos + PROJECTILE_HEIGHT);
        } else if (currentTargetType == 2) {
          fill(0, 191, 255); // Cyan
          ellipse(xpos, ypos, PROJECTILE_WIDTH, PROJECTILE_HEIGHT);
        } else if (currentTargetType == 3) {
          fill(50, 255, 50); // Green
          rectMode(CENTER);
          rect(xpos, ypos, PROJECTILE_WIDTH * 1.5, PROJECTILE_HEIGHT * 1.5);
          rectMode(CORNER);
        } else {
          // Fallback or default shape
          fill(projectileColor);
          rect(xpos-PROJECTILE_WIDTH/2,ypos-PROJECTILE_HEIGHT/2,PROJECTILE_WIDTH,PROJECTILE_HEIGHT);
        }
      }
    }
  }
  
  //Delete a projectile if it has travelled off the screen
  void collide(){
    if(ypos <= 0 || ypos >= SCREENY){
    ypos = bulletGraveyard;}
  }
}
