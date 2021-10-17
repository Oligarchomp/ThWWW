/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(spell_wait)
	{
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
					
					if(state_time % bubble_wait == 0)
					{
						aim_spd = bubble_spd_min + aim_dist / bubble_open_max * bubble_spd_scale;
						shoot_arc(DAN_BUBBLE,1,bubble_nbr,obj_boss.x,obj_boss.y,999,aim_dist,aim_spd,sfx_shot1,5);
						aim_dist = goto_value(aim_dist,0,bubble_dist_plus)
						if(aim_dist == 0)
						{
							state = 1;
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

