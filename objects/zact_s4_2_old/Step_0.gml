/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var jelly_wait = 46;
			var jelly_spd = 2;
			var jelly_start = 20;
			var jelly_accel = 0.1;
			var jelly_nbr = 4;
			
			var ring_nbr = 7;
			var ring_wait = 32;
			var ring_spd = 4;
		break;
		case 1:
			var jelly_wait = 30;
			var jelly_spd = 2.5;
			var jelly_start = 20;
			var jelly_accel = 0.1;
			var jelly_nbr = 5;
			
			var ring_nbr = 12;
			var ring_wait = 24;
			var ring_spd = 4.5;
		break;
		case 2:
			var jelly_wait = 25;
			var jelly_spd = 2.5;
			var jelly_start = 20;
			var jelly_accel = 0.1;
			var jelly_nbr = 7;
			
			var ring_nbr = 15;
			var ring_wait = 20;
			var ring_spd = 5;
		break;
		case 3:
			var jelly_wait = 22;
			var jelly_spd = 2.5;
			var jelly_start = 20;
			var jelly_accel = 0.1;
			var jelly_nbr = 8;
			
			var ring_nbr = 18;
			var ring_wait = 18;
			var ring_spd = 5;
		break;
	}
	
	var row_life = 3;
	var row_wait = 20;
	var row_ang = 50;
	
	var big_life = 42;
	var big_shoot_lenght = 180;
	
	switch(step)
	{
		case 0:
			need_fairy_time = 60;
			dir_act = -1;
		break;
		case 80:
			need_fairy_time = 60;
			dir_act = 1;
		break;
		case 150:
			create_enemy(EN_RED,room_width / 2,-20,big_life,2,5,-90);
			create_enemy(EN_RED,140,-20,big_life,2,4,-90);
			create_enemy(EN_RED,260,-20,big_life,2,4,-90);
		break;
		case 160:
			need_fairy_time = 60;
			dir_act = -1;
		break;
		case 240:
			need_fairy_time = 60;
			dir_act = 1;
		break;
		
	}
	
	if(need_fairy_time > 0)
	{
		if(step % row_wait == 0)
		{
			var inst = create_enemy(EN_BLUE,room_width / 2 - 220 * dir_act,300,row_life,3,5,90 - row_ang * dir_act)
			inst.dir_move = dir_act;
		}
		need_fairy_time -= 1;	
	}
	//row
	with(obj_enemy3)
	{
		switch(state)
		{
			case 0:
				if(state_time == 40)
				{
					state = 1;	
					if(dir_move == 1)
					{
						angle_to = 360;
					}
					else
					{
						angle_to = -180;
					}
				}
			break;
			case 1:
				angle = goto_value(angle,angle_to,4);
			break;
		}
		
		if(step % jelly_wait == jelly_wait - 1)
		{
			var angle_shoot = rng(360,false,1);//find_angle(xprevious,yprevious,x,y) + 90;
			shoot_ring(DAN_JELLYBEAN,3,jelly_nbr,x,y,angle_shoot,0,sfx_shot2,6);	
		}
	}
	
	with(obj_danmaku6)
	{
		switch(state)
		{
			case 0:
				if(state_time == jelly_start)
				{
					state = 1;
					play_sound(sfx_redirect1,1,false);
				}
			break;
			case 1:
				spd = goto_value(spd,jelly_spd,jelly_accel);	
			break;
		}
	}
	
	// big
	with(obj_enemy2)
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
			case 1://shoot aim
				if(state_time < big_shoot_lenght)
				{
					if(state_time % ring_wait == 0)
					{
						shoot_ring(DAN_BALL,2,ring_nbr,x,y,999,ring_spd,sfx_shot1,5);
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 30)
				{
					state = 3;
					angle = -90;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.04);
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

