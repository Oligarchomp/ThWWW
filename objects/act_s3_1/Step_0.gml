/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var bubble_ring = 3;
			var bubble_row = 1;
			var bubble_spd_min = 2;
			var bubble_spd_max = 4;
		break;
		case 1:
			var bubble_ring = 5;
			var bubble_row = 1;
			var bubble_spd_min = 2;
			var bubble_spd_max = 5;
		break;
		case 2:
			var bubble_ring = 6;
			var bubble_row = 2;
			var bubble_spd_min = 2;
			var bubble_spd_max = 5;
		break;
		case 3:
			var bubble_ring = 7;
			var bubble_row = 2;
			var bubble_spd_min = 2;
			var bubble_spd_max = 5.5;
		break;
	}
	
	var fairy_wait = 16;
	var fairy_lenght = 260;
	
	var fairy_x_off = 10;
	var fairy_x_git = 40;
	var fairy_life = 11;
	var fairy_angle_off = 6;
	
	switch(state)
	{
		case 0:
			if(state_time < fairy_lenght)
			{
				if(state_time % fairy_wait == 0)
				{
					if ((state_time / fairy_wait) % 2 == 0)
					{
						var inst = create_enemy(EN_WHITE,fairy_x_off + rng(fairy_x_git,false,8),room_height + 20,fairy_life,1,11,90 - rng(fairy_angle_off,false,1));
					}
					else
					{
						var inst = create_enemy(EN_WHITE,room_width - fairy_x_off - rng(fairy_x_git,false,8),room_height + 20,fairy_life,1,11,90 + rng(fairy_angle_off,false,1));
					}
					inst.item_nbr = 2;
				}
			}
		break;
	}
	
	if(step == wait_card)
	{
		instance_create_depth(0,0,0,obj_stagecard);
	}
	
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0: //coming up
				spd = goto_value(spd,0,0.15);
				if (spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shooting
				
					shoot_ring_row(DAN_BUBBLE,7,bubble_ring,bubble_row,x,y,999,bubble_spd_min,bubble_spd_max,sfx_redirect1,3);
					shoot_ring_row(DAN_BUBBLE,7,bubble_ring,bubble_row,x,y,998,bubble_spd_min + 1,bubble_spd_max + 1,sfx_redirect1,3);	

					shoot_ring_row(DAN_ARROWHEAD,7,bubble_ring * 3,bubble_row * 2,x,y,999,bubble_spd_min * 1.2,bubble_spd_max * 1.2,sfx_redirect1,2);
					state = 2;
			break;
			case 2: //waiting
				if (state_time > 30)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2,y - 20);
				}
			break;
			case 3: //leaving
				spd = goto_value(spd,3,0.1);
			break;
		}
	}
	
	
	
}
// Inherit the parent event
event_inherited();

