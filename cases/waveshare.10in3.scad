// Minimal overrides for Waveshare 10.3" ePaper case
include <case1.scad>;

/* [View settings] */
view_mode="print_horizontal"; // [print_vertical, print_horizontal, stacked, stacked_case, exploded, only_case, only_thick_border, only_panel_cover]

/* [Case depth] */
case_depth = 10.0;

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
usb_cutout_box_wall_thickness = 0.8;
usb_cutout_hole_position = "right"; // [top, bottom, left, right]
usb_cutout_hole_width = 14;
usb_cutout_hole_height = 6.0;

/* [Hanging hole] */
hanging_hole = true;
hanging_hole_offset = 30;

/* [Debug] */
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
