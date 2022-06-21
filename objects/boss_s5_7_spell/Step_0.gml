/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var cross_type = 1;
			
			var knife_size = 3;
			var knife_dist = 50;
			var knife_spd = 7;
			
			var stab_ring = 11;
			var stab_spd_shoot = 6;
			var stab_spd_final = 2;
			var stab_deccel = 0.3;
			var stab_accel = 0.1;
			
			var fire_spd = 6;
			var fire_spd_git = 3;
			var fire_off = 40;
			var fire_wait = 2;
			var fire_lenght = 180;
			
			var ring_nbr = 11;
			var ring_spd = 1.8;
			var ring_wait = 58;
			
			var arrow_wait = 40;
			var arrow_arc = 5;
			var arrow_spd = 3.5;
			var arrow_dist = 30;
			var arrow_lenght = 100;
			var arrow_size = 2;
		break;
		case 1:
			var cross_type = 1;
			
			var knife_size = 3;
			var knife_dist = 50;
			var knife_spd = 7;
			
			var stab_ring = 19;
			var stab_spd_shoot = 6;
			var stab_spd_final = 2;
			var stab_deccel = 0.3;
			var stab_accel = 0.1;
			
			var fire_spd = 6;
			var fire_spd_git = 3;
			var fire_off = 40;
			var fire_wait = 2;
			var fire_lenght = 180;
			
			var ring_nbr = 19;
			var ring_spd = 2;
			var ring_wait = 51;
			
			var arrow_wait = 36;
			var arrow_arc = 7;
			var arrow_spd = 4.5;
			var arrow_dist = 22;
			var arrow_lenght = 100;
			var arrow_size = 2;
		break;
		case 2:
			var cross_type = 1;
			
			var knife_size = 3;
			var knife_dist = 60;
			var knife_spd = 7;
			
			var stab_ring = 26;
			var stab_spd_shoot = 6;
			var stab_spd_final = 2;
			var stab_deccel = 0.3;
			var stab_accel = 0.1;
			
			var fire_spd = 6;
			var fire_spd_git = 3;
			var fire_off = 40;
			var fire_wait = 2;
			var fire_lenght = 180;
			
			var ring_nbr = 24;
			var ring_spd = 2;
			var ring_wait = 46;
			
			var arrow_wait = 31;
			var arrow_arc = 9;
			var arrow_spd = 5;
			var arrow_dist = 19;
			var arrow_lenght = 100;
			var arrow_size = 2;
		break;
		case 3:
			var cross_type = 1;
		
			var knife_size = 3;
			var knife_dist = 60;
			var knife_spd = 7;
			
			var stab_ring = 30;
			var stab_spd_shoot = 6;
			var stab_spd_final = 2;
			var stab_deccel = 0.3;
			var stab_accel = 0.1;
			
			var fire_spd = 6;
			var fire_spd_git = 3;
			var fire_off = 40;
			var fire_wait = 2;
			var fire_lenght = 180;
			
			var ring_nbr = 28;
			var ring_spd = 2;
			var ring_wait = 42;
			
			var arrow_wait = 28;
			var arrow_arc = 11;
			var arrow_spd = 5;
			var arrow_dist = 15;
			var arrow_lenght = 100;
			var arrow_size = 2;
		break;
	}
	var cross_nbr = 4;
	var knife_spin_max = 20;
	
	switch(state)
	{
		case 0:
			for(var i = 0; i < 360; i += 360 / cross_nbr)
			{
				var aim = -90;
				var col = cross_type ? (i == 0 ? 6 : 7) : 3;
				var inst = shoot(DAN_KNIFE,col,obj_boss.x,obj_boss.y,aim + i - 220 * dir_act,0,sfx_spawn_light,6);	
				inst.spawn_type = SPAWN_SCALE;
				inst.image_xscale = knife_size;
				inst.image_yscale = knife_size;
				inst.pos_type = POS_MANUAL;
				inst.dist = 0;
				inst.angle_to = aim + i + global.rng_patch * rng(360,false,1);
				inst.dir_dan = dir_act;
				inst.is_cancelable = false;
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
				case 80:
					with(obj_danmaku6)
					{
						boss_charge(x,y);
					}
				break;
				case 81:
				case 86:
				case 91:
				case 96:
					if(!global.rng_patch)
					{
						var inst = instance_create_depth(obj_boss.x,obj_boss.y,global.boss_depth,obj_thunder);
						inst.is_thunder = false;
					
						var inst = instance_create_depth(obj_boss.x,obj_boss.y,global.boss_depth,obj_thunder);
						inst.is_thunder = false;
						inst.w_angle = 180;
					
						var inst = instance_create_depth(obj_boss.x,obj_boss.y,global.boss_depth,obj_thunder);
						inst.is_thunder = false;
						inst.w_angle = 90;
					
						var inst = instance_create_depth(obj_boss.x,obj_boss.y,global.boss_depth,obj_thunder);
						inst.is_thunder = false;
						inst.w_angle = 270;
					}
				break;
				case 120:
					with(obj_danmaku6)
					{
						boss_release(x,y,sfx_boss_release);
						state = 4;
					}
					state = 3;
				break;
			}
		break;
		case 3:
			if(state_time == fire_lenght)
			{
				with(obj_danmaku6)
				{
					state = 5;
				}
				state = 4;
			}
		break;
		case 4:
			if(state_time < arrow_lenght)
			{
				if(state_time % arrow_wait == 0)
				{
					shoot_arc(DAN_ARROW,3,arrow_arc,obj_boss.x,obj_boss.y,999,arrow_dist,arrow_spd,sfx_shot1,3);
					with(obj_danmaku3)
					{
						if(state == 0)
						{
							spawn_type = SPAWN_SCALE;
							image_xscale = arrow_size;
							image_yscale = arrow_size;
							state = 1;
							x_offscreen *= arrow_size;
							y_offscreen *= arrow_size;
						}
					}
				}
			}
			else
			{
				state = 5;
				boss_movement_goto(obj_player.x,obj_boss.y,4);
				if(obj_boss.x_to > 300)
				{
					obj_boss.x_to = 300;
				}
				if(obj_boss.x_to < 100)
				{
					obj_boss.x_to = 100;
				}
			}
		break;
		case 5:
			if(obj_boss.in_position)
			{
				state = 0;	
			}
		break;
	}
	
	//knife
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
				state = 2;
				spd = knife_spd;
				pos_type = POS_ANGLE;
			break;
			case 2:
				if(state_time % 3 == 0)
				{
					
				}
			
				var sq = 5;
				var found_wall = false;
				
				if(collision_rectangle(x - sq + hsp,y - sq ,x + sq + hsp,y + sq,obj_wall,false,true))
				{
					found_wall = true;
				}
				
				if (collision_rectangle(x - sq,y - sq + vsp,x + sq,y + sq + vsp,obj_wall,false,true))
				{
					found_wall = true;
				}
				
				if(found_wall)
				{
					state = 3;
					spd = 0;
					shoot_ring(DAN_ARROW,color_id,stab_ring,x,y,rng(360,false,8),stab_spd_shoot,sfx_shot1,5);
				}
			break;
			case 4:
				if(cross_type == 1)
				{
					var dan = DAN_ARROW;
				}
				else
				{
					var dan = DAN_BALL;
				}
			
				if(state_time % fire_wait == 0)
				{
					var x_pos = x - fire_off + rng(fire_off * 2, false,3);
					var y_pos = y - fire_off + rng(fire_off * 2, false,6);
					var sp = fire_spd + rng(fire_spd_git,false,8);
					
					shoot(dan,color_id,x_pos,y_pos,angle + 180,sp,sfx_shot1,2);
				}
				
				if(state_time % ring_wait == 0)
				{
					shoot_ring(dan,color_id,ring_nbr,x,y,rng(36,false,9),ring_spd,sfx_redirect2,4);	
				}
			break;
			case 5:
				spd = goto_value(spd,5,0.1);
			break;
		}
	}
	
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				image_xscale = 2;
				image_yscale = 2;
				x_offscreen *= 2;
				y_offscreen *= 2;
				spawn_type = SPAWN_SCALE;
				
				state += 1;
			break;
			case 1:
				spd = goto_value(spd,0,stab_deccel);
				if(spd == 0)
				{
					state += 1;
				}
			break;
			case 2:
				spd = goto_value(spd,stab_spd_final,stab_accel);
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

