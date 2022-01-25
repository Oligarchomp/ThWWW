/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) 
{
	with(obj_spell_art)
	{
		sprite_index = spr_nothing;	
	}
	
	if (spell_wait == 0)
	{
		
		var spin_spd = 8;
		
		var wait_wave = 10;
		
		
		var spawn_time = 40;
		var rice_wait = 2;
		var rice_nbr = 18;
		var rice_angle_plus = 8;
		var rice_dist = 30;
		var rice_spd = 2;
		var rice_accel = 0.02;
		var wait_move = 5;
	
		var aim_wait = 2;
		var aim_arc = 5;
		var aim_row = 3;
		var aim_dist = 36;
		var aim_spd_min = 3;
		var aim_spd_max = 5;
	
		switch(state)
		{
			case 0:
				switch(state_time)
				{
					case 0:
						boss_charge(obj_boss.x,obj_boss.y);
					break;
					case 30:
						boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
						state = 1;
					break;
				}
			break;
			case 1:
			
				array_push(rice_angle_list,rng(360,false,3));
				array_push(rice_time_list,-1);
				array_push(rice_dist_list,0);
				array_push(rice_dir_list,rice_wave_dir);
		
				rice_wave_dir *= -1;
				
				
				state = 3;		
			break;
			case 3:
				if(state_time == wait_wave)
				{
					state = 4;
					boss_charge(obj_boss.x,obj_boss.y);
				}
			break;
			case 4:
				switch(state_time)
				{
					case 30:
						boss_charge(obj_boss.x,obj_boss.y);
					break;
					case 60:
						state = 5;
						obj_boss.pos_type = POS_MANUAL;
					break;
				}
			break;
			case 5:
				obj_boss.x = x_ref + lengthdir_x(dist_pale,angle_pale);
				obj_boss.y = y_ref + lengthdir_y(dist_pale,angle_pale)
				obj_boss.dir = obj_boss.dir_max;
			
				angle_pale = goto_value(angle_pale,450,spin_spd);
			
			
				if(state_time % aim_wait == 0)
				{
					shoot_arc_row(DAN_ARROWHEAD,3.5 + dir * 0.5,aim_arc,aim_row,obj_boss.x,obj_boss.y,999,aim_dist,aim_spd_min,aim_spd_max,sfx_shot1,2);
				}
			
				if(angle_pale = 450)
				{
					angle_pale = 450 + dir * 360;
					state = 0;
					obj_boss.pos_type = POS_SP;
					dir *= -1;
				}
			break;
		
		}
		
		
		
		//RICE
		for(var i = 0; i < array_length(rice_angle_list); i += 1)
		{
			rice_time_list[i] += 1;
			if(rice_time_list[i] < spawn_time)
			{
				if (rice_time_list[i] % rice_wait == 0)
				{
					rice_angle_list[i] += rice_angle_plus * rice_dir_list[i];
					rice_dist_list[i] += rice_dist;
			
					for(var r = 0; r < 360; r += 360 / rice_nbr)
					{
						if(rice_dir_list[i] == 1)
						{
							var col = 4;
						}
						else
						{
							var col = 3;
						}
						var x_pos = obj_boss.x + lengthdir_x(rice_dist_list[i],rice_angle_list[i] + r);
						var y_pos = obj_boss.y + lengthdir_y(rice_dist_list[i],rice_angle_list[i] + r);	
					
						var x_aim = obj_boss.x + lengthdir_x(rice_dist_list[i] - rice_dist, rice_angle_list[i] - rice_angle_plus * rice_dir_list[i] + r);
						var y_aim = obj_boss.y + lengthdir_y(rice_dist_list[i] - rice_dist, rice_angle_list[i] - rice_angle_plus * rice_dir_list[i] + r);
						var ang = find_angle(x_pos,y_pos,x_aim,y_aim) + 180;
						shoot(DAN_MENTOS,col,x_pos,y_pos,ang,0,sfx_redirect2,3);
					}
				}
			
			}
			else
			{
				if(rice_time_list[i] > spawn_time + wait_move)
				{
					var spell = self;
					with(obj_danmaku3)
					{
						if(spell.rice_dir_list[i] == 1)
						{
							if(color_id == 4)
							{
								state = 1;
							}
						}
						else
						{
							if(color_id == 3)
							{
								state = 1;
							}
						}
					}
			
					array_delete(rice_angle_list,i,1)
					array_delete(rice_time_list,i,1)
					array_delete(rice_dist_list,i,1)
					array_delete(rice_dir_list,i,1)
				}
			}
		
		}
		
	
		with(obj_danmaku3)
		{
			switch(state)
			{
				case 0:
					if(state_time == 0)
					{
						var dis = sqrt(sqr(x - obj_player.x) + sqr(y - obj_player.y));
				
						if(dis < 50)
						{
							instance_destroy();	
						}
						else
						{
							state = 10;	
						}
					}
				break;
				case 1:
					spd = goto_value(spd,rice_spd,rice_accel);
				break;
			}
		}
		
		
	}
}
// Inherit the parent event
event_inherited();

