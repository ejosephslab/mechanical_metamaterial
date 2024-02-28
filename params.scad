// Metamaterial parameters
// EAJ 2024

phi = 25; //x axis and interior bar
theta = -25; // lean angle from y axis

// **WARNING, UNTESTED FOR OTHER DIMENSIONS!**
// **CHANGE THESE VALUES AT YOUR OWN RISK!**

$fn = 12;
xdim = 9; //lateral width of unit cell
ydim = 9; //height of unit cell
d = .35; // wall thickness 
t = 5; // Z height (thickness of slab)
ro = 1.65/2+.35/2; // outer diameter tubing
ri = ro-.35; // inner diameter tubing
bf = 0; // buffer height

b = xdim/(8*cos(phi)); //  interior bar length
h = (ydim+5*b*sin(phi))/(2+1+2*cos(theta));  // side height 
g =h-2*b*sin(phi); // gap distance
w = b*cos(phi); //half unit width
uh = 2*h+h-5*b*sin(phi)+2*h*cos(theta); // grid height
cx = (-(5*w-h*sin(-theta))+((1*2*w-w+w+w/2)))+(1*2*w-w+w+w/2)/2+w - ro;
cy = (-(h+h-3*b*sin(phi)+h*cos(theta))+h/2-ri-d/2)+(((2*(h-b*sin(phi)))+h*cos(theta)/2)+(3.5*(h-b*sin(phi))))/2;
dx=-h*sin(-theta);
dy=-h*cos(-theta);


