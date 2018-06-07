import java.util.ArrayList;

class Planet {
  final float MAX_RADIUS;
  float rad, starDist;
  float planetSpeed = 100;
  float spdInc;
  float planetX, planetY;
  color c;
  ArrayList<Moon> arr;
  int pAmp;
  

  Planet(float x, float y, float radius, int amp, float pSpeedInc) {
    pAmp = amp;
    spdInc = pSpeedInc;
    planetX = x;
    planetY = y;
    MAX_RADIUS = radius;
    rad = radius; //solar radii
    c = color(5, 70, 145);
    //color gradient changes with bigger size
    //screen size 
    //ellipse coors specified by mouse location
  }
  
  void revolve() {
  }

  void orbit() {
    
    //Larger speeds decrease revolution time
    planetSpeed += spdInc;

    //To establish simple harmonic motion, I used sin funcitons
    planetX = pAmp*sin(planetSpeed+PI/2);
    planetY = pAmp*sin(planetSpeed);
    
    fill(color(250,5,210));
    ellipse(planetX, planetY, rad, rad);
  }
  

  //returning positions, initiated by user's mouseX and mouseY
  float getX() {
    return planetX;
  }
  float getY() {
    return planetY;
  }

  //getting radius for gas function
  float getRad() {
    return rad;
  }
}
