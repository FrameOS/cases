// Minimal overrides for Waveshare 13.3"E ePaper case
include <case1.scad>;

/* [View settings] */
view_mode="print_horizontal"; // [print_vertical, print_horizontal, stacked]

/* [Case depth] */
case_depth = 6.0;

/* [Panel dimensions] */
panel_width  = 284.49;
panel_height = 208.81;

panel_bezel_left   = 3.3;
panel_bezel_right  = 11.7;
panel_bezel_top    = 3.1;
panel_bezel_bottom = 3.1;

/* [Border and inner padding] */
panel_border_left   = 16.0;
panel_border_right  = 7.6;
panel_border_top    = 16.2;
panel_border_bottom = 16.2;

case_inner_padding_right = 6;

/* [Cable gap] */
panel_cable_gap_right = 142;

/* [Screws] */
screw_offset_left   = 4.6;
screw_offset_right  = 4.6;
screw_offset_top    = 4.6;
screw_offset_bottom = 4.6;

extra_screws_top    = [0.48, 0.52, 0, 0, 0];
extra_screws_bottom = [0.48, 0.52, 0, 0, 0];
extra_screws_left   = [0.333, 0.667, 0, 0, 0];
extra_screws_right  = [0.17, 0.83, 0, 0, 0];

/* [Center support] */
case_center_support_vertical   = false;
case_center_support_horizontal = false;

/* [Kickstand] */
kickstand = true;
kickstand_width = 115;
kickstand_height_percentage = 74;
kickstand_leg_bridge_offset_percentage = 13.5;
kickstand_hinge_top_extra_leverage = 5;
kickstand_leg_bridge_height = 6.5;
kickstand_depth = 6.7;

/* [USB cutout] */
usb_cutout = true;
usb_cutout_box_depth           = 6.5;

// // Vertical hole
// usb_cutout_offset_x_percentage = 10;
// usb_cutout_offset_y_percentage = 18;
// usb_cutout_box_height          = 55;

// Horizontal hole
usb_cutout_offset_x_percentage = 10;
usb_cutout_offset_y_percentage = 11;
usb_cutout_box_width = 55;
usb_cutout_box_height = 20;
usb_cutout_hole_position = "right"; // [top, bottom, left, right, back]

/* [Hanging hole] */
hanging_hole = true;
hanging_hole_offset = 70;

/* [SD card adapter cutout] */
sd_card_in_leg = true;
sd_card_in_leg_side = "left"; // [left, right]
sd_card_in_leg_side_side = "left"; // [left, right]
sd_card_in_leg_y_percentage = 82.0;

/* [Rear cooling] */
rear_cooling = false;
rear_cooling_x_start_percentage = 6.3;
rear_cooling_x_end_percentage = 20;
rear_cooling_y_start_percentage = 18;
rear_cooling_y_end_percentage = 60;

/* [Raspberry Pi Zero Pinholes] */
pi_pinholes = false;
pi_pinholes_ordientation = "vertical"; // [horizontal, vertical]
pi_pinholes_x_percentage = 5.5;
pi_pinholes_y_percentage = 15;

/* [Side buttons] */
side_buttons_left = [];
side_buttons_right = [];
side_buttons_top = [];
// side_buttons_top = [90];
side_buttons_bottom = [];

/* [Debug] */
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
