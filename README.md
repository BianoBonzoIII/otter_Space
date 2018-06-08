### otter_Space
#### Brian Lin
#### Isaac Jon
#### Aleksandra Koroza

# The Space Architect Program

## Overview
This is a star formation simulator that is at least a little scientifically accurate. The user will be able to choose from the various ingredients and conditions that dictate the type of star that forms. Once the star is formed, the user may add more celestial bodies in order to create their very own solar system, which consists of planets and moons.


## Launch Instructions 
The Intro will begin with fading sentences, which introduduce the project. User will then click on the screen to start the program, which will bring them into the nebula phase, where the user chooses the size of the star. After that, they will have access to the interactive solar system simulation. 

To launch the program:
1. clone the directory by doing
```
git clone https://github.com/BianoBonzoIII/otter_Space.git
```
2. enter the code directory
```
cd Woo
```
3. and run using Processing
```
processing Woo
```

## User Guide
When in Solar System phase, the following commands are visible:
z --> Exit Program
g --> Remove Gassy Planet
r --> Remove Rocky Planet
m --> Remove Moon
ENTER --> Colony Stage
q --> Go back to Solar System

The user add new Rocky or Gassy planets depending on the button they press (square -> Rocky ; circle -> Gassy) and moons upon mouseclick.
Pressing enter will bring you into Colony Stage in which you can, upon clicking on a Rocky planet, design the habitat for that planet.
Values in colony phase must be between 20 and 100.

## How It works
The program is separated into several different phases that lead into one another: Intro, Nebula, Animation,and Solar System (which has several parts.

- Intro:<br/> 
A title screen with a background image of outerspace and the use of fading text in *Woo.pde* to present our project in an aesthetically pleasing manner.

- Nebula:<br/>
Implements pixels and Perlin noise to give the user a visual effect that looks like a gas. *Gas.pde* and *Woo.pde* are used for this phase. In *Gas.pde*, many variables are used to manipulate the texture such as `zoff`; a global variable that acts as time for 3D noise, `increment`, the compactness or density of the pixels, and `zincrement`, the rapidness of the pixels changing color.<br/> For every x,y coordinate in the 2D space of the window, a method called `noiseAnimate`, implements a for loop that calculates a noise value for the pixel that occupies the x,y coordinate and produces a brightness value, `float bright`. This value is then used to change the color of certain pixels to give the pixels a gas-like behavior, `pixels[x+y*width] = color(bright,bright,bright);`<br/> On the bottom of the window, the user is asked to ype and enter a value for the size of the star. This implements *Woo.pde* by manipulating text and using a method called `keyTyped()` to recognize the user's actions and change the text according to the keys they press. Once they enter an acceptable value, the user is prompted to click an area on the gas where they want to place the star. [Check out the source here!](https://processing.org/examples/noise3d.html) 

- Animation:<br/>
In *Woo.pde*, once the state is changed, the class runs a method in Gas.pde where it reads `gas.noiseAnimateCondense(mouseX,mouseY);` This method adjusts the noise value of each pixel on the screen using a method called `noiseDetail()`. The star from the Nebula stage is an instance of `Star.pde` and is drawn to the screen using `ellipse()` but it's born with a small radius. The star then continuously expands to its inputted size, which is stored by a variable in *Star.pde* called `MAX_RADIUS`. As the star expands, the pixels all "condense" and moves towards the star. Once the star reaches its inputted size and the pixels are gone, the program moves on to the next stage. 

- Solar System:<br/>
Similar to the Nebula phase, the user is prompted how they want to expand their solar system and to feed the program data for each celestial body. They can add a total of 6 planets and however many moons they want for each planet. `SolarSystem.pde` is used and it contains a Star object. The root of the solar system is the Star that the user placed onto the screen. The Star contains an array list of Planets. Planets have their own array list of Moons as well. SolarSystem implements a tree of only one node, the Star. This Star implements a tree of Planets, where each node is a Planet and *Planet.pde* contains an array list of Moons.<br/> *Rocky.pde* and *Gassy.pde* are subclasses of Planet.pde. These subclasses are applied to each planet depending on the user input through buttons on the screen. Both *Planet.pde* and *Moon.pde* have an orbitting method which uses the sin function to manipulate the coordinates of the celestial bodies to make it look like they are in a celestial orbit. [We found the sine application from this page](http://learningprocessing.com/examples/chp14/example-14-16-solar-system)

- Colonization:<br/>
The user launches the colonization stage when they choose to inhabit a rocky planet by clicking on one during stage three, where the user has access to this feature. On the planet, the user then begins the process of colonization. They can input values that represent houses and the size for the house. Each house that the user adds will also be added into a minHeap, which will automatically sort itself to maintain minHeap quality based on the size of the houses. The colony will be saved after the user returns to the solar system, so when they click on the planet again, the work that they previously did will load. Uses ALHeap code covered in class.  

