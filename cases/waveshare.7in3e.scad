// Minimal overrides for Waveshare 7.3" E case
include <case1.scad>;

/* [View Settings] */
view_mode="print_horizontal"; // [print_vertical, print_horizontal, stacked]

/* [Case depth] */
case_depth = 6.0;

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
panel_border_top    = 6.4;
panel_border_bottom = 6.4;

// // Uniform border
// panel_border_left   = 9.2;
// panel_border_right  = 9.2;
// panel_border_top    = 9.9;
// panel_border_bottom = 4.0;

case_inner_padding_left   = 2.0;
case_inner_padding_right  = 2.0;
case_inner_padding_top    = 2.0;
case_inner_padding_bottom = 2.0;

/* [Cable gap] */
panel_cable_gap_bottom = 40;

/* [Screws] */
screw_offset_left   = 4.2;
screw_offset_right  = 4.2;
screw_offset_top    = 3.7;
screw_offset_bottom = 3.7;

extra_screws_top    = [0, 0, 0, 0, 0];
extra_screws_bottom = [0, 0, 0, 0, 0];
extra_screws_left   = [0, 0, 0, 0, 0];
extra_screws_right  = [0, 0, 0, 0, 0];

/* [Center support] */
case_center_support_vertical   = false;
case_center_support_horizontal = false;

/* [Kickstand] */
kickstand = true;
kickstand_width = 95;
kickstand_leg_bridge_height             = 6.5;
kickstand_leg_bridge_offset_percentage  = 0.55;
kickstand_depth                         = 6.7;

/* [USB cutout] */
usb_cutout = true;
usb_cutout_offset_x_percentage = 92;
usb_cutout_offset_y_percentage = 50;
usb_cutout_box_depth           = 6.4;
usb_cutout_hole_height         = 5.8;

/* [Hanging hole] */
hanging_hole = true;
hanging_hole_offset = 4;

/* [Debug] */
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
