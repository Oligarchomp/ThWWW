/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(global.gp_active)
{
	x += hsp;
	x %= width;
	
	for(var i = 0; i < tide_row; i += 1)
	{
		time_list[i] += 1;
	}
	
	x_rain += r_hsp;
	x_rain %= r_width;
	
	y_rain += r_vsp;
	y_rain %= r_height;
	
	x_rain2 += r_hsp * rain_mult;
	x_rain2 %= r_width;
	
	y_rain2 += r_vsp * rain_mult;
	y_rain2 %= r_height;
}