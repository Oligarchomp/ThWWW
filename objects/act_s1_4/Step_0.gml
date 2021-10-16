/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	var lenght = 100;
	var wait = 8;
	var x_off = 30;
			
	var fairy_spd = 6;
	
	
	switch(global.difficulty)
	{
		case 0:
			var ring_nbr = 5;
			var row_nbr = 1;
			var arc_nbr = 1;
			var spd_low = 2;
			var spd_high = 2.5;
		break;
		case 1:
			var ring_nbr = 10;
			var row_nbr = 1;
			var arc_nbr = 1;
			var spd_low = 2;
			var spd_high = 3.5;
		break;
		case 2:
			var ring_nbr = 12;
			var row_nbr = 2;
			var arc_nbr = 1;
			var spd_low = 2.5;
			var spd_high = 4;
		break;
		case 3:
			var ring_nbr = 19;
			var row_nbr = 2;
			var arc_nbr = 1;
			var spd_low = 3;
			var spd_high = 5;
		break;
	}
	
	
	
	
	switch(state)
	{
		case 0: //left to right
			if(state_time < lenght)
			{
				if(state_time % wait == 0)
				{
					var x_pos = x_off + state_time / wait * 30
					var inst = create_enemy(EN_GREEN,x_pos,-20,3,5,fairy_spd,-90)
					inst.dir_to_go = -1;
					inst.item_nbr = 1;
				}
			}
			else
			{
				state = 1;
			}
		break;
		case 1://wait
			if (state_time == 60)
			{
				state = 2;
			}
		break;
		case 2: //right to left
			if(state_time < lenght)
			{
				if(state_time % wait == 0)
				{
					var x_pos = room_width - x_off - state_time / wait * 30
					var inst = create_enemy(EN_GREEN,x_pos,-20,3,5,fairy_spd,-90)
					inst.dir_to_go = 1;
					inst.item_nbr = 1;
				}
			}
			else
			{
				state = 3;
			}
		break;
		case 3://wait
			if (state_time == 60)
			{
				state = 4;
			}
		break;
		case 4: //"random"
			var lenght = 150;
			if(state_time < lenght)
			{
				if(state_time % wait == 0)
				{
					var x_pos = x_off + (state_time * 13) % (room_width - x_off*2)
					var inst = create_enemy(EN_GREEN,x_pos,-20,3,5,fairy_spd,-90)
					inst.dir_to_go = rng(2,true,1) - 1;
					inst.item_nbr = 1;
				}
			}
			else
			{
				state = 5;
			}
		break;
		case 5:
		
		break;
	}
	
	with(obj_enemy5)
	{
		switch(state)
		{
			case 0: //arrival
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
					angle_shoot = rng(360,true,1);
				}
			break;
			case 1://shoot
				
				
				repeat(arc_nbr)
				{
					shoot_ring_row(DAN_ARROW,3,ring_nbr,row_nbr,x,y,angle_shoot,spd_low,spd_high,sfx_shot1,6)
					angle_shoot += 2;
				}
				
				with(obj_danmaku6)
				{
					if (spd >= spd_high - 1)
					{
						color_id = 6;
					}
				}
				state = 2;
			break;
			case 2: //waiting for something to happen?
				if(state_time == 2)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2 + room_width * dir_to_go, -10)
				}
			break;
			case 3:
				spd = goto_value(5,spd,0.05)
				
			break;
		}
		
		
	}
	
	
	
	
	
}



// Inherit the parent event
event_inherited();


