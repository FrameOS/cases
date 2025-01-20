/* FrameOS Case: Mark I */

/* [View settings] */

view_mode="print_vertical"; // [print_vertical, print_horizontal, stacked]

/* [Panel dimensions] */

// Physical width of the eInk panel (mm) @shared
panel_width  = 284.49;
// Physical height of the eInk panel (mm) @shared
panel_height = 208.81;

// Thickness of the eInk panel (layer 1.2: border)
panel_depth  = 1.2;
// Clearance around the eInk panel (mm)
clearance = 0.3;

// Dimensions of the bezel on the eInk panel @shared
panel_bezel_left   = 11.7;
panel_bezel_right  = 3.3;
panel_bezel_top    = 3.1;
panel_bezel_bottom = 3.1;

/* [Border around and below panel] */

// How much case to add around the panel @shared
panel_border_left   = 3.2;
panel_border_right  = 11.6;
panel_border_top    = 11.8;
panel_border_bottom = 11.8;

// Gap in the border for the eInk panel's cables, mm, centered @shared
panel_cable_gap_left = 142;
panel_cable_gap_right = 0;
panel_cable_gap_top = 0;
panel_cable_gap_bottom = 0;
panel_cable_gap_size = 2.0; // How into the border to cut
case_cable_gap_depth = 3.0; // How deep into the case to cut

// Extra space inside the case to hold up the panel @shared
case_inner_padding_left = 6;
case_inner_padding_right = 4;
case_inner_padding_top = 4;
case_inner_padding_bottom = 4;

/* [Panel supports] */

// @shared

case_center_support_vertical = true;
case_center_support_horizontal = true;
case_center_support_width = 4.0;

/* [Case dimensions] */

fillet_radius = 2;

// Panel cover thickness (together with panel_depth makes up the top part)
panel_cover_depth = 2.0;

// Total inside compartment thickness (layer 2.1) @shared
case_depth = 10.0; 

// Back shell thickness (layer 2.2)
back_depth = 2.0;

/* [Screws and placement] */

// Center of each screw hole from the corner @shared
screw_offset_left   = 5.0;
screw_offset_right  = 5.0;
screw_offset_top    = 5.0;
screw_offset_bottom = 5.0;

