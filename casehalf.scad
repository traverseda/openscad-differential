use<MCAD/2Dshapes.scad>

numbgears=7;
holerad=23;//should be axle gear rad+some extra. Will take some fiddling to find out exactly how much bigger.
shaftsize=4;//radius obviously...
caserad=holerad+3;//The radius of the outside of the case

basethick=5;//how thick the base is.
height=basethick+9;//How tall one half is.

pinrad=2;//How thick the pins that hold the gears to the body are
pinrot=14;//Edit this manually until the pins line up with the sides. I really should figure out how to do this automatically, or perhaps just rewrite ngon so it uses the same rotation method. For 7 sides it's 15

difference()
{
	cylinder(h = height, r=caserad);
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

