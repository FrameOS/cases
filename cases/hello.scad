// Welcome to The FrameOS Case Maker!

// 1. Choose your panel (e.g. waveshare.7in3e) from the dropdown above.
// 2. Set values like "case_depth" to customize your case.
// 3. Generate a STL by clicking "render" below.

// To share your customizations with everyone else, visit:
// - https://github.com/FrameOS/cases/
// - https://frameos.net/

// If you're new to OpenSCAD, get started here:
// - https://openscad.org/documentation.html
// - https://openscad.org/cheatsheet/index.html
// - https://learnxinyminutes.com/openscad/

// This is a fork of the OpenSCAD playground. Big props to them!
// - https://github.com/openscad/openscad-playground

/* [Demo] */

// This is just a quick demo with a few configuration options.
// Open "waveshare.13in3e.scad" for more settings,
// ... or peek into "case1.scad" to see all of them.

include <waveshare.13in3e.scad>

view_mode="print_vertical"; // [print_vertical, print_horizontal, stacked]

// Physical width of the eInk panel (mm)
panel_width  = 284.49;
// Physical height of the eInk panel (mm)
panel_height = 208.81;
// Total inside compartment thickness. Measure and adjust!
case_depth = 10.0; 
// Add a kickstand
kickstand = true;
// Kickstand rotation (for debugging)
kickstand_rotation = 0; // [0:35]
// Add a cutout for the USB port
usb_cutout = false;
// Hanging hole
hanging_hole = true;
// Vertical spacers holding up the frame
case_center_support_vertical = false;
// Horizontal spacers holding up the frame
case_center_support_horizontal = false;
// Peek into the case (for debugging)
cross_section_percentage = 0; // [0:100]
