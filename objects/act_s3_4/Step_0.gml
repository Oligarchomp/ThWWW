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
			
			var mentos_wait = 18;
			var mentos_ring = 6;
			var mentos_spd_min = 2;
			var mentos_spd_git = 0.5;
		break;
		case 1:
			var orb_wait = 26;
			var orb_ring = 14;
			var orb_spd = 2.5;
			
			var orb_spin = 360 / orb_ring / 2.5
			
			var mentos_wait = 10;
			var mentos_ring = 10;
			var mentos_spd_min = 2;
			var mentos_spd_git = 1;
		break;
		case 2:
			var orb_wait = 22;
			var orb_ring = 16;
			var orb_spd = 2.5;
			
			var orb_spin = 360 / orb_ring / 2.5
			
			var mentos_wait = 9;
			var mentos_ring = 12;
			var mentos_spd_min = 2;
			var mentos_spd_git = 1;
		break;
		case 3:
			var orb_wait = 20;
			var orb_ring = 18;
			var orb_spd = 2.5;
			
			var orb_spin = 360 / orb_ring / 2.5
			
			var mentos_wait = 8;
			var mentos_ring = 14;
			var mentos_spd_min = 2;
			var mentos_spd_git = 1;
		break;
	}
	
	var orb_lenght = 300;
	
	var small_life = 80;
	
	switch(step)
	{
		case 0:
		case 400:
			var inst = create_enemy(EN_RED,room_width / 2,-20,145,2,4,-90)
			inst.item_nbr = 14;
			inst.fairy_dir = act_dir;
			act_dir *= -1;
			
			var inst = create_enemy(EN_GREEN,80,-20,small_life,1,4.5,-90)
			inst.item_nbr = 5;
			
			var inst = create_enemy(EN_GREEN,320,-20,small_life,1,4.5,-90)
			inst.item_nbr = 5;
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
						shoot_ring(DAN_BUBBLE,7,orb_ring,x,y,angle_shoot,orb_spd,sfx_redirect1,7);	
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
						var sp = mentos_spd_min + rng(mentos_spd_git,false,9);
						shoot_ring(DAN_BALL,3,mentos_ring,x,y,rng(360,false,6),sp,sfx_shot1,6);
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

