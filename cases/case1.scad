/* FrameOS Case 1 */

/* [View settings] */

view_mode="print_vertical"; // [print_vertical, print_horizontal, stacked]

// Shrinkage adjustment when printing vertically. By default we measured 0.4mm of shrinkage for every 100mm of case.
vertical_print_scale = 1.004; 

/* [Panel dimensions] */

// Physical width of the eInk panel (mm)
panel_width  = 284.49;
// Physical height of the eInk panel (mm)
panel_height = 208.81;

// Clearance around the eInk panel (mm)
clearance = 0.3;

// Dimensions of the bezel on the eInk panel. This part will be covered by the panel cover.
panel_bezel_left   = 11.7;
panel_bezel_right  = 3.3;
panel_bezel_top    = 3.1;
panel_bezel_bottom = 3.1;

/* [Border and inner padding] */

// How much border to add around the panel
panel_border_left   = 3.2;
panel_border_right  = 11.6;
panel_border_top    = 11.8;
panel_border_bottom = 11.8;

// Supporting space below the panel
case_inner_padding_left = 4;
case_inner_padding_right = 4;
case_inner_padding_top = 4;
case_inner_padding_bottom = 4;

/* [Case dimensions] */

// How round to make the case
fillet_radius = 2.5;

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
panel_cable_gap_bottom = 0;
panel_cable_gap_size = 2.0; // How into the border to cut
case_cable_gap_depth = 3.0; // How deep into the case to cut

/* [Panel supports] */

case_center_support_vertical = true;
case_center_support_horizontal = true;
case_center_support_width = 4.0;

/* [Screws and placement] */

// Center of each screw hole from the corner
screw_offset_left   = 5.0;
screw_offset_right  = 5.0;
screw_offset_top    = 5.0;
screw_offset_bottom = 5.0;

// Extra screws on the top side (0.0 to 1.0)
extra_screws_top = [0.48, 0.52, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the bottom side (0.0 to 1.0)
extra_screws_bottom = [0.48, 0.52, 0, 0, 0]; // [0.0:0.05:1.0]
// Extra screws on the left side (0.0 to 1.0)
extra_screws_left = [0, 0, 0, 0, 0]; // [0.0:0.05:1.0]
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
kickstand_hinge_top_extra_leverage = 3; // Height added to the flap above the hinge. Increasing reduces max rotation
kickstand_hinge_wall_padding = 0.2; // Distance from the back wall
kickstand_hinge_cylinder_gap = 0.5; // Gap between the hinge and the cylinder
kickstand_rotation = 0; // Kickstand rotation angle, goes up to 35 when open

/* [USB cutout] */

usb_cutout = true;
usb_cutout_offset_x_percentage = 80;
usb_cutout_offset_y_percentage = 20;
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

// End of variables.

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

kickstand_height = frame_full_height * kickstand_height_percentage / 100;
kickstand_full_width = kickstand_width + 2 * kickstand_wall_thickness + 2 * kickstand_gap_thickness;
kickstand_leg_full_width = kickstand_leg_width + 2 * kickstand_wall_thickness + 2 * kickstand_gap_thickness;
kickstand_leg_bridge_offset = kickstand_leg_bridge_offset_percentage * (kickstand_height - 2 * kickstand_leg_bridge_height) / 100;

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
    cubeWithAngledTopBottom(
        loc=[
            panel_border_left + panel_width_with_clearance / 2 - panel_cable_gap_bottom / 2,
            panel_border_top + panel_height_with_clearance - case_inner_padding_bottom - case_depth - 0.11,
            translate_depth
        ],
        size=[
            panel_cable_gap_bottom,
            panel_cable_gap_size + case_inner_padding_bottom + 0.11 + case_depth,
            depth + 0.11
        ]
    );
}

