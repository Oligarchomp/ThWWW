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
					var knife_dan = DAN_ARROW;
					var knife_row = 4;
					var knife_ring = 16;
					var knife_size = 1;
					var knife_dist = 60;
					var knife_spd = 3;
					var knife_spd_div = 1.5;
					
					var knife_wait = 8;
					
					var wave_wait = 32;
				break;
				case 1:
					var knife_dan = DAN_KNIFE;
					var knife_row = 5;
					var knife_ring = 36;
					var knife_size = 1;
					var knife_dist = 60;
					var knife_spd = 3.4;
					var knife_spd_div = 1.5;
					
					var knife_wait = 8;
					
					var wave_wait = 17;
				break;
				case 2:
					var knife_dan = DAN_KNIFE;
					var knife_row = 5;
					var knife_ring = 24;
					var knife_size = 2;
					var knife_dist = 60;
					var knife_spd = 3.5;
					var knife_spd_div = 1.4;
					
					var knife_wait = 8;
					
					var wave_wait = 13;
				break;
				case 3:
					var knife_dan = DAN_KNIFE;
					var knife_row = 5;
					var knife_ring = 28;
					var knife_size = 2;
					var knife_dist = 70;
					var knife_spd = 4;
					var knife_spd_div = 1.3;
					
					var knife_wait = 10;
					
					var wave_wait = 10;
				break;
			}
		
			var knife_spin_max = 20;
	
			switch(state)
			{
				case 0:
					var aim = rng(360,false,9);
					for(var n = 0; n < knife_row; n += 1)
					{
						for(var i = 0; i < 360; i += 360 / knife_ring)
						{
							var inst = shoot(knife_dan,3,obj_boss.x,obj_boss.y,aim + i,0,sfx_spawn_light,6);	
							inst.spawn_type = SPAWN_SCALE;
							inst.image_xscale = knife_size;
							inst.image_yscale = knife_size;
							inst.pos_type = POS_MANUAL;
							inst.dist = 0;
							inst.angle_to = aim + i + 220 * dir_act;
							inst.wait = n * knife_wait;
							inst.dir_dan = dir_act;
						}
					}
					state = 1;
				break;
				case 1:
					switch(state_time)
					{
						case 30:
							boss_charge(obj_boss.x,obj_boss.y);
						break;
						case 60:
							state = 2;
							boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
							with(obj_danmaku6)
							{
								if(state = 0)
								{
									state = 1;	
								}
							}
						break;
					}
				break;
				case 2:
					switch(state_time)
					{
						case 0:
							boss_movement_random(4,12,3);
						break;
						case wave_wait:
							state = 0;
							dir_act *= -1;
						break;
					}
				break;
			}
			
			
			with(obj_danmaku6)
			{
				switch(state)
				{
					case 0:
						if(dir_dan == 1)
						{
							angle += min(recursiv(angle,angle_to,10,0.2),knife_spin_max);
						}
						else
						{
							angle += max(recursiv(angle,angle_to,10,0.2),-knife_spin_max);
						}
						dist += recursiv(dist,knife_dist,10,0.1);
						x = obj_boss.x + lengthdir_x(dist,angle);
						y = obj_boss.y + lengthdir_y(dist,angle);
					break;
					case 1:
						if(wait == 0)
						{
							state = 2;
							spd = knife_spd;
							pos_type = POS_ANGLE;
							play_sound(sfx_redirect2,1,false);
						}
						else
						{
							wait -= 1;
						}
					break;
					case 2:
						var sq = 5;
						var found_wall = false;
						if (y < 480)
						{
							if(collision_rectangle(x - sq + hsp,y - sq ,x + sq + hsp,y + sq,obj_wall,false,true))
							{
								found_wall = true;
								angle = -angle + 180;
							}
				
							if (collision_rectangle(x - sq,y - sq + vsp,x + sq,y + sq + vsp,obj_wall,false,true))
							{
								found_wall = true;
								angle *= -1;
							}
						}
				
						if(found_wall)
						{
							state = 3;
							spd /= knife_spd_div;
							color_id = 5;
							depth -= 1;
						}
						//no break
					case 3:
					break;
				}
			}
			
		break;
	}
}
// Inherit the parent event
event_inherited();

