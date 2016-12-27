
module e3d_extruder_mount() {
	% cube([46, 44, 35]);

	// bottom, opposite hotend
	translate([3.5, 6, 0]) boltHole(3, length=50);

	// bottom, hotend
	translate([41.5, 5.5, 0]) boltHole(3, length=50);

	// top, opposite hotend
	translate([41.5, 36.5, 0]) boltHole(3, length=50);

	// top, hotend (hobb hole)
	translate([10, 37, 0]) cylinder(d=6, h=100, center=true);

	// center hole
	translate([26, 21, 0]) cylinder(d=7, h=100, center=true);
}