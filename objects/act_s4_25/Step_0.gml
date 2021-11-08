/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var arrow_wait = 42;
			var arrow_arc = 3;
			var arrow_row = 1;
			var arrow_dist = 40;
			var arrow_spd_min = 2.5;
			var arrow_spd_max = 3;
			
			var mentos_wait = 60;
			var mentos_ring = 5;
			var mentos_row = 3;
			var mentos_spd_min = 2;
			var mentos_spd_max = 2.5;
		break;
		case 1:
			var arrow_wait = 38;
			var arrow_arc = 3;
			var arrow_row = 2;
			var arrow_dist = 35;
			var arrow_spd_min = 2.5;
			var arrow_spd_max = 4;
			
			var mentos_wait = 60;
			var mentos_ring = 8;
			var mentos_row = 4;
			var mentos_spd_min = 2;
			var mentos_spd_max = 3;
		break;
		case 2:
			var arrow_wait = 35;
			var arrow_arc = 5;
			var arrow_row = 2;
			var arrow_dist = 30;
			var arrow_spd_min = 2.5;
			var arrow_spd_max = 4;
			
			var mentos_wait = 60;
			var mentos_ring = 9;
			var mentos_row = 4;
			var mentos_spd_min = 2;
			var mentos_spd_max = 3;
		break;
		case 3:
			var arrow_wait = 32;
			var arrow_arc = 5;
			var arrow_row = 3;
			var arrow_dist = 26;
			var arrow_spd_min = 2.5;
			var arrow_spd_max = 4.5;
			
			var mentos_wait = 60;
			var mentos_ring = 10;
			var mentos_row = 4;
			var mentos_spd_min = 2;
			var mentos_spd_max = 3;
		break;
	}
	
	var big_life = 90;
	var big_shoot_lenght = 100;
	
	var small_life = 2;
	var small_wait = 26;

	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_GREEN,280,-20,big_life,2,7,-90);
			inst.item_nbr = 6;
		break;
		case 70:
			need_fairy_time = 80;
			dir_small = 1;
		break;
		case 120:
			var inst = create_enemy(EN_GREEN,120,-20,big_life,2,7,-90);
			inst.item_nbr = 6;
		break;
		case 190:
			need_fairy_time = 80;
			dir_small = -1;
		break;
		case 240:
			var inst = create_enemy(EN_GREEN,280,-20,big_life,2,7,-90);
			inst.item_nbr = 6;
		break;
		case 310:
			need_fairy_time = 80;
			dir_small = 1;
		break;
		case 360:
			var inst = create_enemy(EN_GREEN,120,-20,big_life,2,7,-90);
			inst.item_nbr = 6;
		break;
		case 430:
			need_fairy_time = 80;
			dir_small = -1;
		break;
		case 480:
			var inst = create_enemy(EN_GREEN,280,-20,big_life,2,7,-90);
			inst.item_nbr = 6;
		break;
	}
	
	if(need_fairy_time > 0)
	{
		if(need_fairy_time % small_wait == 0)
		{
			if(dir_small == 1)
			{
				var x_pos = 120;
			}
			else
			{
				var x_pos = 280;
			}
			var inst = create_enemy(EN_BLUE,x_pos,-20,small_life,1,3,-90);
			inst.dir_move = dir_small;
		}
		need_fairy_time -= 1;	
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
					angle_shoot = -90
				}
			break;
			case 1://shoot aim
				if(state_time < big_shoot_lenght)
				{
					if(state_time % mentos_wait == 0)
					{
						var sp = mentos_spd_max;
						var ang = 0;
					
						for(var i = 0; i <= mentos_row; i += 1)
						{
							if(sp == mentos_spd_min) or (sp == mentos_spd_max)
							{
								var dan = DAN_BUBBLE;
								var col = 3;
							}
							else
							{
								var dan = DAN_MENTOS;
								var col = 7;
							}
							
							shoot_ring(dan,col,mentos_ring,x,y,angle_shoot + ang,sp,sfx_redirect1,5);
							shoot_ring(dan,col,mentos_ring,x,y,angle_shoot - ang,sp,sfx_redirect1,5);
							
							sp -= (mentos_spd_max - mentos_spd_min) / mentos_row;
							ang += 180 / mentos_ring / mentos_row;
						}
						
						//angle_shoot += 180 / mentos_ring;
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 40)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2,y - 30);
				}
			break;
			case 3:
				spd = goto_value(spd,3.5,0.05);
			break;
		}
		
	}

	//small
	with(obj_enemy1)
	{
		if(state <= 1)
		{
			if(step % arrow_wait == 0)
			{
				shoot_arc_row(DAN_ARROW,1,arrow_arc,arrow_row,x,y,999,arrow_dist,arrow_spd_min,arrow_spd_max,sfx_shot1,3);
			}
		}
		switch(state)
		{
			case 0:
				if(state_time == 30)
				{
					state = 1;
					angle_final = -90 + 90 * dir_move;
				}
			break;
			case 1:
				angle = goto_value(angle,angle_final,3);
				if(angle = angle_final)
				{
					state = 2;
				}
			break;
			
		}
	}

	

}
// Inherit the parent event
event_inherited();