module render_panel_cable_gap_top(depth, translate_depth) {
    cubeWithAngledTopBottom(
        loc=[
            panel_border_left + panel_width_with_clearance / 2 - panel_cable_gap_top / 2,
            panel_border_top - panel_cable_gap_size,
            translate_depth
        ],
        size=[
            panel_cable_gap_top,
            panel_cable_gap_size * 2 + case_inner_padding_top + 0.11, // 2x to cut into the chamfer
            depth + 0.11
        ],
        top=(view_mode == "print_vertical"),
        topReverse=true
    );
}

module render_panel_cable_gap_left(depth, translate_depth) {
    cubeWithAngledTopBottom(
        loc=[
            panel_border_left - panel_cable_gap_size,
            panel_border_top + panel_height_with_clearance / 2 - panel_cable_gap_left / 2,
            translate_depth
        ],
        size=[
            panel_cable_gap_size + case_inner_padding_left + 0.11,
            panel_cable_gap_left,
            depth + 0.11
        ],
        top=(view_mode == "print_vertical"),
        topReverse=true
    );
}

module render_panel_cable_gap_right(depth, translate_depth) {
    cubeWithAngledTopBottom(
        loc=[
            panel_border_left + panel_width_with_clearance - case_inner_padding_right - 0.11,
            panel_border_top + panel_height_with_clearance / 2 - panel_cable_gap_right / 2,
            translate_depth
        ],
        size=[
            panel_cable_gap_size + case_inner_padding_right + 0.11,
            panel_cable_gap_right,
            depth + 0.11
        ],
        top=(view_mode == "print_vertical"),
        topReverse=true
    );
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
                            cubeWithAngledTopBottom(
                                loc=[frame_full_width / 4, frame_full_height / 2 - (case_center_support_width / 2), 0],
                                size=[frame_full_width / 6, case_center_support_width, case_depth],
                                bottom=(view_mode == "print_vertical")
                            );
                            cubeWithAngledTopBottom(
                                loc=[frame_full_width / 4 + frame_full_width / 3, frame_full_height / 2 - (case_center_support_width / 2), 0],
                                size=[frame_full_width / 6, case_center_support_width, case_depth],
                                bottom=(view_mode == "print_vertical")
                            );
                        }

                        if (case_center_support_vertical) {
                            cubeWithAngledTopBottom(
                                loc=[frame_full_width / 2 - (case_center_support_width / 2), frame_full_height / 4, 0],
                                size=[case_center_support_width, frame_full_height / 6, case_depth],
                                bottom=(view_mode == "print_vertical")
                            );
                            cubeWithAngledTopBottom(
                                loc=[frame_full_width / 2 - (case_center_support_width / 2), frame_full_height / 4 + frame_full_height / 3, 0],
                                size=[case_center_support_width, frame_full_height / 6, case_depth],
                                bottom=(view_mode == "print_vertical")
                            );
                        }
                    };
                }
            };

            if (usb_cutout) {
                cubeWithAngledTopBottom(
                    loc=[
                        frame_full_width * usb_cutout_offset_x_percentage / 100, 
                        frame_full_height * usb_cutout_offset_y_percentage / 100,
                        back_depth + case_depth - (usb_cutout_box_depth + usb_cutout_box_wall_thickness),
                    ], 
                    size =[
                        usb_cutout_box_width + usb_cutout_box_wall_thickness * 2, 
                        usb_cutout_box_height + usb_cutout_box_wall_thickness, 
                        usb_cutout_box_depth + usb_cutout_box_wall_thickness
                    ], 
                    bottom=(usb_cutout_hole_postition != "bottom")
                );
            }
            if (hanging_hole) {
                cubeWithAngledTopBottom(
                    loc=[
                        (frame_full_width - hanging_hole_box_width - hanging_hole_wall_thickness * 2) / 2, 
                        hanging_hole_offset - hanging_hole_wall_thickness, 
                        back_depth + case_depth - min(back_depth + case_depth, hanging_hole_depth)
                    ],
                    size=[
                        hanging_hole_box_width + 2 * hanging_hole_wall_thickness, 
                        hanging_hole_box_height + 2 * hanging_hole_wall_thickness, 
                        min(back_depth + case_depth, hanging_hole_depth)
                    ],
                    bottom=(view_mode == "print_vertical")
                );
            }

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

        if (usb_cutout) {
            // Cutout into box
            cubeWithAngledTopBottom(
                loc=[
                    frame_full_width * usb_cutout_offset_x_percentage / 100 + usb_cutout_box_wall_thickness, 
                    frame_full_height * usb_cutout_offset_y_percentage / 100 + usb_cutout_box_wall_thickness,
                    back_depth + case_depth - usb_cutout_box_depth,
                ], 
                size =[
                    usb_cutout_box_width, 
                    usb_cutout_box_height, 
                    usb_cutout_box_depth + 0.11
                ], 
                bottom=(usb_cutout_hole_postition != "bottom")
            );

            // Hole into what's remaining
            if (usb_cutout_hole_postition == "left" || usb_cutout_hole_postition == "right") {
                translate([
                    frame_full_width * usb_cutout_offset_x_percentage / 100 + usb_cutout_box_wall_thickness - usb_cutout_box_wall_thickness - 0.11
                    + (usb_cutout_hole_postition == "right" ? usb_cutout_box_width + usb_cutout_box_wall_thickness : 0), 
                    frame_full_height * usb_cutout_offset_y_percentage / 100 + usb_cutout_box_wall_thickness + (usb_cutout_box_height - usb_cutout_hole_width) / 2,
                    back_depth + case_depth - usb_cutout_box_depth + (usb_cutout_box_depth - usb_cutout_hole_height) / 2,
                ])
                cube([
                    usb_cutout_box_wall_thickness + 0.22, 
                    usb_cutout_hole_width, 
                    usb_cutout_hole_height
                ]);
            } else {
                translate([
                    frame_full_width * usb_cutout_offset_x_percentage / 100 + usb_cutout_box_wall_thickness + (usb_cutout_box_width - usb_cutout_hole_width) / 2, 
                    frame_full_height * usb_cutout_offset_y_percentage / 100 + usb_cutout_box_wall_thickness - usb_cutout_box_wall_thickness - 0.11 
                    + (usb_cutout_hole_postition == "bottom" ? usb_cutout_box_height + usb_cutout_box_wall_thickness : 0),
                    back_depth + case_depth - usb_cutout_box_depth + (usb_cutout_box_depth - usb_cutout_hole_height) / 2,
                ])
                cube([
                    usb_cutout_hole_width, 
                    usb_cutout_box_wall_thickness + 0.22, 
                    usb_cutout_hole_height
                ]);
            }
        }

        if (hanging_hole) {
            cubeWithAngledTopBottom(
                loc=[
                    (frame_full_width - hanging_hole_box_width) / 2, 
                    hanging_hole_offset, 
                    back_depth + case_depth - min(back_depth + case_depth, hanging_hole_depth) + hanging_hole_wall_thickness
                ],
                size=[
                    hanging_hole_box_width, 
                    hanging_hole_box_height, 
                    min(back_depth + case_depth, hanging_hole_depth) - hanging_hole_wall_thickness * 2
                ],
                bottom=(view_mode == "print_vertical")
            );

            // Big cyclinter hole
            translate([
                frame_full_width / 2, 
                hanging_hole_offset + hanging_hole_box_height * 0.75, 
                case_depth - 0.11
            ])
            rotate([0, 0, 90])
            cylinder(d = hanging_hole_large_diameter, h = back_depth + 0.21);
            // Small cyclinter hole
            translate([
                frame_full_width / 2, 
                hanging_hole_offset + hanging_hole_box_height * 0.75 - hanging_hole_large_diameter, 
                case_depth - 0.11
            ])
            rotate([0, 0, 90])
            cylinder(d = hanging_hole_small_diameter, h = back_depth + 0.21);
            // Box connecitng the two
            translate([
                frame_full_width / 2 - hanging_hole_small_diameter / 2,
                hanging_hole_offset + hanging_hole_box_height * 0.75 - hanging_hole_large_diameter, 
                case_depth - 0.11
            ])
            cube([hanging_hole_small_diameter, hanging_hole_large_diameter, back_depth + 0.21]);
        }
    }
}

