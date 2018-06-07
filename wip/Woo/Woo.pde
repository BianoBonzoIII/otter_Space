//Different states 
final static int INTRO = 0;
final static int NEBULA = 1;
final static int ANIMATION = 2;
final static int SOLAR = 3;
final static int END = 4;

//Text font
PFont f;

//state 0 vars
int state =0;
String a = "otter_Space presents...";
String b = "The Space Architect Program!";
String c = "{click on the screen to continue}";
PImage img;
float speed = 1.; 
float value = 0.0;
int MAX = 255;
String current= a;
float fade =1.0; // alpha parameter is a number between 0.0 and 1.0
int switches =0; // transitioning between strings a,b,c etc
//

//===== state 1 vars =====
Gas gas;
boolean gasIns= false;
boolean msgTyped;
String msg = "Please specify a size: ";  
String input = ""; //Takes in user input
boolean starPlaced;// false until state 2
//

//===== state 10 vars =====
//n/a
//

//===== state 3 vars =====
// Celestial Body Variables
Star s;
//User Input Variables
int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 50;     // Diameter of rect
int circleSize = 60;   // Diameter of circle
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;
String choice1 = "Planet"; 
String choice2 = "Moon";
String choice3 = "Comet";
String choice4 = "Asteroid";
//solar system once 
SolarSystem sys;
boolean paused;
float temp;
//are we in colonial minigame?
boolean minigame;

//stage 

// stage 4 values
Planet sel; //selected in stage 3

/*******FOR REFERENCE
 float moonX, moonY; //Moon x and y coordinate
 float earthX, earthY; //Earth x and y coordinate
 float earthSpeed, moonSpeed; // The rate at which the bodies revolve
 float sunX = 350;
 float sunY = 350; // Suns x and y coordinate
 *********/

void setup() {
  size(700, 700);
  img = loadImage("largeGalField.jpg");
  f = createFont("Arial", 16, true);
  smooth();

  // For stage 3
  rectColor = color(255);
  circleColor = color(255);
  rectHighlight = color(204);
  circleHighlight = color(204);
  rectX = 300;
  rectY = 625;
  circleX = 500;
  circleY = 650;
}

/*void stop() {
 float temp;
 for (Planet p : sys.arr) {
 temp = p.spdInc;
 if (paused) {
 p.spdInc = 0;
 } else {
 p.spdInc = temp;
 p.orbit();
 }
 }
 }*/

void draw() {
  //==================== Intro State =======================
  if (state ==0) {
    image(img, 0, 0);
    fade = ((sin(radians(value))+1)/2)*MAX; // makes the fading more "organic"
    if (fade== 0.0) {
      switches++;
    }

    if (switches==0) { //String a
      // with help from: https://forum.processing.org/two/discussion/12935/text-fade-in-out-with-millis
      // ie. processing forum
      //float fade = abs(sin(radians(value)))*MAX; <-- faster graphic
      value+=speed;
      fill(255, fade); 
      textSize(55);
      text(a, 50, 350);
    } else if (switches ==1) { //String b
      value+=speed;
      fill(255, fade); 
      textSize(45);
      text(b, 40, 350);
    } else { // String c
      value+=speed;
      fill(255, fade); 
      textSize(40);
      text(c, 45, 350);
    }
  }
  //============================================================
  //================ Nebula State ==================
  if (state == 1) {
    if (!gasIns) {
      gas = new Gas();
      gasIns = true;
      background(203, 88, 88);
    }

    gas.noiseAnimate();

    //Creates User Interface
    fill(color(0));
    rect(-1, 600, 1000, 150);
    textFont(f, 36);
    fill(color(250));

    if (!msgTyped) {
      text(msg, 20, 660);
      text(input, 400, 660);
    } else {
      textSize(30);
      msg = "Please choose a location to place your star:"; 
      text(msg, 10, 660);
    }
  }
  //===================================================

  //============== Animation State ==================
  else if (state==10) {  //Added after other states 
    gas.noiseAnimateCondense(s, s.getX(), s.getY());
    s.expand();

    if (gas.condensed) {
      state = 3;
    }
  }
  //==================================================


  //====================== Solar System State ================== 
  //###NOTE###: Rectangle will be Planet and Moon will be Moon 
  //Use the choice variables on the top as markers for these buttons
  //Go to button.html in processing for your reference
  //^^^What the buttons actually do is done in mouseClicked()^^^
  else if (state == 2) {

    clear();
    fill(s.c);
    ellipse(width/2, height/2, 100, 100);

    //creates a new solar system and given the star
    //star has radius, color and position on screen
    //new SolarSystem(s);
    for (Planet p : sys.arr) {
      //float temp = p.spdInc;
      for (Moon m : p.moonArr) {
        m.orbit();
      }
      p.orbit();
      if (dist(mouseX, mouseY, p.planetX, p.planetY) < p.getRad()) {
        //temp=p.spdInc;
        p.spdInc = 0;
        p.spdInc=temp;
      } 
      if (dist(mouseX, mouseY, p.planetX, p.planetY) > p.getRad()) {
        temp=p.spdInc;
        p.spdInc = temp;
        p.orbit();
        //stop();
      }
    }


    // button
    update(mouseX, mouseY);

    if (rectOver) {
      fill(rectHighlight);
    } else {
      fill(rectColor);
    }
    stroke(250);
    rect(rectX, rectY, rectSize, rectSize);

    if (circleOver) {
      fill(circleHighlight);
    } else {
      fill(circleColor);
    }    
    stroke(0);
    ellipse(circleX, circleY, circleSize, circleSize);

    msg = "Please Choose: ";
    text(msg, 20, 660);
  } else if (state == 3) {

    clear();
    fill(s.c);
    ellipse(width/2, height/2, 100, 100);

    //creates a new solar system and given the star
    //star has radius, color and position on screen
    //new SolarSystem(s);
    for (Planet p : sys.arr) {
      //float temp = p.spdInc;
      for (Moon m : p.moonArr) {
        m.orbit();
      }
      p.orbit();
      if (dist(mouseX, mouseY, p.planetX, p.planetY) < p.getRad()) {
        //temp=p.spdInc;
        p.spdInc = 0;
        p.spdInc=temp;
      } 
      if (dist(mouseX, mouseY, p.planetX, p.planetY) > p.getRad()) {
        temp=p.spdInc;
        p.spdInc = temp;
        p.orbit();
        //stop();
      }
    }
  } else if (state==4) {

    background(90, 148, 185);
    fill(170, 118, 14);
    rect(0, 200, 700, 600);


    fill(0);
    rect(-1, -1, 200, 60);
    fill(255);
    textSize(20);
    text(msg, 2, 20);
    text(input, 2, 40);
    ((Rocky)sel).drawColony();
  }
}


