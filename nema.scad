
include <MCAD/constants.scad>

n17sz = 1.7 * mm_per_inch;
n17sz_bounds = n17sz + 8;
n17mo = (n17sz - 31) / 2;

module nema17() {
	cube([n17sz, n17sz, 34]);
	translate([n17sz/2, n17sz/2, 33]) cylinder(d=23, h=25);

	translate([n17mo, n17mo, 33]) cylinder(d=3, h=5);
	translate([n17mo, n17mo + 31, 33]) cylinder(d=3, h=5);
	translate([n17mo + 31, n17mo, 33]) cylinder(d=3, h=5);
	translate([n17mo + 31, n17mo + 31, 33]) cylinder(d=3.5, h=5);
}

module nema17_hole() {
	hull() {
		cylinder(d=3.5, h=5);
		translate([0, -3, 0]) cylinder(d=3.5, h=5);
	}
}

module nema17_mount() {
	translate([n17mo, n17mo + 1.5, 33]) nema17_hole();
	translate([n17mo, n17mo + 32.5, 33]) nema17_hole();
	translate([n17mo + 31, n17mo + 1.5, 33]) nema17_hole();
	translate([n17mo + 31, n17mo + 32.5, 33]) nema17_hole();
}

module nema17_spacer() {
	difference() {
		cube([n17sz_bounds, n17sz_bounds/2, 2]);
		translate([n17sz_bounds/2, 10, -1]) rotate(45) minkowski() {
			cube([n17sz_bounds-10, n17sz_bounds-10, 3]);
			cylinder(r=5, h=1);
		}
	}
}

module nema17_spacer_top() {
	difference() {
		minkowski() {
			difference() {
				translate([2,0,0]) cube([n17sz_bounds-4, n17sz_bounds/2 - 4, 1]);
				translate([-1, 13, -1]) cube([n17sz_bounds+2, n17sz_bounds, 4]);
			}
			cylinder(r=2, h=1, center=true);
		}
		translate([n17sz_bounds/2, 10, -1]) rotate(45) minkowski() {
			cube([n17sz_bounds-10, n17sz_bounds-10, 3]);
			cylinder(r=5, h=1);
		}
		translate([4, 1, -35]) nema17_mount();
		%translate([4, 2, -35]) nema17();
	}
}

module nema17_rest() {
	difference() {
		union() {
			// bottom
			minkowski() {
				translate([2,0,0]) cube([n17sz_bounds-4, 1, 36]);
				cylinder(r=2, h=1);
			}

			// right
			translate([n17sz_bounds-3,0,0]) cube([3, n17sz_bounds*1.75, 37]);
			// left
			cube([3, n17sz_bounds*1.75, 37]);

			// face
			translate([0, 0, 35]) nema17_spacer();
		}

		%translate([4, 3, 0]) nema17();
		translate([4, 3, 0]) nema17_mount();

		translate([-5, 80, -15]) rotate(45, [1, 0, 0]) cube([75, 75, 75]);
	}
}
