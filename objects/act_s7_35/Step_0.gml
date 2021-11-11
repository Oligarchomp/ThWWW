/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	var arrow_wait = 28;
	var arrow_ring = 12;
	var arrow_row = 3;
	var arrow_spd_min = 2.3;
	var arrow_spd_max = 3.5;
	
	var mentos_wait = 3;
	var mentos_arc = 6;
	var mentos_spd = 3;
	var mentos_dist = 18;
	var mentos_spin = -38.5;
	
	var y_ref = 150;
	
	var fairy_life = 60;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_RED,-20,y_ref,fairy_life,2,8.5,0);
			inst.item_nbr = 12;
			inst.angle_shoot = 90;
			inst.dan_dir = 1;
		break;
		case 10:
			var inst = create_enemy(EN_BLUE,-50,y_ref - 30,fairy_life,2,8.5,0);
			inst.angle_shoot = rng(360,false,5);
			inst.dan_dir = 1;
			inst.item_nbr = 10;
		break;
		case 290:
			var inst = create_enemy(EN_RED,room_width + 20,y_ref,fairy_life,2,8.5,180);
			inst.item_nbr = 12;
			inst.angle_shoot = 90;
			inst.dan_dir = -1;
		break;
		case 300:
			var inst = create_enemy(EN_BLUE,room_width + 50,y_ref - 30,fairy_life,2,8.5,180);
			inst.angle_shoot = rng(360,false,5);
			inst.dan_dir = -1;
			inst.item_nbr = 10;
		break;
	}
	
	
	
	
	with(obj_enemy)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				
				angle += 0.1 * dan_dir;
				
				if(en_type == EN_BLUE)
				{
					if(state_time % arrow_wait == 5)
					{
						for(var i = arrow_spd_min; i < arrow_spd_max; i += (arrow_spd_max - arrow_spd_min) / arrow_row)
						{
							shoot_ring(DAN_ARROW,1,arrow_ring,x,y,angle_shoot,i,sfx_redirect1,1);
							angle_shoot += 180 / arrow_ring;
						}
						angle_shoot += 10 * dan_dir;
					}
				}
				else
				{
					if(state_time % mentos_wait == 0)
					{
						shoot_arc(DAN_MENTOS,6,mentos_arc,x,y,angle_shoot,mentos_dist,mentos_spd,sfx_shot1,2);	
						angle_shoot += mentos_spin * dan_dir;
					}
				}
				
				if(state_time > 170)
				{
					state = 2;
				}
			break;
			case 2://wait
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

