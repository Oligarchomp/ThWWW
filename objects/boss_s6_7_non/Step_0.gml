/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			//wave 2
			var mentos_ring = 23;
			var mentos_spd = 6.5;
			var mentos_wait = 30;
			
			
			//wave 1
			var bubble_wait = 18;
			var bubble_arc = 5;
			var bubble_dist = 32;
			var bubble_spd = 4.2;
			
			var bullet_wait = 10;
			var bullet_ring = 17;
			var bullet_spd = 3.5;
			var bullet_dist  = 180 / bullet_ring;
			
			//wave 3
			var tss_arc = 6;
			var tss_dist = 14;
			var tss_spd = 3.5;
			var tss_wait = 4;
			var tss_change = 8;
			var tss_dist1 = 1.4;
			var tss_dist2 = 1.4;
			
			var wall_wait = 5;
			var wall_nbr = 12;
			var wall_spd = 8;
			var wall_open_final = 360 / wall_nbr;
			
			var wave_wait = 100;
		break;
		case 1:
			//wave 2
			var mentos_ring = 29;
			var mentos_spd = 8;
			var mentos_wait = 26;
			
			
			//wave 1
			var bubble_wait = 14;
			var bubble_arc = 7;
			var bubble_dist = 24;
			var bubble_spd = 5.7;
			
			var bullet_wait = 8;
			var bullet_ring = 29;
			var bullet_spd = 3.4;
			var bullet_dist  = 180 / bullet_ring;
			
			//wave 3
			var tss_arc = 8;
			var tss_dist = 11;
			var tss_spd = 4.3;
			var tss_wait = 3;
			var tss_change = 6;
			var tss_dist1 = 1.2;
			var tss_dist2 = 1.2;
			
			var wall_wait = 5;
			var wall_nbr = 14;
			var wall_spd = 8;
			var wall_open_final = 360 / wall_nbr;
			
			var wave_wait = 90;
		break;
		case 2:
			//wave 2
			var mentos_ring = 35;
			var mentos_spd = 8;
			var mentos_wait = 23;
			
			//wave 1
			var bubble_wait = 10;
			var bubble_arc = 7;
			var bubble_dist = 24;
			var bubble_spd = 6;
			
			var bullet_wait = 7;
			var bullet_ring = 35;
			var bullet_spd = 3.8;
			var bullet_dist  = 180 / bullet_ring;
			
			//wave 3
			var tss_arc = 9;
			var tss_dist = 11;
			var tss_spd = 5;
			var tss_wait = 3;
			var tss_change = 6;
			var tss_dist1 = 1;
			var tss_dist2 = 6;
			
			var wall_wait = 4;
			var wall_nbr = 18;
			var wall_spd = 10;
			var wall_open_final = 360 / wall_nbr;
			
			
			var wave_wait = 90;
		break;
		case 3:
			//wave 2
			var mentos_ring = 37;
			var mentos_spd = 9.5;
			var mentos_wait = 20;
			
			
			//wave 1
			var bubble_wait = 10;	
			var bubble_arc = 7;
			var bubble_dist = 20;
			var bubble_spd = 6.5;
			
			var bullet_wait = 6;
			var bullet_ring = 40;
			var bullet_spd = 4;
			var bullet_dist  = 180 / bullet_ring;
			
			//wave 3
			var tss_arc = 9;
			var tss_dist = 12;
			var tss_spd = 5.5;
			var tss_wait = 2;
			var tss_change = 8;
			var tss_dist1 = 1;
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
					
					var inst = instance_create_depth(obj_boss.x,obj_boss.y,obj_boss.depth - 1, obj_shield_nua);
					inst.scale_spd = 0.02;
				break;
				case 65:
					switch(wave_id)
					{
						case 0:
							state = 2;
						break;
						case 1:
							state = 1;
						break;
						case 2:
							
							switch(global.difficulty)
							{
								case 0:
								case 1:
									tss_angle = -90 + (tss_dist / 2 - (tss_change - 1) * tss_dist1 / 2) * act_dir;
								break;
								case 2:
								case 3:
									tss_angle = -90;
								break;
							}
							
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
					shoot_ring(DAN_BUBBLE,1,mentos_ring,obj_boss.x,obj_boss.y,999,mentos_spd,sfx_redirect2,5);
				}
				
				var open = 160;
				var aim = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y) + 180;
				repeat(14)
				{
					shoot(DAN_BULLET,7,obj_boss.x,obj_boss.y,aim + open - rng(open * 2,false,1),5 + rng(5,false,1),sfx_shot2,4);
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
					shoot_arc(DAN_BUBBLE,1,bubble_arc,obj_boss.x,obj_boss.y,999,bubble_dist,bubble_spd,sfx_shot1,3)
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
						tss_angle += tss_dist2 * tss_dir * act_dir; 
						tss_dir *= -1;
					}
					else
					{
						tss_angle += tss_dist1 * tss_dir  * act_dir;
					}
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
				
				wall_open = 0;
			
				act_dir *= -1;
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
					
					with(obj_shield_nua)
					{
						state = 1;
					}
				break;
				case wave_wait:
					state = 0;
				break;
			}
		break;
	}
	
}

// Inherit the parent event
event_inherited();

