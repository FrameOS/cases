// Waveshare 10.3" ePaper case

include <mark1.scad>

/* [View settings] */

view_mode="print_vertical"; // [print_vertical, print_horizontal, stacked]

/* [Panel dimensions] */

// Physical width of the eInk panel (mm)
panel_width  = 284.49;
// Physical height of the eInk panel (mm)
panel_height = 216.69;

// Dimensions of the bezel on the eInk panel
panel_bezel_left   = 3.1;
panel_bezel_right  = 3.1;
panel_bezel_top    = 3.1;
panel_bezel_bottom = 13.7;

/* [Border around and below panel] */

// How much case to add around the panel
panel_border_left   = 6;
panel_border_right  = 6;
panel_border_top    = 6;
panel_border_bottom = 3;

// Gap in the border for the eInk panel's cables, mm, centered
panel_cable_gap_left = 0;
panel_cable_gap_right = 0;
panel_cable_gap_top = 0;
panel_cable_gap_bottom = 141;
panel_cable_gap_size = 2.0; // How into the border to cut
case_cable_gap_depth = 3.0; // How deep into the case to cut

// Extra space inside the case to hold up the panel
case_inner_padding_left = 4;
case_inner_padding_right = 4;
case_inner_padding_top = 4;
case_inner_padding_bottom = 6;

/* [Panel supports] */

case_center_support_vertical = true;
case_center_support_horizontal = true;
case_center_support_width = 4.0;

/* [Case dimensions] */

// Total inside compartment thickness (layer 2.1)
case_depth = 10.0; 

/* [Screws and placement] */

// Center of each screw hole from the corner
screw_offset_left   = 4.0;
screw_offset_right  = 4.0;
screw_offset_top    = 4.0;
screw_offset_bottom = 4.0;

// Extra screws on the top side (0.0 to 1.0)
extra_screws_top = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the bottom side (0.0 to 1.0)
extra_screws_bottom = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the left side (0.0 to 1.0)
extra_screws_left = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the right side (0.0 to 1.0)
extra_screws_right = [0.5, 0, 0, 0, 0]; // [0.0:0.05:1.0]

/* [Case side holes] */

case_hole_right_top = 16;
case_hole_right_bottom = 16;
case_hole_right_top_offset = 10;
case_hole_right_bottom_offset = 10;

case_hole_top_depth = 2;
case_hole_bottom_depth = 2;

/* [Kickstand (experimental)] */

kickstand = false;
kickstand_width = 40;
