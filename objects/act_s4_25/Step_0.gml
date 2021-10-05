/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var mentos_ring = 13;
			var mentos_spd = 2;
			var mentos_wait = 70;
			
			var spam_wait = 4;
			var spam_shot_spd = 2;
			var spam_grav_accel = 0.05;
			var spam_spd_git = 1;
			var spam_open = 69;
			
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
			
			var spam_wait = 2;
			var spam_shot_spd = 2;
			var spam_grav_accel = 0.05;
			var spam_spd_git = 1;
			var spam_open = 65;
			
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
			
			var spam_wait = 1;
			var spam_shot_spd = 2;
			var spam_grav_accel = 0.05;
			var spam_spd_git = 1;
			var spam_open = 70;
			
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
			
			var spam_wait = 1;
			var spam_shot_spd = 2;
			var spam_grav_accel = 0.05;
			var spam_spd_git = 1;
			var spam_open = 76;
			
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
				if(state_time % spam_wait == 0)
				{
					if(global.difficulty == 3)
					{
						var nbr = 2;
					}
					else
					{
						var nbr = 1;
					}
					for(var i = 0; i < nbr; i += 1) 
					{
						var spd_spam = spam_shot_spd + rng(spam_spd_git,false,i + 2);
						var aim = 90 - spam_open + rng(spam_open * 2,false,i + 1);
						var inst = shoot(DAN_BALL,2,x,y,aim,spd_spam,sfx_shot2,7);
						inst.pos_type = POS_SP;
						inst.y_grav_accel = spam_grav_accel;
						inst.y_grav_max = 6;
					}
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
				shoot_ring(DAN_MENTOS,7,mentos_ring,x,y,999,mentos_spd,sfx_redirect1,8);
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

}
// Inherit the parent event
event_inherited();

