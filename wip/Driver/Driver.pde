//Different states 
final static int INTRO = 0;
final static int NEBULA = 1;
final static int ANIMATION = 2;
final static int SOLAR = 3;
final static int END = 4;

//state 0 vars
int state =0;
String a = "otter_Space presents...";
String b = "Make your very own solar system!";
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
boolean gasIns= false;
//
//state 2 vars
//
void setup() {
  size(800, 800);
  img = loadImage("largeGalField.jpg");
  smooth();
}

void draw() {
  
  if (state ==0){
    image(img, 0, 0);
    fade = ((sin(radians(value))+1)/2)*MAX; // makes the fading more "organic"
    if (fade== 0.0){
      switches++;
    }
    
    if (switches==0){ //String a
  // with help from: https://forum.processing.org/two/discussion/12935/text-fade-in-out-with-millis
  // ie. processing forum
  //float fade = abs(sin(radians(value)))*MAX; <-- faster graphic
  value+=speed;
  fill(255, fade); 
  textSize(70);
  text(a,0,400);}
  
   else if (switches ==1){ //String b
  value+=speed;
  fill(255, fade); 
  textSize(45);
  text(b,0,400);}
  
  else { // String c
  value+=speed;
  fill(255, fade); 
  textSize(45);
  text(c,50,400);
  }

}

//nebula state
if (state == 1){
  if (!gasIns){
  gas =new Gas();
  gasIns=true;
}
  gas.noiseAnimate();
}

}

void mouseClicked(){
//intro screen transition to state 
//change number of switches to skip intro screen
if (state==0 && switches>=1){
  state=1;
  //clear();
}
}
