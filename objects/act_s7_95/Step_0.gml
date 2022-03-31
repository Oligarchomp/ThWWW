/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{

	var bubble_arc = 6;
	var bubble_row = 5;
	var bubble_dist = 8;
	var bubble_spd_min = 1.5;
	var bubble_spd_max = 6;
	
	var mentos_ring = 30;
	var mentos_row = 4;
	var mentos_spd_min = 1.5;
	var mentos_spd_max = 5.5;

	var fairy_life = 300;
	
	if(step == 0)
	{
		create_enemy(EN_RED,room_width / 2 - 70,-20,fairy_life,3,6,-90);
		create_enemy(EN_RED,room_width / 2 + 70,-20,fairy_life,3,6,-90);
		
		create_enemy(EN_BLUE,room_width /2,-10,fairy_life,3,6.1,-90)
		
		create_enemy(EN_BLUE,-20,50,fairy_life,3,6.1,0)
		create_enemy(EN_BLUE,room_width + 20, 50,fairy_life,3,6.1,180)
		
	}
	
	
	with(obj_enemy3)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
					item_nbr = 15;
				}
			break;
			case 1://shoot
				if(en_type = EN_RED)
				{
					shoot_arc_row(DAN_BUBBLE,6,bubble_arc,bubble_row,x,y,999,bubble_dist,bubble_spd_min,bubble_spd_max,sfx_redirect1,6);
				}
				else
				{
					shoot_ring_row(DAN_MENTOS,7,mentos_ring,mentos_row,x,y,998,mentos_spd_min,mentos_spd_max,sfx_shot1,4);
				}
				state = 2;
				life = min(life,10);
			break;
			case 2://wait
				if(state_time == 120)
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

