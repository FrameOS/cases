/*****************************************************************************/
/*                          Global Parameters                                */
/*****************************************************************************/

// Gap between STL parts for visual debugging
debug_gap = 40;

// Physical dimensions of the eInk panel
panel_width  = 170.3;
panel_height = 111.3;

// Dimensions of the bezel on the eInk panel
panel_bezel_left   = 5.0;
panel_bezel_right  = 5.0;
panel_bezel_top    = 4.9;
panel_bezel_bottom = 10.4;

// How much case to add around the panel
case_border_left   = 3.0;
case_border_right  = 3.0;
case_border_top    = 5.0;
case_border_bottom = 5.0;

// Extra space inside the case to hold up the panel
case_inner_padding_left = 2.0;
case_inner_padding_right = 2.0;
case_inner_padding_top = 2.0;
case_inner_padding_bottom = 2.0;

// Panel cover thickness (layer 1.1: border + bezel)
panel_cover_depth = 2.0;

// Panel border thickness (layer 1.2: border)
panel_depth  = 1.2;

// Total “electronics compartment” thickness (layer 2.1)
case_depth = 7.0; 

// Back shell thickness (layer 2.2)
back_depth = 2.0;

// Center of each screw hole from the corner
screw_offset_left = 2.5;
screw_offset_right = 2.5;
screw_offset_top = 2.5;
screw_offset_bottom = 2.5;

// Hole made into layer layer 1.2
panel_screw_hole_diameter = 2.0;

// Cylindrical hole inserted into layers 2.1 and 2.2
case_screw_hole_outer_diameter = 3.2;
case_screw_hole_inner_diameter = 2.0;
case_screw_hole_floor_depth = 1.0;
case_screw_hole_bottom_gap_depth = 1.0;

/*****************************************************************************/
/*                Derived Dimensions (overall frame size)                    */
/*****************************************************************************/

// Width and height of the entire frame
frame_full_width  = panel_width
                  + case_border_left + case_border_right;

frame_full_height = panel_height
                  + case_border_top + case_border_bottom;

// Total depth across all 4 layers
frame_full_depth = panel_depth
                 + panel_cover_depth
                 + case_depth
                 + back_depth;

/*****************************************************************************/
/*                              Modules                                      */
/*****************************************************************************/

module panel_cover() {
    difference() {
        // Outer block
        cube([frame_full_width, frame_full_height, panel_cover_depth]);
        
        // Hole (moved slightly deeper so the difference cuts fully through)
        translate(
          [
            panel_bezel_left + case_border_left, 
            panel_bezel_top + case_border_top,
            -0.1
          ]
        )
        cube([
            panel_width - panel_bezel_left - panel_bezel_right, 
            panel_height - panel_bezel_top - panel_bezel_bottom, 
            panel_cover_depth + 0.2
        ]);
    }
}

module panel_shell() {
    difference() {
        cube([frame_full_width, frame_full_height, panel_depth]);
        
        // Hole
        translate(
          [
            case_border_left,
            case_border_top,
            -0.1
          ]
        )
        cube([panel_width, panel_height, panel_depth + 0.2]);
    }
}

module electronics_compartment() {
    difference() {
        cube([frame_full_width, frame_full_height, case_depth]);
        
        // Hole
        translate(
          [
            case_border_left + case_inner_padding_left,
            case_border_top + case_inner_padding_top,
            -0.1
          ]
        )
        cube([
            panel_width - case_inner_padding_left - case_inner_padding_right,
            panel_height - case_inner_padding_top - case_inner_padding_bottom,
            case_depth + 0.2
        ]);
    } 
}

module back_shell() {
    cube([frame_full_width, frame_full_height, back_depth]);
}

/*****************************************************************************/
/*                              Rendering                                    */
/*****************************************************************************/

// Panel Cover
translate([0, 0, 0]) panel_cover();

// Panel layer
translate([0, 0, panel_cover_depth]) panel_shell();

// Electronics compartment
translate([0, 0, panel_cover_depth + panel_depth + debug_gap]) electronics_compartment();

// // Back shell
translate([0, 0, panel_cover_depth + panel_depth + case_depth + debug_gap]) back_shell();
