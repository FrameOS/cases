// Waveshare 7.3"E ePaper case

include <mark1.scad>

/* [View settings] */

view_mode="print_vertical"; // [print_vertical, print_horizontal, stacked]

/* [Panel dimensions] */

// Physical width of the eInk panel (mm)
panel_width  = 170.3;
// Physical height of the eInk panel (mm)
panel_height = 111.3;

back_depth = 1.2;

// // Dimensions of the bezel on the eInk panel
// panel_bezel_left   = 5.2;
// panel_bezel_right  = 5.2;
// panel_bezel_top    = 4.9;
// panel_bezel_bottom = 10.8;

// // How much case to add around the panel
// panel_border_left   = 2.0;
// panel_border_right  = 2.0;
// panel_border_top    = 6.0;
// panel_border_bottom = 6.0;

// Dimensions of the bezel on the eInk panel
panel_bezel_left   = 5.2;
panel_bezel_right  = 5.2;
panel_bezel_top    = 4.9;
panel_bezel_bottom = 10.8;

// How much case to add around the panel
panel_border_left   = 8.8;
panel_border_right  = 8.8;
panel_border_top    = 9.1;
panel_border_bottom = 3.2;

/* [Screws and placement] */

// Center of each screw hole from the corner
screw_offset_left   = 5.2;
screw_offset_right  = 5.2;
screw_offset_top    = 5.2;
screw_offset_bottom = 5.2;

// Extra screws on the top side (0.0 to 1.0)
extra_screws_top = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the bottom side (0.0 to 1.0)
extra_screws_bottom = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the left side (0.0 to 1.0)
extra_screws_left = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the right side (0.0 to 1.0)
extra_screws_right = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]

/* [Border around and below panel] */

// Gap in the border for the eInk panel's cables, mm, centered
panel_cable_gap_left = 0;
panel_cable_gap_right = 0;
panel_cable_gap_top = 0;
panel_cable_gap_bottom = 40;
panel_cable_gap_size = 2.0; // How into the border to cut
case_cable_gap_depth = 3.0; // How deep into the case to cut

// Extra space inside the case to hold up the panel
case_inner_padding_left = 2.0;
case_inner_padding_right = 2.0;
case_inner_padding_top = 2.0;
case_inner_padding_bottom = 2.0;

/* [Panel supports] */

case_center_support_vertical = false;
case_center_support_horizontal = false;

/* [Case dimensions] */

// Total inside compartment thickness
case_depth = 12.0; 

/* [Case side holes] */

case_hole_left_top = 0;
case_hole_left_top_offset = 5;
case_hole_right_top = 0;
case_hole_right_top_offset = 5;

case_hole_top_depth = 2;
case_hole_bottom_depth = 2;

/* [Kickstand] */

kickstand = true;
kickstand_width = 80;
kickstand_leg_width = 10;
kickstand_leg_bridge_height = 10;
kickstand_leg_bridge_offset_percentage = 2.5;
kickstand_height_percentage = 65;
kickstand_hinge_top_extra_leverage = 2; // Height added to the flap above the hinge. Increasing reduces max rotation (2mm=45deg, 3mm=35deg, ...)
kickstand_hinge_top_cavity = 2; // Height by which to make the cavity above the top of the hinge taller
kickstand_depth = 7;
kickstand_rotation = 0; 

/* [USB cutout] */

usb_cutout = true;
usb_cutout_offset_x_percentage = 74;
usb_cutout_offset_y_percentage = 28;
usb_cutout_box_width = 20;
usb_cutout_box_height = 50;
usb_cutout_box_depth = 10;
usb_cutout_box_wall_thickness = 1;
usb_cutout_hole_postition = "top"; // [top, bottom, left, right]
usb_cutout_hole_width = 14;
usb_cutout_hole_height = 6.0;
