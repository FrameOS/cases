/*****************************************************************************/
/*          FrameOS Mark1 Case. WaveShare 7.3"E frame subsitutions.          */
/*****************************************************************************/

/* [View settings] */

view_mode="ready_to_print"; // [ready_to_print, stacked]
print_mode="vertical"; // [vertical, horizontal]


/* [Panel dimensions] */

// Physical width of the eInk panel (mm)
panel_width  = 170.3;
// Physical height of the eInk panel (mm)
panel_height = 111.3;

// Dimensions of the bezel on the eInk panel
panel_bezel_left   = 5.2;
panel_bezel_right  = 5.2;
panel_bezel_top    = 4.9;
panel_bezel_bottom = 10.8;

/* [Border around and below panel] */

// How much case to add around the panel
panel_border_left   = 2.0;
panel_border_right  = 2.0;
panel_border_top    = 6.0;
panel_border_bottom = 6.0;

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

// Total inside compartment thickness (layer 2.1)
case_depth = 12.0; 

/* [Screws and placement] */

// Center of each screw hole from the corner
screw_offset_left   = 3.2;
screw_offset_right  = 3.2;
screw_offset_top    = 3.2;
screw_offset_bottom = 3.2;

// Extra screws on the top side (0.0 to 1.0)
extra_screws_top = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the bottom side (0.0 to 1.0)
extra_screws_bottom = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the left side (0.0 to 1.0)
extra_screws_left = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the right side (0.0 to 1.0)
extra_screws_right = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]

/* [Case side holes] */

case_hole_left_bottom = 16;
case_hole_left_bottom_offset = 5;

case_hole_top_depth = 2;
case_hole_bottom_depth = 2;

/* [Kickstand (experimental)] */

kickstand = true;
kickstand_width = 40;
kickstand_height = 80;
kickstand_depth = 7;
kickstand_hinge_diameter = 2.2;
kickstand_leg_hole_diameter = 5;
hinge_top_extra_leverage = 3;
