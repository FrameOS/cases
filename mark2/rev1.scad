// We are printing a case around an e-ink panel and a raspberry, in two parts. There will be 4 layers from the top

// 1. The panel cover (contains a big hole: panel_bezel_(left/right) + panel_border_(left/right) etc from the border)
// 2. The panel (contains a bigger hole: panel_border_(left/right) only)
//     -- split into two parts -- 
// 3. The electronics compartment (same border)
// 4. The back shell


// Leyer 2: The panel

// The pysical dimensions of the eInk panel
panel_width = 170.3;
panel_height = 111.3;
panel_depth = 1.2;

// Dimensions of the control circuitry on the panel (will be covered by the panel covber)
panel_bezel_left = 5.0;
panel_bezel_right = 5.0;
panel_bezel_top = 4.9;
panel_bezel_bottom = 10.4;

// Dimensions from the panel to the edge of the case (will be covered by the panel cover)
panel_border_left = 3.0;
panel_border_right = 3.0;
panel_border_top = 3.0;
panel_border_bottom = 3.0;

// Layer 1: The panel cover
panel_cover_depth = 2.0;

// Calculate the full dimensions of the frame
frame_full_width = panel_width + panel_bezel_left + panel_bezel_right + panel_cover_border_left + panel_cover_border_right;
frame_full_height = panel_height + panel_bezel_top + panel_bezel_bottom + panel_cover_border_top + panel_cover_border_bottom;

// Layer 3: The electronics compartment

electornics_depth = 7.0;

// Layer 4: The back shell
back_depth = 1.8;

frame_full_depth = panel_depth + panel_cover_depth + electornics_depth + back_depth;

// Part 1: The panel cover

// Part 2: The panel

// Part 3: The electronics compartment

// Part 4: The back shell

// Render the parts
