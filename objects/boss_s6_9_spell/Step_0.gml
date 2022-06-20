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
					var aim_ring = 26;
					var aim_row = 5;
					var aim_spd_min = 1.5;
					var aim_spd_max = 5;
				
					var mentos_wait = 14;
					var mentos_off = 90;
					var ball_wait = 14;
					var ball_off = 65;

			
					var water_ring = 3;
					var water_spd_shoot_min = 5.5;
					var water_deccel = 0.1;
					var water_spd_min = 1.05;
					var water_dist = 3.1;
					
					var anchor_wait = 184; // must be even
					var anchor_nbr = 10;
					var anchor_accel = 0.03;
					var anchor_spd_max = 5;
				break;
				case 1:
					var aim_ring = 34;
					var aim_row = 5;
					var aim_spd_min = 1.8;
					var aim_spd_max = 5.8;
				
					var mentos_wait = 9;
					var mentos_off = 90;
					var ball_wait = 9;
					var ball_off = 75;
			
					var water_ring = 3;
					var water_spd_shoot_min = 5.5;
					var water_deccel = 0.1;
					var water_spd_min = 1.1;
					var water_dist = 1.95;
					
					var anchor_wait = 150; // must be even
					var anchor_nbr = 12;
					var anchor_accel = 0.03;
					var anchor_spd_max = 5.5;
				break;
				case 2:
					var aim_ring = 40;
					var aim_row = 5;
					var aim_spd_min = 2;
					var aim_spd_max = 6;
				
					var mentos_wait = 7;
					var mentos_off = 85;
					var ball_wait = 7;
					var ball_off = 85 + 26; // 30
			
					var water_ring = 3;
					var water_spd_shoot_min = 5.5;
					var water_deccel = 0.1;
					var water_spd_min = 1.2;
					var water_dist = 2.05;
					
					var anchor_wait = 130; // must be even
					var anchor_nbr = 14;
					var anchor_accel = 0.03;
					var anchor_spd_max = 5.5;
				break;
				case 3:
					var aim_ring = 44;
					var aim_row = 5;
					var aim_spd_min = 2;
					var aim_spd_max = 6;
				
					var mentos_wait = 5;
					var mentos_off = 90;
					var ball_wait = 5;
					var ball_off = 90 - 14; // 33
			
					var water_ring = 3;
					var water_spd_shoot_min = 12.5;
					var water_deccel = 0.5;
					var water_spd_min = 1.3;
					var water_dist = 2.1;
					
					var anchor_wait = 110; // must be even
					var anchor_nbr = 15;
					var anchor_accel = 0.03;
					var anchor_spd_max = 5.5;
				break;
			}
			
			
			
			if(step == 0)
			{
				boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
				var aimm = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y) + 180;
				shoot_ring_row(DAN_BUBBLE,1,aim_ring,aim_row,obj_boss.x,obj_boss.y,aimm,aim_spd_min,aim_spd_max,noone,8);
				with(obj_danmaku8)
				{
					state = 999;
					is_cancelable = false;
				}
			}
	
			switch(state)
			{
				case 2: // phase 3
				
					if(anchor_time % anchor_wait == 0) or (timeout_phase and anchor_time % (anchor_wait / 2) == 0)
					{
						shoot_ring(DAN_ANCHOR,1,anchor_nbr,obj_boss.x,obj_boss.y,999,0,sfx_spawn_light,8);
						
						with(obj_danmaku8)
						{
							if(state == 0)
							{
								state = 99;
							}
							is_cancelable = false;
						}
					}
					
					anchor_time += 1;
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
							angle -= global.rng_patch ? rng(360,false,1) : ang_plus
							spd = spd_to;
						}
					break;
					case 99: //anchor_spawn
						state += 1;
						is_cancelable = false;
						
						boss_charge_row(obj_boss.x,obj_boss.y,angle,9,31,3)
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
		break;
	}
	
	//shield
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
}

// Inherit the parent event
event_inherited();

