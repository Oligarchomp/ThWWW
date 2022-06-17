/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(spell_wait)
	{
		case 70:
			instance_create_depth(obj_boss.x,obj_boss.y,0,obj_helm);
		break;
		case 30:
			boss_charge(obj_boss.x,obj_boss.y);
		break;
		case 0:
		
			switch(global.difficulty)
			{
				case 0:
					var mentos_wait = 7;
					var mentos_ring = 4;
					var mentos_spd_min = 3.5;
					var mentos_spd_max = 4.5;
					var mentos_angle_plus = 360 / mentos_ring / 5;
					
					var spam_bubble = 2;
					var spam_mentos = 8;
					var spam_ball = 12;
					
					var spam_ring = 5;
					
					var spam_spd_min = 3;
					var spam_spd_git = 5;
					var spam_div = 2.8;
					var spam_deccel = 0.2;
					
					var wave_length = 150;
					var wait = 110;
				break;
				case 1:
					var mentos_wait = 5;
					var mentos_ring = 4;
					var mentos_spd_min = 4;
					var mentos_spd_max = 5;
					var mentos_angle_plus = 360 / mentos_ring / 7;
					
					var spam_bubble = 6;
					var spam_mentos = 15;
					var spam_ball = 26;
					
					var spam_ring = 5;
					
					var spam_spd_min = 3;
					var spam_spd_git = 6;
					var spam_div = 2.6;
					var spam_deccel = 0.2;
					
					var wave_length = 150;
					var wait = 88;
				break;
				case 2:
					var mentos_wait = 4;
					var mentos_ring = 4;
					var mentos_spd_min = 4.5;
					var mentos_spd_max = 5.5;
					var mentos_angle_plus = 360 / mentos_ring / 9;
					
					var spam_bubble = 8;
					var spam_mentos = 18;
					var spam_ball = 32;
					
					var spam_ring = 5;
					
					var spam_spd_min = 3;
					var spam_spd_git = 6.2;
					var spam_div = 2.5;
					var spam_deccel = 0.2;
					
					var wave_length = 150;
					var wait = 80;
				break;
				case 3:
					var mentos_wait = 3;
					var mentos_ring = 4;
					var mentos_spd_min = 5;
					var mentos_spd_max = 6;
					var mentos_angle_plus = 360 / mentos_ring / 10;
					
					var spam_bubble = 9; 
					var spam_mentos = 21; 
					var spam_ball = 38;
					
					var spam_ring = 5;
					
					var spam_spd_min = 3;
					var spam_spd_git = 6.6;
					var spam_div = 2.5;
					var spam_deccel = 0.2;
					
					var wave_length = 150;
					var wait = 80;
				break;
			}
		
		
			switch(state)
			{
				case 0:
					if(state_time < wave_length)
					{
						
						if(state_time % mentos_wait == 0)
						{
							shoot_ring(DAN_MENTOS,1,mentos_ring,obj_boss.x,obj_boss.y,mentos_angle,mentos_spd_min,sfx_shot1,5);	
							shoot_ring(DAN_MENTOS,7,mentos_ring,obj_boss.x,obj_boss.y,mentos_angle,mentos_spd_max,noone,6);	
							mentos_angle += mentos_angle_plus * act_dir;
						}
					}
					else
					{
						state += 1;
						boss_movement_random(2,20,5);
						act_dir *= -1;
						
						bullet_angle = rng(360,false,1);
						mentos_angle = rng(360,false,1);
						
						play_sound(sfx_redirect1,1,false);
						
						
						repeat(spam_ball)
						{
							shoot_ring(DAN_RAINDROP,choose(2,1),spam_ring,obj_boss.x,obj_boss.y,rng(360,false,1),spam_spd_min + rng(spam_spd_git,false,1),noone,8);	
						}
						
						repeat(spam_mentos)
						{
							shoot_ring(DAN_MENTOS,choose(2,1),spam_ring,obj_boss.x,obj_boss.y,rng(360,false,1),spam_spd_min + rng(spam_spd_git,false,1),noone,8);	
						}
						
						repeat(spam_bubble)
						{
							shoot_ring(DAN_BUBBLE,choose(2,1),spam_ring,obj_boss.x,obj_boss.y,rng(360,false,1),spam_spd_min + rng(spam_spd_git,false,1),noone,8);	
						}
					}
				break;
				case 1:
					var wait2 = wait - 30;
					switch(state_time)
					{
						case wait2:
							boss_charge(obj_boss.x,obj_boss.y);
						break;
						case wait:
							state = 0;
						break;
					}
				break;
			}
		
			with(obj_danmaku8)
			{
				switch(state)
				{
					case 0:
						spd_to = spd / spam_div;
						state += 1;
					break;
					case 1:
						spd = goto_value(spd,spd_to,spam_deccel);
					break;
				}
			}
		
		break;
	}
}

// Inherit the parent event
event_inherited();

