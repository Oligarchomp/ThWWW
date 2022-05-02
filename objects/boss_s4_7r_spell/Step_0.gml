/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var mentos_wait = 40;
			var mentos_nbr = 10;
			var mentos_spd = 2;
			
			var aim_arc = 3;
			var aim_row = 3;
			var aim_shoot_wait = 22;
			var aim_dist = 7;
			
			var aim_spd_min = 10;
			var aim_spd_max = 17;
			var aim_frame_stop = 25;
			var aim_redirect_wait = 50;
			var aim_redirect_spd = 4.5;
			var aim_redirect_deccel = 0.1;
			
			var aim_home_spd = 2.5;
			
			var aim_wave = 140;
			var aim_wave_wait = 55;
			
			var rock_nbr = 8;
			var rock_dist = 80;
			var rock_angle_accel = 0.15;
			var rock_angle_max = 10;
		break;
		case 1:
			var mentos_wait = 34;
			var mentos_nbr = 15;
			var mentos_spd = 2;
			
			var aim_arc = 3;
			var aim_row = 3;
			var aim_shoot_wait = 19;
			var aim_dist = 7;
			
			var aim_spd_min = 10;
			var aim_spd_max = 17;
			var aim_frame_stop = 25;
			var aim_redirect_wait = 50;
			var aim_redirect_spd = 4.5;
			var aim_redirect_deccel = 0.1;
			
			var aim_home_spd = 3;
			
			var aim_wave = 160;
			var aim_wave_wait = 45;
			
			var rock_nbr = 8;
			var rock_dist = 80;
			var rock_angle_accel = 0.15;
			var rock_angle_max = 15;
		break;
		case 2:
			var mentos_wait = 28;
			var mentos_nbr = 22;
			var mentos_spd = 2;
			
			var aim_arc = 3;
			var aim_row = 4;
			var aim_shoot_wait = 16;
			var aim_dist = 7;
			
			var aim_spd_min = 10;
			var aim_spd_max = 20;
			var aim_frame_stop = 25;
			var aim_redirect_wait = 50;
			var aim_redirect_spd = 5;
			var aim_redirect_deccel = 0.1;
			
			var aim_home_spd = 3;
			
			var aim_wave = 170;
			var aim_wave_wait = 40;
			
			var rock_nbr = 8;
			var rock_dist = 80;
			var rock_angle_accel = 0.15;
			var rock_angle_max = 17;
		break;
		case 3:
			var mentos_wait = 24;
			var mentos_nbr = 26;
			var mentos_spd = 2;
			
			var aim_arc = 3;
			var aim_row = 5;
			var aim_shoot_wait = 14;
			var aim_dist = 7;
			
			var aim_spd_min = 10;
			var aim_spd_max = 23;
			var aim_frame_stop = 25;
			var aim_redirect_wait = 50;
			var aim_redirect_spd = 5.5;
			var aim_redirect_deccel = 0.1;
			
			var aim_home_spd = 3;
			
			var aim_wave = 180;
			var aim_wave_wait = 33;
			
			var rock_nbr = 8;
			var rock_dist = 80;
			var rock_angle_accel = 0.15;
			var rock_angle_max = 20;
		break;
	}
	
	
	
	if(obj_boss.in_position)
	{
		boss_movement_goto(room_width / 2 + 70 * pos_dir,85,0.5);
		pos_dir *= -1;
	}
	if(step % mentos_wait == 0)
	{
		shoot_ring(DAN_STARBIG,7,mentos_nbr,obj_boss.x,obj_boss.y,rng(360,false,7),mentos_spd,sfx_shot2,7);
	}
	
	if(step == 0)
	{
		for(var i = 0; i < rock_nbr; i += 1 )
		{
			var inst = shoot(DAN_ROCK,6,obj_boss.x,obj_boss.y,0,0,sfx_spawn_light,8);
			
			inst.pos_type = POS_MANUAL;
			inst.ang = i * 360 / rock_nbr;
			inst.ang_spd = 0;
			inst.dist = 0;
			inst.rot = rng(360,false,4);
			inst.number = i ;
			inst.is_cancelable = false;
		}
	}
	
	switch(state)
	{
		case 0:
			if(state_time < aim_wave)
			{
				if(state_time % aim_shoot_wait == 0)
				{
					var rock_shoot = rock_id
					with(obj_danmaku8)
					{
						if(number == rock_shoot)
						{
							var aim = find_angle(x,y,obj_boss.x,obj_boss.y) - 90;
							shoot_arc_row(DAN_AMULET,6,aim_arc,aim_row,x,y,aim,aim_dist,aim_spd_min,aim_spd_max,sfx_shot1,6);
						}
					}
					rock_id += 1;
					rock_id %= rock_nbr;
				}
			}
			else
			{
				state = 1;
			}
		break;
		case 1:
			if(state_time == aim_wave_wait)
			{
				state = 0;
				rock_id = rng(rock_nbr,true,1);
			}
		break;
	}
	
	//rock
	with(obj_danmaku8)
	{
		dist += recursiv(dist,rock_dist,30,0.1);
		ang_spd = goto_value(ang_spd,rock_angle_max,rock_angle_accel);
		ang += ang_spd;
		
		x = obj_boss.x + lengthdir_x(dist,ang)
		y = obj_boss.y + lengthdir_y(dist,ang)
	}
	
	with(obj_danmaku6)
	{
		switch(state)
		{
			case 0:
				if(state_time == 0)
				{
					spd_ref = spd;
					y_offscreen = 30;
				}
				spd = goto_value(spd,0,spd_ref / aim_frame_stop);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1:
				if(state_time == aim_redirect_wait)
				{
					state = 2;
					angle = global.rng_patch ? rng(360,false,1) : find_angle(x,y,obj_player.x,obj_player.y);
					spd = aim_redirect_spd;
					color_id = 7;
				}
			break;
			case 2:
				spd = goto_value(spd,0,aim_redirect_deccel);
				if(spd == 0)
				{
					state = 3;
				}
			break;
			case 3:
				if(state_time == aim_redirect_wait)
				{
					state = 4;
					angle = global.rng_patch ? rng(360,false,1) : find_angle(x,y,obj_player.x,obj_player.y);
					spd = aim_home_spd;
					color_id = 0;
				}
			break;
		}
	}
	
	
}
// Inherit the parent event
event_inherited();