//============================================================

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}
//returns if inside rect
boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

//returns if inside circle
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

void mouseClicked() {
  //intro screen transition to state 
  //change number of switches to skip intro screen
  if (state==0 && switches >= 0) {
    state=1;
    //clear();
  }

  /*
Scale from Solar Radii to Ellipse Size: 
   ==Input==   ==Ellipse==
   12  -->  rad = 5 
   1708   -->  rad = 300;
   Formula --> 5 + (input - 1)(0.174)
   Change Factor: 1 solar radii --> +0.174 rad 
   */

  //Include two if statements for clicking Moon button or clicking Planet button
  if (state == 2) {

    //circle is gassy planet
    if (sys.arr.size()<6) {
      if (circleOver) {
        sys.addPlanet(1);
      }
      //rect is rocky
      if (rectOver) {
        sys.addPlanet(0);
        //designOpt =true;
      }
    }
    for (Planet p : sys.arr) {
      if (dist(mouseX, mouseY, p.planetX, p.planetY) < p.getRad()) {
        p.addMoon();
      }
      //for each planet, if type is rocky and minigame = false
    }
  }
  if (state == 3) {
    for (Planet p : sys.arr) {
      if (dist(mouseX, mouseY, p.planetX, p.planetY) < p.getRad() &&  p.getType() == 0) {
        sel=p;
        state = 4;
        input ="";
        msg = "Choose a number";
      }
    }
  }
}


void keyTyped() {
  if (state ==1) {
    if (!msgTyped) {
      if (key == BACKSPACE) {
        if (input.length()>0)
          input = input.substring(0, input.length()-1);
      } 
      if (key == ENTER && state==1) {
        if (msg.equals("Too small!") || msg.equals("Too big!")) {
          msg = "Please specify a size: ";
        }
        //Add restriction to input size  
        if (input.length() > 0) { // message is done when enter pressed
          float f = Float.parseFloat(input);
          if ( f > 880) {  
            msg = "Too big!";
            input = "";
          } else if (f < .12) {
            msg = "Too small!";
            input = "";
          } else {
            msgTyped = true;
            state = 10;
            s = new Star(width/2, height/2, (5 + ( (int(input) - 1) * 0.174 ))); 
            starPlaced = true;        
            sys = new SolarSystem(s);
            //gas.noiseAnimateCondense(s, mouseX, mouseY);
            //s.expand();
          }
        }
      } else {
        if (key != BACKSPACE)
          input += key;
      }
    }
  } else if (state==2) {
    if (key == ENTER) { //Set stage to three, gives ability to create colonies
      state = 3;
    }
  } else if (state ==3) {// when click on rocky planet, go to stage 4
    //if (key ==ENTER){
    // state=4;
    //}

    if (key == BACKSPACE) { //if stage = 3, go to stage 2
      state=2;
    }
  }
  //this is actual visuals of the mx heap colony thingy
  else if (state==4) {

    if (key == 'q') {
      state=3;
    }
    if (key == BACKSPACE) {
      if (input.length()>0)
        input = input.substring(0, input.length()-1);
    } 
    if (key == ENTER) {
      if (msg.equals("Too small!") || msg.equals("Too big!")) {
        msg = "Choose a number";
      }
      //Add restriction to input size  
      if (input.length() > 0) { // message is done when enter pressed
        int f = int(input);

        if ( f > 100) {  
          msg = "Too big!";
          input = "";
        } else if (f < 20) {
          msg = "Too small!";
          input ="";
        } else {
          ((Rocky)sel).colony.add(f);
          input = "";
        }
      }
    } else {
      if (key != BACKSPACE)
        input += key;
    }
  }
}
