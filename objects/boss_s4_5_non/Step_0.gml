/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(spell_wait)
	{
		case 40:
			boss_charge(obj_boss.x,obj_boss.y);
		break;
		case 0:
			switch(global.difficulty)
			{
				case 0:
					var ring_wait = 36;
					var ring_nbr = 15;
					var ring_spd_shoot = 10;
					var ring_spd_times_less = 5;
			
					var ring_spd_dif = 1.2;
			
					var dist_plus = 0.5;
					var dist_max = 40;
					var deccel = 0.8;
			
					var wave_lenght = 200;
					var wave_wait = 80;
				break;
				case 1:
					var ring_wait = 25;
					var ring_nbr = 22;
					var ring_spd_shoot = 11;
					var ring_spd_times_less = 4.5;
			
					var ring_spd_dif = 1.2;
			
					var dist_plus = 0.5;
					var dist_max = 40;
					var deccel = 0.8;
			
					var wave_lenght = 200;
					var wave_wait = 70;
				break;
				case 2:
					var ring_wait = 20;
					var ring_nbr = 27;
					var ring_spd_shoot = 11;
					var ring_spd_times_less = 4;
			
					var ring_spd_dif = 1.2;
			
					var dist_plus = 0.5;
					var dist_max = 40;
					var deccel = 0.8;
			
					var wave_lenght = 200;
					var wave_wait = 70;
				break;
				case 3:
					var ring_wait = 18;
					var ring_nbr = 32;
					var ring_spd_shoot = 11;
					var ring_spd_times_less = 4;
			
					var ring_spd_dif = 1.2;
			
					var dist_plus = 0.5;
					var dist_max = 40;
					var deccel = 0.8;
			
					var wave_lenght = 200;
					var wave_wait = 60;
				break;
			}
	
	
			switch(state)
			{
				case 0:
					if(state_time < wave_lenght)
					{
						if(state_time % ring_wait == 0)
						{
							var ang = rng(360,false,4);
							if(wave % 2 == 0)
							{
								col = 3;
							}
							else
							{
								col = 2;
							}
							shoot_ring(DAN_STARBIG,col,ring_nbr,obj_boss.x,obj_boss.y,ang,ring_spd_shoot,sfx_shot1,3);
							shoot_ring(DAN_STARBIG,col,ring_nbr,obj_boss.x,obj_boss.y,ang + 360 / ring_nbr / 2,ring_spd_shoot  * ring_spd_dif,sfx_shot1,3);
							wave += 1;
						}
					}
					else
					{
						boss_movement_random(1,8,3);
						state = 1;
					}
				
				break;
				case 1:
					if(state_time == wave_wait)
					{
						state = 0;
					}
				break;
			}
	
	
			with(obj_danmaku3)
			{
				switch(state)
				{
					case 0:
					if(state_time == 0)
					{
						spd_ref = spd;
						angle_plus = 0;
						angle_ref = angle;
					}
			
					spd = goto_value(spd,spd_ref / ring_spd_times_less,deccel);
					if(spd == spd_ref / ring_spd_times_less)
					{
						state = 1;
					}
			
				
					break;
					case 1:
						if(color_id == 3)
						{
							var way = 1;
						}
						else
						{
							var way = -1;
						}
				
						angle_plus = goto_value(angle_plus,dist_max,dist_plus);
						angle = angle_ref + angle_plus * way ;
				
					break;
				}
		}
		break;
	}
}
// Inherit the parent event
event_inherited();

