/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var aim_arc = 1;
			var aim_spd = 3;
			var aim_dist = 0;
			
			var arrow_size = 5;
			var arrow_spd = 3;
			
			var ball_nbr = 4;
			var ball_spd = 0.8;
			var ball_accel = 0.03;
			
			var fill_ring = 8;
			var fill_spd = 2;
			var fill_wait = 45;
			
			var wave_wait = 150;
		break;
		case 1:
			var aim_arc = 3;
			var aim_spd = 3.3;
			var aim_dist = 35;
			
			var arrow_size = 5;
			var arrow_spd = 4;
			
			var ball_nbr = 9;
			var ball_spd = 0.9;
			var ball_accel = 0.03;
			
			var fill_ring = 11;
			var fill_spd = 2;
			var fill_wait = 39;
			
			var wave_wait = 150;
		break;
		case 2:
			var aim_arc = 5;
			var aim_spd = 3.6;
			var aim_dist = 29;
			
			var arrow_size = 5;
			var arrow_spd = 5;
			
			var ball_nbr = 16;
			var ball_spd = 1;
			var ball_accel = 0.03;
			
			var fill_ring = 15;
			var fill_spd = 2;
			var fill_wait = 34;
			
			var wave_wait = 150;
		break;
		case 3:
			var aim_arc = 7;
			var aim_spd = 3.6;
			var aim_dist = 22;
			
			var arrow_size = 5;
			var arrow_spd = 5;
			
			var ball_nbr = 20;
			var ball_spd = 1;
			var ball_accel = 0.03;
			
			var fill_ring = 22;
			var fill_spd = 2;
			var fill_wait = 30;
			
			var wave_wait = 150;
		break;
	}
	var boss_spd = 24;
	
	switch(state)
	{
		case 0:
			if(pos_step < array_length(x_list))
			{
				boss_movement_goto(room_width / 2 + x_list[pos_step] * dir_act,y_list[pos_step],boss_spd);
				pos_step += 1;
				state = 1;
				
			}
			else
			{
				boss_movement_goto(room_width / 2, 100, boss_spd);
				state = 2;	
			}
		break;
		case 1:
			if(obj_boss.in_position)
			{
				state = 0;
				
				var rand = rng(360,false,1);
				shoot_arc(DAN_ARROW,7,aim_arc,obj_boss.x,obj_boss.y,999,aim_dist,aim_spd,sfx_redirect2,4);
				
				shoot_ring(DAN_MENTOS,5,ball_nbr,obj_boss.x,obj_boss.y,rand,0,sfx_shot1,5);
				
				with(obj_danmaku5)
				{
					spawn_type = SPAWN_SCALE;	
				}

				
				var inst = shoot(DAN_ARROW,3,obj_boss.x,obj_boss.y,999,0,sfx_spawn_light,3);
				inst.spawn_type = SPAWN_SCALE;
				inst.image_xscale = arrow_size;
				inst.image_yscale = arrow_size;
				inst.x_offscreen *=  arrow_size;
				inst.y_offscreen *=  arrow_size;
			}
		break;
		case 2:
			if(obj_boss.in_position)
			{
				state = 3;
				boss_charge(obj_boss.x,obj_boss.y);
			}
		break;
		case 3:
			if(state_time == 40)
			{
				boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
				with(obj_danmaku6)
				{
					state = 1;	
				}
				with(obj_danmaku5)
				{
					state = 1;	
				}
				with(obj_danmaku3)
				{
					state = 1;	
				}
				
				state = 4;
			}
		break;
		case 4:
			if(state_time < wave_wait)
			{
				if(state_time % fill_wait == fill_wait - 1)
				{
					shoot_ring(DAN_BUBBLE,3,fill_ring,obj_boss.x,obj_boss.y,999,fill_spd,sfx_shot1,7);
				}
			}
			else
			{
				state = 5;
				pos_step = 0;
				dir_act *= -1;
			}
		break;
		case 5:
			switch(state_time)
			{
				case 80:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 110:
					state = 0;
				break;
			}
		break;
	}
	
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				angle = find_angle(x,y,obj_player.x,obj_player.y);
			break;
			case 1:
				spd = goto_value(spd,arrow_spd,0.1);
			break;
		}
	}
	

	
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 1:
				spd = goto_value(spd,ball_spd,ball_accel);	
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

