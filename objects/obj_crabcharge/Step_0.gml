/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	if (old_state != state)
	{
		old_state = state;
		state_time = 0;
	}
	else
	{
		state_time += 1;
	}
	
	x += lengthdir_x(spd,angle);
	y += lengthdir_y(spd,angle);
	
	switch(angle)
	{
		case 180:
			if(x < -size)
			{
				instance_destroy();	
			}
		break;
		case 0:
			if(x > room_width + size)
			{
				instance_destroy();	
			}
		break;
		case -90:
			if(y > room_height + size)
			{
				instance_destroy();	
			}
		break;
	}
	
	
}