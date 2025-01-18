/*****************************************************************************/
/*                          Global Parameters                                */
/*****************************************************************************/

$fn = $preview ? 32 : 100;

// Gap between STL parts for visual debugging
debug_gap = 40;

// Physical width of the eInk panel (mm)
panel_width  = 170.3;
// Physical height of the eInk panel (mm)
panel_height = 111.3;
// Thickness of the eInk panel (layer 1.2: border)
panel_depth  = 1.2;

// Dimensions of the bezel on the eInk panel
panel_bezel_left   = 5.0;
panel_bezel_right  = 5.0;
panel_bezel_top    = 4.9;
panel_bezel_bottom = 10.4;

// How much case to add around the panel
panel_border_left   = 1.0;
panel_border_right  = 1.0;
panel_border_top    = 4.0;
panel_border_bottom = 4.0;

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

case_center_support = true;

// Panel cover thickness (layer 1.1: border + bezel above eInk panel)
panel_cover_depth = 2.0;

// Total “electronics compartment” thickness (layer 2.1)
case_depth = 12.0; 
//case_depth = 7.0; 

// Back shell thickness (layer 2.2)
back_depth = 2.0;

// Center of each screw hole from the corner
screw_offset_left   = 2.5;
screw_offset_right  = 2.5;
screw_offset_top    = 2.5;
screw_offset_bottom = 2.5;

// Hole made into layer 1.2
panel_screw_insert_diameter = 2.0;

// Cylindrical hole inserted into layers 2.1 and 2.2
case_screw_hole_diameter        = 3.5;
case_screw_hole_thread_diameter = 2.0; // Hole for the screw thread that goes all the way through
case_screw_hole_solid_border    = 1.0; // Solid border around the screw hole
case_screw_hole_floor_depth     = 1.0; // Depth of the floor of the screw hole
case_screw_hole_insert_depth    = 4.0; // Leave this much room at bottom for the heat set insert

case_hole_left_top = 0;
case_hole_left_bottom = 14;
case_hole_right_top = 0;
case_hole_right_bottom = 0;
case_hole_top_left = 0;
case_hole_top_right = 0;
case_hole_bottom_left = 0;
case_hole_bottom_right = 0;

case_hole_left_top_offset = 5;
case_hole_left_bottom_offset = 5;
case_hole_right_top_offset = 5;
case_hole_right_bottom_offset = 5;
case_hole_top_left_offset = 5;
case_hole_top_right_offset = 5;
case_hole_bottom_left_offset = 5;
case_hole_bottom_right_offset = 5;

/*****************************************************************************/
/*                Derived Dimensions (overall frame size)                    */
/*****************************************************************************/

// Width and height of the entire frame
frame_full_width  = panel_width
                  + panel_border_left + panel_border_right;

frame_full_height = panel_height
                  + panel_border_top + panel_border_bottom;

// Total depth across all 4 layers
frame_full_depth = panel_depth
                 + panel_cover_depth
                 + case_depth
                 + back_depth;

/*****************************************************************************/
/*                 Utility: Corner Screw Hole Positions                      */
/*****************************************************************************/

// Coordinates for the four corners, offset in from each edge
corners = [
    [ screw_offset_left,                     screw_offset_bottom                  ],
    [ frame_full_width - screw_offset_right, screw_offset_bottom                  ],
    [ screw_offset_left,                     frame_full_height - screw_offset_top ],
    [ frame_full_width - screw_offset_right, frame_full_height - screw_offset_top ]
];

/*****************************************************************************/
/*                              Modules                                      */
/*****************************************************************************/

//
// 1. Panel Cover (layer 1.1)
//    This layer covers the border of the case, and the bezel around the eInk panel
//
module panel_cover() {
    difference() {
        // Outer block
        cube([frame_full_width, frame_full_height, panel_cover_depth]);
        
        // Window for the eInk panel’s visible area
        translate(
          [
            panel_bezel_left + panel_border_left, 
            panel_bezel_top  + panel_border_top,
            -0.01
          ]
        )
        cube([
            panel_width  - panel_bezel_left - panel_bezel_right, 
            panel_height - panel_bezel_top  - panel_bezel_bottom, 
            panel_cover_depth + 0.02
        ]);
    }
}

