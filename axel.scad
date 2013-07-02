use<MCAD/2Dshapes.scad>

//axel

difference(){

	union(){

	//this for loop is a tan fillet
	for(i=[1:10]){
		translate([0,0,i+5])cylinder(h=1,r1=tan(i*7)+3.5,r2=tan((i+1)*7)+3.5);
		}
	translate([0,0,-20])cylinder(	h=40, r=3.8);
	translate([0,0,-30])linear_extrude(height=10)ngon(6,4);

	difference(){

		translate([0,0,16])cylinder(h=5, r=10);
		translate([24.9,24.9,21])cube([50,50,5], center=true);
		translate([-24.9,-24.9,21])cube([50,50,5], center=true);
	}}

translate([0,0,-60])cylinder(h=90, r=2.2);

};

