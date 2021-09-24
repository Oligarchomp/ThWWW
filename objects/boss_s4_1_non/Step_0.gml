/// @description Insert description here
// You can write your code in this editor


if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var move_time = 100;
			var laser_nbr = 2;
			var laser_spd = 5;
			var laser_dist = 20;
			var laser_lenght = 1600;
			
			var ring_start = 130;
			var ring_nbr = 12;
			var ring_spd = 4;
			var ring_wait = 40;
			
			var aim_arc = 1;
			var aim_row = 2;
			var aim_spd_min = 3;
			var aim_spd_max = 4;
		break;
		case 1:
			var move_time = 90;
			var laser_nbr = 4;
			var laser_spd = 5;
			var laser_dist = 20;
			var laser_lenght = 1600;
			
			var ring_start = 130;
			var ring_nbr = 18;
			var ring_spd = 4;
			var ring_wait = 20;
			
			var aim_arc = 1;
			var aim_row = 4;
			var aim_spd_min = 3;
			var aim_spd_max = 5;
		break;
		case 2:
			var move_time = 80;
			var laser_nbr = 4;
			var laser_spd = 5;
			var laser_dist = 20;
			var laser_lenght = 1800;
			
			var ring_start = 120;
			var ring_nbr = 25;
			var ring_spd = 4;
			var ring_wait = 13;
			
			var aim_arc = 3;
			var aim_row = 4;
			var aim_spd_min = 3;
			var aim_spd_max = 5;
		break;
		case 3:
			var move_time = 70;
			var laser_nbr = 4;
			var laser_spd = 5;
			var laser_dist = 20;
			var laser_lenght = 1800;
			
			var ring_start = 120;
			var ring_nbr = 30;
			var ring_spd = 4;
			var ring_wait = 10;
			
			var aim_arc = 3;
			var aim_row = 5;
			var aim_spd_min = 3;
			var aim_spd_max = 6;
		break;
	}
	switch(state)
	{
		case 0:
			if(state_time == 0)
			{
				angle_laser = -90 + laser_lenght * dir_act;
			}
			
			if (angle_laser == -90)
			{
				state = 1;
				dir_act *= -1;
			}
		break;
		case 1:
			var move_time2 = move_time * 2;
			switch(state_time)
			{
				case 0:
					boss_movement_goto(room_width / 2 + 80 * dir_act, 80,3);
					shoot_arc_row(DAN_STARBIG,6,aim_arc,aim_row,obj_boss.x,obj_boss.y,999,40,aim_spd_min,aim_spd_max,sfx_redirect1,2);
				break;
				case move_time:
					boss_movement_goto(room_width/ 2, 100,3);
					shoot_arc_row(DAN_STARBIG,6,aim_arc,aim_row,obj_boss.x,obj_boss.y,999,40,aim_spd_min,aim_spd_max,sfx_redirect1,2);
				break;
				case move_time2:
					state = 0;
				break;
			}
			
		
		break;
	}
	
	
	if(step > ring_start)
	{
		if(step % ring_wait == 0)
		{
			shoot_ring(DAN_STARBIG,2,ring_nbr,obj_boss.x,obj_boss.y,rng(360,false,4),ring_spd,sfx_shot1,3);
		}
		
	}
	
	if(angle_laser != -90)
	{
		angle_laser = goto_value(angle_laser,-90,laser_dist);
		shoot_ring(DAN_STARSMALL,6,laser_nbr,obj_boss.x,obj_boss.y,angle_laser,laser_spd,sfx_shot3,1);
	}
}
// Inherit the parent event
event_inherited();

