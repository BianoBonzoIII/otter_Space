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

//state 1 vars
Gas gas;
Star s;
boolean gasIns= false;
boolean msgTyped = false;
String msg = "Please specify a size: ";  
String input = ""; //Takes in user input
//

//state 2 vars
//
void setup() {
  size(800, 800);
  img = loadImage("largeGalField.jpg");
  f = createFont("Arial", 16, true);
  smooth();
}

void draw() {

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
      textSize(70);
      text(a, 0, 400);
    } else if (switches ==1) { //String b
      value+=speed;
      fill(255, fade); 
      textSize(45);
      text(b, 100, 400);
    } else { // String c
      value+=speed;
      fill(255, fade); 
      textSize(45);
      text(c, 50, 400);
    }
  }

  //nebula state
  else if (state == 1) {
    if (!gasIns) {
      gas = new Gas();
      gasIns = true;
      background(203, 88, 88);
    }
    gas.noiseAnimate();

    //Creates User Interface
    fill(color(0));
    rect(-1, 700, 1000, 150);
    textFont(f, 36);
    fill(color(250));
    
    if (!msgTyped) {
      //msg = "Please specify a size: ";    
      text(msg, 20, 760);
      text(input, 500, 760);
    } else {
      msg = "Please choose a location to place your star:"; 
      text(msg, 20, 760);
      //msgTyped = true;
    }
  } else if (state==2) {
    background(250);
    //s = new Star(mouseX, mouseY, int(input) ); //Note: Instead of Integer.parseInt(), just use int()
    s.expand();
  }

  //animation state 
  else if (state == 3) {
  }
}


void mouseClicked() {
  //intro screen transition to state 
  //change number of switches to skip intro screen
  if (state==0 && switches>=0) {
    state=1;
    //clear();
  }

  if (state==1 && msgTyped) {
    state = 2;
    s = new Star(mouseX, mouseY, int(input) ); //Note: Instead of Integer.parseInt(), just use int()
    s.expand();
  }
}

void keyTyped() {
  if (!msgTyped) {
    
    if (key == BACKSPACE) {
      if (input.length()>0)
        input = input.substring(0, input.length()-1);
    } else
      input += key;
    
    if (key == ENTER) {
      //Add restriction to input size  
      //msgTyped =true;
///*
      if (input.length() >= 0) { // message is done when enter pressed
        if (int(input) > 1708) {  
          msg = "Too big!";
          input = "";
          text(msg, 20, 760);
          text(input, 500, 760);
        }
        if (int(input) < 12) { 
          msg = "Too small!";
          input = "";
          text(msg, 20, 760);  
          text(input, 500, 760);
        }

        
      }
    //  */
      else{
      msgTyped =true;}
    }
  }
}