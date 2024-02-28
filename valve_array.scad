// Compile the structure for the valve array
// EAJ 2024

include <./params.scad>;

include  <./reentrant_structures.scad>

include  <./closeable_segment.scad>

include  <./always_open_segment.scad>

include <./control.scad>;

function inlist(x,list,i = 0, m = false) = i < len(list) ? inlist(x,list,i+1,m||(list[i]==x)) : m;

union(){
for (z = [0:(control_regions-1)]){
for (x = [0:(flow_channels-1)]){

    
     if inlist(z,control[x]){
    translate([(x%columns)*(8*w),floor(x/columns)*ydim-0.01*floor(x/columns),2*t*z]) always_open(h,b,phi,d,t,0,theta,ri,ro);
    }
    else {translate([(x%columns)*(8*w),floor(x/columns)*ydim-0.01*floor(x/columns),2*t*z]) closeable(h,b,phi,d,t,0,theta,ri,ro);
        }
    }


}
}
