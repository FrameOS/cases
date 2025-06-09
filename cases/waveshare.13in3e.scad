// Minimal overrides for Waveshare 13.3"E ePaper case
include <case1.scad>;

/* [View settings] */
view_mode="print_horizontal"; // [print_vertical, print_horizontal, stacked, stacked_case, exploded, only_case, only_thick_border, only_panel_cover]

/* [Case depth] */
panel_cover_depth = 1.6;
panel_depth  = 1.2;
case_depth = 9.0; // change this for your usecase
back_depth = 1.2;
fillet_radius = 2.5; // How round to make the case. Not used with thick borders.

/* [Panel dimensions] */
panel_width  = 285.09;
panel_height = 209.01;

panel_bezel_left   = 3.8;
panel_bezel_right  = 11.8;
panel_bezel_top    = 3.2;
panel_bezel_bottom = 3.2;

/* [Border and inner padding] */
panel_border_left   = 15.5;
panel_border_right  = 7.5;
panel_border_top    = 16.1;
panel_border_bottom = 16.1;

case_inner_padding_left = 4;
case_inner_padding_right = 6;
case_inner_padding_top = 4;
case_inner_padding_bottom = 4;

/* [Thick border] */
thick_border = true;
thick_border_width = 12.0;
thick_border_extra_depth = 15.0;

/* [Cable gap] */
panel_cable_gap_right = 142;

/* [Screws] */
screw_offset_left   = 4.6;
screw_offset_right  = 4.6;
screw_offset_top    = 4.6;
screw_offset_bottom = 4.6;

extra_screws_top    = [0.333, 0.667, 0, 0];
extra_screws_bottom = [0.36, 0.64, 0, 0];
extra_screws_left   = [0.333, 0.667, 0, 0, 0];
extra_screws_right  = [0.17, 0.83, 0, 0, 0];

/* [Center support] */
case_center_support_vertical   = false;
case_center_support_horizontal = false;

/* [Kickstand] */
kickstand = false;
kickstand_width = 115;
kickstand_height_percentage = 74;
kickstand_leg_bridge_offset_percentage = 14;
kickstand_hinge_top_extra_leverage = 5;
kickstand_leg_bridge_height = 6.5;
kickstand_depth = 6.7;

/* [USB cutout] */
usb_cutout = true;
usb_cutout_box_depth           = 6.5;
usb_cutout_offset_x_percentage = 50;
usb_cutout_offset_y_percentage = 50;
usb_cutout_box_width = 20;
usb_cutout_box_height = 55;
usb_cutout_hole_position = "top"; // [top, bottom, left, right, back]

/* [Hanging hole] */
// [ [top, bottom, left, right], offset_percentage ]
hanging_holes = [
    ["top", 20],
    ["left", 20],
];

/* [SD card adapter cutout] */
sd_card_in_leg = false;
sd_card_in_leg_side = "left"; // [left, right]
sd_card_in_leg_side_side = "left"; // [left, right]
sd_card_in_leg_y_percentage = 82.0;

sd_card_in_usb_cutout = true;
sd_card_in_usb_cutout_side = "right"; // [left, right]
sd_card_in_usb_cutout_y_percentage = 80;

/* [Rear cooling] */
rear_cooling = false;
rear_cooling_x_start_percentage = 41.7;
rear_cooling_x_end_percentage = 58;
rear_cooling_y_start_percentage = 73.6;
rear_cooling_y_end_percentage = 81;

/* [Raspberry Pi Zero Pinholes] */
pi_pinholes = true;
pi_pinholes_orientation = "horizontal"; // [horizontal, vertical]
pi_pinholes_x_percentage = 50;
pi_pinholes_y_percentage = 85;

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
