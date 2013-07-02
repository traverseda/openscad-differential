use<MCAD/2Dshapes.scad>

include <settings.scad>


//	translate([0,0,-1])cylinder(h = basethick+2, r=shaftsize);
difference(){
//union all the spokes to a center cylinder
union(){
cylinder(h = pinrad*2, r=8);
	//This creates the holes for all the pins.
	rotate([0,0,pinrot])translate([0,0,2])for ( i = [0 : numbgears] )
	{
	    rotate( i * 360 / numbgears, [0, 0, 1])
	    translate([0, caserad-(caserad-holerad), 0])
	    rotate([90,0,0])cylinder(h = basethick+2+20, r=pinrad,$fn=20);
}}
translate([0,0,-1])cylinder(h = basethick+2, r=shaftsize);
};