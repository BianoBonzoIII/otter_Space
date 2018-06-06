/*
Scale from Solar Radii to Ellipse Size: 
 ==Input==   ==Ellipse==
 1   -->  rad = 5 
 1708   -->  rad = 400;
 Change Factor: 1 solar radii --> +0.2314 rad 
 */

class Star {
  final float MAX_RADIUS;
  int xpos, ypos;
  int rad;
  float changeFactor = 0.2314;
  color c;


  //constructor
  // 1 solar radii smallest star
  // 1708 solar radii biggest star
  //algo: 
  // 800x800
  //needs exper.
  Star(int x, int y, int radius) {
    xpos = x;
    ypos = y;
    MAX_RADIUS = radius;
    rad = 5;
    c = color(2, 43, 249);
    //color gradient changes with bigger size
    //screen size 
    //ellipse coors specified by mouse location
  }

  void expand() {
    if (rad >= MAX_RADIUS) { 
      rad -= changeFactor;
      fill(c);
      ellipse(xpos, ypos, rad, rad);
    } else {
      fill(c);
      rad += changeFactor;
      ellipse(xpos, ypos, rad, rad); //Places the ellipse
    }
  }

  // gives the illusion of rotating star at fixed point
  // may use rotate()
  void revolve() {
  }
  // use shininess(float)
  void shine() {
  }

//returning positions, initiated by user's mouseX and mouseY
  int getX() {
    return xpos;
  }
  int getY() {
    return ypos;
  }
  
  //getting radius for gas function
  int getRad(){
    return rad;
  }
}
