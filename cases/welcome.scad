// Welcome to The FrameOS Case Maker!

// To get started, choose your panel from the dropdown above.
// Change the values of a panel to customize it to your liking.
// When you're done, generate a STL by clicking "render" below.

// To share your customizations with everyone else, visit:
// - https://github.com/FrameOS/cases/
// - https://frameos.net/

// If you're new to OpenSCAD, get started here:
// - https://openscad.org/documentation.html
// - https://openscad.org/cheatsheet/index.html
// - https://learnxinyminutes.com/openscad/

// This is a fork of the OpenSCAD playground. Big props to them!
// - https://github.com/openscad/openscad-playground

// Edit "13in3e.scad" directly for more options
include <13in3e.scad>

// Physical width of the eInk panel (mm)
panel_width  = 284.49;
// Physical height of the eInk panel (mm)
panel_height = 208.81;
// Total inside compartment thickness (layer 2.1)
case_depth = 10.0; 
// Add a kickstand
kickstand = false;
// Vertical spacers holding up the frame
case_center_support_vertical = true;
// Horizontal spacers holding up the frame
case_center_support_horizontal = true;

