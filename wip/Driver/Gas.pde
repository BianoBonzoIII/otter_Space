class Gas {
  //source: https://processing.org/examples/noise3d.html
  //Using 3D noise to create simple animated texture. Here, the third dimension ('z') is treated as time.

  //size affects increment
  float increment = 0.01; // Density 
  // The noise function's 3rd argument, a global variable that increments once per cycle
  float zoff = 0.0;  
  // We will increment zoff differently than xoff and yoff
  float zincrement = 0.01; // Gas Movement Speed
  //curr height
  int h =height;
  //curr width
  int w =width;
  //dist from center
  final static int STARTDIAM = 800;
  //step
  final static int STEP = 10;
  //current diameter
  int currDiam = STARTDIAM;
  //boolean seeing if condensed
  boolean condensed; 



  void noiseAnimate() {
    // Optional: adjust noise detail here
    //ie changes "bluriness"
    noiseDetail(10, 0.7f);

    loadPixels();

    float xoff = 0.0; // Start xoff at 0

    // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
    for (int x = 0; x < width; x++) {
      //if outside diameter, do black
      xoff += increment;   // Increment xoff 
      float yoff = 0.0;   // For every xoff, start yoff at 0
      for (int y = 0; y < height; y++) {
        yoff += increment; // Increment yoff

        // Calculate noise and scale by 255
        float bright = noise(xoff, yoff, zoff)*255;

        // Try using this line instead
        //float bright = random(0,255);

        // Set each pixel onscreen to a grayscale value
        pixels[x+y*width] = color(bright, bright, bright);
      }
    }
    updatePixels();

    zoff += zincrement; // Increment zoff
  }


  void noiseAnimateCondense(Star s, int currX, int currY) {
    // Optional: adjust noise detail here
    //ie changes "bluriness"
    noiseDetail(10, 0.7f);

    loadPixels();

    float xoff = 0.0; // Start xoff at 0

    // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
    for (int x= 0; x < width; x++) {



      xoff += increment;   // Increment xoff 
      
      float yoff = 0.0;   // For every xoff, start yoff at 0
      for (int y = 0; y < height; y++) {
        float d = dist(currX, currY, x, y); //distance b/w center of star and x, y of pixel

        if (d>currDiam) {
          pixels[x+y*width] = color(0);
        } else {
          yoff += increment; // Increment yoff

          // Calculate noise and scale by 255
          float bright = noise(xoff, yoff, zoff)*255;

          // Try using this line instead
          //float bright = random(0,255);

          // Set each pixel onscreen to a grayscale value
          pixels[x+y*width] = color(bright, bright, bright);
        }
      }
    }
    updatePixels();

    zoff += zincrement; // Increment zoff
    currDiam = Math.max(currDiam-STEP,s.getRad());
    if (currDiam == s.getRad()){
    condensed=true;
    }
  }
}