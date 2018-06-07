class Moon {
  //final float MAX_RADIUS;
  Planet par;
  float rad;
  float moonSpeed;
  float moonX, moonY;
  color c;
  int myAmp;
  float myInc = random(0.05, 0.1);
 

  Moon(Planet p, int amp) {
    par = p;
    moonX = p.planetX - myAmp;
    moonY = p.planetY - myAmp;
    //MAX_RADIUS = radius;
    rad = random(7,10); //solar radii
    c = color(255, 141, 0);
    myAmp = amp;
    
    //color gradient changes with bigger size
    //screen size 
    //ellipse coors specified by mouse location
  }
  
  void revolve() {
  }

  void orbit() {
    moonSpeed+= myInc;
    
    moonX = myAmp*sin(moonSpeed+PI/2)+par.planetX;
    moonY = myAmp*sin(moonSpeed)+par.planetY;
    
    fill(color(c));
    ellipse(moonX, moonY, rad, rad);
  }

  //returning positions, initiated by user's mouseX and mouseY
  float getX() {
    return moonX;
  }
  float getY() {
    return moonY;
  }

  //getting radius for gas function
  float getRad() {
    return rad;
  }
}
