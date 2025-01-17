///////////////////////////////////////////////////////////////////////
//  E-Ink Display Case
//  Parametric Case for 7.3" Waveshare E-Ink & Raspberry Pi Zero W2
//
//  Author: ChatGPT (inspired by snippet provided by @Andy Levesque)
//  License: CC BY-NC
//
//  Description:
//    This OpenSCAD file creates a multi-part enclosure for a 7.3" eInk display
//    (170 mm x 111 mm) plus a Raspberry Pi Zero W2.
//
//    It includes the following pieces (toggled on/off):
//      1) front_frame     (the bezel holding the eInk from the front)
//      2) middle_spacer   (optional spacer ring for additional depth)
//      3) back_shell      (the rear portion that encloses electronics)
//
//  Usage:
//    1) Toggle showFrontFrame, showMiddleSpacer, showBackShell at the end.
//    2) Render or export each part (STL) as needed.
//
//  NOTE: You can adapt or expand it with advanced features (e.g., BOSL2, hex
//        walls, cable cutouts, etc.) to suit your needs.
///////////////////////////////////////////////////////////////////////


// -------------------------------------------------------------------
//                        1) Core Dimensions
// -------------------------------------------------------------------

// 7.3" Waveshare eInk active area ~170 x 111 mm. Adjust to your exact panel.
eInkWidth  = 170;   // mm
eInkHeight = 111;   // mm

// Bezel thickness on each side. By default, 5 mm all around except bottom=10 mm.
bezelTop    = 5;
bezelBottom = 10;
bezelLeft   = 5;
bezelRight  = 5;

// Optional extension beyond each bezel (for cables, stands, or aesthetic).
extendTop    = 0;
extendBottom = 0;
extendLeft   = 0;
extendRight  = 0;

// The front frame’s thickness and the back shell depth.
frameThickness     = 3;    // ring thickness of the front bezel
backShellDepth     = 8;    // interior depth behind the panel
shellWallThickness = 2;    // thickness of the back shell walls

// If you want a separate "middle spacer" to add extra gap:
middleSpacerHeight = 0;    // set > 0 for a 3-part design, else 0

// -------------------------------------------------------------------
//                      2) Mounting / Screws
// -------------------------------------------------------------------

// Screw standoff settings
standoffDiameter       = 4.0;     // outer diameter of standoff
screwHoleDiameter      = 2.5;     // hole diameter for M2.5 (or M3 if bigger)
standoffHeight         = backShellDepth; 
standoffInsetFromEdges = 10;      // offset from edges for each standoff

// The front ring can have countersinks for screw heads:
receptacleDepth   = 2;  // depth of countersink
receptacleDiameter = 5; // diameter for the screw head area

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

// -------------------------------------------------------------------
//              4) Modules for repeated geometry
// -------------------------------------------------------------------

// Simple rectangular cuboid
module box_3d(sizeXYZ=[10,10,10], center=false) {
    cube(sizeXYZ, center=center);
}

// Standoff with a central screw hole
module standoffWithHole(height, standoffDia, holeDia) {
    difference() {
        cylinder(h = height, r = standoffDia/2, $fn=50);
        translate([0,0,-0.1])  // shift so hole is fully cut
            cylinder(h = height+0.2, r = holeDia/2, $fn=50);
    }
}

// Place multiple standoffs in a grid, inset from edges
module placeStandoffs(standoffHt, standoffDia, holeDia, standoffCntW, standoffCntH) {
    // Range for standoffs: from standoffInsetFromEdges to
    // (totalFrameX - standoffInsetFromEdges)
    spacingW = (totalFrameX - 2*standoffInsetFromEdges);
    spacingH = (totalFrameY - 2*standoffInsetFromEdges);

    // Steps between standoffs
    stepW = (standoffCntW > 1) ? spacingW / (standoffCntW - 1) : 0;
    stepH = (standoffCntH > 1) ? spacingH / (standoffCntH - 1) : 0;
    
    for (ix = [0 : standoffCntW-1]) {
        for (iy = [0 : standoffCntH-1]) {
            xPos = standoffInsetFromEdges + ix * stepW;
            yPos = standoffInsetFromEdges + iy * stepH;
            // Move standoff into place
            translate([xPos, yPos, 0])
                standoffWithHole(standoffHt, standoffDia, holeDia);
        }
    }
}

// A rectangular cutout for the eInk panel region in the front bezel
module eInkCutout() {
    translate([bezelLeft + extendLeft, 
               bezelBottom + extendBottom,
               0])
        cube([panelWidth, panelHeight, 999], center=false);
}

// -------------------------------------------------------------------
//             5) The Front Frame (Top Part)
// -------------------------------------------------------------------
module front_frame() {
    difference() {
        // Outer shape of the front frame
        box_3d(
            sizeXYZ=[totalFrameX, totalFrameY, frameThickness],
            center=false
        );
        
        // Carve out the display opening
        eInkCutout();

        // OPTIONAL: carve out countersinks for screw heads from the top
        translate([0,0,frameThickness])
        for (ix=[0:standoffCountWidth-1]) {
            for (iy=[0:standoffCountHeight-1]) {
                xPos = standoffInsetFromEdges + ix * (
                        (totalFrameX - 2*standoffInsetFromEdges)
                        / max(1,(standoffCountWidth-1))
                    );
                yPos = standoffInsetFromEdges + iy * (
                        (totalFrameY - 2*standoffInsetFromEdges)
                        / max(1,(standoffCountHeight-1))
                    );

                // Cylinder from above
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
            // The same eInkCutout so it's hollow in the center
            eInkCutout();
        }
    }
}

// -------------------------------------------------------------------
//             7) The Back Shell (Bottom Part)
// -------------------------------------------------------------------
module back_shell() {
    // The back shell is totalFrameX x totalFrameY in XY,
    // with (shellWallThickness + backShellDepth) in Z.
    // Inside is hollow for the Pi, etc.

    union() {
        // Outer perimeter + floor
        difference() {
            // Full block
            box_3d(
                sizeXYZ=[totalFrameX, totalFrameY, (backShellDepth + shellWallThickness)],
                center=false
            );
            // Hollow out inside
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

        // Add standoffs inside on the floor
        translate([0,0,0]) {
            placeStandoffs(standoffHeight, standoffDiameter, screwHoleDiameter, 
                           standoffCountWidth, standoffCountHeight);
        }
    }
}

// -------------------------------------------------------------------
//                 8) Toggles & Final Assembly
// -------------------------------------------------------------------

// Toggles: set these to true/false to enable or disable each part
showFrontFrame    = true;
showMiddleSpacer  = false;
showBackShell     = false;

// A small gap so parts don't overlap visually if all are shown at once
assemblyGap = 0.2;

// We'll stack them along Z, in the order: front frame -> middle -> back
zPos = 0;

if (showFrontFrame) {
    translate([0,0,zPos]) front_frame();
    zPos = zPos + frameThickness + assemblyGap;
}

if (showMiddleSpacer && middleSpacerHeight > 0) {
    translate([0,0,zPos]) middle_spacer();
    zPos = zPos + middleSpacerHeight + assemblyGap;
}

if (showBackShell) {
    translate([0,0,zPos]) back_shell();
    // We don't necessarily need to add anything to zPos if it's the last piece
}
