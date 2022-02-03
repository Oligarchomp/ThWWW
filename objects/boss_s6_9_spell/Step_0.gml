/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) 
{
	switch(spell_wait)
	{
		case 60:
		case 30:
			boss_charge(obj_boss.x,obj_boss.y);
		break;
		case 0:
			switch(global.difficulty)
			{
				case 0:
					var aim_ring = 32;
					var aim_row = 5;
					var aim_spd_min = 2.5;
					var aim_spd_max = 6;
				
					var mentos_wait = 10;
					var mentos_off = 90;
					var ball_wait = 10;
					var ball_off = 30;
					var bubble_wait = 40;
					var bubble_off = 100;
			
					var water_ring = 3;
					var water_spd_shoot_min = 5.5;
					var water_deccel = 0.1;
					var water_spd_min = 1.3;
					var water_dist = 2.1;
				break;
				case 1:
					var aim_ring = 38;
					var aim_row = 5;
					var aim_spd_min = 2.5;
					var aim_spd_max = 6;
				
					var mentos_wait = 6;
					var mentos_off = 90;
					var ball_wait = 6;
					var ball_off = 30;
					var bubble_wait = 22;
					var bubble_off = 100;
			
					var water_ring = 3;
					var water_spd_shoot_min = 5.5;
					var water_deccel = 0.1;
					var water_spd_min = 1.6;
					var water_dist = 2.1;
				break;
				case 2:
					var aim_ring = 40;
					var aim_row = 5;
					var aim_spd_min = 2.5;
					var aim_spd_max = 6;
				
					var mentos_wait = 5;
					var mentos_off = 90;
					var ball_wait = 5;
					var ball_off = 30;
					var bubble_wait = 16;
					var bubble_off = -60;
			
					var water_ring = 3;
					var water_spd_shoot_min = 5.5;
					var water_deccel = 0.1;
					var water_spd_min = 1.7;
					var water_dist = 2.1;
				break;
				case 3:
					var aim_ring = 44;
					var aim_row = 5;
					var aim_spd_min = 2.5;
					var aim_spd_max = 6;
				
					var mentos_wait = 4;
					var mentos_off = 90;
					var ball_wait = 4;
					var ball_off = 30;
					var bubble_wait = 13;
					var bubble_off = -60;
			
					var water_ring = 3;
					var water_spd_shoot_min = 12.5;
					var water_deccel = 0.5;
					var water_spd_min = 1.8;
					var water_dist = 2.1;
				break;
			}
			
			var anchor_wait = 110;
			var anchor_nbr = 13;
			var anchor_accel = 0.05;
			var anchor_spd_max = 5;
			
			if(step == 0)
			{
				boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
				shoot_ring_row(DAN_BUBBLE,1,aim_ring,aim_row,obj_boss.x,obj_boss.y,90,aim_spd_min,aim_spd_max,noone,8);
				with(obj_danmaku8)
				{
					state = 999;	
				}
			}
	
			switch(state)
			{
				case 2: // phase 3
					if(timeout_phase)
					{
						if(timeout_time % anchor_wait == 0)
						{
							shoot_ring(DAN_ANCHOR,1,anchor_nbr,obj_boss.x,obj_boss.y,999,0,sfx_spawn_light,1);
							with(obj_danmaku1)
							{
								state = 100;
								is_cancelable = false;
							}
						}
						timeout_time += 1;
					}
				
				
					if(step % bubble_wait == 0)
					{
						for(var i = 0; i < 360; i += 360 / water_ring)
						{
							var ang = water_angle + i;
							var inst = shoot(DAN_BUBBLE,1,obj_boss.x,obj_boss.y,ang,water_spd_shoot_min,sfx_redirect1,6);
							inst.spd_to = water_spd_min;
							inst.ang_plus = bubble_off;
							inst.is_cancelable = false;
			
							var inst = shoot(DAN_BUBBLE,2,obj_boss.x,obj_boss.y,-ang - 360 / water_ring,water_spd_shoot_min,sfx_redirect1,7);
							inst.spd_to = water_spd_min;
							inst.ang_plus = -bubble_off;
							inst.is_cancelable = false;
						}
					}
				case 1: // phase 2
					if(step % ball_wait == 0)
					{
						for(var i = 0; i < 360; i += 360 / water_ring)
						{
							var ang = water_angle + i;
							var inst = shoot(DAN_BALL,1,obj_boss.x,obj_boss.y,ang,water_spd_shoot_min,sfx_shot2,2);
							inst.spd_to = water_spd_min;
							inst.ang_plus = ball_off;
							inst.is_cancelable = false;
			
							var inst = shoot(DAN_BALL,2,obj_boss.x,obj_boss.y,-ang - 360 / water_ring,water_spd_shoot_min,sfx_redirect1,3);
							inst.spd_to = water_spd_min;
							inst.ang_plus = -ball_off;
							inst.is_cancelable = false;
						}
					}
				//no break;
				case 0://phase 1
					if(step % mentos_wait == 0)
					{
						for(var i = 0; i < 360; i += 360 / water_ring)
						{
							var ang = water_angle + i;
							var inst = shoot(DAN_MENTOS,1,obj_boss.x,obj_boss.y,ang,water_spd_shoot_min,sfx_shot2,4);
							inst.spd_to = water_spd_min;
							inst.ang_plus = mentos_off;
							inst.is_cancelable = false;
			
							var inst = shoot(DAN_MENTOS,2,obj_boss.x,obj_boss.y,-ang - 360 / water_ring,water_spd_shoot_min,sfx_redirect1,5);
							inst.spd_to = water_spd_min;
							inst.ang_plus = -mentos_off;
							inst.is_cancelable = false;
						}
					}
				break;
			}
	
			with(obj_danmaku)
			{
				switch(state)
				{
					case 0:
						spd = goto_value(spd,0,water_deccel);
						if(spd == 0)
						{
							state = 1;
							angle -= ang_plus
							spd = spd_to;
						}
					break;
					case 100://anchor
						spd = goto_value(spd,anchor_spd_max,anchor_accel);
					break;
				}
			}
			
			
			if(keyboard_check_pressed(vk_control)) and (global.debug)
			{
				life_left -= 600;	
			}
	
			water_angle += water_dist;
	
			switch(state)
			{
				case 0:
					if(life_left < 3000)
					{
						state = 1;
						boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
					}
				break;
				case 1:
					if(life_left < 1800)
					{
						state = 2;
						boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
					}
				break;
			}
			
			if(time_left < timeout_start) and (!timeout_phase)
			{
				state = 2;
				timeout_phase = true;
				boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
				play_sound(sfx_boat,1,false);
			}
	
			if(obj_player.bomb_time != 0)
			{
				if(can_shield)
				{
					obj_boss.alpha = 0.4;
					obj_boss.mask_index = spr_nothing;
					can_shield = false;
					instance_create_depth(obj_boss.x,obj_boss.y,obj_boss.depth - 1, obj_shield_nua);
				}
			}
			else
			{
				obj_boss.alpha = 1;
				obj_boss.mask_index = spr_boss_hurtbox;
				can_shield = true;
				with(obj_shield_nua)
				{
					state = 1;	
				}
			}
		break;
	}
}

// Inherit the parent event
event_inherited();

