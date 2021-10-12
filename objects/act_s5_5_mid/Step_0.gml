/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var wave_lenght = 70;
			var ring_wait = 12;
			var ring_nbr = 39;
			var ring_spd = 3;
			var ring_spd_redirect = 2;
			
			var aim_dan = DAN_MENTOS;
			var aim_wait = 16;
			var aim_spd = 3.5;
			var aim_arc = 0;
			var aim_dist = 23;
		break;
		case 1:
			var wave_lenght = 70;
			var ring_wait = 12;
			var ring_nbr = 55;
			var ring_spd = 3.6;
			var ring_spd_redirect = 2.3;
			
			var aim_dan = DAN_MENTOS;
			var aim_wait = 16;
			var aim_spd = 3.5;
			var aim_arc = 3;
			var aim_dist = 23;
		break;
		case 2:
			var wave_lenght = 70;
			var ring_wait = 10;
			var ring_nbr = 64;
			var ring_spd = 4;
			var ring_spd_redirect = 2.5;
			
			var aim_dan = DAN_BUBBLE;
			var aim_wait = 14;
			var aim_spd = 3.5;
			var aim_arc = 5;
			var aim_dist = 20;
		break;
		case 3:
			var wave_lenght = 70;
			var ring_wait = 10;
			var ring_nbr = 69;
			var ring_spd = 4.5;
			var ring_spd_redirect = 2.8;
			
			var aim_dan = DAN_BUBBLE;
			var aim_wait = 12;
			var aim_spd = 4;
			var aim_arc = 5;
			var aim_dist = 17;
		break;
	}
	
	
	switch(state)
	{
		case 0:
			if(state_time == 0)
			{
				x_aim = obj_player.x;
				y_aim = obj_player.y;
			}
			if(state_time < wave_lenght)
			{
				if(state_time % ring_wait == 0)
				{
					var aim = find_angle(obj_boss.x,obj_boss.y,x_aim,y_aim);
					shoot_ring(DAN_ARROW,7,ring_nbr,obj_boss.x,obj_boss.y,aim,ring_spd,sfx_shot2,5);
				}
			}
			else
			{
				state = 1;
				boss_movement_random(10,5,3);
			}
		break;
		case 1:
			if(obj_boss.in_position)
			{
				state = 2;
				x_aim = obj_player.x;
				y_aim = obj_player.y;
			}
		break;
		case 2:
			if(state_time < wave_lenght)
			{
				if(state_time % aim_wait == 0)
				{
					var aim = find_angle(obj_boss.x,obj_boss.y,x_aim,y_aim);
					shoot_arc(aim_dan,3,aim_arc,obj_boss.x,obj_boss.y,aim,aim_dist,aim_spd,sfx_shot1,6);	
				}
			}
			else
			{
				state = 3;
			}
		break;
		case 3:
			if(state_time == 30)
			{
				state = 0;
			}
		break;
	}
	
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				var sq = 5;
				var found_wall = false;
				if (y < 480)
				{
					if(collision_rectangle(x - sq + hsp,y - sq ,x + sq + hsp,y + sq,obj_wall,false,true))
					{
						found_wall = true;
						angle = -angle + 180;
					}
				
					if (collision_rectangle(x - sq,y - sq + vsp,x + sq,y + sq + vsp,obj_wall,false,true))
					{
						found_wall = true;
						angle *= -1;
					}
				}
				
				if(found_wall)
				{
					state = 1;
					spd = ring_spd_redirect;
					color_id = 5;
				}
			break;
		}
	}
	
	
}
// Inherit the parent event
event_inherited();

