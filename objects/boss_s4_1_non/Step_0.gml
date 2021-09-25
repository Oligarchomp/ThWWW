/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			
		break;
		case 1:
			
		break;
		case 2:
			
		break;
		case 3:
			var middle_time = 60;
			
			var aim_spd_min = 6;
			var aim_spd_max = 8;
			var aim_ring = 30;
			var aim_row = 3;
			var aim_wait = 12;
			
			var ring_nbr = 30;
			var ring_wait = 12;
			var ring_dist = 360 / ring_nbr / 2;
			var ring_accel = 0.1;
			var ring_spd_shoot = 4;
			var ring_spd_final = 6;
			var ring_wait_move = 40;
		break;
	}
	
	switch(state)
	{
		case 0://shoot middle
			switch(state_time)
			{
				case 0:
					ring_angle = rng(360,true,7);
					ring_angle_ref = ring_angle;
				break;
				case middle_time:
					state = 1;
					boss_movement_goto(room_width / 2 - 120 * dir_act,80,3);
					dir_act *= -1;
				break;
			}
			if(state_time % ring_wait == 0)
			{
				shoot_ring(DAN_STARSMALL,6,ring_nbr,obj_boss.x,obj_boss.y,ring_angle_ref + ring_angle,ring_spd_shoot,sfx_shot3,2);
				ring_angle += ring_dist * dir_act;
			}
			
		break;
		case 1:
			if(obj_boss.in_position)
			{
				state = 2;
			}
		break;
		case 2:
			if(state_time % ring_wait == 0)
			{
				shoot_ring(DAN_STARSMALL,6,ring_nbr,obj_boss.x,obj_boss.y,ring_angle_ref + ring_angle,ring_spd_shoot,sfx_shot3,2);
				ring_angle += ring_dist * dir_act;
			}
			
			if(state_time == 30)
			{
				state = 3;
				boss_movement_goto(room_width / 2,100,3);
			}
		break;
		case 3:
			if(obj_boss.in_position)
			{
				state = 0;
			}
		break;
		
	}
	if(state >= 1) and (state <= 3)
	{
		if(step % aim_wait == 0)
		{
			shoot_ring_row(DAN_STARBIG,2,aim_ring,aim_row,obj_boss.x,obj_boss.y,999,aim_spd_min,aim_spd_max,sfx_shot2,3);	
		}
	}
	
	with(obj_danmaku2)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,ring_accel)
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1:
				if(state_time == ring_wait_move)
				{
					state = 2;
				}
			break;
			case 2:
				spd = goto_value(spd,ring_spd_final,ring_accel);
			break;
		}
		
	}
	
	
	
}
// Inherit the parent event
event_inherited();

