color("blue")import("casehalf.stl");

translate([0,0,-12])color("red")import("bigGear.stl");
//translate([0,0,42])rotate([0,180,0])color("red")import("bigGear.stl");


for(i=[1:7]){
	translate([0,0,14])rotate([0,90,i*360/7+180/7])translate([0,0,-14])color("green")import("smallGear.stl");
}
translate([0,0,12])color("yellow")import("spokes.stl");

translate([0,0,-12])color("pink")import("axel.stl");