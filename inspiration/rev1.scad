///////////////////////////////////////////////////////////////////////
//  E-Ink Display Case
//  Parametric Case for 7.3" Waveshare E-Ink & Raspberry Pi Zero W2
//
//  Author: ChatGPT (inspired by snippet provided by @Andy Levesque)
//  License: CC BY-NC
//
//  Description:
//    This OpenSCAD file creates a two- (or three-) part enclosure:
//    1) A front frame that holds and bezel-encapsulates the eInk panel
//    2) A back shell to hold Pi Zero W2 and to secure the panel from behind
//    3) Optionally a middle spacer if you need more depth or want a 3-part approach
//
//  Key features:
//    - Parametric eInk display size (width x height)
//    - Different top/bottom/left/right bezel widths
//    - Extensions for each bezel dimension
//    - Screw standoffs for assembly
//    - Adjust thickness, standoff heights/diameters, etc.
//
//  Usage:
//    1) Tweak parameters below
//    2) Render the entire assembly or generate STLs for each part:
//       - "front_frame()"
//       - "back_shell()"
//       - "middle_spacer()" (optional if you’d like more depth)
//    3) Export each module as STL individually or comment/uncomment
//       to see only the part you want.
//
//  NOTE: If you want to incorporate your original code’s hex walls,
//        slot system, or BOSL2-based features, simply replace the
//        relevant geometry inside the union/difference blocks with
//        your specialized modules.
///////////////////////////////////////////////////////////////////////


// -------------------------------------------------------------------
//                        1) Core Dimensions
// -------------------------------------------------------------------

// 7.3" Waveshare eInk active area ~170 x 111 mm. 
// Adjust to your panel’s outer glass or frame dimensions, if needed.
eInkWidth  = 170;     // mm
eInkHeight = 111;     // mm

// Bezel thickness on each side. By default, 5 mm all around except bottom is 10 mm.
bezelTop    = 5;
bezelBottom = 10;
bezelLeft   = 5;
bezelRight  = 5;

// Optional extension in each direction beyond the bezel. 
// Useful if you want more room for cables or to attach stands, etc.
extendTop    = 0;
extendBottom = 0;
extendLeft   = 0;
extendRight  = 0;

// The front frame thickness and the back shell thickness
frameThickness   = 3;   // how “tall” the front bezel ring is
backShellDepth   = 8;   // interior depth behind the panel for Pi, wires, etc.
shellWallThickness = 2; // thickness of the back shell walls

// If you want a separate "middle spacer" piece to further extend the case:
middleSpacerHeight = 0;  // set > 0 for a 3-part case, set 0 to omit

// -------------------------------------------------------------------
//                      2) Mounting / Screws
// -------------------------------------------------------------------

// Screw standoff settings
standoffDiameter        = 4.0;      // outer diameter of standoff
screwHoleDiameter       = 2.5;      // clearance hole for M2.5 or M3, etc.
standoffHeight          = backShellDepth; 
standoffInsetFromEdges  = 10;       // how far from edges to place standoffs

// The front ring also can have “receptacles” that line up with standoffs
receptacleDepth   = 2;  // how deep the front ring’s countersink for the screw
receptacleDiameter = 5; // slightly bigger than standoffDiameter to hold the head

// Number of standoffs along width/height
standoffCountWidth  = 2;  // how many standoffs left-to-right
standoffCountHeight = 2;  // how many standoffs top-to-bottom

// -------------------------------------------------------------------
//                 3) Calculate Overall Dimensions
// -------------------------------------------------------------------

// The overall opening needed for the eInk panel
panelWidth  = eInkWidth;
panelHeight = eInkHeight;

// The front frame’s total X dimension
totalFrameX = panelWidth
             + bezelLeft + bezelRight
             + extendLeft + extendRight;

// The front frame’s total Y dimension
totalFrameY = panelHeight
             + bezelTop + bezelBottom
             + extendTop + extendBottom;

// The front frame’s outer X dimension == totalFrameX
// The front frame’s outer Y dimension == totalFrameY
// The front frame’s thickness == frameThickness

// If you are doing a 3-part design, total case depth = frameThickness + middleSpacerHeight + backShellDepth + shellWallThickness

// -------------------------------------------------------------------
//              4) Modules for repeated geometry
// -------------------------------------------------------------------

// Create a rounded or standard rectangular cuboid
module box_3d(sizeXYZ=[10,10,10], center=false) {
    // Simple standard box
    if (!center) {
        cube(sizeXYZ, center=false);
    } else {
        cube(sizeXYZ, center=true);
    }
}

// A simple standoff plus a hole for screw
module standoffWithHole(height, standoffDia, holeDia) {
    difference() {
        cylinder(h = height, r = standoffDia/2, $fn=50);
        translate([0,0,-0.1])  // slight shift so hole goes all the way
            cylinder(h = height+0.2, r = holeDia/2, $fn=50);
    }
}

// Discrete function to place standoffs in corners or along edges
module placeStandoffs(standoffHt, standoffDia, holeDia, standoffCntW, standoffCntH) {
    // We’ll distribute them across the “inner rectangle”
    // from standoffInsetFromEdges to (totalFrameX - standoffInsetFromEdges)
    spacingW = (totalFrameX - 2*standoffInsetFromEdges);
    spacingH = (totalFrameY - 2*standoffInsetFromEdges);

