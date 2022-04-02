/// @description Insert description here
// You can write your code in this editor


if (global.debug) and (room == room_gp)
{
	
	draw_set_font(font_info);
	draw_text(0,40,"Objects:")
	draw_text(92,40,instance_number(all));
	
	draw_text(600,20,global.dps_draw);
}
