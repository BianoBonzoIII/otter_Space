class Gassy extends Planet {
  int type = 1;

  Gassy( float x, float y, float radius, int amp, float pSpeedInc ) {
    super(x, y, radius, amp, pSpeedInc);
    c= color(240,183,60);
  }
  
  int getType() {
    return type;
  }
  
  
}
