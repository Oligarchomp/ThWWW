/// @description Insert description here
// You can write your code in this editor
if (global.debug)
{
	if (keyboard_check(vk_space))
	{
		room_speed = 300;
	}
	else
	{
		room_speed = 60;
	}
	
	if(room = room_gp)
	{
		if(global.time % 60 == 0)
		{
			global.dps_draw = global.dps;
			global.dps = 0;
		}
	}
}