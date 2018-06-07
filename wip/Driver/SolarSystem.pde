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
   //Larger speeds decrease revolution time
   earthSpeed += .005;
   moonSpeed += .05;
   
   //To establish simple harmonic motion, I used sin funcitons
   earthX = 175*sin(earthSpeed+PI/2)+sunX;
   earthY = 175*sin(earthSpeed)+sunY;
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
  void addPlanet() {
    Planet p = new Planet(width/2-amp,height/2, 25., amp, pSpeedInc);
    arr.add(p);
    amp += 50;
    pSpeedInc -= 0.002;
  }

  void addMoon( Planet p ) {
  }

  void removePlanet( Planet p) {
  }

  void removeMoon(Moon m) {
  }
}
