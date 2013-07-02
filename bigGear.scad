use<MCAD/involute_gears.scad>;


	gear1_teeth = 27;
	gear2_teeth = 8;
	axis_angle = 90;
	outside_circular_pitch=280;

	outside_pitch_radius1 = gear1_teeth * outside_circular_pitch / 360;
	outside_pitch_radius2 = gear2_teeth * outside_circular_pitch / 360;
	pitch_apex1=outside_pitch_radius2 * sin (axis_angle) +
		(outside_pitch_radius2 * cos (axis_angle) + outside_pitch_radius1) / tan (axis_angle);
	cone_distance = sqrt (pow (pitch_apex1, 2) + pow (outside_pitch_radius1, 2));
	pitch_apex2 = sqrt (pow (cone_distance, 2) - pow (outside_pitch_radius2, 2));
	echo ("cone_distance", cone_distance);
	pitch_angle1 = asin (outside_pitch_radius1 / cone_distance);
	pitch_angle2 = asin (outside_pitch_radius2 / cone_distance);
	echo ("pitch_angle1, pitch_angle2", pitch_angle1, pitch_angle2);
	echo ("pitch_angle1 + pitch_angle2", pitch_angle1 + pitch_angle2);

//trim a bit off the edge for smoothness and fit.
intersection(){

//gear

difference(){

	rotate([0,0,90])
	translate ([0,0,pitch_apex1+20])
	{
		translate([0,0,-pitch_apex1])
		bevel_gear (
			number_of_teeth=gear1_teeth,
			cone_distance=cone_distance,
			pressure_angle=30,
			outside_circular_pitch=outside_circular_pitch,
			face_width=18.5,
			gear_thickness=0,
			bore_diameter=0
			);
	}
//axel

difference(){
	union(){
	translate([0,0,-60])cylinder(	h=80, r=3.8);
	difference(){
		translate([0,0,16])cylinder(h=5, r=10.3);
		translate([25.2,25.2,21])cube([50,50,5], center=true);
		translate([-25.2,-25.2,21])cube([50,50,5], center=true);
	}}
translate([0,0,-60])cylinder(h=90, r=2.2);

}
cylinder(h=50, r=4);
translate([0,0,39])cube([100,100,30], center=true);
}

cylinder(h=80, r=20);
}