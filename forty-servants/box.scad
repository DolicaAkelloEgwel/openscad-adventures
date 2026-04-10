$fa = 1;
$fs = 0.4;

thickness = 2;

inner_x = 72;
inner_y = 122;
inner_z = 20;

finger_y_translation = (inner_y * 0.5) + thickness;
finger_x_translation = (inner_x * 0.5) + thickness;
finger_z_translation = -5;

finger_slot_height = inner_z + thickness + 10;

outer_x = inner_x + (thickness * 2);
outer_y = inner_y + (thickness * 2);
outer_z = inner_z + thickness;

finger_small_radius = 15;
finger_large_radius = 20;

difference() {
    cube([outer_x, outer_y, outer_z]);

    translate([thickness, thickness, thickness])
    cube([inner_x, inner_y, inner_z + 1]);

    translate([0, finger_y_translation, finger_z_translation])
    cylinder(h=finger_slot_height, r1=finger_small_radius, r2=finger_large_radius);

    translate([outer_x, finger_y_translation, finger_z_translation])
    cylinder(h=finger_slot_height, r1=finger_small_radius, r2=finger_large_radius);
    
    translate([finger_x_translation, thickness, finger_z_translation])
    cylinder(h=finger_slot_height, r1=finger_small_radius, r2=finger_large_radius);

    translate([finger_x_translation, outer_y, finger_z_translation])
    cylinder(h=finger_slot_height, r1=finger_small_radius, r2=finger_large_radius);
}