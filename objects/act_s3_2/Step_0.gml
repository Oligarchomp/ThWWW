/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var mentos_wait = 12;
			var mentos_ring = 10;
			var mentos_open = 6;
			var mentos_spd_min = 4;
			var mentos_spd_git = 0.8;
		break;
		case 1:
			var mentos_wait = 10;
			var mentos_ring = 12;
			var mentos_open = 7;
			var mentos_spd_min = 4.2;
			var mentos_spd_git = 1.1;
		break;
		case 2:
			var mentos_wait = 8;
			var mentos_ring = 13;
			var mentos_open = 8;
			var mentos_spd_min = 4.4;
			var mentos_spd_git = 1.2;
		break;
		case 3:
			var mentos_wait = 6;
			var mentos_ring = 15;
			var mentos_open = 8;
			var mentos_spd_min = 5;
			var mentos_spd_git = 1.4;
		break;
	}
	
	var f_life = 30;
	var shoot_lenght = 140;
	
	switch(state_time)
	{
		case 0:
		case 162:
		case 324:
		case 488:
			var inst = create_enemy(EN_WHITE,-20,75 + y_plus,f_life,1,4,0);
			inst.item_nbr = 4;
			var inst = create_enemy(EN_WHITE,room_width + 20,75 + y_plus,f_life,1,4,180);
			inst.item_nbr = 4;
			
			y_plus += 25;
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
			case 1://shoot aim
				if(state_time < shoot_lenght)
				{
					if(state_time % mentos_wait == 0)
					{
						var sp = mentos_spd_min + rng(mentos_spd_git,false,9);
						var ang = find_angle(x,y,obj_player.x,obj_player.y) + mentos_open - rng(mentos_open * 2,false,7);
						shoot_ring(DAN_MENTOS,7,mentos_ring,x,y,ang,sp,sfx_shot1,7);
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
					angle = angle + 180;
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

