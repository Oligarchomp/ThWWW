/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	//intro aimed 
	var x_off_spawn = 30;
	var y_off_spawn = 20;
	
	var fairy_spd = 3.5;
	
	var wave_lenght = 75;
	var wave_time_dif = 40;
	
	var wave1_start = 10
	var wave1_end = wave1_start + wave_lenght 
	var wave_wait = 12;
	var change_time1 = 20;
	
	var start_shoot_top = 2;
	var start_shoot_bottom = 60;
	
	
	var shoot_lengh = 90;
		
	var shoot_wait = 18;
		
	var arc_nbr = 7;
	var arc_spd = 5;
	var arc_dist = 15;
	
	var fairy_life = 5;
	

	if (step > wave1_start) and (step < wave1_end) and (step % wave_wait == 0)
	{
		var inst = create_enemy(EN_GREEN,room_width - x_off_spawn,-y_off_spawn,fairy_life,2,fairy_spd,-90)
		inst.item_nbr = 2;
	}
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				if(state_time == change_time1)
				{
					state = 1;
				}
			break;
			case 1:
				angle = goto_value(angle,0,3);
			break;
		}
		
		if (step > start_shoot_top) and (step < start_shoot_top + shoot_lengh)
		{
			if (step % shoot_wait == 0)
			{
				shoot_arc(DAN_MENTOS,3,arc_nbr,x,y,999,arc_dist,arc_spd,sfx_shot1,6);
			}
		}
		
	}
	
	var wave2_start = wave1_start + wave_time_dif
	var wave2_end = wave2_start + wave_lenght 
	var change_time2 = 30;
	
	if (step > wave2_start) and (step < wave2_end) and (step % wave_wait == 0)
	{
		var inst = create_enemy(EN_GREEN,x_off_spawn,-y_off_spawn,fairy_life,1,fairy_spd,-90);
		inst.item_nbr = 2;
	}
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
				if(state_time == change_time2)
				{
					state = 1;
				}
			break;
			case 1:
				angle = goto_value(angle,-180,3);
			break;
		}
		
		if (step > start_shoot_top) and (step < start_shoot_top + shoot_lengh)
		{
			if (step % shoot_wait == 0)
			{
				shoot_arc(DAN_MENTOS,3,arc_nbr,x,y,999,arc_dist,arc_spd,sfx_shot1,6);
			}
		}
		
	}
	
	var wave3_start = wave2_start + wave_time_dif
	var wave3_end = wave3_start + wave_lenght 
	var change_time3 = 74;
	
	if (step > wave3_start) and (step < wave3_end) and (step % wave_wait == 0)
	{
		var inst = create_enemy(EN_GREEN,room_width - x_off_spawn,room_height + y_off_spawn,fairy_life,4,fairy_spd,90)
		inst.item_nbr = 2;
	}
	with(obj_enemy3)
	{
		switch(state)
		{
			case 0:
				if(state_time == change_time3)
				{
					state = 1;
				}
			break;
			case 1:
				angle = goto_value(angle,0,3);
			break;
		}
		
		if (step > start_shoot_bottom) and (step < start_shoot_bottom + shoot_lengh)
		{
			if (step % shoot_wait == 0)
			{
				shoot_arc(DAN_MENTOS,3,arc_nbr,x,y,999,arc_dist,arc_spd,sfx_shot1,6);
			}
		}
	}
	
	var wave4_start = wave3_start + wave_time_dif
	var wave4_end = wave4_start + wave_lenght 
	var change_time4 = 64;
	
	if (step > wave4_start) and (step < wave4_end) and (step % wave_wait == 0)
	{
		var inst = create_enemy(EN_GREEN,x_off_spawn,room_height + y_off_spawn,fairy_life,3,fairy_spd,90)
		inst.item_nbr = 2;
	}
	with(obj_enemy4)
	{
		switch(state)
		{
			case 0:
				if(state_time == change_time4)
				{
					state = 1;
				}
			break;
			case 1:
				angle = goto_value(angle,180,3);
			break;
		}
		
		if (step > start_shoot_bottom) and (step < start_shoot_bottom + shoot_lengh)
		{
			if (step % shoot_wait == 0)
			{
				shoot_arc(DAN_MENTOS,3,arc_nbr,x,y,999,arc_dist,arc_spd,sfx_shot1,6);
			}
		}
	}
	
	if (step = stagecard_time)
	{
		instance_create_depth(0,0,0,obj_stagecard);
	}
}

// Inherit the parent event
event_inherited();

