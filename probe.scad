
module z_probe() {
	union() {
		translate([0, 0, 17]) cylinder(d=18.5, h=53);
		cylinder(d=15, h=70);
	}
}

module z_probe_mount() {
	difference() {
		union() {
			cube([15, 25, 10], center=true);
			translate([0, 0, 6]) minkowski() {
				cube([8, 18, 1], center=true);
				cylinder(r=2, h=1, center=true);
			}
		}
		translate([0, 5, 0]) cylinder(d=5, h=70, center=true);
		translate([0, -5, 0]) cylinder(d=5, h=70, center=true);
	}
}

module z_probe_holder() {
	%translate([0, 0, 35]) rotate(180, [0,1,0]) z_probe();
	difference() {
		hull() {
			cylinder(d=28, h=6);
			translate([-28, -11, 0]) minkowski() {
				cube([14, 24, 5]);
				cylinder(r=1, h=1);
			}
		}
		translate([0, 0, -30]) z_probe();

		translate([-26, -9, 3]) minkowski() {
			cube([10, 20, 3]);
			cylinder(r=0.5, h=1);
		}

		#translate([-21, 6, -10]) cylinder(d=3.5, h=70);
		#translate([-21, -4, -10]) cylinder(d=3.5, h=70);
	}
}
