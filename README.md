# CubeSat
With the aim of becoming an FPGA/VHDL teacher, I am developing a cubesat project for practical work and projects for my school. Of course it won't fly but i'll have to communicate with a static base on the ground (on a table 10 meters away).

## Functional diagram
First of all, here is what I want it to look like. It's a functionnal diagram with the main components.  
![functionnal_diagram](/images/diagram.png)
There will be :
- 2 temperature/humidity sensors
- An ultrasonic distance sensor
- An UV sensor
- An altimeter
- And later I'll add an H bridge to control solar panels
- Also, a Receiver and a Transmitter to communicate with the ground base

The ground base will be simple with push buttons and LCD Screen.

## Structure
For the structure, I printed each piece. I used these files : https://www.thingiverse.com/thing:4096437.
I took the liberty to increase the size by 50%. So today it looks like this :  
![](/images/structure.png)

## Schematics
So, for this project I need to create my own PCB. With the help of my colleague, we created it using Easy EDA.
Of course I'll buy it from JLPCB.  
![](/images/pcb.png)

## Todo
To copy : ✔️ ❌
[❌] - Altimeter
[❌] - Ultrasonic sensor
[❌] - Receiver
[❌] - Transmitter
[❌] - UV sensor
[❌] - Extern T°/Hum sensor
[❌] - Intern T°/Hum sensor
[❌] - One Wire
[❌] - SPI
[❌] - I2C
[❌] - TOP LEVEL
[❌] - Assembly
[❌] - Testing