// Extra screws on the top side (0.0 to 1.0) @shared
extra_screws_top = [0.48, 0.52, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the bottom side (0.0 to 1.0) @shared
extra_screws_bottom = [0.48, 0.52, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the left side (0.0 to 1.0) @shared
extra_screws_left = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the right side (0.0 to 1.0) @shared
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

// @shared, set to zero and 2

case_hole_left_top = 0;
case_hole_left_bottom = 0;
case_hole_right_top = 0;
case_hole_right_bottom = 0;
case_hole_top_left = 0;
case_hole_top_right = 0;
case_hole_bottom_left = 0;
case_hole_bottom_right = 0;

case_hole_left_top_offset = 0;
case_hole_left_bottom_offset = 0;
case_hole_right_top_offset = 0;
case_hole_right_bottom_offset = 0;
case_hole_top_left_offset = 0;
case_hole_top_right_offset = 0;
case_hole_bottom_left_offset = 0;
case_hole_bottom_right_offset = 0;

case_hole_top_depth = 2;
case_hole_bottom_depth = 2;

/* [Kickstand (experimental)] */

kickstand = false; // @shared
kickstand_width = 40; // @shared
kickstand_height = 80; // @shared
kickstand_depth = 7; // @shared
kickstand_bottom_start = 3;
kickstand_wall_thickness = 1;
kickstand_gap_thickness = 0.5;
kickstand_hinge_diameter = 2.2; // @shared
kickstand_leg_hole_diameter = 5; // @shared
hinge_top_extra_leverage = 3; // overrides kickstand_gap_thickness on the top @shared
hinge_wall_padding = 0.2; // distance from the back wall
hinge_cylinder_gap = 0.5; // gap between the hinge and the cylinder

/* [Debug] */

// Gap between STL parts for visual debugging
debug_gap = 40;

$fn = 32;


/*****************************************************************************/
/*                Derived Dimensions (overall frame size)                    */
/*****************************************************************************/

// Physical width of the eInk panel (mm) + clearance 0.3*2
panel_width_with_clearance  = panel_width  + clearance * 2;
// Physical height of the eInk panel (mm) + clearance 0.3*2
panel_height_with_clearance = panel_height + clearance * 2;

// Width and height of the entire frame
frame_full_width  = panel_width_with_clearance
                  + panel_border_left + panel_border_right;

frame_full_height = panel_height_with_clearance
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
screw_positions = [
    [ screw_offset_left,                     screw_offset_bottom                  ],
    [ frame_full_width - screw_offset_right, screw_offset_bottom                  ],
    [ screw_offset_left,                     frame_full_height - screw_offset_top ],
    [ frame_full_width - screw_offset_right, frame_full_height - screw_offset_top ],

    for (s = extra_screws_bottom)
        if (s != 0 && s != 1)
            [ screw_offset_left + s * (frame_full_width - screw_offset_left - screw_offset_right), 
            frame_full_height - screw_offset_top ],

    for (s = extra_screws_top)
        if (s != 0 && s != 1)
            [ screw_offset_left + s * (frame_full_width - screw_offset_left - screw_offset_right), 
            screw_offset_bottom ],

    for (s = extra_screws_left)
        if (s != 0 && s != 1)
            [ screw_offset_left, 
            screw_offset_bottom + s * (frame_full_height - screw_offset_bottom - screw_offset_top) ],

    for (s = extra_screws_right)
        if (s != 0 && s != 1)
            [ frame_full_width - screw_offset_right, 
            screw_offset_bottom + s * (frame_full_height - screw_offset_bottom - screw_offset_top) ]
];


/*****************************************************************************/
/*                            Panel cover                                    */
/*****************************************************************************/

module panel_cover() {
    difference() {
        // Top block
        filletBoxTop(frame_full_width, frame_full_height, panel_cover_depth + panel_depth);
        
        // Window for the eInk panel’s visible area
        translate(
          [
            panel_bezel_left + panel_border_left, 
            panel_bezel_top  + panel_border_top,
            -0.11
          ]
        )
        cube([
            panel_width_with_clearance  - panel_bezel_left - panel_bezel_right, 
            panel_height_with_clearance - panel_bezel_top  - panel_bezel_bottom, 
            panel_cover_depth + 0.22
        ]);

        for (c = screw_positions) {
            translate([c[0], c[1],  panel_cover_depth + panel_depth - panel_screw_insert_depth])
                cylinder(d = panel_screw_insert_diameter, 
                         h = panel_screw_insert_depth + 0.11);
        }

        // Internal rectangular cutout matching the panel
        translate(
          [
            panel_border_left,
            panel_border_top,
            panel_cover_depth
          ]
        )
        cube([
            panel_width_with_clearance,
            panel_height_with_clearance,
            panel_depth + 0.22
        ]);
        if (panel_cable_gap_bottom > 0) {
            render_panel_cable_gap_bottom(panel_depth, panel_cover_depth);
        }
        if (panel_cable_gap_top > 0) {
            render_panel_cable_gap_top(panel_depth, panel_cover_depth);
        }
        if (panel_cable_gap_left > 0) {
            render_panel_cable_gap_left(panel_depth, panel_cover_depth);
        }
        if (panel_cable_gap_right > 0) {
            render_panel_cable_gap_right(panel_depth, panel_cover_depth);
        }
    }
}

module render_panel_cable_gap_bottom(depth, translate_depth) {
  translate(
    [
      panel_border_left + panel_width_with_clearance / 2 - panel_cable_gap_bottom / 2,
      panel_border_top + panel_height_with_clearance - case_inner_padding_bottom - case_depth - 0.11,
      translate_depth
    ]
  )
  cube([
      panel_cable_gap_bottom,
      panel_cable_gap_size + case_inner_padding_bottom + 0.11 + case_depth,
      depth + 0.11
  ]); 
}

module render_panel_cable_gap_top(depth, translate_depth) {
  translate(
    [
      panel_border_left + panel_width_with_clearance / 2 - panel_cable_gap_top / 2,
      panel_border_top - panel_cable_gap_size,
      translate_depth
    ]
  )
  cube([
      panel_cable_gap_top,
      panel_cable_gap_size * 2 + case_inner_padding_top + 0.11, // 2x to cut into the chamfer
      depth + 0.11
  ]); 
  if (view_mode == "print_vertical") {
    let (l = panel_cable_gap_top, w = depth, h = depth)
    translate([
    panel_border_left + panel_width_with_clearance / 2 - panel_cable_gap_top / 2,
    panel_border_top - panel_cable_gap_size - depth + 0.11,
    translate_depth
    ])
    polyhedron(//pt 0        1        2        3        4        5
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
  }
}

module render_panel_cable_gap_left(depth, translate_depth) {
  translate(
    [
      panel_border_left - panel_cable_gap_size,
      panel_border_top + panel_height_with_clearance / 2 - panel_cable_gap_left / 2,
      translate_depth
    ]
  )
  cube([
      panel_cable_gap_size + case_inner_padding_left + 0.11,
      panel_cable_gap_left,
      depth + 0.11
  ]); 
  if (view_mode == "print_vertical") {
    let (l = panel_cable_gap_size + case_inner_padding_left + 0.11, w = depth, h = depth)
    translate([
      panel_border_left - panel_cable_gap_size,
      panel_border_top + panel_height_with_clearance / 2 - panel_cable_gap_left / 2 - depth + 0.11,
      translate_depth
    ])
    polyhedron(//pt 0        1        2        3        4        5
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
  }
}

module render_panel_cable_gap_right(depth, translate_depth) {
  translate(
    [
      panel_border_left + panel_width_with_clearance - case_inner_padding_right - 0.11,
      panel_border_top + panel_height_with_clearance / 2 - panel_cable_gap_right / 2,
      translate_depth
    ]
  )
  cube([
      panel_cable_gap_size + case_inner_padding_right + 0.11,
      panel_cable_gap_right,
      depth + 0.11
  ]); 
  if (view_mode == "print_vertical") {
    let (l = panel_cable_gap_size + case_inner_padding_right + 0.11, w = depth, h = depth)
    translate([
      panel_border_left + panel_width_with_clearance - case_inner_padding_right - 0.11,
      panel_border_top + panel_height_with_clearance / 2 - panel_cable_gap_right / 2 - depth + 0.11,
      translate_depth
    ])
    polyhedron(//pt 0        1        2        3        4        5
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
  }
}


/*****************************************************************************/
/*                             Case body                                     */
/*****************************************************************************/

module caseBody () {
    difference() {
        filletBoxBottom(
            frame_full_width, 
            frame_full_height, 
            case_depth + back_depth
        );
        
        // Internal rectangular cutout for electronics
        translate(
          [
            panel_border_left + case_inner_padding_left,
            panel_border_top  + case_inner_padding_top,
            -0.11
          ]
        )
        cube([
            panel_width_with_clearance 
              - case_inner_padding_left 
              - case_inner_padding_right,
            panel_height_with_clearance 
              - case_inner_padding_top 
              - case_inner_padding_bottom,
            case_depth + 0.11
        ]);
        case_cable_gaps();
        case_holes();
    }
     // chamfer the edges
    if (view_mode == "print_vertical") {
        difference() {
            // top chamfer
            let (
                l = panel_width_with_clearance - case_inner_padding_left - case_inner_padding_right, 
                w = -case_depth, 
                h = -case_depth
            )
            translate([
                panel_border_left + case_inner_padding_left,
                panel_border_top  + case_inner_padding_top + case_depth,
                case_depth
            ])
            polyhedron(//pt 0        1        2        3        4        5
                points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
                faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
            );
            if (panel_cable_gap_top > 0) {
                render_panel_cable_gap_top(case_cable_gap_depth, -0.11);
            }
        }
    }
}

module case_cable_gaps() {
    if (panel_cable_gap_bottom > 0) {
        render_panel_cable_gap_bottom(case_cable_gap_depth, -0.11);
    }
    if (panel_cable_gap_top > 0) {
        render_panel_cable_gap_top(case_cable_gap_depth, -0.11);
    }
    if (panel_cable_gap_left > 0) {
        render_panel_cable_gap_left(case_cable_gap_depth, -0.11);
    }
    if (panel_cable_gap_right > 0) {
        render_panel_cable_gap_right(case_cable_gap_depth, -0.11);
    }
}

module case_holes() {
    if (case_hole_left_top > 0) {
        translate([-0.11, case_hole_left_top_offset + panel_border_top + case_inner_padding_top - 0.11, -0.11 + case_hole_top_depth])
        cube([
            panel_border_left + case_inner_padding_left + 0.22,
            case_hole_left_top + 0.22,
            case_depth - case_hole_top_depth - case_hole_bottom_depth + 0.22
        ]);
    }
    if (case_hole_left_bottom > 0) {
        translate([-0.11, - case_hole_left_bottom_offset + panel_border_top + panel_height_with_clearance - case_inner_padding_bottom - case_hole_left_bottom - 0.11, -0.11 + case_hole_top_depth])
        cube([
            panel_border_left + case_inner_padding_left + 0.22,
            case_hole_left_bottom + 0.22,
            case_depth - case_hole_top_depth - case_hole_bottom_depth + 0.22
        ]);
    }
    if (case_hole_right_top > 0) {
        translate([panel_width_with_clearance + panel_border_left - case_inner_padding_right - 0.11, case_hole_right_top_offset + panel_border_top + case_inner_padding_top - 0.11, -0.11 + case_hole_top_depth])
        cube([
            panel_border_right + case_inner_padding_right + 0.22,
            case_hole_right_top + 0.22,
            case_depth - case_hole_top_depth - case_hole_bottom_depth + 0.22
        ]);
    }
    if (case_hole_right_bottom > 0) {
        translate([panel_width_with_clearance + panel_border_left - case_inner_padding_right - 0.11, - case_hole_right_bottom_offset + panel_border_top + panel_height_with_clearance - case_inner_padding_bottom - case_hole_right_bottom - 0.11, -0.11 + case_hole_top_depth])
        cube([
            panel_border_right + case_inner_padding_right + 0.22,
            case_hole_right_bottom + 0.22,
            case_depth - case_hole_top_depth - case_hole_bottom_depth + 0.22
        ]);
    }
    if (case_hole_top_left > 0) {
        translate([case_hole_top_left_offset + panel_border_left + case_inner_padding_left - 0.11, -0.11, -0.11 + case_hole_top_depth])
        cube([
            case_hole_top_left + 0.22,
            panel_border_top + case_inner_padding_top + 0.22,
            case_depth - case_hole_top_depth - case_hole_bottom_depth + 0.22
        ]);
    }
    if (case_hole_top_right > 0) {
        translate([- case_hole_top_right_offset + panel_border_left + panel_width_with_clearance - case_inner_padding_right - case_hole_top_right - 0.11, -0.11, -0.11 + case_hole_top_depth])
        cube([
            case_hole_top_right + 0.22,
            panel_border_top + case_inner_padding_top + 0.22,
            case_depth - case_hole_top_depth - case_hole_bottom_depth + 0.22
        ]);
    }
    if (case_hole_bottom_left > 0) {
        translate([case_hole_bottom_left_offset + panel_border_left + case_inner_padding_left - 0.11, panel_border_top + panel_height_with_clearance - case_inner_padding_bottom - 0.11, -0.11 + case_hole_top_depth])
        cube([
            case_hole_bottom_left + 0.22,
            panel_border_top + case_inner_padding_top + 0.22,
            case_depth - case_hole_top_depth - case_hole_bottom_depth + 0.22
        ]);
    }
    if (case_hole_bottom_right > 0) {
        translate([-case_hole_bottom_right_offset + panel_border_left + panel_width_with_clearance - case_inner_padding_right - case_hole_bottom_right - 0.11, panel_border_top + panel_height_with_clearance - case_inner_padding_bottom - 0.11, -0.11 + case_hole_top_depth])
        cube([
            case_hole_bottom_right + 0.22,
            panel_border_top + case_inner_padding_top + 0.22,
            case_depth - case_hole_top_depth - case_hole_bottom_depth + 0.22
        ]);
    }   
}

module case() {
    // Cut out inner cylinders for screws
    difference() {
        union() {
            if (case_center_support_vertical || case_center_support_horizontal) {
                difference() {
                    union() {
                        // Center support
                        if (case_center_support_horizontal) {
                            translate([frame_full_width / 4, frame_full_height / 2 - (case_center_support_width / 2), 0])
                            cube([frame_full_width / 6, case_center_support_width, case_depth]);

                            translate([frame_full_width / 4 + frame_full_width / 3, frame_full_height / 2 - (case_center_support_width / 2), 0])
                            cube([frame_full_width / 6, case_center_support_width, case_depth]);

                            if (view_mode == "print_vertical") {
                                let (l = frame_full_width / 6, w = -case_depth, h = -case_depth)
                                translate([frame_full_width / 4, frame_full_height / 2 + (case_center_support_width / 2) + case_depth, case_depth])
                                polyhedron(//pt 0        1        2        3        4        5
                                    points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
                                    faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
                                );
                                let (l = frame_full_width / 6, w = -case_depth, h = -case_depth)
                                translate([frame_full_width / 4 + frame_full_width / 3, frame_full_height / 2 + (case_center_support_width / 2) + case_depth, case_depth])
                                polyhedron(//pt 0        1        2        3        4        5
                                    points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
                                    faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
                                );
                            }
                        }

                        if (case_center_support_vertical) {
                            translate([frame_full_width / 2 - (case_center_support_width / 2), frame_full_height / 4, 0])
                            cube([case_center_support_width, frame_full_height / 6, case_depth]);

                            translate([frame_full_width / 2 - (case_center_support_width / 2), frame_full_height / 4 + frame_full_height / 3, 0])
                            cube([case_center_support_width, frame_full_height / 6, case_depth]);

                            if (view_mode == "print_vertical") {
                                let (l = case_center_support_width, w = -case_depth, h = -case_depth)
                                translate([
                                    frame_full_width / 2 - (case_center_support_width / 2), 
                                    frame_full_height / 4 + frame_full_height / 6 + case_depth,
                                    case_depth
                                ])
                                polyhedron(//pt 0        1        2        3        4        5
                                    points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
                                    faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
                                );

                                let (l = case_center_support_width, w = -case_depth, h = -case_depth)
                                translate([
                                    frame_full_width / 2 - (case_center_support_width / 2), 
                                    frame_full_height / 4 + frame_full_height / 2 + case_depth,
                                    case_depth
                                ])
                                polyhedron(//pt 0        1        2        3        4        5
                                    points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
                                    faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
                                );
                            }
                        }
                    };
                }
            };

            // Cut out a piece of the cube
            caseBody();
        };
        
        // Cut holes to the back
        for (c = screw_positions) {
            // Screw thread hole that goes all the way
            translate([c[0], c[1], - 0.11])
            cylinder(d = case_screw_hole_thread_diameter,
                      h = case_depth + back_depth + 0.11);
            
            // Cylinder hole from back to insert
            translate([c[0], c[1], case_screw_hole_insert_depth + case_screw_hole_floor_depth]) // Solid border around the screw hole
            cylinder(d = case_screw_hole_diameter,
                      h = case_depth + back_depth - case_screw_hole_insert_depth - case_screw_hole_floor_depth + 0.11); // Hole for the screw thread
            
            // Cylinder hole from front to insert
            translate([c[0], c[1], - 0.11]) // Solid border around the screw hole
            cylinder(d = case_screw_hole_diameter,
                      h = case_screw_hole_insert_depth + 0.11); // Hole for the screw thread
        }
    }
}

/*****************************************************************************/
/*                             Kickstand                                     */
/*****************************************************************************/

module renderKickstand() {
    cube([kickstand_width, kickstand_height, kickstand_depth]);
}

module caseWithKickstand() {
    // Make a hole in the case
    difference() {
        union() {
            case();
            translate([
                (frame_full_width - kickstand_width) / 2, 
                frame_full_height - kickstand_bottom_start - kickstand_height, 
                case_depth + back_depth - kickstand_depth
            ])
            cube([kickstand_width, kickstand_height, kickstand_depth]);
        }
        translate([
            (frame_full_width - kickstand_width + 2 * kickstand_wall_thickness) / 2, 
            frame_full_height - kickstand_bottom_start - kickstand_height + kickstand_wall_thickness, 
            case_depth + back_depth - kickstand_depth + kickstand_wall_thickness + 0.11
        ])
        cube([
            kickstand_width - 2 * kickstand_wall_thickness, 
            kickstand_height - 2 * kickstand_wall_thickness, 
            kickstand_depth  - kickstand_wall_thickness
        ]);
    }
    
    hinge_real_depth = kickstand_depth - kickstand_wall_thickness - hinge_wall_padding - kickstand_hinge_diameter / 2;
    hinge_start = [
        frame_full_width / 2 - kickstand_width / 2 + 0.11, 
        frame_full_height - kickstand_bottom_start - kickstand_height + kickstand_wall_thickness + kickstand_depth / 2 + hinge_top_extra_leverage,  // no kickstand_gap_thickness here, 
        case_depth + back_depth - hinge_real_depth / 2
    ];

    difference() {
        union() {
            // Render the hinge's top cylinder
            translate([frame_full_width / 2 - kickstand_width / 2 + kickstand_wall_thickness + kickstand_gap_thickness , hinge_start[1], hinge_start[2]])
            rotate([90, 0, 90])
            cylinder(d = hinge_real_depth, h = kickstand_width - 2 * kickstand_wall_thickness - 2 * kickstand_gap_thickness);

            // Render the hinge's large plate
            translate([
                frame_full_width / 2 - kickstand_width / 2 + kickstand_wall_thickness + kickstand_gap_thickness, 
                frame_full_height - kickstand_bottom_start - kickstand_height + kickstand_gap_thickness + kickstand_wall_thickness,  // no kickstand_gap_thickness here, 
                case_depth + back_depth - hinge_real_depth / 2
            ])
            cube([
                kickstand_width - 2 * kickstand_wall_thickness - 2 * kickstand_gap_thickness, 
                kickstand_height - kickstand_gap_thickness - kickstand_wall_thickness * 2 - kickstand_gap_thickness ,
                hinge_real_depth / 2
            ]);
        }

        // Render an empty cylinder inside the top cylinder
        translate([frame_full_width / 2 - kickstand_width / 2 + kickstand_wall_thickness - kickstand_gap_thickness - 0.11, hinge_start[1], hinge_start[2]])
        rotate([90, 00, 90])
        cylinder(d = kickstand_hinge_diameter + hinge_cylinder_gap * 2, h = kickstand_width + 0.22);

        // Render gap to access the hinge
        gap_radius = (hinge_real_depth)/4 - 0.11;
        translate([
            frame_full_width / 2 - kickstand_width / 4 + kickstand_wall_thickness + kickstand_gap_thickness, 
            frame_full_height - kickstand_bottom_start - kickstand_height / 3 - kickstand_gap_thickness - kickstand_wall_thickness + 0.11,
            case_depth + back_depth - hinge_real_depth / 2 - 0.11
        ])
        filletBox(
            kickstand_width / 2 - 2 * kickstand_wall_thickness - 2 * kickstand_gap_thickness, 
            kickstand_height / 3 + gap_radius * 2,
            hinge_real_depth / 2 + 0.22,
            gap_radius
        );

    }

    // Render gap to access the hinge
    gap_radius = (hinge_real_depth)/4 - 0.11;
    // Base connecting it to the body
    translate([
        frame_full_width / 2 - kickstand_width / 4 + kickstand_wall_thickness + kickstand_gap_thickness + gap_radius * 2, 
        frame_full_height - kickstand_bottom_start - kickstand_height / 12 - kickstand_gap_thickness - kickstand_wall_thickness + 0.11 + gap_radius,
        case_depth + back_depth - kickstand_depth + 0.11
    ])
    cube([
        kickstand_width / 2 - 2 * kickstand_wall_thickness - 2 * kickstand_gap_thickness - gap_radius * 4, 
        kickstand_height / 12 - gap_radius * 2,
        kickstand_depth,
    ]);

    // Stop behind the clamp in the bottom
    translate([
        frame_full_width / 2 - kickstand_width / 2 + kickstand_wall_thickness - 0.11, 
        frame_full_height - kickstand_bottom_start - kickstand_height / 12,
        case_depth + back_depth - kickstand_depth + 0.11
    ])
    cube([
        kickstand_width - 2 * kickstand_wall_thickness + 0.22, 
        kickstand_height / 12,
        kickstand_depth - hinge_real_depth / 2 - kickstand_gap_thickness,
    ]);

    // The clamp itself
    translate([
        frame_full_width / 2 - kickstand_width / 4 + kickstand_wall_thickness + kickstand_gap_thickness + gap_radius / 2, 
        frame_full_height - kickstand_bottom_start - kickstand_height / 12 - kickstand_gap_thickness - kickstand_wall_thickness + 0.11,
        case_depth + back_depth - hinge_real_depth / 2 + 0.11
    ])
    filletBox(
        kickstand_width / 2 - 2 * kickstand_wall_thickness - 2 * kickstand_gap_thickness - gap_radius, 
        kickstand_height / 12 + gap_radius * 2,
        hinge_real_depth / 2,
        gap_radius
    );

    // Render a cylinder as a hinge
    translate(hinge_start)
    rotate([90, 00, 90])
    cylinder(d = kickstand_hinge_diameter, h = kickstand_width - 0.22);

}

/*****************************************************************************/
/*                              Utility                                      */
/*****************************************************************************/


module filletBox(x, y, z, r = fillet_radius) {
    // Optional sanity check (warn if the fillet is too large):
    if (x < 2*r || y < 2*r || z < 2*r) {
        echo("WARNING: fillet radius is too large for box dimensions!");
    }
    
    // Minkowski sum of a smaller cube + sphere(r)
    // => yields a final shape with filleted edges/corners.
    translate([r, r, r])  // Move the sphere to the corner of the cube
    minkowski() {
        // Create the “inner” cube, shrunk by 2*r in each dimension
        // so that after Minkowski we end up with full x, y, z overall.
        cube([x - 2*r, y - 2*r, z - 2*r], center = false);

        // Add the sphere that “rounds” the corners/edges
        sphere(r = r, $fn = 64);  // $fn=64 for smoother arcs
    }
}

module filletBoxTop(x, y, z, r = fillet_radius) {
    intersection() {
        cube([x, y, z]);
        filletBox(x, y, z * 2, r);
    }
}

module filletBoxMiddle(x, y, z, r = fillet_radius) {
    intersection() {
        cube([x, y, z]);
        translate([0, 0, -z])
        filletBox(x, y, z * 3, r);
    }
}

module filletBoxBottom(x, y, z, r = fillet_radius) {
    intersection() {
        cube([x, y, z]);
        translate([0, 0, -z])
        filletBox(x, y, z * 2, r);
    }
}



/*****************************************************************************/
/*                              Rendering                                    */
/*****************************************************************************/

print_gap = 20;

rotate(
    view_mode == "print_vertical" 
    ? [180, 180, 180]
    : view_mode == "print_horizontal" 
    ? [0, 0, 180]
    : [0, 180, 0])
translate(
    view_mode == "print_vertical" 
      ? [-frame_full_width/2, -frame_full_height - print_gap - debug_gap, 0]
      : view_mode == "print_horizontal" 
        ? [-frame_full_width/2, +frame_full_height/2 + print_gap, -(case_depth + back_depth)] 
        : [-frame_full_width/2, -frame_full_height/2, - (panel_cover_depth + panel_depth + debug_gap)])  // stacked
panel_cover();

rotate(
    view_mode == "print_vertical" 
    ? [90, 180, 180] 
    : [0, 180, 0]
)
translate(
    view_mode == "print_vertical" 
    ? [-frame_full_width/2, -frame_full_height, 0] 
    : [-frame_full_width/2, -frame_full_height/2, 0]
) 
    if (kickstand) {
        caseWithKickstand();
    } else {
        case();
    };
