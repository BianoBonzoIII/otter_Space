class SolarSystem {
  Star root; 
  ArrayList<Planet> arr;
  int xPosStar;
  int yPosStar;
  float moonX, moonY; //Moon x and y coordinate
  float earthX, earthY; //Earth x and y coordinate 
  float sunX, sunY; // Suns x and y coordinate
  int amp = 100; //New planet added at this distance 
  float pSpeedInc = 0.015; 

  SolarSystem( Star s ) {
    xPosStar= s.getX();
    yPosStar= s.getY();
    arr = new ArrayList<Planet>();
  }

  /*************** FOR REFERENCE
   moonX = 40*sin(moonSpeed+PI/2)+earthX;
   moonY = 40*sin(moonSpeed)+earthY;
   
   background(0);
   
   fill(0, 0, 255);
   stroke(0, 0, 150);
   ellipse(earthX, earthY, 30, 30);
   fill(200);
   stroke(150);
   ellipse(moonX, moonY, 10, 10);
   fill(255, 255, 0);
   stroke(150, 150, 0);
   ellipse(sunX, sunY, 200, 200);
   ******************/

  void move() {
    background(0);

    fill(0, 0, 255);
    stroke(0, 0, 150);
    ellipse(earthX, earthY, 30, 30);
    fill(200);
    stroke(150);
    ellipse(moonX, moonY, 10, 10);
    fill(255, 255, 0);
    stroke(150, 150, 0);
    ellipse(sunX, sunY, 200, 200);
  }
  void addPlanet(int i) {
    Planet p;
    if (i==1) {
      p = new Gassy(width/2-amp, height/2, 75., amp, pSpeedInc);
    } else {
      p = new Rocky(width/2-amp, height/2, 25., amp, pSpeedInc);
      
    }

    arr.add(p);
    amp += 50;
    pSpeedInc -= 0.002;
  }


  void removeGassy() {
    for(Planet p : arr) {
      if (p.getType() == 1) {
        arr.remove(p);
        break;
      }
    }
  }
  
  void removeRocky() {
    for(Planet p : arr) {
      if (p.getType() == 0) {
        arr.remove(p);
        break;
      }
    }    
  }

  void removeMoon() {
    for(Planet p : arr) {
      p.removeMoon();
      break;
    }
  }
}
