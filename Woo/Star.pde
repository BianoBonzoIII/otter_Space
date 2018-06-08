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
  float changeFactor = 1.5;
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
    //12, 136, 260, 384, 508, 638, 756, 880 
    if (MAX_RADIUS >= 756) {
      //blue 
      c=color(3, 16, 252);
    }
    else if (MAX_RADIUS >= 638) {
      //blue white 
      c=color(48, 208, 250);
    }
    else if (MAX_RADIUS >= 508) {
      //white blue 
      c=color(176, 236, 252);
    }
    else if (MAX_RADIUS >= 384) {
      //white 
      c=color(255);
    }

    else if (MAX_RADIUS >= 260) {
      //yellow 
      c=color(247, 247, 0 );
    }
    else if (MAX_RADIUS >= 136) {
      //orange 
      c=color(255, 102, 0);
    }
    else {
      //orange red 
      c=color(240, 96, 0);
    }
  }

  
  //color gradient changes with bigger size
  //screen size 
  //ellipse coors specified by mouse location


void expand() {
  /* if (abs(rad-MAX_RADIUS) <= 0.2314) {
   starDone = true;
   fill(c);
   ellipse(starX, starY, rad, rad);
   } */  if (rad >= 100) { 
    starDone=true;
    fill(c);
    ellipse(starX, starY, rad, rad);
  } else {
    fill(c);
    rad += changeFactor;
    ellipse(starX, starY, rad, rad); //Places the ellipse
  }
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