//
// 2. Panel Shell (layer 1.2)
//    This layer covers the border of the case, has holes for heat set inserts for the screws and the panel's cables.
//
module panel_shell() {
    difference() {
        // Overall solid
        cube([frame_full_width, frame_full_height, panel_depth]);
        
        // Internal rectangular cutout matching the panel
        translate(
          [
            panel_border_left,
            panel_border_top,
            -0.01
          ]
        )
        cube([
            panel_width,
            panel_height,
            panel_depth + 0.02
        ]);
        
        // Four corner screw insert holes
        for (c = corners) {
            translate([c[0], c[1], -0.01])
                cylinder(d = panel_screw_insert_diameter, 
                         h = panel_depth + 0.02);
        }
        if (panel_cable_gap_bottom > 0) {
            panel_gap_bottom(panel_depth);
        }
        if (panel_cable_gap_top > 0) {
            panel_gap_top(panel_depth);
        }
        if (panel_cable_gap_left > 0) {
            panel_gap_left(panel_depth);
        }
        if (panel_cable_gap_right > 0) {
            panel_gap_right(panel_depth);
        }
    }
}

module panel_gap_bottom(depth) {
  translate(
    [
      panel_border_left + panel_width / 2 - panel_cable_gap_bottom / 2,
      panel_border_top + panel_height - case_inner_padding_bottom - 0.01,
      -0.01
    ]
  )
  cube([
      panel_cable_gap_bottom,
      panel_cable_gap_size + case_inner_padding_bottom + 0.01,
      depth + 0.02
  ]); 
}

module panel_gap_top(depth) {
  translate(
    [
      panel_border_left + panel_width / 2 - panel_cable_gap_top / 2,
      panel_border_top - panel_cable_gap_size,
      -0.01
    ]
  )
  cube([
      panel_cable_gap_top,
      panel_cable_gap_size + case_inner_padding_top + 0.01,
      depth + 0.02
  ]); 
}

module panel_gap_left(depth) {
  translate(
    [
      panel_border_left - panel_cable_gap_size,
      panel_border_top + panel_height / 2 - panel_cable_gap_left / 2,
      -0.01
    ]
  )
  cube([
      panel_cable_gap_size + case_inner_padding_left + 0.01,
      panel_cable_gap_left,
      depth + 0.02
  ]); 
}

module panel_gap_right(depth) {
  translate(
    [
      panel_border_left + panel_width - case_inner_padding_right - 0.01,
      panel_border_top + panel_height / 2 - panel_cable_gap_right / 2,
      -0.01
    ]
  )
  cube([
      panel_cable_gap_size + case_inner_padding_right + 0.01,
      panel_cable_gap_right,
      depth + 0.02
  ]); 
}

//
// 3. The main case compartment (layers 2.1 + 2.2)
//
module caseBody () {
    difference() {
        // Overall block
        cube([frame_full_width, frame_full_height, case_depth + back_depth]);
        
        // Internal rectangular cutout for electronics
        translate(
          [
            panel_border_left + case_inner_padding_left,
            panel_border_top  + case_inner_padding_top,
            -0.01
          ]
        )
        cube([
            panel_width 
              - case_inner_padding_left 
              - case_inner_padding_right,
            panel_height 
              - case_inner_padding_top 
              - case_inner_padding_bottom,
            case_depth + 0.01
        ]);
        if (panel_cable_gap_bottom > 0) {
            panel_gap_bottom(case_cable_gap_depth);
        }
        if (panel_cable_gap_top > 0) {
            panel_gap_top(case_cable_gap_depth);
        }
        if (panel_cable_gap_left > 0) {
            panel_gap_left(case_cable_gap_depth);
        }
        if (panel_cable_gap_right > 0) {
            panel_gap_right(case_cable_gap_depth);
        }
        if (case_hole_left_top > 0) {
            translate([-0.01, case_hole_left_top_offset + panel_border_top + case_inner_padding_top - 0.01, -0.01])
            cube([
                panel_border_left + case_inner_padding_left + 0.02,
                case_hole_left_top + 0.02,
                case_depth + 0.02
            ]);
        }
        if (case_hole_left_bottom > 0) {
            translate([-0.01, - case_hole_left_bottom_offset + panel_border_top + panel_height - case_inner_padding_bottom - case_hole_left_bottom - 0.01, -0.01])
            cube([
                panel_border_left + case_inner_padding_left + 0.02,
                case_hole_left_bottom + 0.02,
                case_depth + 0.02
            ]);
        }
        if (case_hole_right_top > 0) {
            translate([panel_width + panel_border_left - case_inner_padding_right - 0.01, case_hole_left_top_offset + panel_border_top + case_inner_padding_top - 0.01, -0.01])
            cube([
                panel_border_left + case_inner_padding_left + 0.02,
                case_hole_right_top + 0.02,
                case_depth + 0.02
            ]);
        }
        if (case_hole_right_bottom > 0) {
            translate([panel_width + panel_border_left - case_inner_padding_right - 0.01, - case_hole_left_bottom_offset + panel_border_top + panel_height - case_inner_padding_bottom - case_hole_right_bottom - 0.01, -0.01])
            cube([
                panel_border_left + case_inner_padding_left + 0.02,
                case_hole_right_bottom + 0.02,
                case_depth + 0.02
            ]);
        }
        if (case_hole_top_left > 0) {
            translate([case_hole_top_left_offset + panel_border_left + case_inner_padding_left - 0.01, -0.01, -0.01])
            cube([
                case_hole_top_left + 0.02,
                panel_border_top + case_inner_padding_top + 0.02,
                case_depth + 0.02
            ]);
        }
        if (case_hole_top_right > 0) {
            translate([- case_hole_top_right_offset + panel_border_left + panel_width - case_inner_padding_right - case_hole_top_right - 0.01, -0.01, -0.01])
            cube([
                case_hole_top_right + 0.02,
                panel_border_top + case_inner_padding_top + 0.02,
                case_depth + 0.02
            ]);
        }
        if (case_hole_bottom_left > 0) {
            translate([case_hole_bottom_left_offset + panel_border_left + case_inner_padding_left - 0.01, panel_border_top + panel_height - case_inner_padding_bottom - 0.01, -0.01])
            cube([
                case_hole_bottom_left + 0.02,
                panel_border_top + case_inner_padding_top + 0.02,
                case_depth + 0.02
            ]);
        }
        if (case_hole_bottom_right > 0) {
            translate([-case_hole_bottom_right_offset + panel_border_left + panel_width - case_inner_padding_right - case_hole_bottom_right - 0.01, panel_border_top + panel_height - case_inner_padding_bottom - 0.01, -0.01])
            cube([
                case_hole_bottom_right + 0.02,
                panel_border_top + case_inner_padding_top + 0.02,
                case_depth + 0.02
            ]);
        }   
    }
}

