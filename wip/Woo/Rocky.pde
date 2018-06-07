class Rocky extends Planet{
  final int TYPE = 0;
  ALHeap colony;
  
  Rocky( float x, float y, float radius, int amp, float pSpeedInc ) {
    super(x, y, radius, amp, pSpeedInc);
    c= color(198,180,180);
    colony= new ALHeap();
  }
  
  void drawColony(){
   background(90,148,185);
   rect(0,200,700,600);
   fill(170,118,14);
   
  }
  
}
