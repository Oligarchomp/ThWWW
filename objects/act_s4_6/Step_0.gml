/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var shot_spd_min = 1.5;
			var shot_spd_max = 3.5;
			var shot_ring = 12;
			var shot_row = 1;
		break;
		case 1:
			var shot_spd_min = 1.5;
			var shot_spd_max = 3.8;
			var shot_ring = 18;
			var shot_row = 3;
		break;
		case 2:
			var shot_spd_min = 1.5;
			var shot_spd_max = 4;
			var shot_ring = 19;
			var shot_row = 4;
		break;
		case 3:
			var shot_spd_min = 1.5;
			var shot_spd_max = 4;
			var shot_ring = 22;
			var shot_row = 5;
		break;
	}
	var fairy_wait = 40;
	var fairy_life = 30;
	var fairy_lenght = 1300;
	var fairy_dist = 101;
	
	if(instance_exists(obj_boss))
	{
		wait_time = 90;
	}
	
	if(wait_time > 0)
	{
		wait_time -= 1;
	}
	
	if(step < fairy_lenght)
	{
		if (step % fairy_wait == 0)
		{
			if(x_spawn + fairy_dist * spawn_dir > room_width) or (x_spawn + fairy_dist * spawn_dir < 0)
			{
				spawn_dir *= -1;
			}
			x_spawn += fairy_dist * spawn_dir; 
			
			if(wait_time == 0)
			{
				create_enemy(EN_RED,x_spawn,-20,fairy_life,5,6,-90);
			}
		}
	}
		
	with(obj_enemy5)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot aim
				state = 2;
				shoot_ring_row(DAN_BALL,6,shot_ring,shot_row,x,y,999,shot_spd_min,shot_spd_max,sfx_redirect1,4);
				shoot_ring(DAN_BUBBLE,6,shot_ring,x,y,999,shot_spd_max,noone,3);
			break;
			case 2:
				if(state_time == 30)
				{
					state = 3;
					angle = -90;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.04);
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

