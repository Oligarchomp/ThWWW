/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_info);

if (global.debug)
{
	draw_text(0,40,"Objects:")
	draw_text(92,40,instance_number(all));
	
	draw_text(600,20,global.dps_draw);
}