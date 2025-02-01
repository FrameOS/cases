// Minimal overrides for Waveshare 7.5" ePaper case
include <case1.scad>;

/* [View settings] */
view_mode="print_vertical"; // [print_vertical, print_horizontal, stacked]

/* [Panel dimensions] */
panel_width  = 170.3;
panel_height = 111.3;

panel_bezel_left   = 3.2;
panel_bezel_right  = 3.2;
panel_bezel_top    = 3.0;
panel_bezel_bottom = 8.9;

/* [Border and inner padding] */
panel_border_left   = 2.0;
panel_border_right  = 2.0;
panel_border_top    = 6.0;
panel_border_bottom = 6.0;

// // Uniform border
// panel_border_left   = 9.7;
// panel_border_right  = 9.7;
// panel_border_top    = 9.9;
// panel_border_bottom = 4.0;

case_inner_padding_left   = 2.0;
case_inner_padding_right  = 2.0;
case_inner_padding_top    = 2.0;
case_inner_padding_bottom = 2.0;

/* [Cable gap] */
panel_cable_gap_bottom = 40;

/* [Case depth] */
case_depth = 6.0;

/* [Screws] */
screw_offset_left   = 4.2;
screw_offset_right  = 4.2;
screw_offset_top    = 3.2;
screw_offset_bottom = 3.2;

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
kickstand_leg_bridge_height             = 8;
kickstand_leg_bridge_offset_percentage  = 0;
kickstand_depth                         = 6.7;

/* [USB cutout] */
usb_cutout = true;
usb_cutout_offset_y_percentage = 28;
usb_cutout_box_depth           = 6.4;
usb_cutout_hole_height         = 5.8;

/* [Hanging hole] */
hanging_hole = true;
hanging_hole_offset = 4;

/* [Debug] */
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
