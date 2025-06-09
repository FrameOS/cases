// Minimal overrides for Waveshare 10.3" ePaper case
include <case1.scad>;

/* [View settings] */
view_mode="print_horizontal"; // [print_vertical, print_horizontal, stacked, stacked_case, exploded, only_case, only_thick_border, only_panel_cover]

/* [Case depth] */
panel_cover_depth = 1.6;
panel_depth  = 1.2;
case_depth = 10.0; // change this for your usecase
back_depth = 1.2;
fillet_radius = 2.5; // How round to make the case. Not used with thick borders.

/* [Panel dimensions] */
panel_width  = 216.70;
panel_height = 174.41;

panel_bezel_left   = 3.1;
panel_bezel_right  = 3.1;
panel_bezel_top    = 3.1;
panel_bezel_bottom = 13.7;

/* [Border and inner padding] */
panel_border_left   = 6;
panel_border_right  = 6;
panel_border_top    = 6;
panel_border_bottom = 6;

// // Uniform border
// panel_border_left   = 16.6;
// panel_border_right  = 16.6;
// panel_border_top    = 16.6;
// panel_border_bottom = 6;

case_inner_padding_bottom = 6;

/* [Cable gap] */
panel_cable_gap_bottom = 141;

/* [Screws] */
screw_offset_left   = 3.2;
screw_offset_right  = 3.2;
screw_offset_top    = 3.2;
screw_offset_bottom = 3.2;

extra_screws_top    = [0.5, 0, 0, 0, 0];
extra_screws_bottom = [0.165, 0.835, 0, 0, 0];
extra_screws_left   = [0.5, 0, 0, 0, 0];
extra_screws_right  = [0.5, 0, 0, 0, 0];

/* [Center support] */
case_center_support_vertical   = false;
case_center_support_horizontal = true;

/* [Kickstand] */
kickstand = true;
kickstand_width = 95;
kickstand_hinge_top_extra_leverage = 5;
kickstand_leg_bridge_offset_percentage = 5;

/* [USB cutout] */
usb_cutout = true;
usb_cutout_offset_x_percentage = 8;
usb_cutout_offset_y_percentage = 12;
usb_cutout_box_width = 70;
usb_cutout_box_height = 20;
usb_cutout_box_depth = 7;
usb_cutout_left_wall_thickness = 0.8;
usb_cutout_right_wall_thickness = 0.8;
usb_cutout_top_wall_thickness = 0.8;
usb_cutout_bottom_wall_thickness = 0.8;
usb_cutout_hole_position = "right"; // [top, bottom, left, right]
usb_cutout_hole_width = 14;
usb_cutout_hole_height = 6.0;

/* [Hanging hole] */
// [ [top, bottom, left, right], offset_percentage ]
hanging_holes = [
    ["top", 20],
    ["left", 18],
];

/* [Side buttons] */
 // array of values 0.0 to 1.0
side_buttons_left = [];
side_buttons_right = [];
side_buttons_top = [];
side_buttons_bottom = [];

/* [Debug] */
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
