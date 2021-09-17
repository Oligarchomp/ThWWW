/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	// Big fairy
	var big_x_off = 90;
	var big_y_off = -10;
	
	var big_wait = 200;
	var big_life = 130;
	
	
	switch(global.difficulty)
	{
		case 0:
			var aim_arc_nbr = 0;
			
			var mentos_nbr = 3;
			var mentos_plus = 30;
			
			var bubble_ring_nbr = 4;
			var bubble_row_nbr = 1;
			var bubble_spd_max = 3;
		break;
		case 1:
			var aim_arc_nbr = 1;
			
			var mentos_nbr = 6;
			var mentos_plus = 20;
			
			var bubble_ring_nbr = 6;
			var bubble_row_nbr = 2;
			var bubble_spd_max = 3;
		break;
		case 2:
			var aim_arc_nbr = 2;
			
			var mentos_nbr = 10;
			var mentos_plus = 12;
			
			var bubble_ring_nbr = 8;
			var bubble_row_nbr = 2;
			var bubble_spd_max = 3.5;
		break;
		case 3:
			var aim_arc_nbr = 4;
			
			
			var mentos_nbr = 12;
			var mentos_plus = 12;
			
			var bubble_ring_nbr = 10;
			var bubble_row_nbr = 3;
			var bubble_spd_max = 4;
		break;
	}
	
			var mentos_wave = 9;
			var mentos_wait = 12;
	
	
	if (step == 0) or (step == big_wait * 2)
	{
		//big
		var inst = create_enemy(EN_RED,big_x_off,big_y_off,big_life,1,5,-90);
		inst.item_nbr = 5;
		
		//small
		start_spawn_small = true;
		spawn_time_ref = step;
		spawn_x_dir = -1;
	}
	
	
	if (step == big_wait)  or (step == big_wait * 3)
	{
		//big
		var inst = create_enemy(EN_RED,room_width - big_x_off,big_y_off,big_life,1,5,-90);
		inst.item_nbr = 5;
		
		//small
		start_spawn_small = true;
		spawn_time_ref = step;
		spawn_x_dir = 1;
	}
	
		//spawn small
	var spawn_lenght = 60;
	var spawn_wait = 8;
	
	var small_x_off_middle = -150;
	var small_y_off = -120;
	
	var small_life = 4; 
	

	if(start_spawn_small)
	{
		if ((step - spawn_time_ref) < spawn_lenght)
		{
			if ((step - spawn_time_ref) % spawn_wait == 0)
			{
				//small
				var x_pos = room_width / 2 + small_x_off_middle * spawn_x_dir + rng(50,true,1) * spawn_x_dir;
				var inst = create_enemy(EN_BLUE, x_pos,small_y_off,small_life,2,10 + rng(1,false,4),-90);
				inst.item_nbr = 2;
			}
		}
		else
		{
			start_spawn_small = false;
		}
		
	}
	
	//enemy
	// big
	with (obj_enemy1)
	{
		switch(state)
		{
			case 0://arrival
				spd = goto_value(spd,0,0.1)
				if(spd == 0)
				{
					state = 1;
					mentos_angle = rng(360,false,3);
					bubble_angle = 0;
				}
			break;
			case 1: // shoot
				
				
				var bubble_wave = 2;
				
				var shoot_time = mentos_wait * mentos_wave
				
				if (state_time < shoot_time)
				{
					if (state_time % mentos_wait == 0)
					{
						shoot_ring(DAN_MENTOS,7,mentos_nbr,x,y,mentos_angle,4.5,sfx_shot3,3)
						mentos_angle += mentos_plus;
					}
					
					
					if (state_time % (shoot_time / bubble_wave) == 0)
					{
						shoot_ring_row(DAN_BUBBLE,6,bubble_ring_nbr,bubble_row_nbr,x,y,bubble_angle,2,bubble_spd_max,sfx_redirect1,4)
						bubble_angle += 360 / bubble_ring_nbr / 2;
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2://waiting
				if (state_time > 70)
				{
					state = 3;
				}
			break;
			case 3://departure
				spd = 2;
			break;
		}
	}
	
	//small fairy
	
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.25)
				if (spd == 0)
				{
					state = 1;
				}
			break;
			case 1:
				if (state_time == 3)
				{
					state = 2;
				}
			break;
			case 2:
				shoot_arc(DAN_ARROW, 3,aim_arc_nbr,x,y,999,2,5,sfx_shot1,2)
				state = 3;
				
				var is_left = x < room_width / 2;
				if (is_left)
				{
					var x_aim = room_width + 200 + rng(50,true,3);
				}
				else
				{
					var x_aim = - 200 - rng(50,true,3);
				}
				angle = find_angle(x,y,x_aim, -30)
			break;
			case 3:
				spd = goto_value(spd,5,0.1)
			break;
		}
	}
}


// Inherit the parent event
event_inherited();

