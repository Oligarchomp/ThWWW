/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var anchor_nbr = 8;
			var anchor_spd = 6;
			
			var mentos_wait = 7;
			var mentos_spd_final = 1.6;
			var mentos_accel = 0.015;
			var mentos_angle_plus = 30;
			
			var arc_nbr = 7;
			var arc_row = 2;
			var arc_spd_min = 0.6;
			var arc_spd_max = 1.6;
			
			var wave_wait = 200;
		break;
		case 1:
			var anchor_nbr = 10;
			var anchor_spd = 6;
			
			var mentos_wait = 6;
			var mentos_spd_final = 1.8;
			var mentos_accel = 0.015;
			var mentos_angle_plus = 20;
			
			var arc_nbr = 9;
			var arc_row = 2;
			var arc_spd_min = 0.8;
			var arc_spd_max = 1.7;
			
			var wave_wait = 180;
		break;
		case 2:
			var anchor_nbr = 11;
			var anchor_spd = 6;
			
			var mentos_wait = 5;
			var mentos_spd_final = 1.8;
			var mentos_accel = 0.015;
			var mentos_angle_plus = 20;
			
			var arc_nbr = 11;
			var arc_row = 2;
			var arc_spd_min = 0.9;
			var arc_spd_max = 1.8;
			
			var wave_wait = 160;
		break;
		case 3:
			var anchor_nbr = 12;
			var anchor_spd = 6;
			
			var mentos_wait = 4;
			var mentos_spd_final = 1.8;
			var mentos_accel = 0.015;
			var mentos_angle_plus = 20;
		
			
			var arc_nbr = 12;
			var arc_row = 2;
			var arc_spd_min = 0.9;
			var arc_spd_max = 1.8;
			
			var wave_wait = 150;
		break;
	}
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					play_sound(sfx_boss_charge,1,false);
					
					switch(global.difficulty)
					{
						case 0:
						case 1:
							var aim = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y) + 180 / anchor_nbr;
						break;
						case 2:
						case 3:
							var aim = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y);
						break;
					}
					
					for(var i = 0; i < 360; i += 360 / anchor_nbr)
					{
						var ang = !global.rng_patch ? i + aim : rng(360,false,1);
						
						boss_charge_row(obj_boss.x,obj_boss.y,ang,9,31,3)
						array_push(angle_charge,ang);
					}
					
				break;
				case 30:
					mentos_angle_start = rng(360,false,4);
					boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
					
					for(var i = 0; i < array_length(angle_charge); i += 1)
					{
						var inst = shoot(DAN_ANCHOR,1,obj_boss.x,obj_boss.y,angle_charge[i],anchor_spd,sfx_spawn_light,3);
						inst.angle = angle_charge[i]; //for rng patch
						
						inst.is_cancelable = false;
						inst.angle_mentos = mentos_angle_start;
						mentos_angle_start += 360 / anchor_nbr;
						inst.dan_dir = act_dir;
					}
					
					angle_charge = [];
					
					state = 1;
				break;
			}
		break;
		case 1:
			if(state_time == 200)
			{
				state = 2;
			}
		break;
		case 2:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 30:
					with(obj_danmaku3)
					{
						state = 2;	
					}
					with(obj_danmaku4)
					{
						state = 1;
						pos_type = POS_ANGLE;
					}
					
					play_sound(sfx_redirect1,1,false);
					
					boss_movement_random(2,3,2);
				break;
				case wave_wait:
					state = 0;
					act_dir *= -1;
				break;
			}
		break;
		
	}
	
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				var sq = 10;
				var found_wall = false;
				
				
				if(collision_rectangle(x - sq + hsp,y - sq ,x + sq + hsp,y + sq,obj_wall,false,true))
				{
					found_wall = true;
					screen_shake(floor(spd / 1.3),0);
				}
				
				if (collision_rectangle(x - sq,y - sq + vsp,x + sq,y + sq + vsp,obj_wall,false,true))
				{
					found_wall = true;
					screen_shake(0,floor(spd / 1.3));
				}
				
				
				if(found_wall)
				{
					play_sound(sfx_shock,1,false);
					state = 1;
					spd = 0;
					
					var n = 0;
					for(var i = arc_spd_min; i < arc_spd_max; i += (arc_spd_max - arc_spd_min) / arc_row)
					{
						shoot_ring(DAN_MENTOS,1,arc_nbr,x,y,angle + n * 180 / arc_nbr,i,noone,2)
						n += 1;
						n %= 2;
					}
				}
				
				if(state_time % mentos_wait == 0)
				{
					var inst = shoot(DAN_MENTOS,7,x,y,angle_mentos,0,noone,4);
					inst.angle_ref = angle + 180;
					inst.dist_ref = sqrt(sqr(inst.x - x) + sqr(inst.y - y));
					inst.is_cancelable = false;
					
					angle_mentos += mentos_angle_plus * dan_dir;
				}
			break;
			case 2:
				spd = goto_value(spd,5,0.1);
			break;
			
		}
	}
	//mentos
	with(obj_danmaku4)
	{
		switch(state)
		{
			case 1:	
				spd = goto_value(spd,mentos_spd_final,mentos_accel);
			break;
		}
	}
}

// Inherit the parent event
event_inherited();

