#!/bin/bash
echo flow_channels = 18\;>control.scad
echo columns = 3\;>>control.scad
echo control_regions = 6\;>>control.scad
echo control = [ >>control.scad
for x0 in $(seq 0 4)
do
for x1 in $(seq $(($x0+1)) 5 )
do
for x2 in $(seq $(($x1+1)) 6 )
do
echo $(echo [ $x0, $x1, $x2 ], ) >>control.scad
done
done
done
echo ]\;>>control.scad
