import java.util.ArrayList;

class Planet {
  int type;
  final float MAX_RADIUS;
  float rad, starDist;
  float planetSpeed = 100;
  float spdInc;
  float planetX, planetY;
  color c;
  ArrayList<Moon> moonArr;
  //will contain values for room position in maxHeap
  int pAmp;
  int mAmp = 40;
  float pSpeed;


  Planet(float x, float y, float radius, int amp, float pSpeedInc) {
    //sets pAmp determined by current state of solar system
    pAmp = amp;
    //as it gets farther away, planets move slower
    spdInc = pSpeedInc;
    moonArr= new ArrayList<Moon>();
    planetX = x;
    planetY = y;
    //not currently used
    MAX_RADIUS = radius;
    rad = radius; //solar radii
  }
  
  int getType() {
    return type; 
  }

  void orbit() {

    //Larger speeds decrease revolution time
    planetSpeed += spdInc;

    //To establish simple harmonic motion, I used sin funcitons
    planetX = pAmp*sin(planetSpeed+PI/2)+width/2;
    planetY = pAmp*sin(planetSpeed)+height/2;

    fill(color(c));
    ellipse(planetX, planetY, rad, rad);
  }

  void addMoon() {
    moonArr.add(new Moon(this,mAmp));
    mAmp += 5;
  }

  void removeMoon() {
    for (Moon m : moonArr) {
      moonArr.remove(m);
      mAmp -= 5;
      break;
    }
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

  boolean overCircle(float x, float y, float mx, float my) {
    float disX = x - mx;
    float disY = y - my;
    if (sqrt(sq(disX) + sq(disY)) < rad ) {
      return true;
    } else {
      return false;
    }
  }
}
