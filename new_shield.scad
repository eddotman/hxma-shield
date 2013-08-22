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

//Offsets
upp_off_outer = [(bot_width_outer - upp_width_outer) / 2, (bot_depth_outer - upp_depth_outer) / 2, bot_height_outer];

//Render outer part of bottom
cube (bot_dim_outer); 

//Render outer part of upper
translate (upp_off_outer) cube (upp_dim_outer);