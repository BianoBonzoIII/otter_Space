/*
Scale from Solar Radii to Ellipse Size: 
 ==Input==   ==Ellipse==
 .12  -->  rad = 5 
 880   -->  rad = 500;
 Formula --> 5 + (input - 1)(0.174)
 Change Factor: 1 solar radii --> +0.174 rad 
 */

class Star {
  final float MAX_RADIUS;
  int starX, starY;
  float rad;
  float changeFactor = 2.5;
  color c;
  boolean starDone;


  //constructor
  // 12 solar radii smallest star
  // 1708 solar radii biggest star
  //algo: 
  // 800x800
  //needs exper.
  Star(int x, int y, float radius) {
    starX = x;
    starY = y;
    MAX_RADIUS = radius;
    rad = 0; //solar radii
    if ( MAX_RADIUS >= 500 ) {
      c = color(174, 212, 227);
    } else if ( MAX_RADIUS < 500) {
      c = color(250,5,210);
    }

    fill(c);
    //color gradient changes with bigger size
    //screen size 
    //ellipse coors specified by mouse location
  }

  void expand() {
    /* if (abs(rad-MAX_RADIUS) <= 0.2314) {
     starDone = true;
     fill(c);
     ellipse(starX, starY, rad, rad);
     } */    if (rad >= MAX_RADIUS) { 
      starDone=true;
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
  float getRad() {
    return rad;
  }
}
