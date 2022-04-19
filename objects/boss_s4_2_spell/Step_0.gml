/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var fire_ring = 10;
			var fire_ring_nbr = 8;
			var fire_spd_min = 2;
			var fire_spd_git = 2;
			
			var rock_nbr = 4;
			var rock_wait_aim = 30;
			var rock_accel = 0.05;
			var rock_spd_max = 8;
			
			var star_nbr = 22;
			var star_spd_shoot = 5;
			var star_spd_final = 1.9;
			
			var ball_spd_max = 8;
			var ball_accel = 0.05
			var ball_nbr = 2;
			var ball_dist = 5;
			
			var wait_wave = 220;
			
			var im = 5;
		break;
		case 1:
			var fire_ring = 13;
			var fire_ring_nbr = 10;
			var fire_spd_min = 2.2;
			var fire_spd_git = 2.6;
			
			var rock_nbr = 6;
			var rock_wait_aim = 30;
			var rock_accel = 0.05;
			var rock_spd_max = 8;
			
			var star_nbr = 27;
			var star_spd_shoot = 6;
			var star_spd_final = 1.9;
			
			var ball_spd_max = 8;
			var ball_accel = 0.05
			var ball_nbr = 2;
			var ball_dist = 5;
			
			var wait_wave = 195;
			var im = 5;
		break;
		case 2:
			var fire_ring = 15;
			var fire_ring_nbr = 12;
			var fire_spd_min = 2.4;
			var fire_spd_git = 2.8;
			
			var rock_nbr = 8;
			var rock_wait_aim = 30;
			var rock_accel = 0.05;
			var rock_spd_max = 8;
			
			var star_nbr = 32;
			var star_spd_shoot = 6;
			var star_spd_final = 2;
			
			var ball_spd_max = 8;
			var ball_accel = 0.05
			var ball_nbr = 2;
			var ball_dist = 5;
			
			var wait_wave = 170;
			var im = 6;
		break;
		case 3:
			var fire_ring = 18;
			var fire_ring_nbr = 13;
			var fire_spd_min = 2.6;
			var fire_spd_git = 2.8;
			
			var rock_nbr = 10;
			var rock_wait_aim = 30;
			var rock_accel = 0.05;
			var rock_spd_max = 8;
			
			var star_nbr = 36;
			var star_spd_shoot = 6;
			var star_spd_final = 2.1;
			
			var ball_spd_max = 8;
			var ball_accel = 0.05
			var ball_nbr = 2;
			var ball_dist = 5;
			
			var wait_wave = 155;
			var im = 6;
		break;
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
			play_sound(sfx_spawn_light,1,false);
			for(var i = 0; i < 360; i += 360 / rock_nbr)
			{
				var inst = shoot(DAN_ROCK,im,obj_boss.x,obj_boss.y,i,5.3,noone,5);
				inst.rot = rng(360,false,3);
				inst.is_cancelable = false;
			}
			
			boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
			
			var ang = rng(360,false,5);
			for(var i = 0; i < fire_ring_nbr; i += 1)
			{
				shoot_ring(DAN_FIREBALL,6,fire_ring,obj_boss.x,obj_boss.y,ang,fire_spd_min + fire_spd_git / fire_ring_nbr * i ,noone,3);
				ang += 360 / fire_ring / 3;
			}
			state = 2;
		break;
		case 2:
			switch(state_time)
			{
				case 30:
					boss_movement_random(2,9,2);
				break;
				case wait_wave:
					state = 0;
				break;
			}
			
		break;
		
		
	}
	
	
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1:
				shoot_ring(DAN_STARBIG,1,star_nbr,x,y,rng(360,false,5),star_spd_shoot,sfx_shot1,4);
				state = 2;
			break;
			case 2:
				if(state_time == rock_wait_aim)
				{
					angle = find_angle(x,y,obj_player.x,obj_player.y);
					state = 3;
					play_sound(sfx_redirect1,1,false);
				}
			break;
			case 3:
				spd = goto_value(spd,rock_spd_max,rock_accel);
				if(state_time % 14 == 0)
				{
					shoot_arc(DAN_BALL,7,ball_nbr,x,y,angle,ball_dist,0,sfx_shot2,6);
				}
			break;
		}
	}
	//star
	with(obj_danmaku4)
	{
		spd = goto_value(spd,star_spd_final,0.2);
	}
	//ball
	with(obj_danmaku6)
	{
		spd = goto_value(spd,ball_spd_max,ball_accel);
	}
	
}
// Inherit the parent event
event_inherited();

