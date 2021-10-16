/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			//wave 1
			var mentos_ring = 36;
			var mentos_spd = 6.5;
			var mentos_wait = 19;
			
			var around_arc = 4;
			var around_spd_shot= 18;
			var around_wait = 3;
			var around_deccel = 0.3;
			var around_dist_ref = 50;
			
			//wave 2
			var bubble_wait = 18;
			var bubble_ring = 11;
			var bubble_spd = 5.5;
			
			var bullet_wait = 10;
			var bullet_ring = 19;
			var bullet_spd = 3.5;
			var bullet_dist  = 180 / bullet_ring;
			
			//wave 3
			var tss_arc = 11;
			var tss_dist = 10;
			var tss_spd = 3.8;
			var tss_wait = 4;
			var tss_change = 6;
			var tss_dist1 = 1.1;
			var tss_dist2 = 0;
			
			var wall_wait = 4;
			var wall_nbr = 10;
			var wall_spd = 10;
			var wall_open_final = 360 / wall_nbr;
			
			var wave_wait = 100;
		break;
		case 1:
			//wave 1
			var mentos_ring = 44;
			var mentos_spd = 8;
			var mentos_wait = 14;
			
			var around_arc = 6;
			var around_spd_shot= 18;
			var around_wait = 3;
			var around_deccel = 0.3;
			var around_dist_ref = 50;
			
			//wave 2
			var bubble_wait = 14;
			var bubble_ring = 15;
			var bubble_spd = 6.5;
			
			var bullet_wait = 8;
			var bullet_ring = 29;
			var bullet_spd = 4;
			var bullet_dist  = 180 / bullet_ring;
			
			//wave 3
			var tss_arc = 13;
			var tss_dist = 9;
			var tss_spd = 4.3;
			var tss_wait = 3;
			var tss_change = 6;
			var tss_dist1 = 1.2;
			var tss_dist2 = 0;
			
			var wall_wait = 4;
			var wall_nbr = 14;
			var wall_spd = 10;
			var wall_open_final = 360 / wall_nbr;
			
			var wave_wait = 90;
		break;
		case 2:
			//wave 1
			var mentos_ring = 49;
			var mentos_spd = 9;
			var mentos_wait = 13;
			
			var around_arc = 8;
			var around_spd_shot= 18;
			var around_wait = 3;
			var around_deccel = 0.3;
			var around_dist_ref = 50;
			
			//wave 2
			var bubble_wait = 10;
			var bubble_ring = 15;
			var bubble_spd = 6.5;
			
			var bullet_wait = 6;
			var bullet_ring = 35;
			var bullet_spd = 4.5;
			var bullet_dist  = 180 / bullet_ring;
			
			//wave 3
			var tss_arc = 13;
			var tss_dist = 11;
			var tss_spd = 5.5;
			var tss_wait = 2;
			var tss_change = 6;
			var tss_dist1 = 0.8;
			var tss_dist2 = 6.5;
			
			var wall_wait = 4;
			var wall_nbr = 16;
			var wall_spd = 10;
			var wall_open_final = 360 / wall_nbr;
			
			var wave_wait = 90;
		break;
		case 3:
			//wave 1
			var mentos_ring = 55;
			var mentos_spd = 9;
			var mentos_wait = 12;
			
			var around_arc = 8;
			var around_spd_shot= 18;
			var around_wait = 3;
			var around_deccel = 0.3;
			var around_dist_ref = 50;
			
			//wave 2
			var bubble_wait = 10;
			var bubble_ring = 18;
			var bubble_spd = 7;
			
			var bullet_wait = 5;
			var bullet_ring = 40;
			var bullet_spd = 4.5;
			var bullet_dist  = 180 / bullet_ring;
			
			//wave 3
			var tss_arc = 13;
			var tss_dist = 12;
			var tss_spd = 7;
			var tss_wait = 2;
			var tss_change = 6;
			var tss_dist1 = 1.1;
			var tss_dist2 = 7.5;
			
			var wall_wait = 4;
			var wall_nbr = 20;
			var wall_spd = 10;
			var wall_open_final = 360 / wall_nbr;
			
			var wave_wait = 90;
		break;
	}
	
	var wave_lenght = 180;

	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 35:
					play_sound(sfx_spawn_heavy,1,false);
					obj_boss.mask_index = spr_nothing;
					obj_boss.alpha = 0.4;
					
					need_water = true;
				break;
				case 65:
					switch(wave_id)
					{
						case 0:
							state = 1;
						break;
						case 1:
							state = 2;
						break;
						case 2:
							wall_open = 0;
							state = 3;
						break;
					}
				break;
			}
		break;
		case 1:
			if(state_time < wave_lenght)
			{
				if(state_time % mentos_wait == 0)
				{
					shoot_ring(DAN_MENTOS,1,mentos_ring,obj_boss.x,obj_boss.y,999,mentos_spd,sfx_shot1,5);
				}
				
				if(state_time % around_wait == 0)
				{
					dist_bullet = around_dist_ref + sin(state_time / 20) * 30;
					var dist2 = around_dist_ref - sin(state_time / 20) * 30;
					shoot_arc(DAN_BULLET,7,around_arc,obj_boss.x,obj_boss.y,-90,dist_bullet,around_spd_shot,sfx_shot2,4);
					shoot_arc(DAN_BULLET,7,around_arc,obj_boss.x,obj_boss.y,-90,dist2,around_spd_shot,sfx_shot2,4);
				}
			}
			else
			{
				state = 99;
			}
		break;
		case 2:
			if(state_time < wave_lenght)
			{
				if(state_time % bubble_wait == 0)
				{
					shoot_ring(DAN_BUBBLE,1,bubble_ring,obj_boss.x,obj_boss.y,999,bubble_spd,sfx_shot1,3)
				}
				if(state_time % bullet_wait == 0)
				{
					shoot_ring(DAN_BULLET,7,bullet_ring,obj_boss.x,obj_boss.y,bullet_aim,bullet_spd,sfx_shot2,5);
					bullet_aim += bullet_dist;
				}
			}
			else
			{
				state = 99;
			}
		break;
		case 3:
			if(state_time < wave_lenght)
			{
				if(state_time % tss_wait == 0)
				{
					if((state_time / tss_wait) % tss_change == 0)
					{
						tss_angle += tss_dist2 * tss_dir; 
						tss_dir *= -1;
					}
					tss_angle += tss_dist1 * tss_dir;
					
					shoot_arc(DAN_BULLET,7,tss_arc,obj_boss.x,obj_boss.y,tss_angle,tss_dist,tss_spd,sfx_shot2,2);
					
				}
				
				if(state_time % wall_wait == 0)
				{
					shoot_arc(DAN_BUBBLE,1,wall_nbr,obj_boss.x,obj_boss.y,90,wall_open,wall_spd,sfx_shot1,1);
					wall_open += recursiv(wall_open,wall_open_final,10,0.1);
				}
			}
			else
			{
				state = 99;
			}
		break;
		case 99:
			switch(state_time)
			{
				case 0:
					obj_boss.mask_index = spr_boss_hurtbox;
					obj_boss.alpha = 1;
				
					wave_id += 1;
					wave_id %= 3;
					
					boss_movement_random(1,5,2);
					
					need_water = false;
				break;
				case wave_wait:
					state = 0;
				break;
			}
		break;
	}
	
	//slowing bullet
	with(obj_danmaku4)
	{
		switch(state)
		{
			case 0:
				if(state_time == 0)
				{
					spd_ref = spd;	
				}
				
				spd = goto_value(spd,0,around_deccel);
				if(spd == 0)
				{
					cancel_bullet(self);
				}
			break;
		}
	}
	
	water_scale += recursiv(water_scale,0.5 * need_water,16,0.01);	
	
}

// Inherit the parent event
event_inherited();

