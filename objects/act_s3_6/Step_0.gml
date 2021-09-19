/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
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
			var angle_ball_spd = -8;
			var ball_start = 40;
			var ball_spd = 4;
			var ball_wait = 3;
			var ball_ring = 10;
			
			var bubble_nbr = 10;
			var bubble_start = ball_start;
			var bubble_spd = 3;
			var bubble_wait = 10;
		break;
	}
	
	
	var pale_y_off = 80;
	var pale_x_off = 120;
	var pale_spd = 7;
	switch(state)
	{
		case 0:
			if(state_time == 0)
			{
				boss_movement_goto(room_width + pale_x_off, obj_boss.y + pale_y_off ,pale_spd);
			}
			if(obj_boss.x > room_width + pale_x_off - 10 * wave - 1)
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
		case 1:
			if(state_time == 0)
			{
				boss_movement_goto(-pale_x_off, obj_boss.y + pale_y_off,pale_spd);
			}
			if(obj_boss.x < -pale_x_off + 10 * wave + 1)
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
	}
	
	if(state == 0) or (state == 1)
	{
		if(obj_boss.x < room_width) and (obj_boss.x > 0)
		{
			if(step % ball_wait == 0)
			{
				shoot_ring(DAN_BALL,3,ball_ring,obj_boss.x,obj_boss.y,angle_ball,0,sfx_shot3,2);
				angle_ball += angle_ball_spd * (state * 2 - 1);
			}
			
			if(step % bubble_wait == 0)
			{
				shoot_ring(DAN_BUBBLE,4,bubble_nbr,obj_boss.x,obj_boss.y,999,0,sfx_redirect2,3);
			}
		}
	}
	
	if(wave == 6)
	{
		wave = -1;
		state = 2;
		boss_movement_goto(room_width / 2, 100,pale_spd);
		
	}
	
	with(obj_danmaku2)
	{
		switch(state)
		{
			case 0:
				if(state_time == ball_start)
				{
					state = 1;
				}
			break;
			case 1:
				spd = goto_value(spd,ball_spd,0.1);
			break;
		}
	}
	
	//Bubble
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				if(state_time == bubble_start)
				{
					state = 1;
				}
			break;
			case 1:
				spd = goto_value(spd,bubble_spd,0.1);
			break;
		}
	}
	
	
	
	
	
	
}

// Inherit the parent event
event_inherited();

