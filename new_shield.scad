/* HXMA Monochromator Shield */
/* Design by Edward Kim */

//Define dimensions (mm)
//Assume view from beam's POV
bot_width_outer = 173.5;
bot_depth_outer = 146.5;
bot_height_outer = 29.0;
bot_dim_outer = [bot_width_outer, bot_depth_outer, bot_height_outer];

upp_width_outer = 173.5;
upp_depth_outer = 205.0;
upp_height_outer = 103.0;
upp_dim_outer = [upp_width_outer, upp_depth_outer, upp_height_outer];

mount_off_h = 10.0;
mount_off_w = 30.0;

mount_r = 1.6;
mount_h = 2.0;
mount_ang = 90;
mount_ax = [1, 0, 0];

crys_op = [35, 100, 1.0];

wall_th = 0.5;

//Offsets
upp_off_outer = [(bot_width_outer - upp_width_outer) / 2, (bot_depth_outer - upp_depth_outer) / 2, bot_height_outer];
crys1_op_off = [42, 18, -0.25];
crys2_op_off = [42 + crys_op[0] + 24, 18, -0.25];

//Subtract inner areas of lower shield
difference() {
	//Render outer part of bottom
	cube (bot_dim_outer); 

	//Hollow out centre
	translate ([wall_th, wall_th, wall_th]) cube([bot_width_outer - 2*wall_th, bot_depth_outer - 2*wall_th, bot_height_outer]);

	//Crystal openings
	translate (crys1_op_off) cube (crys_op);
	translate (crys2_op_off) cube (crys_op);
}

//Subtract inner areas of upper shield
difference() {
	//Render outer part of upper
	translate (upp_off_outer) cube (upp_dim_outer);	

	//Hollow out centre
	translate ([upp_off_outer[0] + wall_th, upp_off_outer[1] + wall_th, upp_off_outer[2] + wall_th]) cube([upp_width_outer - 2*wall_th, upp_depth_outer - 2*wall_th, upp_height_outer + 2*wall_th]);
	translate ([wall_th, wall_th, wall_th]) cube([bot_width_outer - 2*wall_th, bot_depth_outer - 2*wall_th, bot_height_outer + 2*wall_th]);

	
	//Subtract mounting holes
	for (i = [1 : 5]) {
		translate ([upp_off_outer[0]  + mount_off_w * i, upp_off_outer[1], upp_off_outer[2] + upp_height_outer - mount_off_h]) rotate (a=mount_ang, v=mount_ax) cylinder (r=mount_r, h=mount_h, center=true, $fn=100);
		translate ([upp_off_outer[0]  + mount_off_w * i, upp_off_outer[1] + upp_depth_outer, upp_off_outer[2] + upp_height_outer - mount_off_h]) rotate (a=mount_ang, v=mount_ax) cylinder (r=mount_r, h=mount_h, center=true, $fn=100);
	}
}


