/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	var bubble_nbr = 5;
	var bubble_wait = 6;
	var bubble_start = 0;
	var bubble_spd_final = 2.3;
	var bubble_accel = 0.05;
	var bubble_spd_div = 1.6;
	
	var ball_nbr = 18;
	var ball_wait = 8;
	var ball_start = 0;
	var ball_spd_final = 3.4;
	var ball_accel = 0.1;
	
		
	var pale_y_off = 200;
	var pale_x_off = 120;
	var pale_spd = 7;
	switch(state)
	{
		case 1:
			if(state_time == 0)
			{
				boss_movement_goto(room_width + pale_x_off, obj_boss.y + pale_y_off ,pale_spd);
			}
			if(obj_boss.x > room_width + pale_x_off - 10 * wave - 1)
			{
				state = 0;
				obj_boss.y -= pale_y_off;
				wave += 1;
			}
			with(obj_boss)
			{
				dir = dir_max;
			}
		break;
		case 0:
			if(state_time == 0)
			{
				boss_movement_goto(-pale_x_off, obj_boss.y + pale_y_off,pale_spd);
			}
			if(obj_boss.x < -pale_x_off + 10 * wave + 1)
			{
				state = 1;
				obj_boss.y -= pale_y_off;
				wave += 1;
			}
			with(obj_boss)
			{
				dir = dir_max;
			}
		break;
	}
	
	if(state != 2)
	{
		if(obj_boss.x < room_width) and (obj_boss.x > 0)
		{
			var aim = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y);
			
			if(step % bubble_wait == 0)
			{
				for(var i = 0; i < 360; i += 360 / bubble_nbr)
				{
					var inst = shoot(DAN_BUBBLE,4,obj_boss.x,obj_boss.y,aim + i,0,sfx_redirect1,6);
					inst.spd_to = bubble_spd_final;
					
					var inst = shoot(DAN_BUBBLE,4,obj_boss.x,obj_boss.y,aim + i + 180 / bubble_nbr,0,sfx_redirect1,6);
					inst.spd_to = bubble_spd_final / bubble_spd_div;
				}
				
			}
			
			if(step % ball_wait == 0)
			{
				for(var i = 0; i < 360; i += 360 / ball_nbr)
				{
					var inst = shoot(DAN_MENTOS,3,obj_boss.x,obj_boss.y,aim + i,0,sfx_shot1,5);
					inst.spd_to = ball_spd_final;
					
					//var inst = shoot(DAN_BALL,3,obj_boss.x,obj_boss.y,aim + i + 180 / ball_nbr,0,sfx_shot1,5);
					//inst.spd_to = ball_spd_final / ball_spd_div;
				}
			}
		}
	}
	
	if(wave == 7)
	{
		wave = -1;
		state = 2;
		with(obj_boss)
		{
			instance_destroy();
		}
		
	}
	
	with(obj_danmaku6)
	{
		if(step > bubble_start)
		{
			spd = goto_value(spd,spd_to,bubble_accel);	
		}
	}

	with(obj_danmaku5)
	{
		if(step > ball_start)
		{
			spd = goto_value(spd,spd_to,ball_accel);	
		}
	}
	
	
}

// Inherit the parent event
event_inherited();

