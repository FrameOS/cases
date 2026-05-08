// Minimal overrides for Waveshare 7.3" E case
include <case1.scad>;

/* [View Settings] */
view_mode="print_horizontal"; // [print_vertical, print_horizontal, stacked, stacked_case, exploded, only_case, only_thick_border, only_panel_cover]

/* [Case depth] */
panel_cover_depth = 1.6;
panel_depth  = 1.2;
case_depth = 6.0; // change this for your usecase
back_depth = 1.2;
fillet_radius = 2.2;

/* [Panel dimensions] */
panel_width  = 170.3;
panel_height = 111.3;

panel_bezel_left   = 5.2;
panel_bezel_right  = 5.2;
panel_bezel_top    = 4.9;
panel_bezel_bottom = 10.8;

/* [Border and inner padding] */
panel_border_left   = 2.0;
panel_border_right  = 2.0;
panel_border_top    = 6.8;
panel_border_bottom = 6.8;

// // Uniform border
// panel_border_left   = 14 - panel_bezel_left;
// panel_border_right  = 14 - panel_bezel_right;
// panel_border_top    = 14 - panel_bezel_top;
// panel_border_bottom = 14 - panel_bezel_bottom;

case_inner_padding_left   = 2.0;
case_inner_padding_right  = 0.5;
case_inner_padding_top    = 2.0;
case_inner_padding_bottom = 2.0;

/* [Cover/case thickness reversal] */
reverse_border_thickness = true;
reverse_border_gap = 0.3;

/* [Cable gap] */
panel_cable_gap_bottom = 40;

/* [Screws] */
screw_offset_left   = 4.4;
screw_offset_right  = 4.4;
screw_offset_top    = 4.2;
screw_offset_bottom = 4.2;

extra_screws_top    = [0.5, 0, 0, 0, 0];
extra_screws_bottom = [0.35, 0.65, 0, 0, 0];
extra_screws_left   = [0, 0, 0, 0, 0];
extra_screws_right  = [0, 0, 0, 0, 0];

// Hole made into panel cover
panel_screw_insert_diameter = 3.45;
panel_screw_insert_depth = 0.5;

// Cylindrical hole inserted into case
case_screw_hole_diameter        = 4.5;
case_screw_hole_thread_diameter = 2.0;
case_screw_hole_floor_depth     = 2.0;
case_screw_hole_insert_depth    = 4.0;

/* [Center support] */
case_center_support_vertical   = false;
case_center_support_horizontal = false;

/* [Kickstand] */
kickstand = true;
kickstand_width = 95;
kickstand_leg_bridge_height             = 6.5;
kickstand_leg_bridge_offset_percentage  = 12;
kickstand_leg_bottom_angle              = 80;
kickstand_depth                         = 6.7;

/* [USB cutout] */
usb_cutout = true;
usb_cutout_offset_x_percentage = 93.3;
usb_cutout_offset_y_percentage = 66.0;
usb_cutout_box_depth           = 6.4;
usb_cutout_hole_height         = 4;
usb_cutout_hole_width          = 11;
usb_cutout_top_wall_thickness  = 1.5;


/* [SD cutout] */

sd_cutout = true;
sd_cutout_offset_x_percentage = 13.1;
sd_cutout_offset_y_percentage = 9.5;
sd_cutout_box_width = 30;
sd_cutout_box_height = 18.2;
sd_cutout_box_depth = 6;
sd_cutout_left_wall_thickness = 1.4;
sd_cutout_right_wall_thickness = 2;
sd_cutout_bottom_wall_thickness = 1.4;
sd_cutout_top_wall_thickness = 1.4;
sd_cutout_back_wall_thickness = 0.8;
sd_cutout_hole_offset = 0.0;
sd_cutout_hole_position = "right"; // [top, bottom, left, right, back]
sd_cutout_hole_width = 18;
sd_cutout_hole_height = 4.6;


/* [Hanging hole] */
// [ [top, bottom, left, right], offset_percentage ]
hanging_holes = [
    ["top", 9],
];

hanging_hole_large_diameter = 6;
hanging_hole_small_diameter = 2.5;
hanging_hole_box_width = 8;
hanging_hole_box_height = 16;

/* [SD card adapter cutout] */
sd_card_in_leg = false;

/* [Raspberry Pi Zero Pinholes] */
pi_pinholes = true;
pi_pinholes_orientation = "horizontal"; // [horizontal, vertical]
pi_pinholes_x_percentage = 50;
pi_pinholes_y_percentage = 52.8;
pi_pinholes_spacer_height = 3.2;

/* [Extra Pin Mounts] */
extra_pin_mounts_enabled = true;
extra_pin_mounts_anchor = "top-right";
// Each mount is [x_offset, y_offset, pin_diameter, spacer_diameter, spacer_height, pin_enabled].
// Use [x_offset, y_offset] to keep the Raspberry Pi pin defaults, or undef for any optional value.
extra_pin_mounts = [
    // eink pcb
    [0.302, 21.208, 2.55],
    [0.302 - 12, 21.208, 2.55],
    [0.302, 21.208 - 8, undef, undef, undef, false],
    [0.302 - 29, 21.208 - 12.7, undef, undef, 2, false],
    [-58.302, 21.208 - 6.3, undef, undef, 2.3, false],
    // top pcb
    [52.802, -65.0],
    [-17.802, -65.0],
    [-39, -65.0, undef, undef, undef, false],
    [-58, -40.0, undef, undef, undef, false],
    [0, -40.0, undef, undef, undef, false],
];

/* [Backplate Access Holes] */

backplate_access_holes = true;
backplate_access_holes_diameter = 1.5;
backplate_access_holes_anchor = "top-right";
backplate_access_holes_offsets = [
    [0.302 - 6.063, 21.208],
    [0.302 - 6.063, 21.208 - 4.318],
    [0.302 - 6.063, 21.208 - 4.318 - 4.359],
];


/* [Side buttons] */
 // array of values 0.0 to 1.0
side_buttons_left = [];
side_buttons_right = [0.15, 0.25];
side_buttons_top = [0.9];
side_buttons_bottom = [];

/* [Debug] */
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
