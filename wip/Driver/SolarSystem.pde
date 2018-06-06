class SolarSystem{
  Star root; 
  ArrayList<Planet> arr;
  int xPosStar;
  int yPosStar; 
  
  
  SolarSystem( Star s ) {
    xPosStar= s.getX();
    yPosStar= s.getY();
    arr = new ArrayList<Planet>();
  }
  
  void addPlanet() {
    
  }
  
  void addMoon( Planet p ) {
  }
  
  void removePlanet( Planet p) {
  }
  
  void removeMoon( Moon m) {
  }
  
}