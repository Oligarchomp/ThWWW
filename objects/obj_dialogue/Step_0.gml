/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	if (old_state != state)
	{
		old_state = state;
		state_time = 0;
	}
	else
	{
		state_time += 1;
	}
	
	
	
	
	switch(state)
	{
		case 0://normal 
			diag_alpha = goto_value(diag_alpha,diag_alpha_max,0.1);
			text_alpha = goto_value(text_alpha,1,0.1);
			
			//art_alpha = goto_value(art_alpha,1,0.15);
			text_alpha_diag = goto_value(text_alpha_diag,1,0.2);
		break;
		case 1:// disappearing
			alpha_min = 0;
			
			plr_active_to = 0;
			boss_active_to = 0;
			
			art_alpha_plr_to = 0;
			art_alpha_boss_to = 0;
			
			diag_alpha = goto_value(diag_alpha,0,0.05)
			text_alpha = diag_alpha;
			
			if(diag_alpha == 0)
			{
				if(need_boss_info)
				{
					instance_create_depth(0,0,0,obj_boss_info);
				}
				
				event_next();
				instance_destroy();
			}
		break;
	}
	
	art_alpha_boss = goto_value(art_alpha_boss,art_alpha_boss_to,0.15);
	art_alpha_plr = goto_value(art_alpha_plr,art_alpha_plr_to,0.15);
	
	// setting alpha and position
	plr_active += recursiv(plr_active,plr_active_to,6,.01)
	boss_active += recursiv(boss_active,boss_active_to,6,.01)
	
	x_plr = x_plr_ref + lengthdir_x(active_offset * plr_active,active_angle) 
	y_plr = y_plr_ref + lengthdir_y(active_offset * plr_active,active_angle) 
	
	x_boss = x_boss_ref + lengthdir_x(active_offset * boss_active,180 - active_angle) 
	y_boss = y_boss_ref + lengthdir_y(active_offset * boss_active,180 - active_angle) 
	
	plr_alpha = alpha_min + (plr_active * (1 - alpha_min));
	boss_alpha = alpha_min + (boss_active * (1 - alpha_min));
	
	
	current_step += 1;
	
	
		
	//checking if need to go to next dialogue
	var go_to_next = false;
	
	var wait = wait_list[current_nbr];
	
	if(wait == current_step)
	{
		go_to_next = true;
	}
	else if (wait == -1)
	{
		if(global.shot_pressed)
		{
			go_to_next = true;
		}
		
		//skip hold
		if(global.shot_down)
		{
			skip_time += 1;
		}
		else
		{
			skip_time = 0;
		}
	}
	
	
	if (skip_time > skip_time_ref)// skiping
	{
		if (skip_time % 4 == 0)
		{
			go_to_next = true;
		}
	}
	
	if (auto_skip > 0)
	{
		auto_skip -= 1;
	}
	else
	{
		go_to_next = true;
		auto_skip = auto_skip_ref; //redundant, but to avoid spam of sfx at the end
	}
	
	
	with(obj_boss)
	{
		if(!in_position)
		{
			go_to_next = false;
		}
	}
	
	if (go_to_next) and (state != 1)
	{
		play_sound(sfx_dialogue,1,false);
		
		if (current_nbr < array_length(plr_active_list) - 1)
		{
			current_nbr += 1;
			current_step = 0;
			
			auto_skip = auto_skip_ref;
			
			text_alpha_diag = 0;
		}
		else
		{
			state = 1;
		}
	}

	
	// setting
	if (current_nbr < array_length(plr_active_list))
	{
		if(plr_spr_list[current_nbr] != spr_nothing)
		{
			plr_active_to = plr_active_list[current_nbr];
			plr_spr = plr_spr_list[current_nbr];
			plr_im = plr_im_list[current_nbr];
			art_alpha_plr_to = 1;
		}
		else
		{
			plr_active_to = 0;
			art_alpha_plr_to = 0;
		}
		
		if(boss_spr_list[current_nbr] != spr_nothing)
		{
			boss_active_to = boss_active_list[current_nbr];
			boss_spr = boss_spr_list[current_nbr];
			boss_im = boss_im_list[current_nbr];
			art_alpha_boss_to = 1;
		}
		else
		{
			boss_active_to = 0;
			art_alpha_boss_to = 0;
		}
	}
	
	//stuff that happen
	switch(current_nbr)
	{
		case boss_step:
			if(current_step == 0)
			{
				instance_create_depth(0,0,0,obj_boss);
				obj_boss.spd = 2;
			}
		break;
		case bgm_step:
			if(current_step == 0)
			{
				switch(global.stage)
				{
					case 1:
						set_bgm(mus_boss1);
					break;
					case 2:
						set_bgm(mus_boss2);
					break;
					case 3:
						set_bgm(mus_boss3);
					break;
					case 4:
						set_bgm(mus_boss4);
					break;
					case 5:
						set_bgm(mus_boss5);
					break;
					case 6:
						set_bgm(mus_boss6);
					break;
					case 7:
						set_bgm(noone);
					break;
				}
			}
		break;
		case bgm_step_real:
			if(current_step == 0)
			{
				set_bgm(mus_boss7);
			}
		break;
		case title_step :
			if(current_step == 0)
			{
				instance_create_depth(405,331,depth - 1,obj_bosstitle);
			}
		break;
	}
	
	
	
}