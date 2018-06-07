class Rocky extends Planet {
  int type = 0;
  ALHeap colony;
  float firstRmx;
  float firstRmy;

  Rocky( float x, float y, float radius, int amp, float pSpeedInc ) {
    super(x, y, radius, amp, pSpeedInc);
    c= color(198, 180, 180);
    colony= new ALHeap();
    firstRmx = width/2;
    firstRmy= 225;
  }

  void drawColony() {
    //smaller rooms towards the top
    //limited number of rooms
    //max index 6
    fill(2);
    //ellipse(width/2,225,100,100);
    if(colony._heap.size() > 6)
    ellipse((firstRmx*1.5+width)/2, firstRmy+300, colony._heap.get(6), colony._heap.get(6));
    if(colony._heap.size() > 5)
    ellipse((firstRmx+firstRmx*1.5)/2, firstRmy+300, colony._heap.get(5), colony._heap.get(5));
    if(colony._heap.size() > 4)
    ellipse((firstRmx+firstRmx/2)/2, firstRmy+300, colony._heap.get(4), colony._heap.get(4));
    if(colony._heap.size() > 3)
    ellipse(firstRmx/4, firstRmy+300, colony._heap.get(3), colony._heap.get(3));
    if(colony._heap.size() > 2)
    ellipse(firstRmx*1.5, firstRmy+150, colony._heap.get(2), colony._heap.get(2));
    if(colony._heap.size() > 1)
    ellipse(firstRmx/2, firstRmy+150, colony._heap.get(1), colony._heap.get(1));
    if(colony._heap.size() > 0)
    ellipse(firstRmx, firstRmy, colony._heap.get(0), colony._heap.get(0));
  }

  int getType() {
    return type;
  }
}
