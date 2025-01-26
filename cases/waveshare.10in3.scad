// Minimal overrides for Waveshare 10.3" ePaper case
include <case1.scad>;

// View settings
view_mode="print_vertical"; // [print_vertical, print_horizontal, stacked]

// Panel dimensions
panel_width  = 216.70;
panel_height = 174.41;

panel_bezel_left   = 3.1;
panel_bezel_right  = 3.1;
panel_bezel_top    = 3.1;
panel_bezel_bottom = 13.7;

// Border and inner padding
panel_border_left   = 6;
panel_border_right  = 6;
panel_border_top    = 6;
panel_border_bottom = 6;

case_inner_padding_bottom = 6;

// Cable gap
panel_cable_gap_bottom = 141;

// Case depth
case_depth = 10.0;

// Screws
screw_offset_left   = 3.2;
screw_offset_right  = 3.2;
screw_offset_top    = 3.2;
screw_offset_bottom = 3.2;

extra_screws_top    = [0.5, 0, 0, 0, 0];
extra_screws_bottom = [0.165, 0.835, 0, 0, 0];
extra_screws_left   = [0.5, 0, 0, 0, 0];
extra_screws_right  = [0.5, 0, 0, 0, 0];

// Center support
case_center_support_vertical   = true;
case_center_support_horizontal = true;

// Kickstand
kickstand = true;
kickstand_hinge_top_extra_leverage = 5;

// USB cutout
usb_cutout = true;
usb_cutout_offset_x_percentage = 12;
usb_cutout_offset_y_percentage = 30;
usb_cutout_box_depth           = 7;

// Hanging hole
hanging_hole = true;
hanging_hole_offset = 70;

// Debug
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