    // If standoffCountWidth == 2, we place them at each corner in X
    // If standoffCountWidth > 2, we spread them evenly
    stepW = (standoffCountWidth > 1) 
            ? spacingW / (standoffCountWidth - 1) 
            : 0;
    stepH = (standoffCountHeight > 1)
            ? spacingH / (standoffCountHeight - 1)
            : 0;
    
    for (ix=[0:standoffCountWidth-1]) {
        for (iy=[0:standoffCountHeight-1]) {
            xPos = standoffInsetFromEdges + ix * stepW;
            yPos = standoffInsetFromEdges + iy * stepH;
            // Move standoff into place
            translate([xPos, yPos, 0])
                standoffWithHole(standoffHt, standoffDia, holeDia);
        }
    }
}

// A cutout for the eInk panel region
module eInkCutout() {
    // The panel sits flush inside
    // We remove a rectangle from the front frame. 
    translate([bezelLeft + extendLeft, 
               bezelBottom + extendBottom, 
               0])
        cube([panelWidth, panelHeight, 999], center=false);
}

// -------------------------------------------------------------------
//             5) The Front Frame (Top Part)
// -------------------------------------------------------------------
module front_frame() {
    // This ring is totalFrameX x totalFrameY, thickness = frameThickness
    // With a large rectangular cutout for the display

    difference() {
        // Outer shape of front frame
        box_3d(
            sizeXYZ=[totalFrameX, totalFrameY, frameThickness],
            center=false
        );
        
        // Carve out the display opening
        eInkCutout();

        // OPTIONAL: carve out screw receptacles from the top side
        // We offset standoffs inside the ring, so let’s carve a cylinder 
        // from above for each standoff location. (like countersink)
        // This is only if you want the screw heads to be flush.
        translate([0,0,frameThickness])
        for (ix=[0:standoffCountWidth-1]) {
            for (iy=[0:standoffCountHeight-1]) {
                xPos = standoffInsetFromEdges + ix * ( (totalFrameX - 2*standoffInsetFromEdges)
                          / max(1,(standoffCountWidth-1)) );
                yPos = standoffInsetFromEdges + iy * ( (totalFrameY - 2*standoffInsetFromEdges)
                          / max(1,(standoffCountHeight-1)) );

                // cut from above
                translate([xPos, yPos, 0]) {
                    cylinder(h = receptacleDepth+0.2, r = receptacleDiameter/2, $fn=50);
                }
            }
        }
    }
}

// -------------------------------------------------------------------
//             6) The Middle Spacer (Optional)
// -------------------------------------------------------------------
module middle_spacer() {
    if(middleSpacerHeight > 0) {
        difference() {
            // Outer block
            box_3d(
                sizeXYZ=[totalFrameX, totalFrameY, middleSpacerHeight],
                center=false
            );
            // The same eInkCutout so the interior is open
            eInkCutout();
        }
    }
}

// -------------------------------------------------------------------
//             7) The Back Shell (Bottom Part)
// -------------------------------------------------------------------
module back_shell() {
    // The back shell will be:
    //   totalFrameX x totalFrameY in XY
    //   shellWallThickness + backShellDepth in Z
    //
    // We’ll have a rim around the perimeter (shellWallThickness thick),
    // plus a “floor” at the bottom. Inside is hollow to fit the Pi & wiring.
    //
    // Then we also place standoffs that line up with front frame’s countersink holes.

    // 1) The big outer block
    union() {
        // Outer perimeter walls + floor
        difference() {
            // Outer rectangular prism
            box_3d(
                sizeXYZ=[totalFrameX, totalFrameY, (backShellDepth + shellWallThickness)],
                center=false
            );
            // Hollow out the inside
            translate([shellWallThickness, shellWallThickness, shellWallThickness])
                box_3d(
                    sizeXYZ=[
                        totalFrameX - 2*shellWallThickness,
                        totalFrameY - 2*shellWallThickness,
                        backShellDepth
                    ],
                    center=false
                );
        }

        // 2) Add standoffs inside the shell
        //    If you prefer them on the perimeter, you can adjust positions.
        //    Here, they start at Z=0 (on the floor) and go up standoffHeight.
        translate([0,0,0]) {
            placeStandoffs(standoffHeight, standoffDiameter, screwHoleDiameter, 
                           standoffCountWidth, standoffCountHeight);
        }
    }
}

// -------------------------------------------------------------------
//                 8) Display or Export each part
// -------------------------------------------------------------------
// Uncomment the module you want to preview or export as STL

// a) FRONT FRAME ONLY
//front_frame();

// b) MIDDLE SPACER ONLY (only if middleSpacerHeight > 0)
//middle_spacer();

// c) BACK SHELL ONLY
//back_shell();

// d) WHOLE ASSEMBLY
// For visualization, place them in “assembled” positions:
assemblyGap = 0.2; // small gap so we can see they are separate
translate([0,0,0])                front_frame();
translate([0,0,frameThickness + assemblyGap])   middle_spacer();
translate([0,0,frameThickness + middleSpacerHeight + assemblyGap * 2]) back_shell();
