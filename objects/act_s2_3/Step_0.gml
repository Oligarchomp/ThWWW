/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			
		break;
		case 1:
			
		break;
		case 2:
		
		break;
		case 3:
			var aim_spd_min = 4.1;
			var aim_spd_max = 4.5;
			var aim_row = 2;
			var aim_arc = 5;
			var aim_dist = 20;
			
			var angle_plus_plus = 5;
			var ball_spd = 2;
			
			var pretty_lenght = 210;
			var pretty_wait = 8;
		break;
	}
	
	var fairy_lenght = 240;
	var fairy_y_off = 250;
	var fairy_wait = 10;
	var fairy_life = 12;
	
	
	
	if(step == 0)
	{
		var inst = create_enemy(EN_RED,room_width / 2, -20,100,2);
		inst.angle = -90;
		inst.spd = 4.5;
	}
	
	if(step < fairy_lenght)
	{
		if(step % fairy_wait == 0)
		{
			var inst = create_enemy(EN_BLUE,-10,fairy_y_off + rng(50,false,3),fairy_life,1);
			inst.angle = 0;
			inst.spd = 8 + rng(2,false,2);
			inst.item_nbr = 1;
			
			var inst = create_enemy(EN_BLUE,room_width + 10,fairy_y_off + rng(50,false,3),fairy_life,1);
			inst.angle = 180;
			inst.spd = 8 + rng(2,false,2);
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
					angle = find_angle(x,y,room_width / 2, -500);
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