module case() {
    // Cut out inner cylinders for scres
    difference() {
        // Merce scres cutouts with rest of the case
        union() {
            if (case_center_support) {
                difference() {
                    union() {
                        // Center support
                        translate([panel_border_left + panel_width / 4, panel_border_top + panel_height / 2 - 2, 0])
                        cube([panel_width / 2, 4, case_depth]);

                        translate([panel_border_left + panel_width / 2 - 2, panel_border_top + panel_height / 4, 0])
                        cube([4, panel_height / 2, case_depth]);
                    };
                    translate([panel_border_left + panel_width / 2 - panel_width / 16, panel_border_top + panel_height / 2 - panel_height / 16, -0.01])
                    cube([panel_width / 8, panel_height / 8, case_depth + 0.02]);
                }
            };

            // Corner screw cylinders (solid parts)
            for (c = corners) {
                translate([c[0], c[1], case_screw_hole_insert_depth]) // Solid border around the screw hole
                cylinder(d = case_screw_hole_diameter + case_screw_hole_solid_border,
                          h = case_depth + back_depth - case_screw_hole_insert_depth); // Hole for the screw thread
            };

            // Cut out a piece of the cube
            caseBody();
        };
        
        // Cut holes to the back
        for (c = corners) {
            // Screw thread hole that goes all the way
            translate([c[0], c[1], - 0.01])
            cylinder(d = case_screw_hole_thread_diameter,
                      h = case_depth + back_depth + 0.01);
            
            // Cylinder hole from back to insert
            translate([c[0], c[1], case_screw_hole_insert_depth + case_screw_hole_floor_depth]) // Solid border around the screw hole
            cylinder(d = case_screw_hole_diameter,
                      h = case_depth + back_depth - case_screw_hole_insert_depth - case_screw_hole_floor_depth + 0.01); // Hole for the screw thread
            
            // Cylinder hole from front to insert
            translate([c[0], c[1], - 0.01]) // Solid border around the screw hole
            cylinder(d = case_screw_hole_diameter,
                      h = case_screw_hole_insert_depth + 0.01); // Hole for the screw thread
        }
    }
}


/*****************************************************************************/
/*                              Rendering                                    */
/*****************************************************************************/

// 1. Panel Cover
translate([-frame_full_width/2, -frame_full_height/2, 0]) 
    panel_cover();

// 2. Panel shell
translate([-frame_full_width/2, -frame_full_height/2, panel_cover_depth]) 
    panel_shell();

// 3. Case
translate([-frame_full_width/2, -frame_full_height/2, panel_cover_depth + panel_depth + debug_gap]) 
    case();
