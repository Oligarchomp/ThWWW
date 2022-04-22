/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var mentos_arc = 5;
			var mentos_row = 4;
			var mentos_spd_min = 2;
			var mentos_spd_max = 4;
			var mentos_dist = 36;
			
			var aim_ring = 5;
			var aim_row = 3;
			var aim_spd_min = 1;
			var aim_spd_max = 5;
		break;
		case 1:
			var mentos_arc = 11;
			var mentos_row = 5;
			var mentos_spd_min = 2;
			var mentos_spd_max = 6;
			var mentos_dist = 20;
			
			var aim_ring = 10;
			var aim_row = 5;
			var aim_spd_min = 1;
			var aim_spd_max = 6
		break;
		case 2:
			var mentos_arc = 13;
			var mentos_row = 5;
			var mentos_spd_min = 2;
			var mentos_spd_max = 6;
			var mentos_dist = 12;
			
			var aim_ring = 14;
			var aim_row = 7;
			var aim_spd_min = 1;
			var aim_spd_max = 6.8
		break;
		case 3:
			var mentos_arc = 15;
			var mentos_row = 6;
			var mentos_spd_min = 2;
			var mentos_spd_max = 7;
			var mentos_dist = 9;
			
			var aim_ring = 18;
			var aim_row = 8;
			var aim_spd_min = 1;
			var aim_spd_max = 7.5
		break;
	}
	
	var y_off_blue = 40;
	var fairy_life = 100;
	
	if(step == 0)
	{
		create_enemy(EN_BLACK,-20,y_off_blue,fairy_life,2,6,0);
		create_enemy(EN_BLACK,room_width + 20,y_off_blue,fairy_life,2,6,180);
		
		create_enemy(EN_BLACK,room_width /2,-20,fairy_life,1,6,-90)
		
		var x_off = 50;
		create_enemy(EN_BLACK,room_width /2 + x_off,-20,fairy_life,1,6,-90)
		create_enemy(EN_BLACK,room_width /2 - x_off,-20,fairy_life,1,6,-90)
		
	}
	
	
	//blue
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot
				shoot_ring_row(DAN_BUBBLE,8,aim_ring,aim_row,x,y,999,aim_spd_min,aim_spd_max,sfx_redirect1,3);
				state = 2;
				life = min(life,10);
			break;
			case 2://wait
				if(state_time == 80)
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
	
	//red
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot
				shoot_arc_row(DAN_MENTOS,8,mentos_arc,mentos_row,x,y,999,mentos_dist,mentos_spd_min,mentos_spd_max,sfx_shot1,2);
				state = 2;
				life = min(life,10)
			break;
			case 2://wait
				if(state_time == 80)
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

