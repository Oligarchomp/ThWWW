/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) 
{
	if (spell_wait == 0)
	{
		var marx_nbr = 14;
		var marx_wait = 7;
	
		var mentos_nbr = 9;
		var mentos_spd_shot = 5;
		var mentos_deccel = 0.2;
		var mentos_spd_final = 2.5;
		var mentos_accel = 0.02;
	
		var aim_ring = 10;
		var aim_spd = 4.5;
	
		var release_ring = 24;
		var release_row = 5;
		var release_spd_min = 2.7;
		var release_spd_max = 6;
	
		var charge = 160;
		var boss_accel = 0.3;
		var boss_spd_max = 4;
	
		if(act_dir == 1)
		{
			var col = 1;
		}
		else
		{
			var col = 6;
		}
	
		switch(state)
		{
			case 0:
				switch(state_time)
				{
					case 0:
						boss_charge(obj_boss.x,obj_boss.y);
					break;
					case 30:
						state = 1;
					break;
				}
			break;
			case 1:
				if(state_time % marx_wait == 0)
				{
					if(marx_wave < marx_nbr)
					{
						play_sound(sfx_spawn_light,1,false);
						obj_boss.x = rng(room_width,true,9);
						obj_boss.x_to = obj_boss.x;
						obj_boss.y = 100 - act_dir * 100 + rng(300,true,6);
						obj_boss.y_to = obj_boss.y;
					
						shoot_ring(DAN_MENTOS,col,mentos_nbr,obj_boss.x,obj_boss.y,rng(360,false,5),mentos_spd_shot,sfx_redirect1,5);
					
						shoot_ring(DAN_BUBBLE,col,aim_ring,obj_boss.x,obj_boss.y,999,aim_spd,noone,7);
					
						marx_wave += 1;
					}
					else
					{
						obj_boss.x = room_width / 2;
						obj_boss.x_to = obj_boss.x;
						obj_boss.y = room_height / 2 + 800 * act_dir;
						obj_boss.y_to = obj_boss.y;
						marx_wave = 0;
						state = 2;
					
					}
				}
			break;
			case 2:
				switch(state_time)
				{
					case 0:
						play_sound(sfx_boss_charge,1,false);
					break;
					case 30:
						play_sound(sfx_redirect1,1,false);
						with(obj_danmaku5)
						{
							state = 1;
						}
						state = 3;
					break;
				}
			break;
			case 3:
				if(state_time < charge)
				{
					if(state_time % floor(charge/ 3) == 1)
					{
						boss_charge(obj_boss.x,room_height / 2 + 250 * act_dir);
					}
				
					boss_spd = goto_value(boss_spd,sign(obj_player.x - obj_boss.x) * boss_spd_max,boss_accel);
				
					obj_boss.x += boss_spd;
					obj_boss.x_to = obj_boss.x;
				
					if(state_time % 2 == 0)
					{
						var ang = 90 * act_dir - 30 + rng(60,false,9);
						var inst = shoot(DAN_BUBBLE,col,obj_boss.x,room_height / 2 + 290 * act_dir,ang,1.45,noone,8);
						inst.pos_type = POS_SP;
						inst.y_grav_accel = 0.05 * act_dir;
						inst.y_grav_max = 6;	
						inst.spawn_type = SPAWN_SCALE;
				
						var inst = shoot(DAN_BALL,col,obj_boss.x,room_height / 2 + 262 * act_dir,ang,1.45,noone,2);
						inst.pos_type = POS_SP;
						inst.y_grav_accel = 0.05 * act_dir;
						inst.y_grav_max = 6;	
						inst.spawn_type = SPAWN_SCALE;
					}
				}
				else
				{
					obj_boss.y = room_height / 2 + 400 * act_dir;
				
					boss_release(obj_boss.x,room_height / 2 + 250 * act_dir,sfx_boss_release);
				
					var aim = rng(360,false,1);
					for(var i = release_spd_min; i < release_spd_max; i += (release_spd_max - release_spd_min) / release_row)
					{
						shoot_ring(DAN_BUBBLE,col,release_ring,obj_boss.x,room_height / 2 + 250 * act_dir,aim,i,noone,8);
						shoot_ring(DAN_MENTOS,col,release_ring,obj_boss.x,room_height / 2 + 250 * act_dir,aim + 180 / release_ring,i,noone,7);
						aim += 180 / release_ring;
					}
				
					boss_movement_goto(obj_boss.x,obj_boss.y - 230 * act_dir,10);
					state = 4;
				
				}
			break;
			case 4:
				if(state_time == 120)
				{
					state = 0;
					act_dir *= -1;
				}
			break;
		}
	
	
	
		with(obj_danmaku5)
		{
			switch(state)
			{
				case 0:
					spd = goto_value(spd,0,mentos_deccel);
				break;
				case 1:
					spd = goto_value(spd,mentos_spd_final,mentos_accel);
				break;
			}
		}
	}
	
	
	
	
	//SHIELD
	if(obj_player.bomb_time != 0)
	{
		if(can_shield)
		{
			obj_boss.alpha = 0.4;
			obj_boss.mask_index = spr_nothing;
			can_shield = false;
			instance_create_depth(obj_boss.x,obj_boss.y,obj_boss.depth - 1, obj_shield_reverence);
		}
	}
	else
	{
		obj_boss.alpha = 1;
		obj_boss.mask_index = spr_boss_hurtbox;
		can_shield = true;
		with(obj_shield_reverence)
		{
			state = 1;	
		}
	}
	
}

// Inherit the parent event
event_inherited();

