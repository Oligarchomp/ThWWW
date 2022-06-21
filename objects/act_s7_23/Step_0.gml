/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	var mentos_ring = 5;
	var mentos_wait = 8;
	var mentos_spd_max = 5;
	var mentos_spd_min = 4.9;
	var mentos_open = 1.5;

	var big_life = 60;
	var fairy_lenght = 380;
	
	var aim_wait = 25;
	var aim_arc = 5;
	var aim_spd = 7;
	var aim_dist = 30;
	
	var aim_mentos_wait = 18;


	switch(step)
	{
		case 0:
		case 650:
			var inst = create_enemy(EN_RED,room_width/2 , -20,big_life,6,5,-90);
			inst.item_nbr = 12;
			var inst = create_enemy(EN_RED,room_width/2 + 150, -20,big_life,6,5,-90);
			inst.item_nbr = 12;
			var inst = create_enemy(EN_RED,room_width/2 - 150, -20,big_life,6,5,-90);
			inst.item_nbr = 12;
		break;
		case 280:
		case 930:
			need_fairy_time = 280;
			y_off = 0;
		break;
	}
	
	var fairy_wait = 8;
	
	if(need_fairy_time > 0)
	{
		if(need_fairy_time < 100)
		{
			y_off += 1.5;
		}
			
		if(need_fairy_time % fairy_wait == 0)
		{
			var inst = create_enemy(EN_BLUE,-20,20 + y_off + rng(30,false,6),6,7,5,0);
			inst.item_nbr = 1;
			inst.shot_type = need_fairy_time > 100 ? 1 : 2;
			inst.aim_minus = (100 - need_fairy_time) / 10;
			var inst = create_enemy(EN_BLUE,room_width + 20,20 + y_off + rng(30,false,6),6,7,5,180);
			inst.item_nbr = 1;
			inst.shot_type = need_fairy_time > 100 ? 1 : 2;
			inst.aim_minus = (100 - need_fairy_time) / 10;
		}
		
		need_fairy_time -= 1;
	}
	
	
	//big
	with(obj_enemy6)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.15);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot
				if(state_time < fairy_lenght)
				{
					if(state_time % mentos_wait == 0)
					{
						var aim = rng(360,false,2);
						for(var i = 0; i < 360; i += 360 / mentos_ring)
						{
							shoot(DAN_MENTOS,5,x,y,aim + i,mentos_spd_max,sfx_shot1,4);
							shoot_arc(DAN_MENTOS,5,2,x,y,aim + i,mentos_open,mentos_spd_min,sfx_shot1,5);
						}
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2://wait
				if(state_time == 40)
				{
					state = 3;
					angle = -90;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	with(obj_enemy7)
	{
		if(shot_type == 1)
		{
			if(state_time % aim_wait == 3)
			{
				shoot_arc(DAN_ARROW,1,aim_arc,x,y,999,aim_dist,aim_spd,sfx_shot2,2);
			}
		}
		else
		{
			if(state_time % aim_mentos_wait == 3)
			{
				shoot_arc(DAN_MENTOS,1,aim_arc,x,y,999,aim_dist - aim_minus,aim_spd,sfx_shot1,2);
			}
		}
	}
	
}
// Inherit the parent event
event_inherited();

