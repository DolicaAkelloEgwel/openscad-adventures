$fa = 1;
$fs = 0.4;

thickness = 2;

card_x = 72;
card_y = 122;
card_z = 15;

tolerance = 0.7;

inner_x = card_x + tolerance;
inner_y = card_y + tolerance;
inner_z = ceil(card_z * 0.1) * 10;

echo(inner_z);

finger_y_translation = (inner_y * 0.5) + thickness;
finger_x_translation = (inner_x * 0.5) + thickness;
finger_z_translation = -5;

outer_x = inner_x + (thickness * 2);
outer_y = inner_y + (thickness * 2);
outer_z = inner_z + thickness;

finger_slot_height = outer_z + 10;

finger_small_radius = 15;
finger_large_radius = 20;

cut = 25;

difference() {
    cube([outer_x, outer_y, outer_z]);

    translate([thickness, thickness, thickness])
    cube([inner_x, inner_y, inner_z + 1]);

    // left slot
    translate([0, finger_y_translation, finger_z_translation])
    cylinder(h=finger_slot_height, r1=finger_small_radius, r2=finger_large_radius);

    // right slot
    translate([outer_x, finger_y_translation, finger_z_translation])
    cylinder(h=finger_slot_height, r1=finger_small_radius, r2=finger_large_radius);

    // bottom slot
    translate([finger_x_translation, 0, finger_z_translation])
    cylinder(h=finger_slot_height, r1=finger_small_radius, r2=finger_large_radius);

    // top slot
    translate([finger_x_translation, outer_y, finger_z_translation])
    cylinder(h=finger_slot_height, r1=finger_small_radius, r2=finger_large_radius);

    // extra cut
    translate([cut, 0, thickness])
    cube([outer_x - (2 * cut), outer_y, outer_z]);

    // extra cut
    translate([0, cut, thickness])
    cube([outer_x , outer_y - (2 * cut), outer_z]);
}