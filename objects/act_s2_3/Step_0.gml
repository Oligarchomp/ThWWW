/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var mentos_row = 3;
			var mentos_spd_min = 2.3;
			var mentos_spd_max = 3.6;
			
			var pretty_wait = 16;
			var pretty_ring = 10;
			var pretty_spd = 3.5;
			var pretty_div = 2;
		break;
		case 1:
			var mentos_row = 4;
			var mentos_spd_min = 2.3;
			var mentos_spd_max = 4;
			
			var pretty_wait = 12;
			var pretty_ring = 16;
			var pretty_spd = 3.5;
			var pretty_div = 2;
		break;
		case 2:
			var mentos_row = 5;
			var mentos_spd_min = 2.5;
			var mentos_spd_max = 5;
			
			var pretty_wait = 10;
			var pretty_ring = 18;
			var pretty_spd = 4;
			var pretty_div = 2;
		break;
		case 3:
			var mentos_row = 6;
			var mentos_spd_min = 2.5;
			var mentos_spd_max = 6;
			
			var pretty_wait = 10;
			var pretty_ring = 20;
			var pretty_spd = 4;
			var pretty_div = 2;
		break;
	}
	
	var pretty_lenght = 240;
	
	var fairy_lenght = 320;
	var fairy_y_off = 110;
	var fairy_wait = 22;
	var fairy_life = 12;
	
	
	
	if(step == 0)
	{
		var inst = create_enemy(EN_RED,room_width / 2, -20,140,2,4.5,-90);
	}
	
	if(step < fairy_lenght)
	{
		if(step % fairy_wait == 0)
		{
			var inst = create_enemy(EN_BLUE,-10,fairy_y_off + rng(50,false,3),fairy_life,1,3 + rng(2,false,2),0);
			inst.item_nbr = 1;
			
			var inst = create_enemy(EN_BLUE,room_width + 10,fairy_y_off + rng(50,false,3),fairy_life,1,3 + rng(2,false,2),180);
			inst.item_nbr = 1;
		}
		
	}
	
	//big
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.15);
				if(spd == 0)
				{
					state = 1;
					angle_shoot = 0;
				}
			break;
			case 1://shoot
				if(state_time < pretty_lenght)
				{
					if(state_time % pretty_wait == 0)
					{
						shoot_ring(DAN_ARROWHEAD,1,pretty_ring,x,y,-90 + angle_shoot,pretty_spd,sfx_redirect1,5);
						shoot_ring(DAN_ARROWHEAD,1,pretty_ring,x,y,-90 - angle_shoot,pretty_spd,sfx_redirect1,5);
						angle_shoot += 180 / pretty_ring / pretty_div;
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 60)
				{
					state = 3;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	
	//smal
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot
					shoot_row(DAN_MENTOS,7,mentos_row,x,y,999,mentos_spd_min,mentos_spd_max,sfx_shot1,6);
					state = 2;
			break;
			case 2:
				if(state_time == 60)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2,y + 100);
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

