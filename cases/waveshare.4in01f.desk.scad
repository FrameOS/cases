// Minimal overrides for Waveshare 7.3" E case
include <case1.scad>;

/* [View Settings] */
view_mode="print_horizontal"; // [print_vertical, print_horizontal, stacked, stacked_case, exploded, only_case, only_thick_border, only_panel_cover]

/* [Case depth] */
case_depth = 6.0;

/* [Panel dimensions] */
panel_width  = 69.7;
panel_height = 98.3;
panel_depth  = 6.8;

panel_bezel_left   = 10.5;
panel_bezel_right  = 6.5;
panel_bezel_top    = 6.5;
panel_bezel_bottom = 6.5;

/* [Border and inner padding] */
panel_border_right  = 6.0;
panel_border_left   = 3.0;
panel_border_top    = 6.0;
panel_border_bottom = 6.0;

case_inner_padding_left   = 3.2;
case_inner_padding_right  = 2.0;
case_inner_padding_top    = 2.0;
case_inner_padding_bottom = 1.0;

/* [Screws] */
screw_offset_left   = 4.0;
screw_offset_right  = 4.0;
screw_offset_top    = 4.0;
screw_offset_bottom = 4.0;

extra_screws_top    = [0, 0, 0, 0, 0];
extra_screws_bottom = [0, 0, 0, 0, 0];
extra_screws_left   = [0, 0, 0, 0, 0];
extra_screws_right  = [0, 0, 0, 0, 0];

/* [Center support] */
case_center_support_vertical   = false;
case_center_support_horizontal = false;

/* [Kickstand] */
kickstand = true;
kickstand_width = 64;
kickstand_leg_width = 6;
kickstand_leg_bridge_height             = 6.5;
kickstand_leg_bridge_offset_percentage  = 0;
kickstand_depth                         = 6.7;

/* [USB cutout] */
usb_cutout = true;
usb_cutout_hole_position = "back"; // [top, bottom, left, right, back]
usb_cutout_offset_x_percentage = 50;
usb_cutout_offset_y_percentage = 80;
usb_cutout_box_width = 17;
usb_cutout_box_height = 11;
usb_cutout_box_depth           = 2.2;
usb_cutout_left_wall_thickness = 1.2;
usb_cutout_right_wall_thickness = 1.2;
usb_cutout_top_wall_thickness = 1.2;
usb_cutout_bottom_wall_thickness = 1.2;
usb_cutout_hole_height         = 5.8;

/* [Hanging hole] */
hanging_hole = false;
hanging_hole_offset = 4;

/* [Debug] */
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
