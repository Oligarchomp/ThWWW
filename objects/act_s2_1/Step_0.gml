/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var bubble_wait = 46;
			var bubble_row = 1;
			var bubble_spd_min = 2.9;
			var bubble_spd_max = 3;
			var bubble_arc = 1;
			var bubble_dist = 0;
	
			var pellet_ring = 10;
		break;
		case 1:
			var bubble_wait = 40;
			var bubble_row = 3;
			var bubble_spd_min = 3.5;
			var bubble_spd_max = 4.5;
			var bubble_arc = 1;
			var bubble_dist = 0;
	
			var pellet_ring = 17;
		break;
		case 2:
			var bubble_wait = 34;
			var bubble_row = 3;
			var bubble_spd_min = 3.5;
			var bubble_spd_max = 5;
			var bubble_arc = 1;
			var bubble_dist = 0;
	
			var pellet_ring = 22;
		break;
		case 3:
			var bubble_wait = 30;
			var bubble_row = 3;
			var bubble_spd_min = 3.8;
			var bubble_spd_max = 5.3;
			var bubble_arc = 3;
			var bubble_dist = 46;
	
			var pellet_ring = 26;
		break;
	}
	
	var fairy_life = 30;
	var fairy_lenght = 120;
	
	
	switch(step)
	{
		case 0:
		//case 250:
			var inst = create_enemy(EN_BLUE,50,-20,fairy_life,1,4,-90)
			inst.item_nbr = 2;
			var inst = create_enemy(EN_BLUE,150,-20,fairy_life,1,4,-90)
			inst.item_nbr = 2;
			var inst = create_enemy(EN_BLUE,250,-20,fairy_life,1,4,-90)
			inst.item_nbr = 2;
			var inst = create_enemy(EN_BLUE,350,-20,fairy_life,1,4,-90)
			inst.item_nbr = 2;
		break;
		case wait_card:
			instance_create_depth(0,0,0,obj_stagecard);
		break;
	}
	
	
	
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
			case 1:
				if(state_time < fairy_lenght)
				{
					if(state_time % bubble_wait == 0)
					{
						shoot_arc_row(DAN_BUBBLE,1,bubble_arc,bubble_row,x,y,999,bubble_dist,bubble_spd_min,bubble_spd_max,sfx_redirect1,5);	
						var sp = bubble_spd_min - (bubble_spd_max - bubble_spd_min) / bubble_row;
						shoot_ring(DAN_MENTOS,2,pellet_ring,x,y,999,sp,noone,4);
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
				}
			break;
			case 3:
				spd = goto_value(spd,3,0.05);
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

