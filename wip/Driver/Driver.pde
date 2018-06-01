//Different states 
final static int INTRO = 0;
final static int NEBULA = 1;
final static int ANIMATION = 2;
final static int SOLAR = 3;
final static int END = 4;

PImage img;

void setup() {
  size(800, 800);
  img = loadImage("largeGalField.jpg");
}

void draw() {
  image(img, 0, 0);
}