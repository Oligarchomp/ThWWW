/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var rice_wave = 110;
			var rice_wait = 9;
			var rice_nbr = 5;
			var rice_spd = 1.5;
			var rice_dist = 19;
			var rice_dist_min = 20;
			var rice_angle_plus = 5;
			var rice_angle_off_plus = 0.1;
			
			var wait_move = 15;
			var spawn_time = 65;
			var rice_accel = 0.02;
			
			var rock_nbr = 5;
			var rock_wait = 100;
			var rock_spd = 1.5;
		break;
		case 1:
			var rice_wave = 110;
			var rice_wait = 7;
			var rice_nbr = 7;
			var rice_spd = 1.8;
			var rice_dist = 17;
			var rice_dist_min = 20;
			var rice_angle_plus = 5;
			var rice_angle_off_plus = 0.1;
			
			var wait_move = 15;
			var spawn_time = 65;
			var rice_accel = 0.02;
			
			var rock_nbr = 7;
			var rock_wait = 72;
			var rock_spd = 2;
		break;
		case 2:
			var rice_wave = 100;
			var rice_wait = 6;
			var rice_nbr = 9;
			var rice_spd = 1.9;
			var rice_dist = 16;
			var rice_dist_min = 20;
			var rice_angle_plus = 4.7;
			var rice_angle_off_plus = 0.8;
			
			var wait_move = 15;
			var spawn_time = 65;
			var rice_accel = 0.02;
			
			var rock_nbr = 9;
			var rock_wait = 66;
			var rock_spd = 2;
		break;
		case 3:
			var rice_wave = 90;
			var rice_wait = 5;
			var rice_nbr = 10;
			var rice_spd = 2;
			var rice_dist = 15;
			var rice_dist_min = 20;
			var rice_angle_plus = 5;
			var rice_angle_off_plus = 0.1;
			
			var wait_move = 15;
			var spawn_time = 65;
			var rice_accel = 0.02;
			
			var rock_nbr = 12;
			var rock_wait = 60;
			var rock_spd = 2.2;
		break;
	}
	//RICE
	if(step % rice_wave == 0)
	{
		array_push(rice_angle_list,rng(360,false,3));
		array_push(rice_time_list,-1);
		array_push(rice_dist_list,rice_dist_min);
		array_push(rice_dir_list,rice_wave_dir);
		
		rice_wave_dir *= -1;
	}
	
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
						var col = 6;
					}
					else
					{
						var col = 5;
					}
					var x_pos = obj_boss.x + lengthdir_x(rice_dist_list[i],rice_angle_list[i] + r);
					var y_pos = obj_boss.y + lengthdir_y(rice_dist_list[i],rice_angle_list[i] + r);	
					
					var x_aim = obj_boss.x + lengthdir_x(rice_dist_list[i] - rice_dist, rice_angle_list[i] - rice_angle_plus * rice_dir_list[i] + r);
					var y_aim = obj_boss.y + lengthdir_y(rice_dist_list[i] - rice_dist, rice_angle_list[i] - rice_angle_plus * rice_dir_list[i] + r);
					var ang = find_angle(x_pos,y_pos,x_aim,y_aim)
					shoot(DAN_STARBIG,col,x_pos,y_pos,ang + rice_angle_off,0,sfx_shot2,3);
				}
				
				rice_angle_off += rice_angle_off_plus * rice_dir_list[i];
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
						if(color_id == 6)
						{
							state = 1;
						}
					}
					else
					{
						if(color_id == 5)
						{
							state = 1;
						}
					}
				}
			
				array_delete(rice_angle_list,i,1)
				array_delete(rice_time_list,i,1)
				array_delete(rice_dist_list,i,1)
				array_delete(rice_dir_list,i,1)
				
				rice_angle_off = 0;
			}
		}
		
	}
	
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				spd += 0.002;
			break;
			case 1:
				spd = goto_value(spd,rice_spd,rice_accel);
			break;
		}
	}
	
	//rock
	if(step % rock_wait == 0)
	{
		shoot_ring(DAN_BUBBLE,7,rock_nbr,obj_boss.x,obj_boss.y,999,rock_spd,sfx_shot1,6);
	}
	
}
// Inherit the parent event
event_inherited();

