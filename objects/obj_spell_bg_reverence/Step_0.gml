/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	for(var i = 0; i < array_length(x_list); i += 1)
	{
		x_list[i] += hsp_list[i];
		x_list[i] %= width;
		
		y_list[i] += vsp_list[i];
		y_list[i] %= height;
	}
	
}

// Inherit the parent event
event_inherited();
	

