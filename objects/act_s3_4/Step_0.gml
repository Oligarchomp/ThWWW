/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var orb_wait = 36;
			var orb_ring = 8;
			var orb_spd = 2;
			
			var orb_spin = 360 / orb_ring / 2.5
			
			var mentos_wait = 25;
			var mentos_ring = 8;
			var mentos_open = 3;
			var mentos_spd_min = 2.5;
			var mentos_spd_git = 0.8;
		break;
		case 1:
			var orb_wait = 26;
			var orb_ring = 13;
			var orb_spd = 2.5;
			
			var orb_spin = 360 / orb_ring / 2.5
			
			var mentos_wait = 14;
			var mentos_ring = 10;
			var mentos_open = 3.5;
			var mentos_spd_min = 3.2;
			var mentos_spd_git = 1;
		break;
		case 2:
			var orb_wait = 22;
			var orb_ring = 16;
			var orb_spd = 2.5;
			
			var orb_spin = 360 / orb_ring / 2.5
			
			var mentos_wait = 8;
			var mentos_ring = 11;
			var mentos_open = 4;
			var mentos_spd_min = 4.4;
			var mentos_spd_git = 1.2;
		break;
		case 3:
			var orb_wait = 20;
			var orb_ring = 18;
			var orb_spd = 2.5;
			
			var orb_spin = 360 / orb_ring / 2.5
			
			var mentos_wait = 6;
			var mentos_ring = 13;
			var mentos_open = 4;
			var mentos_spd_min = 5;
			var mentos_spd_git = 1.4;
		break;
	}
	
	var orb_lenght = 200;
	
	var small_life = 50;
	
	switch(step)
	{
		case 0:
		case 300:
			var inst = create_enemy(EN_BLACK,room_width / 2,-20,90,2,4,-90)
			inst.item_nbr = 12;
			inst.fairy_dir = act_dir;
			act_dir *= -1;
			
			var inst = create_enemy(EN_BLACK,80,-20,small_life,1,4.5,-90)
			inst.item_nbr = 4;
			
			var inst = create_enemy(EN_BLACK,320,-20,small_life,1,4.5,-90)
			inst.item_nbr = 4;
		break;
	}
	
	//big
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					angle_shoot = 0;
				}
			break;
			case 1://shoot
				if(state_time < orb_lenght)
				{
					if(state_time % orb_wait == 0)
					{
						shoot_ring(DAN_BUBBLE,8,orb_ring,x,y,angle_shoot,orb_spd,sfx_redirect1,7);	
						angle_shoot += orb_spin * fairy_dir;
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 20)
				{
					state = 3;
					angle = 90;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	//big
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					angle_shoot = 0;
				}
			break;
			case 1://shoot
				if(state_time < orb_lenght)
				{
					if(state_time % mentos_wait == 0)
					{
						var aim = find_angle(x,y,obj_player.x,obj_player.y) - mentos_open + rng(mentos_open * 2,false,1);
						shoot_ring(DAN_MENTOS,8,mentos_ring,x,y,aim,mentos_spd_min + rng(mentos_spd_git,false,1),sfx_shot1,6);
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 20)
				{
					state = 3;
					angle = 90;
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

