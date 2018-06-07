import java.util.ArrayList;

class Planet {
  final float MAX_RADIUS;
  float rad;
  float orbitSpeed;
  int planetX, planetY;
  color c;
  ArrayList<Moon> arr;

  Planet(int x, int y, float radius) {
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
  }

  //returning positions, initiated by user's mouseX and mouseY
  int getX() {
    return planetX;
  }
  int getY() {
    return planetY;
  }

  //getting radius for gas function
  float getRad() {
    return rad;
  }
}
