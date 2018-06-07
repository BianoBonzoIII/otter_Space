/*
Scale from Solar Radii to Ellipse Size: 
 ==Input==   ==Ellipse==
 12  -->  rad = 5 
 1708   -->  rad = 300;
 Formula --> 5 + (input - 1)(0.174)
 Change Factor: 1 solar radii --> +0.174 rad 
 */

class Star {
  final float MAX_RADIUS;
  int starX, starY;
  float rad;
  float changeFactor = 0.2314;
  color c;


  //constructor
  // 1 solar radii smallest star
  // 1708 solar radii biggest star
  //algo: 
  // 800x800
  //needs exper.
  Star(int x, int y, float radius) {
    starX = x;
    starY = y;
    MAX_RADIUS = radius;
    rad = radius; //solar radii
    c = color(2, 43, 249);
    fill(c);
    //color gradient changes with bigger size
    //screen size 
    //ellipse coors specified by mouse location
  }

  void expand() {
    if (rad >= MAX_RADIUS) { 
      rad -= changeFactor;
      fill(c);
      ellipse(starX, starY, rad, rad);
    } else {
      fill(c);
      rad += changeFactor;
      ellipse(starX, starY, rad, rad); //Places the ellipse
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
    return starX;
  }
  int getY() {
    return starY;
  }
  
  //getting radius for gas function
  float getRad(){
    return rad;
  }
}
