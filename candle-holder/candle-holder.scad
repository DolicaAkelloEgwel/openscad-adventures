include<BOSL2/std.scad>
bottom_diameter = 16.35;
candle_gap = 21.65;
cylinder(h=35, d= bottom_diameter)
    position(TOP) cylinder(h=3, d=40)
        position(TOP) difference() {
            cylinder(h=50, d=candle_gap + 3);
            cylinder(h=50, d=candle_gap);
        }