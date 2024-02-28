// Reentrant unit cell structures
// Solid walls if theta = 0, open walls if theta ~= 0
// EAJ 2024

module reentrant(h,b,phi,d,t,bf,theta0){
    ac =    [[0,0],   
        [h*sin(-theta0),h*cos(-theta0)],
        [h*sin(-theta0),h*cos(-theta0)]+[b*cos(-phi),b*sin(-phi)],
        [h*sin(-theta0),h*cos(-theta0)]+[2*w,0],
        
        [2*b*cos(phi),0],
        [b*cos(phi),b*sin(phi)],
        ];

if (theta0==0){     
union(){
rotate([0,0,theta0]) translate([0,h/2,t/2]) cube([d,h,t],center=true);
    
 translate([ac[1][0],ac[1][1],0]) rotate([0,0,-phi]) rotate([0,0,-90])  translate([0,b/2,t/2]) cube([d,b,t],center=true);
    
 translate([ac[2][0],ac[2][1],0]) rotate([0,0,-90+phi]) translate([0,b/2,t/2]) cube([d,b,t],center=true);
    
 translate([2*w,0]) rotate([0,0,theta0]) translate([0,h/2,t/2]) cube([d,h,t],center=true);

 rotate([0,0,phi]) rotate([0,0,-90])  translate([0,b/2,t/2]) cube([d,b,t],center=true);
    
 translate([2*w,0,0]) rotate([0,0,90-phi]) translate([0,b/2,t/2]) cube([d,b,t],center=true); 
}
}

if (theta0!=0){
 union(){
rotate([0,0,theta0]) translate([0,h/2,t/2]) union(){difference(){cube([d,h,t],center=true);cube([d*2,h-2*d,t-2*d],center=true);}
}

 translate([ac[1][0],ac[1][1],0]) rotate([0,0,-phi]) rotate([0,0,-90])  translate([0,b/2,t/2]) difference(){cube([d,b,t],center=true);cube([d*2,b-2*d,t-2*d],center=true);}
    
 translate([ac[2][0],ac[2][1],0]) rotate([0,0,-90+phi]) translate([0,b/2,t/2]) difference(){cube([d,b,t],center=true);cube([d*2,b-2*d,t-2*d],center=true);}
    
 translate([2*w,0]) rotate([0,0,theta0]) translate([0,h/2,t/2]) union(){difference(){cube([d,h,t],center=true);cube([d*2,h-2*d,t-2*d],center=true);}}

 rotate([0,0,phi]) rotate([0,0,-90])  translate([0,b/2,t/2]) difference(){cube([d,b,t],center=true);cube([d*2,b-2*d,t-2*d],center=true);}
    
 translate([2*w,0,0]) rotate([0,0,90-phi]) translate([0,b/2,t/2]) difference(){cube([d,b,t],center=true);cube([d*2,b-2*d,t-2*d],center=true);}
   
}}

for (x = [0:5]){
translate([ac[x][0],ac[x][1],t/2-bf/2]) cylinder(t+bf,r1=d/2,r2=d/2,center=true);
};
}


module reentrant_filled(h,b,phi,d,t,bf,theta0){
reentrant(h,b,phi,d,t,bf,theta0);
    ac =    [[0,0],   
        [h*sin(-theta0),h*cos(-theta0)],
        [h*sin(-theta0),h*cos(-theta0)]+[b*cos(-phi),b*sin(-phi)],
        [h*sin(-theta0),h*cos(-theta0)]+[2*w,0],
        
        [2*b*cos(phi),0],
        [b*cos(phi),b*sin(phi)],
        ];
linear_extrude(t) polygon(ac);
}