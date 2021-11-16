/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var bubble_wait = 28;
			var bubble_ring = 8;
			var bubble_spd = 3;
			var pellet_ring = bubble_ring * 3;
			var pellet_dist_div = 3;
		break;
		case 1:
			var bubble_wait = 20;
			var bubble_ring = 12;
			var bubble_spd = 3;
			var pellet_ring = bubble_ring * 3;
			var pellet_dist_div = 3;
		break;
		case 2:
			var bubble_wait = 18;
			var bubble_ring = 14;
			var bubble_spd = 3;
			var pellet_ring = bubble_ring * 3;
			var pellet_dist_div = 3;
		break;
		case 3:
			var bubble_wait = 16;
			var bubble_ring = 17;
			var bubble_spd = 3;
			var pellet_ring = bubble_ring * 3;
			var pellet_dist_div = 3;
		break;
	}
	
	var shoot_lenght = 100;
	
	var fairy_life = 130;
	switch(step)
	{
		case 0:
		
			var inst = create_enemy(EN_BLUE,room_width - 60, -10,fairy_life,5,5,-90);
			inst.side = -1;
			inst.item_nbr = 5;
		break;
		case 200:
			var inst = create_enemy(EN_BLUE,60, -10,fairy_life,5,5,-90);
			inst.side = 1;
			inst.item_nbr = 5;
		break;
	}
	
	with(obj_enemy5)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.15);
				if(spd == 0)
				{
					state = 1;
					
					angle_shoot = find_angle(x,y,obj_player.x,obj_player.y);
					aim = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 1://shoot
				if(state_time < shoot_lenght)
				{
					if(state_time % bubble_wait == 0)
					{
						shoot_ring(DAN_BUBBLE,1,bubble_ring,x,y,aim,bubble_spd,sfx_redirect1,5);
						shoot_ring(DAN_PELLET,7,pellet_ring,x,y,aim,bubble_spd,noone,4);
						aim += (360 / bubble_ring / pellet_dist_div) * side;
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 60)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2,y);
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.1);
			break;
		}
	}
	
}


// Inherit the parent event
event_inherited();

