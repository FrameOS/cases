// Minimal overrides for Pimoroni 7.3" 2025 SPECTRA
include <case1.scad>;

/* [View settings] */
view_mode="print_horizontal"; // [print_vertical, print_horizontal, stacked, stacked_case, exploded, only_case, only_thick_border, only_panel_cover]

/* [Case depth] */
panel_cover_depth = 1.6;
panel_depth  = 3.0;
case_depth = 12.0; // pi zero 12mm; board imposed minimum 5mm;
back_depth = 1.2;

/* [Panel dimensions] */
panel_width  = 174.0;
panel_height = 123.0;

panel_bezel_left   = 7;
panel_bezel_right  = 7;
panel_bezel_top    = 10;
panel_bezel_bottom = 17;

/* [Border and inner padding] */
panel_border_right  = 7.5;
panel_border_left   = 7.5;
panel_border_top    = 4.5;
panel_border_bottom = 3.5;

case_inner_padding_left = 0; // no padding where the buttons are
case_inner_padding_right = 0.5; // very little padding on that edge
case_inner_padding_top = 4;
case_inner_padding_bottom = 4;

/* [Thick border] */
thick_border = false;
thick_border_width = 12.0;
thick_border_extra_depth = 15.0;

/* [Cable gap] */
// panel_cable_gap_right = 142;

/* [Screws] */
screw_offset_left   = 4.6;
screw_offset_right  = 4.6;
screw_offset_top    = 4.6;
screw_offset_bottom = 4.6;

extra_screws_top    = [0, 0, 0, 0, 0];
extra_screws_bottom = [0, 0, 0, 0, 0];
extra_screws_left   = [0, 0, 0, 0, 0];
extra_screws_right  = [0, 0, 0, 0, 0];

/* [Center support] */
case_center_support_vertical   = false;
case_center_support_horizontal = false;

/* [Kickstand] */
kickstand = true;
kickstand_width = 153;
kickstand_height_percentage = 74;
kickstand_leg_bridge_offset_percentage = 14;
kickstand_hinge_top_extra_leverage = 5;
kickstand_leg_bridge_height = 6.5;
kickstand_depth = 6.7;

/* [USB cutout] */
usb_cutout = true;
usb_cutout_box_depth           = 7;
usb_cutout_offset_x_percentage = 37.5;
usb_cutout_offset_y_percentage = 50;
usb_cutout_box_width = 20;
usb_cutout_box_height = 55;
usb_cutout_hole_position = "top"; // [top, bottom, left, right, back]

/* [Hanging hole] */
// [ [top, bottom, left, right], offset_percentage ]
hanging_holes = [
    // ["top", 20],
];

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
rear_cooling_x_start_percentage = 50;
rear_cooling_x_end_percentage = 80;
rear_cooling_y_start_percentage = 30;
rear_cooling_y_end_percentage = 60;

/* [Raspberry Pi Zero Pinholes] */
pi_pinholes = false;
pi_pinholes_orientation = "horizontal"; // [horizontal, vertical]
pi_pinholes_x_percentage = 50;
pi_pinholes_y_percentage = 85;

/* [Side buttons] */
side_buttons_left = [];//[0.2023, 0.3855, 0.5740, 0.7550];
side_buttons_right = [];
side_buttons_top = [];
side_buttons_bottom = [];
side_button_width = 9.2;
side_button_height = 5.2;
side_button_base = 2.0;
side_button_base_border = 5; // adjust if setting the case depth
side_button_base_inner = 2.5;
side_button_fillet_radius = 1.5;

/* [Debug] */
cross_section_percentage = 0; // [0:100]
vertical_print_scale = 1.004; // 0.4mm shrinkage for every 100mm
kickstand_rotation = 0;
