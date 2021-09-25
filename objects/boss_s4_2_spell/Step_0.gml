/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
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
		
			var fire_ring = 18;
			var fire_ring_nbr = 15;
			var fire_spd_min = 3;
			var fire_spd_git = 3;
			
			var rock_nbr = 10;
			var rock_wait_aim = 30;
			var rock_accel = 0.05;
			var rock_spd_max = 8;
			
			var star_nbr = 36;
			var star_spd_shoot = 6;
			var star_spd_final = 2.5;
			
			var ball_spd_max = 8;
			var ball_accel = 0.05
			var ball_nbr = 2;
			var ball_dist = 5;
			
			var wait_wave = 155;
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
			play_sound(sfx_familiar_spawn,1,false);
			for(var i = 0; i < 360; i += 360 / rock_nbr)
			{
				var inst = create_enemy(EN_ROCK,obj_boss.x,obj_boss.y,99999,1,5.3,i);
				inst.rot = rng(360,false,3);
				inst.mask_index = spr_nothing;
				inst.item_nbr = 0;
			}
			
			boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
			for(var i = 0; i < fire_ring_nbr; i += 1)
			{
				shoot_ring(DAN_FIREBALL,6,fire_ring,obj_boss.x,obj_boss.y,rng(360,false,i),fire_spd_min + rng(fire_spd_git,false,i + 1),noone,3);
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
	
	
	with(obj_enemy1)
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

