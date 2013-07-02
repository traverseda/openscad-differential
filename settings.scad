//This is where all the generic settings go.

numbgears=7;
holerad=23;//should be axle gear rad+some extra. Will take some fiddling to find out exactly how much bigger.
shaftsize=4;//radius obviously...
caserad=holerad+3;//The radius of the outside of the case

basethick=5;//how thick the base is.
height=basethick+9;//How tall one half is.

pinrad=2;//How thick the pins that hold the gears to the body are
pinrot=14;//Edit this manually until the pins line up with the sides. I really should figure out how to do this automatically, or perhaps just rewrite ngon so it uses the same rotation method. For 7 sides it's 15

//---Gear settings start here

gear1_teeth = 27;
gear2_teeth = 8;
axis_angle = 90;
outside_circular_pitch=280;