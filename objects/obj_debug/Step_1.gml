/// @description Insert description here
// You can write your code in this editor
if (global.debug)
{
	if(!global.gp_active)
	{
		if(keyboard_check_pressed(vk_rcontrol))
		{
			global.frame_advance = true;
			global.gp_active = true;
		}
	}
	else
	{
		if(global.frame_advance)
		{
			global.frame_advance = false;
			global.gp_active = false;
		}
		
	}
}