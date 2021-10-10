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
			
			var arrow_size = 2;
			var arrow_spd = 2;
			
			var ring_nbr = 4;
			var ring_spd_min = 1.2;
			var ring_spd_max = 1.5;
			var ring_accel = 0.05;
			
			var fill_ring = 8;
			var fill_spd = 3.5;
			var fill_wait = 45;
			
			var wave_wait = 150;
		break;
		case 1:
			var aim_arc = 3;
			var aim_spd = 3.3;
			var aim_dist = 35;
			
			var arrow_size = 2;
			var arrow_spd = 3;
			
			var ring_nbr = 7;
			var ring_spd_min = 1.2;
			var ring_spd_max = 1.5;
			var ring_accel = 0.05;
			
			var fill_ring = 11;
			var fill_spd = 4;
			var fill_wait = 39;
			
			var wave_wait = 150;
		break;
		case 2:
			var aim_arc = 5;
			var aim_spd = 3.6;
			var aim_dist = 29;
			
			var arrow_size = 3;
			var arrow_spd = 3.5;
			
			var ring_nbr = 8;
			var ring_spd_min = 1.2;
			var ring_spd_max = 1.5;
			var ring_accel = 0.05;
			
			var fill_ring = 15;
			var fill_spd = 4;
			var fill_wait = 34;
			
			var wave_wait = 150;
		break;
		case 3:
			var aim_arc = 7;
			var aim_spd = 3.6;
			var aim_dist = 22;
			
			var arrow_size = 4;
			var arrow_spd = 3.5;
			
			var ring_nbr = 9;
			var ring_spd_min = 1.2;
			var ring_spd_max = 1.5;
			var ring_accel = 0.03;
			
			var fill_ring = 20;
			var fill_spd = 4;
			var fill_wait = 30;
			
			var wave_wait = 150;
		break;
	}
	var boss_spd = 24;
	
	switch(state)
	{
		case 0:
			if(pos_step < ds_list_size(x_list))
			{
				boss_movement_goto(room_width / 2 + x_list[|pos_step] * dir_act,y_list[|pos_step],boss_spd);
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
			if(state_time % 2 == 0)
			{
				//shoot(DAN_BALL,1,obj_boss.x,obj_boss.y,0,0,noone,1);	
			}
			if(obj_boss.in_position)
			{
				state = 0;
				shoot_arc(DAN_ARROW,7,aim_arc,obj_boss.x,obj_boss.y,999,aim_dist,aim_spd,sfx_redirect2,5);
				shoot_ring(DAN_MENTOS,3,ring_nbr,obj_boss.x,obj_boss.y,999,0,sfx_shot1,6);
				shoot_ring(DAN_MENTOS,5,ring_nbr,obj_boss.x,obj_boss.y,998,0,sfx_shot1,6);
				
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
	
	with(obj_danmaku6)
	{
		switch(state)
		{
			case 1:
				if(color_id == 3)
				{
					spd = goto_value(spd,ring_spd_min,0.05);
				}
				else
				{
					spd = goto_value(spd,ring_spd_max,0.05);
				}
			break;
		}
	}
	
	
}
// Inherit the parent event
event_inherited();