/*****************************************************************************/
/*                             Kickstand                                     */
/*****************************************************************************/

module caseWithKickstand() {
    hinge_real_depth = kickstand_depth - kickstand_wall_thickness - kickstand_hinge_wall_padding - kickstand_hinge_diameter / 2;
    hinge_top_offset = kickstand_wall_thickness + kickstand_depth / 2 + kickstand_hinge_top_extra_leverage;
    hinge_start = [
        frame_full_width / 2 - kickstand_full_width / 2 + 0.11, 
        frame_full_height - kickstand_bottom_start - kickstand_height + hinge_top_offset,
        case_depth + back_depth - hinge_real_depth / 2
    ];
    leg_x_starts_full = [
        (frame_full_width - kickstand_full_width) / 2,
        (frame_full_width + kickstand_full_width) / 2 - kickstand_leg_full_width,
    ];
    leg_x_starts_hole = [
        leg_x_starts_full[0] + kickstand_wall_thickness,
        leg_x_starts_full[1] + kickstand_wall_thickness,
    ];
    leg_x_starts_leg = [
        leg_x_starts_hole[0] + kickstand_gap_thickness,
        leg_x_starts_hole[1] + kickstand_gap_thickness,
    ];
    leg_depth = kickstand_depth - kickstand_gap_thickness - kickstand_wall_thickness;
    leg_bridge_depth = leg_depth * 0.8;
    leg_yz = [
        frame_full_height - kickstand_bottom_start - kickstand_height + kickstand_gap_thickness + kickstand_wall_thickness,
        case_depth + back_depth - leg_depth
    ];

