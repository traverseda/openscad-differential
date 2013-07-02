use<MCAD/2Dshapes.scad>
use<MCAD/involute_gears.scad>
use<"bigGear.scad">
include<settings.scad>



difference()
{

	union(){
		
		translate([0,0,-35])scale(2)import("bigGear.stl");

		cylinder(h = height, r=caserad);
		translate([])cylinder();
		}
	translate([0,0,basethick]){
		linear_extrude(height=height)ngon(numbgears,holerad);
	}
	translate([0,0,-1])cylinder(h = basethick+2, r=shaftsize);

	//This creates the holes for all the pins.
	rotate([0,0,pinrot])translate([0,0,height])for ( i = [0 : numbgears] )
	{
	    rotate( i * 360 / numbgears, [0, 0, 1])
	    translate([0, caserad-(caserad-holerad), 0])
	    rotate([90,0,0])cylinder(h = basethick+2, r=pinrad,$fn=20);
	}
for(i=[1:10]){
		translate([0,0,i-6])cylinder(h=1,r1=tan(i*7)+3.6,r2=tan((i+1)*7)+3.6);
	}

}

