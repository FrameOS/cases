// Waveshare 10.3" ePaper case

include <case1.scad>


/* [View settings] */

view_mode="print_vertical"; // [print_vertical, print_horizontal, stacked]

// Shrinkage adjustment when printing vertically. By default we measured 0.4mm of shrinkage for every 100mm of case.
vertical_print_scale = 1.004; 

/* [Panel dimensions] */

// Physical width of the eInk panel (mm)
panel_width  = 216.70;
// Physical height of the eInk panel (mm)
panel_height = 174.41;

// Clearance around the eInk panel (mm)
clearance = 0.3;

// Dimensions of the bezel on the eInk panel. This part will be covered by the panel cover.
panel_bezel_left   = 3.1;
panel_bezel_right  = 3.1;
panel_bezel_top    = 3.1;
panel_bezel_bottom = 13.7;

/* [Border and inner padding] */

// How much border to add around the panel
panel_border_left   = 6;
panel_border_right  = 6;
panel_border_top    = 6;
panel_border_bottom = 6;

// Supporting space below the panel
case_inner_padding_left = 4;
case_inner_padding_right = 4;
case_inner_padding_top = 4;
case_inner_padding_bottom = 6;

/* [Case dimensions] */

// How round to make the case
fillet_radius = 2;

// Panel cover thickness
panel_cover_depth = 1.6;

// Thickness of the eInk panel as measured
panel_depth  = 1.2;

// Total inside compartment thickness
case_depth = 10.0;

// Back plate thickness 
back_depth = 1.2;

/* [Cable holes for panel] */

// Gap in the border for the eInk panel's cables, mm, centered
panel_cable_gap_left = 0;
panel_cable_gap_right = 0;
panel_cable_gap_top = 0;
panel_cable_gap_bottom = 141;
panel_cable_gap_size = 2.0; // How into the border to cut
case_cable_gap_depth = 3.0; // How deep into the case to cut

/* [Panel supports] */

case_center_support_vertical = true;
case_center_support_horizontal = true;
case_center_support_width = 4.0;

/* [Screws and placement] */

// Center of each screw hole from the corner
screw_offset_left   = 3.2;
screw_offset_right  = 3.2;
screw_offset_top    = 3.2;
screw_offset_bottom = 3.2;

// Extra screws on the top side (0.0 to 1.0)
extra_screws_top = [0.5, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the bottom side (0.0 to 1.0)
extra_screws_bottom = [0.165, 0.835, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the left side (0.0 to 1.0)
extra_screws_left = [0.5, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the right side (0.0 to 1.0)
extra_screws_right = [0.5, 0, 0, 0, 0]; // [0.0:0.05:1.0]

// Hole made into layer 1.2
panel_screw_insert_diameter = 3.45;
panel_screw_insert_depth = 2.0;

// Cylindrical hole inserted into layers 2.1 and 2.2
case_screw_hole_diameter        = 4.5;
case_screw_hole_thread_diameter = 2.0; // Hole for the screw thread that goes all the way through
case_screw_hole_floor_depth     = 1.0; // Depth of the floor of the screw hole
case_screw_hole_insert_depth    = 4.0; // Leave this much room at bottom for the heat set insert

/* [Case side holes] */

case_hole_right_top = 0;
case_hole_right_bottom = 0;
case_hole_right_top_offset = 10;
case_hole_right_bottom_offset = 10;

case_hole_top_depth = 1;
case_hole_bottom_depth = 1;

/* [Kickstand] */

kickstand = true;
kickstand_width = 90;
kickstand_leg_width = 10;
kickstand_height_percentage = 65;
kickstand_leg_bridge_offset_percentage = 15;
kickstand_leg_bridge_height = 10;
kickstand_depth = 7;
kickstand_bottom_start = 3;
kickstand_wall_thickness = 1;
kickstand_gap_thickness = 0.5;
kickstand_hinge_diameter = 2.2;
kickstand_leg_hole_diameter = 5;
kickstand_hinge_top_extra_leverage = 5; // Height added to the flap above the hinge. Increasing reduces max rotation
kickstand_hinge_wall_padding = 0.2; // Distance from the back wall
kickstand_hinge_cylinder_gap = 0.5; // Gap between the hinge and the cylinder
kickstand_rotation = 0; // Kickstand rotation angle, goes up to 45 when open

/* [USB cutout] */

usb_cutout = true;
usb_cutout_offset_x_percentage = 12;
usb_cutout_offset_y_percentage = 30;
usb_cutout_box_width = 20;
usb_cutout_box_height = 50;
usb_cutout_box_depth = 7;
usb_cutout_box_wall_thickness = 0.8;
usb_cutout_hole_postition = "top"; // [top, bottom]
usb_cutout_hole_width = 14;
usb_cutout_hole_height = 6.0;

/* [Hanging hole] */

hanging_hole = true;
hanging_hole_large_diameter = 8;
hanging_hole_small_diameter = 3;
hanging_hole_offset = 18;
hanging_hole_box_width = 12;
hanging_hole_box_height = 16;
hanging_hole_depth = 7;
hanging_hole_wall_thickness = 1;

/* [Debug] */

// Gap between STL parts for visual debugging
debug_gap = 40;
cross_section_percentage = 0; // [0:100]
