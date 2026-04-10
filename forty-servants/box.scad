$fa = 1;
$fs = 0.4;

thickness = 0.2;

inner_x = 7.2;
inner_y = 12.2;
inner_z = 2;

finger_y_translation = (inner_y * 0.5) + thickness;
finger_z_translation = -0.1;

difference() {
    cube([inner_x + (thickness * 2), inner_y + (thickness * 2), inner_z + thickness]);

    translate([thickness, thickness, thickness])
    cube([inner_x, inner_y, inner_z + 1]);

    translate([0, finger_y_translation, finger_z_translation])
    cylinder(h=inner_z + (thickness + 2) + 2, r1=1.5, r2=4);

    translate([inner_x + thickness, finger_y_translation, finger_z_translation])
    cylinder(h=inner_z + (thickness + 2) + 2, r1=1.5, r2=4);
}