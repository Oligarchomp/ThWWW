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
					var ring_nbr = 34;
					var ring_wait = 30;
					var ring_change_time = 50;
					var ring_spd = 2.5;
					var ring_spd_mult = 1.1;
					var ring_accel = 0.2;
					var ring_angle_plus = 5;
					var ring_fast = 5;
				break;
				case 1:
					var ring_nbr = 50;
					var ring_wait = 20;
					var ring_change_time = 60;
					var ring_spd = 3;
					var ring_spd_mult = 1.2;
					var ring_accel = 0.2;
					var ring_angle_plus = 6;
					var ring_fast = 6;
				break;
				case 2:
					var ring_nbr = 54;
					var ring_wait = 18;
					var ring_change_time = 70;
					var ring_spd = 3;
					var ring_spd_mult = 1.25;
					var ring_accel = 0.2;
					var ring_angle_plus = 5;
					var ring_fast = 8;
				break;
				case 3:
					var ring_nbr = 56;
					var ring_wait = 16;
					var ring_change_time = 80;
					var ring_spd = 3;
					var ring_spd_mult = 1.25;
					var ring_accel = 0.2;
					var ring_angle_plus = 6;
					var ring_fast = 8;
				break;
			}
			
			var boss_wait = 140;
			
			if(step % boss_wait == 0)
			{
				boss_movement_random(3,9,3);
			}
	
			switch(state)
			{
				case 0:
			
					if(state_time % ring_wait == 0)
					{
						angle_shoot += 360 / ring_nbr // angle_shoot_ref + (state_time / ring_wait ) % 2 * 360 / ring_nbr ;
						for(var i = 0; i < ring_nbr; i += 1)
						{
							var aim = angle_shoot + i * 360 / ring_nbr;
							if(wave_nbr % 2 == 0)
							{
								var col = 2;
							}
							else
							{
								var col = 3;
							}
							var inst = shoot(DAN_STARBIG,col,obj_boss.x,obj_boss.y,aim,ring_spd,sfx_shot1,3);
						
							wave_nbr += 1;
						
							if(i % 2 == 1)
							{
								inst.need_change = false;
							}
							else
							{
								inst.need_change = true;
								inst.dir_dan = dir_dan;
								dir_dan *= -1;
								inst.y_offscreen = 300;
								inst.x_offscreen = 300;
							}	
						}
					}
				break;
			}
	
	
			with(obj_danmaku3)
			{
				switch(state)
				{
					case 0:
						if(need_change)
						{
							if(state_time >= ring_change_time)
							{
								state = 1;
							}
						}
					break;
					case 1:
						spd = goto_value(spd,0,ring_accel);
						if(spd == 0)
						{
							state = 2;
							angle += ring_angle_plus * dir_dan;
						}
					break;
					case 2:
						spd = goto_value(spd,-ring_fast,ring_accel);
						if(spd == -ring_fast)
						{
							state = 3;
							y_offscreen = 30;
							x_offscreen = 30;
						}
					break;
					case 3:
						spd = goto_value(spd,-ring_spd * ring_spd_mult,ring_accel);
					break;
				}
			}
		break;
	}
}
// Inherit the parent event
event_inherited();

