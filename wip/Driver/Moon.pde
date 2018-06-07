class Moon {
  final float MAX_RADIUS;
  float rad;
  float orbitSpeed;
  int moonX, moonY;
  color c;

  Moon(int x, int y, float radius) {
    moonX = x;
    moonY = y;
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
    return moonX;
  }
  int getY() {
    return moonY;
  }

  //getting radius for gas function
  float getRad() {
    return rad;
  }
}
