// Minimal overrides for Waveshare 13.3"E ePaper case
include <case1.scad>;

/* [View settings] */
view_mode="print_horizontal"; // [print_vertical, print_horizontal, stacked, stacked_case, exploded, only_case, only_thick_border, only_panel_cover]

/* [Case depth] */
panel_cover_depth = 1.6;
panel_depth  = 3.0;
case_depth = 12.0; // pi zero 12mm; board imposed minimum 5mm;
back_depth = 1.2;

/* [Panel dimensions] */
panel_width  = 297.0;
panel_height = 210.0;

panel_bezel_left   = 9.5;
panel_bezel_right  = 17.5;
panel_bezel_top    = 3.5;
panel_bezel_bottom = 3.5;

/* [Border and inner padding] */
panel_border_right  = 4;
panel_border_left   = panel_bezel_right + 4 - panel_bezel_left;
panel_border_top    = panel_bezel_right + 4 - panel_bezel_top;
panel_border_bottom = panel_bezel_right + 4 - panel_bezel_bottom;

case_inner_padding_left = 0; // no padding where the buttons are
case_inner_padding_right = 6;
case_inner_padding_top = 4;
case_inner_padding_bottom = 4;

/* [Thick border] */
thick_border = false; // Thick border, does not support side buttons
thick_border_width = 12.0;
thick_border_extra_depth = 15.0;

/* [Cable gap] */
// panel_cable_gap_right = 142;

/* [Screws] */
screw_offset_left   = 4.6;
screw_offset_right  = 4.6;
screw_offset_top    = 4.6;
screw_offset_bottom = 4.6;

extra_screws_top    = [0.333, 0.667, 0, 0];
extra_screws_bottom = [0.36, 0.64, 0, 0];
extra_screws_left   = [0.333, 0.667, 0, 0, 0];
extra_screws_right  = [0, 0, 0, 0, 0];

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
usb_cutout_box_depth           = 9.5;
usb_cutout_offset_x_percentage = 30;
usb_cutout_offset_y_percentage = 50;
usb_cutout_box_width = 20;
usb_cutout_box_height = 55;
usb_cutout_hole_position = "top"; // [top, bottom, left, right, back]

/* [Hanging hole] */
hanging_hole = true;
hanging_hole_offset = 50;

/* [SD card adapter cutout] */
sd_card_in_leg = false;
sd_card_in_leg_side = "left"; // [left, right]
sd_card_in_leg_side_side = "left"; // [left, right]
sd_card_in_leg_y_percentage = 82.0;

sd_card_in_usb_cutout = true;
sd_card_in_usb_cutout_side = "left"; // [left, right]
sd_card_in_usb_cutout_y_percentage = 80;

/* [Rear cooling] */
rear_cooling = true;
rear_cooling_x_start_percentage = 44;
rear_cooling_x_end_percentage = 65;
rear_cooling_y_start_percentage = 30;
rear_cooling_y_end_percentage = 60;

/* [Raspberry Pi Zero Pinholes] */
pi_pinholes = false;
pi_pinholes_orientation = "horizontal"; // [horizontal, vertical]
pi_pinholes_x_percentage = 50;
pi_pinholes_y_percentage = 85;

/* [Side buttons] */
side_buttons_left = [0.192, 0.398, 0.602, 0.808];
side_buttons_right = [];
side_buttons_top = [];
side_buttons_bottom = [];
side_button_base = 2.0;
side_button_base_border = 3.8; // adjust if setting the case depth
side_button_base_inner = 2.2;

/* [Debug] */
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