    leg_bridge_leg_y = frame_full_height - kickstand_bottom_start - kickstand_leg_bridge_offset - kickstand_leg_bridge_height * 2;
    leg_bridge_hole_y = leg_bridge_leg_y - kickstand_gap_thickness;
    leg_bridge_full_y = leg_bridge_leg_y - kickstand_wall_thickness;
    leg_top_height_full = kickstand_depth + kickstand_hinge_top_extra_leverage + kickstand_wall_thickness * 2 + kickstand_gap_thickness;

    // Make a hole in the case
    difference() {
        union() {
            case();
            // Protective box around the kickstand legs
            for (x = leg_x_starts_full) {
                // Long base leg
                cubeWithAngledTopBottom(
                    loc=[
                        x, 
                        frame_full_height - kickstand_bottom_start - kickstand_height, 
                        case_depth + back_depth - kickstand_depth - kickstand_gap_thickness
                    ],
                    size=[kickstand_leg_full_width, kickstand_height, kickstand_depth + kickstand_gap_thickness],
                    bottom=(view_mode == "print_vertical" && kickstand_bottom_start >= kickstand_depth),
                    top=true
                );
            }
    
            // Protective box around the leg bridge
            cubeWithAngledTopBottom(
                loc=[
                    leg_x_starts_full[0] + kickstand_leg_full_width - kickstand_wall_thickness * 2, 
                    leg_bridge_full_y + kickstand_depth - kickstand_wall_thickness, 
                    case_depth + back_depth - kickstand_depth
                ],
                size=[
                    kickstand_full_width - kickstand_leg_full_width * 2 + kickstand_wall_thickness * 4, 
                    kickstand_leg_bridge_height * 2 + kickstand_wall_thickness * 2 - kickstand_depth * 2, 
                    kickstand_depth
                ],
                top=true,
                bottom=true
            );
        }
        // Now the holes
        for (x = leg_x_starts_hole) {
            // Top thicker part - top extra cavity
            cubeWithAngledTopBottom(
                loc=[
                    x,
                    frame_full_height - kickstand_bottom_start - kickstand_height,
                    case_depth + back_depth - kickstand_depth + kickstand_gap_thickness
                ],
                size=[
                    kickstand_leg_width + 2 * kickstand_gap_thickness,
                    kickstand_wall_thickness + 0.11,
                    kickstand_depth - kickstand_wall_thickness * 2
                ],
                top=true
            );
            // Long base leg
            cubeWithAngledTopBottom(
                loc=[
                    x,
                    frame_full_height - kickstand_bottom_start - kickstand_height + kickstand_wall_thickness,
                    case_depth + back_depth - kickstand_depth - kickstand_gap_thickness + kickstand_wall_thickness
                ],
                size=[
                    kickstand_leg_width + 2 * kickstand_gap_thickness,
                    kickstand_height - 2 * kickstand_wall_thickness,
                    kickstand_depth - kickstand_wall_thickness + kickstand_gap_thickness + 0.11
                ]
            );
        }

        // Leg bridge hole
        cubeWithAngledTopBottom(
            loc=[
                leg_x_starts_full[0] + kickstand_leg_full_width - kickstand_wall_thickness - 0.11, 
                leg_bridge_full_y + kickstand_depth, 
                case_depth + back_depth - kickstand_depth + kickstand_gap_thickness 
            ],
            size=[
                kickstand_full_width - kickstand_leg_full_width * 2 + kickstand_wall_thickness * 2 + 0.22, 
                kickstand_leg_bridge_height * 2 - kickstand_depth * 2 + kickstand_gap_thickness, 
                kickstand_depth - kickstand_gap_thickness + 0.11
            ],
            top=true,
            bottom=true
        );
    }
    
