/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var aim_spd_min = 2.8;
			var aim_spd_max = 3;
			var aim_row = 1;
			var aim_arc = 1;
			var aim_dist = 0;
			
			var angle_plus_plus = 12;
			var ball_spd = 2.2;
			
			var pretty_lenght = 210;
			var pretty_wait = 16;
		break;
		case 1:
			var aim_spd_min = 4;
			var aim_spd_max = 4.5;
			var aim_row = 2;
			var aim_arc = 3;
			var aim_dist = 19;
			
			var angle_plus_plus = 6;
			var ball_spd = 3.5;
			
			var pretty_lenght = 210;
			var pretty_wait = 10;
		break;
		case 2:
			var aim_spd_min = 4.3;
			var aim_spd_max = 5.3;
			var aim_row = 3;
			var aim_arc = 5;
			var aim_dist = 18;
			
			var angle_plus_plus = 6;
			var ball_spd = 3.8;
			
			var pretty_lenght = 210;
			var pretty_wait = 8;
		break;
		case 3:
			var aim_spd_min = 4.5;
			var aim_spd_max = 5.5;
			var aim_row = 3;
			var aim_arc = 5;
			var aim_dist = 16;
			
			var angle_plus_plus = 4;
			var ball_spd = 4;
			
			var pretty_lenght = 210;
			var pretty_wait = 6;
		break;
	}
	
	var fairy_lenght = 240;
	var fairy_y_off = 250;
	var fairy_wait = 30;
	var fairy_life = 20;
	
	
	
	if(step == 0)
	{
		var inst = create_enemy(EN_RED,room_width / 2, -20,130,2,4.5,-90);
	}
	
	if(step < fairy_lenght)
	{
		if(step % fairy_wait == 0)
		{
			var inst = create_enemy(EN_BLUE,-10,fairy_y_off + rng(50,false,3),fairy_life,1,8 + rng(2,false,2),0);
			inst.item_nbr = 2;
			
			var inst = create_enemy(EN_BLUE,room_width + 10,fairy_y_off + rng(50,false,3),fairy_life,1,8 + rng(2,false,2),180);
			inst.item_nbr = 2;
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
					angle_plus = 0;
				}
			break;
			case 1://shoot
				if(state_time < pretty_lenght)
				{
					if(state_time % pretty_wait == 0)
					{
						shoot_ring(DAN_BALL,1,10,x,y,-90 + angle_plus,ball_spd,sfx_shot3,2);
						shoot_ring(DAN_BALL,1,10,x,y,-90 - angle_plus,ball_spd,sfx_shot3,2);
						angle_plus += angle_plus_plus;
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
				angle = goto_value(angle,90,1);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot
					shoot_arc_row(DAN_ARROWHEAD,7,aim_arc,aim_row,x,y,999,aim_dist,aim_spd_min,aim_spd_max,sfx_shot3,1);
					state = 2;
			break;
			case 2:
				if(state_time == 60)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2, y - 100);
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

