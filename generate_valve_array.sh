#!/bin/bash

echo \#\!\/bin\/bash > control_loop.sh

flow=$1
echo $(echo echo flow_channels = $flow\\\;\>control.scad) >> control_loop.sh
echo $(echo echo columns = $2\\\;\>\>control.scad) >> control_loop.sh

# calculate number of control regions
control=2;

while [ $flow -ge $(( $(seq -s "*" 1 $control|bc) / $(seq -s "*" 1 $(($control/2))|bc)**2  )) ]
do
control=$(( $control+2 ))
done

echo $(echo echo control_regions = $control\\\;\>\>control.scad) >> control_loop.sh

echo echo control = [ \>\>control.scad>> control_loop.sh

# print the list of positions of always open segments for each flow

echo for x0 in \$\(seq 0 $(($control - ($control/2 - 1) - 1))\) >> control_loop.sh
echo do >> control_loop.sh

for n in $(seq 1 $(($control/2-1)) )
do 
echo for x$n in \$\(seq \$\(\(\$x$(($n-1))+1\)\) $(($control - ($control/2 - 1 - $n ) - 1 )) \) >> control_loop.sh
echo do >> control_loop.sh
done

xn=\$x0
for n in $(seq 1 $(($control/2-1)) )
do
xn=$(echo $xn, \$x$n)
done

echo echo \$\(echo \[ $xn \]\, \) \>\>control.scad>> control_loop.sh

for n in $(seq 1 $(($control/2)) )
do
echo done >> control_loop.sh
done
echo $(echo echo ]\\\;\>\>control.scad) >> control_loop.sh

bash control_loop.sh

# uncheck below to also run openscad on the command line (slow) to generate STL file

# openscad -o valve_array.stl valve_array.scad 

# uncheck to also run accelerated openscad (following instructions from https://gist.github.com/ochafik/6e95596a6e6188b2062ee056b55ce47d) to generate STL file 

# openscad-nightly -o valve_array.stl --enable=fast-csg --enable=fast-cst-trust-corefinement --enable=rewrite-tree --enable=manifold --enable=lazy-union valve_array.scad 
