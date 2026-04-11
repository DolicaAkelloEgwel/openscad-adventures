$fa = 1;
$fs = 0.4;

thickness = 2;

rad_ratio = 114.3 / 121;

r_large = [49.2121, 68.2625, 90.4875, 121];
height = [25.4, 31.75, 34.92, 50.8];

module layer(r_large, height) {
    cylinder(height, r_large * rad_ratio, r_large);
}

module dome() {
    layer(r_large[0], height[0]);

    translate([0,0,height[0]])
    layer(r_large[1], height[1]);

    translate([0,0,height[0]+height[1]])
    layer(r_large[2], height[2]);

    translate([0,0,height[0]+height[1]+height[2]])
    layer(r_large[3], height[3]);
}

color([1,0,0])
difference() {
    
    dome();
    
    translate([0, 0, thickness])
        layer(r_large[0], height[0]);
    
    translate([0, 0, height[0] + thickness])
        layer(r_large[1], height[1]);
    
    translate([0, 0, height[0] + height[1] + thickness])
        layer(r_large[2], height[2]);
    
    translate([0, 0, height[0] + height[1] + height[2] + thickness])
        layer(r_large[3], height[3]);
}