// Dual extruder mount for taz5

include <MCAD/constants.scad>
use <MCAD/nuts_and_bolts.scad>
use <include/tazobjs.scad>

use <nema.scad>
use <probe.scad>

$fn=25;

//%rotate([0,180,0]) translate([-100,0,5]) x_carriage();

module extruder() {
	%cube([55, 95, 25]);
}

module zip_hole() {
	hull() {
		cylinder(r=3, h=20);
		translate([0, 3, 0]) {
			cylinder(r=3, h=20);
		}
	}
}

module back_plate() {
	difference() {
		union() {
			extruder_mount();
			translate([0,18,0]) cube([100,80,6]);
		}
		translate([-5,0,6]) cube([150,150,100]);
	}
}

module mount_plate() {
	translate([5,5,0]) minkowski() {
		cube([110,70,5]);
		cylinder(r=5, h=1);
	}
}

module dual_mount() {
	union() {
		difference() {
			union() {
				back_plate();
				translate([-10,19,0]) mount_plate();

				translate([-5, 25, 1]) nema17_rest();
				translate([53, 25, 1]) nema17_rest();

				translate([5, 20, 22])
					rotate(90, [1,0,0]) z_probe_mount();

				translate([94, 20, 22])
					rotate(90, [1,0,0]) z_probe_mount();
			}

			translate([-2, 28, -1]) cube([45, 47, 30]);
			translate([56, 28, -1]) cube([45, 47, 30]);

			translate([-4, 90, -10]) zip_hole();
			translate([104, 90, -10]) zip_hole();

		}
	}

	//translate([-2, -28.5, 38]) extruder();
	//translate([59, -28.5, 38]) extruder();
}

dual_mount();

//translate([118, -3, 23]) rotate([270])
//z_probe_holder();

//nema17_rest();

//nema17();

translate([-20, 0, 0]) rotate(90) nema17_spacer_top();
translate([-20, 60, 0]) rotate(90) nema17_spacer_top();