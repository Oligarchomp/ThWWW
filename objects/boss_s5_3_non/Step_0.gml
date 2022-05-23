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
					var sword_spd_max = 22;
					var sword_size = 7;
					var sword_wait = 2;
			
					var ice_row = 3;
					var ice_spd = 2;
					
					var ice_arc = 3;
					var ice_dist = 60;
			
					var wave_wait = 48;
				break;
				case 1:
					var sword_spd_max = 16;
					var sword_size = 7;
					var sword_wait = 2;
			
					var ice_row = 4;
					var ice_spd = 2.4;
					
					var ice_arc = 3;
					var ice_dist = 60;
			
					var wave_wait = 28;
				break;
				case 2:
					var sword_spd_max = 20;
					var sword_size = 7;
					var sword_wait = 1;
			
					var ice_row = 4;
					var ice_spd = 2.75;
					
					var ice_arc = 3;
					var ice_dist = 60;
			
					var wave_wait = 28;
				break;
				case 3:
					var sword_spd_max = 20;
					var sword_size = 7;
					var sword_wait = 1;
			
					var ice_row = 4;
					var ice_spd = 3.2;
					
					var ice_arc = 3;
					var ice_dist = 46;
			
					var wave_wait = 12;
				break;
			}
	
			switch(state)
			{
				case 0:
					var angle_sword = -90 - 45 * sword_dir - 10 + rng(20,false,7);
					var x_pos = obj_boss.x + lengthdir_x(100,angle_sword);
					var y_pos = obj_boss.y + lengthdir_y(100,angle_sword);
					var inst = shoot(DAN_KNIFE,3,x_pos,y_pos,angle_sword,0,sfx_spawn_light,8);
					inst.spawn_type = SPAWN_SCALE;
					inst.image_xscale = sword_size;
					inst.image_yscale = sword_size;
					inst.pos_type = POS_MANUAL;
					inst.dist = sqrt(sqr(x_pos - obj_boss.x) + sqr(y_pos - obj_boss.y));
					inst.x_offscreen = 200;
					inst.y_offscreen = 200;
					inst.dir_dan = sword_dir;
					inst.is_cancelable = false;
					inst.angle_aim = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y);
			
					angle_sword_aim += 45;
					sword_dir *= -1;
					state = 1;
				break;
				case 1:
					switch(state_time)
					{
						case 20:
							boss_charge(obj_boss.x,obj_boss.y);
						break;
						case 50:
							//state = 2;
							with(obj_danmaku8)
							{
								state = 1;
								state_time = -1;
							}
						break;
					}
				break;
				case 2:
					switch(state_time)
					{
						case 0:
							boss_movement_random(3,6,2);
						break;
						case wave_wait:
							state = 0;
						break;
					}
				break;
			}
			var spell = self;
			with(obj_danmaku8)
			{
				switch(state)
				{
					case 0:
						if(state_time == 0)
						{
							angle_final = angle - 360 * dir_dan;
							//angle_aim = rng(360,false,6);
						}
					break;
					case 1:
						angle = goto_value(angle,angle_final,sword_spd_max)
				
				
						if(state_time % sword_wait == 0)
						{
							for(var i = dist * 2/ ice_row; i <= dist * 2; i += dist * 2 / ice_row)
							{
								var xx = obj_boss.x + lengthdir_x(i,angle)
								var yy = obj_boss.y + lengthdir_y(i,angle)
								for(var j = -(ice_arc - 1) * ice_dist / 2; j < (ice_arc + 1) * ice_dist / 2; j += ice_dist)
								{
									var inst = shoot(DAN_ARROW,3,xx,yy,angle_aim  + j,0,sfx_shot2,7);
									inst.y_offscreen = 200; 
								}
					
							}
						}
				
				
						if(angle == angle_final)
						{
							state = 2;
							angle_spd = sword_spd_max * -dir_dan;
						}
					break;
					case 2:
						angle_spd += recursiv(angle_spd,0,3,0.2);
						angle += angle_spd;
						if(angle_spd == 0)
						{
							spell.state = 2;
							cancel_bullet(self);
						}
						
						if(state_time == 5)
						{
							with(obj_danmaku7)
							{
								state = 1;
							}
						}
					break;
				}
		
				x = obj_boss.x + lengthdir_x(dist,angle);
				y = obj_boss.y + lengthdir_y(dist,angle)
			}
	
			with(obj_danmaku7)
			{
				switch(state)
				{
					case 1:
						if(spd < ice_spd)
						{
							spd += 0.1;
						}
						
						if(y > 500)
						{
							y_offscreen = 30;
						}
					break;
				}
			}
		break;
	}
}
// Inherit the parent event
event_inherited();