    // The kickstand itself
    difference() {
        union() {
            // Legs
            for (x = leg_x_starts_leg) {
                // Render the leg's top cylinder over the hinge
                translate([x, hinge_start[1], hinge_start[2]])
                rotate([90, 0, 90])
                cylinder(d = hinge_real_depth, h = kickstand_leg_width);

                // Render the large leg top
                translate([x, hinge_start[1], hinge_start[2]])
                rotate([kickstand_rotation, 0, 0])
                translate([0, leg_yz[0] - hinge_start[1], case_depth + back_depth - (hinge_real_depth / 2) - hinge_start[2]])
                cube([
                    kickstand_leg_width, 
                    hinge_top_offset,
                    hinge_real_depth / 2
                ]);

                // Render the large leg
                translate([x, hinge_start[1], hinge_start[2]])
                rotate([kickstand_rotation, 0, 0])
                translate([0, leg_yz[0] - hinge_start[1] + hinge_top_offset - kickstand_hinge_diameter, leg_yz[1] - hinge_start[2]])
                cube([
                    kickstand_leg_width, 
                    kickstand_height - kickstand_gap_thickness - kickstand_wall_thickness * 2 - kickstand_gap_thickness - hinge_top_offset + kickstand_hinge_diameter,
                    leg_depth
                ]);
            }
            // Render the leg bridge
            translate([0, hinge_start[1], hinge_start[2]])
            rotate([kickstand_rotation, 0, 0])
            cubeWithAngledTopBottom(
                loc=[
                    leg_x_starts_leg[0] + kickstand_leg_width, 
                    leg_bridge_leg_y - hinge_start[1] + leg_bridge_depth,
                    case_depth + back_depth - leg_bridge_depth - hinge_start[2]
                ],
                size=[
                    kickstand_width - 2 * kickstand_leg_width, 
                    max(kickstand_leg_bridge_height - hinge_real_depth - leg_bridge_depth, 0), 
                    leg_bridge_depth
                ],
                top=true,
                bottom=true
            );
        }

        // Render an empty cylinder inside the top cylinder, where the hinge will go through
        translate([leg_x_starts_leg[0] - 0.11, hinge_start[1], hinge_start[2]])
        rotate([90, 0, 90])
        cylinder(d = kickstand_hinge_diameter + kickstand_hinge_cylinder_gap * 2, h = kickstand_width + 0.22);

        // Render an empty cylinder into the feet of the kickstand
        for (x = leg_x_starts_leg) {
            translate([0, hinge_start[1], hinge_start[2]])
            rotate([kickstand_rotation, 0, 0])
            translate([
                x - 0.11, 
                frame_full_height - kickstand_bottom_start - kickstand_gap_thickness * 3 - hinge_start[1],
                case_depth + back_depth - hinge_start[2] - leg_depth / 2
            ])
            rotate([90, 0, 90])
            cylinder(d = leg_depth  * 0.75, h = kickstand_leg_width + 0.22);
        }
    }

