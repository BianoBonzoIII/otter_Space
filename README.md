### otter_Space
#### Brian Lin
#### Isaac Jon
#### Aleksandra Koroza

# The Space Architect Program 

## Description
This is a star formation simulator that is at least a little scientifically accurate. The user will be able to choose from the various ingredients and conditions that dictate the type of star that forms. Once the star is formed, the user may add more celestial bodies in order to create their very own solar system, which consists of planets, comets, moons, and asteroids.

## How It Works
The program is separated into 4 different phases that lead into one another: Intro, Nebula, Animation, Solar System
- Intro:<br/> 
A title screen with a background image of outerspace and the use of fading text in *Driver.pde* to present our project in an aesthetically pleasing manner.

- Nebula:<br/>
Implements pixels and Perlin noise to give the user a visual effect that looks like a gas. *Gas.pde* and *Driver.pde* are used for this phase. In *Gas.pde*, many variables are used to manipulate the texture such as `zoff`; a global variable that acts as time for 3D noise, `increment`, the compactness or density of the pixels, and `zincrement`, the rapidness of the pixels changing color.<br/> For every x,y coordinate in the 2D space of the window, a method called `noiseAnimate`, implements a for loop that calculates a noise value for the pixel that occupies the x,y coordinate and produces a brightness value, `float bright`. This value is then used to change the color of certain pixels to give the pixels a gas-like behavior, `pixels[x+y*width] = color(bright,bright,bright);`<br/> On the bottom of the window, the user is asked to ype and enter a value for the size of the star. This implements *Driver.pde* by manipulating text and using a method called `keyTyped()` to recognize the user's actions and change the text according to the keys they press. Once they enter an acceptable value, the user is prompted to click an area on the gas where they want to place the star. 

- Animation:<br/>
In *Driver.pde*, once the state is changed, the class runs a method in Gas.pde where it reads `gas.noiseAnimateCondense(mouseX,mouseY);` This method adjusts the noise value of each pixel on the screen using a method called `noiseDetail()`. The star from the Nebula stage is an instance of `Star.pde` and is drawn to the screen using `ellipse()` but it's born with a small radius. The star then continuously expands to its inputted size, which is stored by a variable in *Star.pde* called `MAX_RADIUS`. As the star expands, the pixels all "condense" and moves towards the star. As the star expands, it changes color. Once the star reaches its inputted size and the pixels are gone, the program moves on to the next stage. 

- Solar System:<br/>
The window size is increased in order to accomodate for the other celestial bodies. Similar to the Nebula phase, the user is prompted how they want to expand their solar system and to feed the program data for each celestial body. They can add planets, moons, comets, or asteroids. `SolarSystem.pde` is used and it contains a Star object. Trees are implemented in this phase. The root of the solar system is the Star that the user placed onto the screen. The Star contains an array list of Planets. Planets will have their own array list of Moons as well. SolarSystem implements a tree of only one node, the Star. This Star implements a tree of Planets, where each node is a Planet and *Planet.pde* contains an array list of Moons.<br/> *Rocky.pde* and *Gassy.pde* are subclasses of Planet.pde. These subclasses are applied to each planet depending on the user input. They change what the planet looks like to the user where *Rocky.pde* uses smaller ellipses that overlap the planet to make it look like its bumpy. *Gassy.pde* uses 3D noise similar to Nebula and *Gas.pde* to give the planet a cloudy texture. Both *Planet.pde* and *Moon.pde* have two methods. One of them is `revolve()`, which implements a method from the Processing library called `rotate()` to make it look like its rotating on its axis. The other is `orbit()`, which uses the sin function to manipulate the coordinates of the celestial bodies to make it look like they are in a celestial orbit. 

## Launch Instructions 
Click on the screen during the Intro Phase in order to start the program

