// Minimal overrides for Waveshare 13.3"E ePaper case
include <case1.scad>;

// View settings
view_mode="print_vertical"; // [print_vertical, print_horizontal, stacked]

// Panel dimensions
panel_width  = 284.49;
panel_height = 208.81;

panel_bezel_left   = 11.7;
panel_bezel_right  = 3.3;
panel_bezel_top    = 3.1;
panel_bezel_bottom = 3.1;

// Border and inner padding
panel_border_left   = 6.2;
panel_border_right  = 14.6;
panel_border_top    = 14.8;
panel_border_bottom = 14.8;

case_inner_padding_left = 6;

// Cable gap
panel_cable_gap_left = 142;

// Case depth
case_depth = 6.0;

// Screws
screw_offset_left   = 3.2;
screw_offset_right  = 3.2;
screw_offset_top    = 3.2;
screw_offset_bottom = 3.2;

extra_screws_top    = [0.48, 0.52, 0, 0, 0];
extra_screws_bottom = [0.48, 0.52, 0, 0, 0];
extra_screws_left   = [0.17, 0.83, 0, 0, 0];
extra_screws_right  = [0.333, 0.667, 0, 0, 0];

// Center support
case_center_support_vertical   = true;
case_center_support_horizontal = true;

// Kickstand
kickstand = true;
kickstand_leg_bridge_offset_percentage = 10;
kickstand_hinge_top_extra_leverage     = 5;

// USB cutout
usb_cutout = true;
usb_cutout_offset_x_percentage = 25;
usb_cutout_box_height          = 55;
usb_cutout_box_depth           = 6.5;

// Hanging hole
hanging_hole = true;
hanging_hole_offset = 70;

// Debug
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
