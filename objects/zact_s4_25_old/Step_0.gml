/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var mentos_ring = 10;
			var mentos_spd = 2;
			var mentos_wait = 70;
			
			var arc_wait = 800;
			var arc_nbr = 3;
			var arc_dist = 20;
			var arc_spd_shot = 2.6;
			var arc_grav = 0.04;
			var arc_grav_max = 8;
			
			var arrow_spd_shot = 11;
			var arrow_spd_final = 3;
			var arrow_arc = 1;
			var arrow_dist = 1;
			var arrow_wait = 50;
		break;
		case 1:
			var mentos_ring = 18;
			var mentos_spd = 2.3;
			var mentos_wait = 62;
			
			var arc_wait = 18;
			var arc_nbr = 11;
			var arc_dist = 11;
			var arc_spd_shot = 2.5;
			var arc_grav = 0.04;
			var arc_grav_max = 11;
			
			var arrow_spd_shot = 11;
			var arrow_spd_final = 3.5;
			var arrow_arc = 3;
			var arrow_dist = 2;
			var arrow_wait = 48;
		break;
		case 2:
			var mentos_ring = 22;
			var mentos_spd = 2.5;
			var mentos_wait = 56;
			
			var arc_wait = 15;
			var arc_nbr = 15;
			var arc_dist = 9;
			var arc_spd_shot = 2.5;
			var arc_grav = 0.04;
			var arc_grav_max = 11;
			
			var arrow_spd_shot = 11;
			var arrow_spd_final = 3.5;
			var arrow_arc = 5;
			var arrow_dist = 1;
			var arrow_wait = 48;
		break;
		case 3:
			var mentos_ring = 30;
			var mentos_spd = 3;
			var mentos_wait = 50;
			
			var arc_wait = 13;
			var arc_nbr = 17;
			var arc_dist = 7;
			var arc_spd_shot = 2.5;
			var arc_grav = 0.04;
			var arc_grav_max = 11;
			
			var arrow_spd_shot = 11;
			var arrow_spd_final = 3.5;
			var arrow_arc = 5;
			var arrow_dist = 2;
			var arrow_wait = 40;
		break;
	}
	
	var big_life = 90;
	var big_shoot_lenght = 100;
	
	var small_life = 2;
	var small_wait = 26;

	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_RED,280,-20,big_life,2,8,-90);
			inst.item_nbr = 6;
		break;
		case 30:
			need_fairy_time = 80;
			dir_small = 1;
		break;
		case 120:
			var inst = create_enemy(EN_RED,120,-20,big_life,2,8,-90);
			inst.item_nbr = 6;
		break;
		case 150:
			need_fairy_time = 80;
			dir_small = -1;
		break;
		case 240:
			var inst = create_enemy(EN_RED,280,-20,big_life,2,8,-90);
			inst.item_nbr = 6;
		break;
		case 270:
			need_fairy_time = 80;
			dir_small = 1;
		break;
		case 360:
			var inst = create_enemy(EN_RED,120,-20,big_life,2,8,-90);
			inst.item_nbr = 6;
		break;
		case 390:
			need_fairy_time = 80;
			dir_small = -1;
		break;
		case 480:
			var inst = create_enemy(EN_RED,room_width / 2,-20,big_life,2,8,-90);
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
				}
				
				if(state_time % arc_wait == 0)
				{
					shoot_arc(DAN_MENTOS,2,arc_nbr,x,y,90,arc_dist,arc_spd_shot,sfx_shot2,8);
				}
			break;
			case 1://shoot aim
				if(state_time < big_shoot_lenght)
				{
					
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
	
		if(state <= 1)
		{
			if(step % mentos_wait == 0)
			{
				shoot_ring(DAN_MENTOS,7,mentos_ring,x,y,999,mentos_spd,sfx_redirect1,7);
			}
		}
		
	}

	//small
	with(obj_enemy1)
	{
		if(state <= 1)
		{
			if(step % arrow_wait == 0)
			{
				shoot_arc(DAN_ARROW,6,arrow_arc,x,y,999,arrow_dist,arrow_spd_shot,sfx_shot2,5);
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
	
	with(obj_danmaku5)
	{
		spd = goto_value(spd,arrow_spd_final,0.3);
	}
	
	with(obj_danmaku8)
	{
		pos_type = POS_SP;
		y_grav_accel = arc_grav;
		y_grav_max = arc_grav_max;
		if(y < 200)
		{
			y_offscreen = 200;	
		}
		else
		{
			y_offscreen = 20;
		}
	}

}
// Inherit the parent event
event_inherited();

