/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(global.gp_active)
{
	for(var i = 0; i < ds_list_size(y_pos); i += 1)
	{
		y_pos[|i] += vsp * scale_list[|i];
		y_pos[|i] %= height * scale_list[|i];
	}
	
}