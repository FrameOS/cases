// Minimal overrides for Waveshare 7.3" E case
include <case1.scad>;

/* [View Settings] */
view_mode="print_horizontal"; // [print_vertical, print_horizontal, stacked, stacked_case, exploded, only_case, only_thick_border, only_panel_cover]

/* [Case depth] */
case_depth = 6.0;
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
case_inner_padding_right  = 2.0;
case_inner_padding_top    = 2.0;
case_inner_padding_bottom = 2.0;

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

/* [Center support] */
case_center_support_vertical   = false;
case_center_support_horizontal = false;

/* [Kickstand] */
kickstand = true;
kickstand_width = 95;
kickstand_leg_bridge_height             = 6.5;
kickstand_leg_bridge_offset_percentage  = 15;
kickstand_depth                         = 6.7;

/* [USB cutout] */
usb_cutout = true;
usb_cutout_offset_x_percentage = 92;
usb_cutout_offset_y_percentage = 70;
usb_cutout_box_depth           = 6.4;
usb_cutout_hole_height         = 5.8;
usb_cutout_hole_width          = 14;

/* [Hanging hole] */
hanging_hole = true;
hanging_hole_offset = 7;

/* [SD card adapter cutout] */
sd_card_in_leg = true;
sd_card_in_leg_side = "left"; // [left, right]
sd_card_in_leg_side_side = "left"; // [left, right]
sd_card_in_leg_y_percentage = 74;

/* [Rear cooling] */
rear_cooling = true;
rear_cooling_x_start_percentage = 6.3;
rear_cooling_x_end_percentage = 20;
rear_cooling_y_start_percentage = 18;
rear_cooling_y_end_percentage = 60;

/* [Raspberry Pi Zero Pinholes] */
pi_pinholes = true;
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
