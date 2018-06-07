class Moon {
  final float MAX_RADIUS;
  float rad;
  float moonSpeed;
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

  /*void orbit() {
    moonX = 40*sin(moonSpeed+PI/2)+earthX;
    moonY = 40*sin(moonSpeed)+earthY;
  }
*/
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