    // Do not print this for vertical prints, as the legs will get stuck into it
    if (view_mode != "print_vertical") {
        // Render an full cylinder into the frame to snap the legs into
        for (x = leg_x_starts_hole) {
            translate([
                x - 0.11, 
                frame_full_height - kickstand_bottom_start - kickstand_gap_thickness * 2,
                case_depth + back_depth - hinge_real_depth / 4
            ])
            rotate([90, 0, 90])
            cylinder(d = hinge_real_depth / 3, h = kickstand_leg_width + 0.22 + kickstand_gap_thickness * 2);
        }
    }
    
    // Render a cylinder as a hinge
    for (x = leg_x_starts_full) {
        translate([x, hinge_start[1], hinge_start[2]])
        rotate([90, 0, 90])
        cylinder(d = kickstand_hinge_diameter, h = kickstand_leg_full_width - 0.22);
    }
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

module cubeWithAngledTopBottom(loc, size, top=false, topReverse=false, bottom=false, bottomReverse=false) {
    translate(loc)
    cube(size);

    if (top) {
        translate([loc[0], loc[1] - (topReverse ? size[2] : 0) + 0.01, loc[2]])
        rotate(topReverse ? [0,0,0] : [90,0,0])
        polyhedron(//pt 0        1        2        3        4        5
            points=[[0,0,0], [size[0],0,0], [size[0],size[2],0], [0,size[2],0], [0,size[2],size[2]], [size[0],size[2],size[2]]],
            faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
        );
    }
    if (bottom) {
        translate([loc[0], loc[1] + size[1] + (bottomReverse ? 0 : size[2]) - 0.01, loc[2] + size[2]])
        rotate(bottomReverse ? [270,0,0] : [180,0,0])
        polyhedron(//pt 0        1        2        3        4        5
            points=[[0,0,0], [size[0],0,0], [size[0],size[2],0], [0,size[2],0], [0,size[2],size[2]], [size[0],size[2],size[2]]],
            faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
        );
    }
}


/*****************************************************************************/
/*                              Rendering                                    */
/*****************************************************************************/

print_gap = 20;

difference() {
    union() {
        rotate(
            view_mode == "print_vertical" 
            ? [180, 180, 180]
            : view_mode == "print_horizontal" 
            ? [0, 0, 180]
            : [0, 180, 0])
        translate(
            view_mode == "print_vertical" 
            ? [-frame_full_width/2, -frame_full_height - print_gap, 0]
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
            ? [-frame_full_width/2, -frame_full_height * vertical_print_scale, 0] 
            : [-frame_full_width/2, -frame_full_height/2, 0]
        )
        scale([1, view_mode == "print_vertical" ? vertical_print_scale : 1, 1])
        if (kickstand) {
            caseWithKickstand();
        } else {
            case();
        };
        // translate([-frame_full_width / 2, -400, -100])
        // cube([frame_full_width * cross_section_percentage / 100 + 0.2, frame_full_height + 500, 500]);
    }

    // cut off half
    if (cross_section_percentage > 0 && cross_section_percentage < 100) {
        translate([-frame_full_width / 2 - 0.11, -400, -100])
        cube([frame_full_width * cross_section_percentage / 100 + 0.2, frame_full_height + 500, 500]);
    }
}

