class Star {
  final float MAX_RADIUS;
  float xpos, ypos;
  int rad;
  color c;


  //constructor
  //.12 solar radii smallest star
  // 1708 solar radii biggest star
  //algo: 
  // 800x800
  //needs exper.
  Star(float x, float y, int radius) {
    xpos = x;
    ypos = y;
    MAX_RADIUS = radius;
    c = color(2, 43, 249);
    //color gradient changes with bigger size
    //screen size 
    //ellipse coors specified by mouse location
  }

  void expand() {
    if (rad >= MAX_RADIUS) { 
      fill(c);
      ellipse(xpos, ypos, rad, rad);
    }
    else {
      fill(c);
      rad += 0.2;
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
}
