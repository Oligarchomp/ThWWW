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
					var bubble_wait = 14;
					var bubble_nbr = 5;
					var bubble_open_max = 360 / bubble_nbr;
					var bubble_spd_min = 2;
					var bubble_spd_scale = 2;
					var bubble_dist_plus = 13;
					
					var spam_start = 10;
					var spam_nbr = 7;
					var spam_mult = 1.3;
					
					var wave_wait = 70;
					
					var bullet_wait = 8;
					var bullet_spd = 2.5;
					var bullet_ring = 6;
					var bullet_start = 0;
					var bullet_dist = 180 / bullet_ring / 4;
				break;
				case 1:
					var bubble_wait = 10;
					var bubble_nbr = 7;
					var bubble_open_max = 360 / bubble_nbr;
					var bubble_spd_min = 3;
					var bubble_spd_scale = 2;
					var bubble_dist_plus = 10;
					
					var spam_start = 10;
					var spam_nbr = 12;
					var spam_mult = 1.4;
					
					var wave_wait = 70;
					
					var bullet_wait = 7;
					var bullet_spd = 3;
					var bullet_ring = 7;
					var bullet_start = 0;
					var bullet_dist = 180 / bullet_ring / 4;
				break;
				case 2:
					var bubble_wait = 10;
					var bubble_nbr = 7;
					var bubble_open_max = 360 / bubble_nbr;
					var bubble_spd_min = 3;
					var bubble_spd_scale = 3;
					var bubble_dist_plus = 8.2;
					
					var spam_start = 10;
					var spam_nbr = 13;
					var spam_mult = 1.5;
					
					var wave_wait = 60;
					
					var bullet_wait = 7;
					var bullet_spd = 3;
					var bullet_ring = 9;
					var bullet_start = 0;
					var bullet_dist = 180 / bullet_ring / 4;
				break;
				case 3:
					var bubble_wait = 10;
					var bubble_nbr = 7;
					var bubble_open_max = 360 / bubble_nbr;
					var bubble_spd_min = 3;
					var bubble_spd_scale = 4;
					var bubble_dist_plus = 8;
					
					var spam_start = 10;
					var spam_nbr = 18;
					var spam_mult = 1.6;
					
					var wave_wait = 50;
					
					var bullet_wait = 7;
					var bullet_spd = 3;
					var bullet_ring = 11;
					var bullet_start = 0;
					var bullet_dist = 180 / bullet_ring / 4;
				break;
			}
	
			if(step > bullet_start)
			{
				if(step % bullet_wait == 0)
				{
					shoot_ring(DAN_BULLET,7,bullet_ring,obj_boss.x,obj_boss.y,bullet_angle,bullet_spd,sfx_shot2,3);
					shoot_ring(DAN_BULLET,7,bullet_ring,obj_boss.x,obj_boss.y,-bullet_angle - 180,bullet_spd,sfx_shot2,3);
					bullet_angle += bullet_dist;
				}
			}
			
			switch(state)
			{
				case 0:
					if(state_time == 0)
					{
						aim_dist = bubble_open_max;
					}
					
					if(aim_dist >= spam_start)
					{
						if(state_time % bubble_wait == 0)
						{
							aim_spd = bubble_spd_min + aim_dist / bubble_open_max * bubble_spd_scale;
							shoot_arc(DAN_BUBBLE,1,bubble_nbr,obj_boss.x,obj_boss.y,999,aim_dist,aim_spd,sfx_shot1,5);	
							aim_dist = goto_value(aim_dist,0,bubble_dist_plus);
						}
					}
					else
					{
						if(spam_total < spam_nbr)
						{
							if(state_time % 2 == 0)
							{
								var ang = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y) - spam_start * spam_mult + rng(spam_start * 2 * spam_mult,false,4);
								var sp = bubble_spd_min + aim_dist / bubble_open_max * bubble_spd_scale;
								shoot(DAN_BUBBLE,1,obj_boss.x,obj_boss.y,ang,sp,sfx_shot1,5);
								spam_total += 1;
							}
						}
						else
						{
							state = 1;
							spam_total = 0;
						}
					}
				break;
				case 1:
					var wave_wait2 = wave_wait + 30;
					switch(state_time)
					{
						case 0:
							boss_movement_random(2,3,2);
						break;
						case wave_wait:
							boss_charge(obj_boss.x,obj_boss.y);
						break;
						case wave_wait2:
							state = 0;
						break;
					}
				break;
			}
			
			
			
			
		break;
	}
}

// Inherit the parent event
event_inherited();

