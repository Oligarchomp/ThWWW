/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) 
{
	if (spell_wait == 0)
	{
		var spawn_time = 54;
		var rice_wait = 1;
		var rice_angle_plus = 12.5;
		var rice_dist = 10;
		var rice_nbr = 6;
		var wait_move = 66;
	
		var note_spd = 3.5;
		var note_accel = 0.013;
	
		var bubble_ring = 7;
		var bubble_row = 9;
		var bubble_dist_min = 120;
		var bubble_dist = 90;
		var bubble_spin = 15;
		var bubble_accel = 0.015;
		var bubble_spd = 4;
	
		switch(state)
		{
			case 0:
				switch(state_time)
				{
					case 0:
						boss_charge(obj_boss.x,obj_boss.y);
						var inst = boss_charge(obj_player.x,obj_player.y);
						inst.owner = obj_player;
					break;
					case 40:
						with(obj_danmaku)
						{
							cancel_bullet(self);
						}
					
						boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
						boss_release(obj_player.x,obj_player.y,sfx_boss_release);
					
						var x_mem = obj_player.x;
						var y_mem = obj_player.y;
					
						obj_player.x = obj_boss.x;
						obj_player.y = obj_boss.y;
						obj_option.x = obj_player.x;
						obj_option.y = obj_player.y;
					
						obj_boss.x = x_mem;
						obj_boss.y = y_mem;
						obj_boss.x_to = obj_boss.x;
						obj_boss.y_to = obj_boss.y;
					
						x_spawn = obj_player.x;
						y_spawn = obj_player.y;
					
						with(obj_boss)
						{
							my_hitbox.x = x;
							my_hitbox.y = y;
						}
						with(obj_player_hurtbox)
						{
							x = obj_player.x;
							y = obj_player.y;
						}
					
						array_push(rice_angle_list,rng(360,false,3));
						array_push(rice_time_list,-1);
						array_push(rice_dist_list,70);
						array_push(rice_dir_list,act_dir);
					
						var ang = rng(360,false,1);
					
						for(var j = 1; j < 1 + bubble_row; j += 1)
						{
							for(var i = 0; i < 360; i += 360 / bubble_ring)
							{
								var x_pos = x_spawn + lengthdir_x(bubble_dist_min + (j - 1) * bubble_dist,ang + i);
								var y_pos = y_spawn + lengthdir_y(bubble_dist_min + (j - 1) * bubble_dist,ang + i);
								var aim = find_angle(x_pos,y_pos,x_spawn,y_spawn) + j * 5 * -act_dir;
								var inst = shoot(DAN_BUBBLE,3.5 + act_dir * 2.5,x_pos,y_pos,aim,0,sfx_redirect1,7);
								inst.is_cancelable = false;
								inst.x_offscreen = 600;
								inst.y_offscreen = 600;
							}
							ang -=  bubble_spin * act_dir;
						}
					
						act_dir *= -1;
					
						state = 1;
					break;
				
				}
			break;
			case 1:
				if(state_time == 240)
				{
					state = 0;	
				}
			break;
		}
	
	
	
		//RICE
		for(var i = 0; i < array_length(rice_angle_list); i += 1)
		{
			rice_time_list[i] += 1;
			if(rice_time_list[i] < spawn_time)
			{
				while(rice_time_list[i] < spawn_time)
				{
					rice_time_list[i] += 1;
				
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
								var col = 1;
							}
							var x_pos = x_spawn + lengthdir_x(rice_dist_list[i],rice_angle_list[i] + r);
							var y_pos = y_spawn + lengthdir_y(rice_dist_list[i],rice_angle_list[i] + r);	
					
						
							var ang = find_angle(x_pos,y_pos,x_spawn,y_spawn) + rice_time_list[i] * rice_dir_list[i]
							var inst = shoot(DAN_NOTE,col,x_pos,y_pos,ang,0,sfx_redirect2,3);
							inst.x_offscreen = 600;
							inst.y_offscreen = 600;
							inst.is_cancelable = false;
						}
					}
				}
			
			}
			else
			{
				if(rice_time_list[i] > spawn_time + wait_move)
				{
				
					play_sound(sfx_redirect1,1,false);
				
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
							if(color_id == 1)
							{
								state = 1;
							}
						}
					}
				
					with(obj_danmaku7)
					{
						state = 1;	
					}
			
			
					array_delete(rice_angle_list,i,1)
					array_delete(rice_time_list,i,1)
					array_delete(rice_dist_list,i,1)
					array_delete(rice_dir_list,i,1)
				}
			}
		
		}
	
		//note
		with(obj_danmaku3)
		{
			switch(state)
			{
				case 1:
					spd = goto_value(spd,note_spd,note_accel);
				break;
			}
		}
	
		//bubble
		with(obj_danmaku7)
		{
			switch(state)
			{
				case 1:
					spd = goto_value(spd,bubble_spd,bubble_accel);
				break;
			}
		}
	}
	
	
	
	//SHIELD
	if(obj_player.bomb_time != 0)
	{
		if(can_shield)
		{
			obj_boss.alpha = 0.4;
			obj_boss.mask_index = spr_nothing;
			can_shield = false;
			instance_create_depth(obj_boss.x,obj_boss.y,obj_boss.depth - 1, obj_shield_reverence);
		}
	}
	else
	{
		obj_boss.alpha = 1;
		obj_boss.mask_index = spr_boss_hurtbox;
		can_shield = true;
		with(obj_shield_reverence)
		{
			state = 1;	
		}
	}
	
}

// Inherit the parent event
event_inherited();

