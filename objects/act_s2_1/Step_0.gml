/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			
		break;
		case 1:
			
		break;
		case 2:
		
		break;
		case 3:
			var arrowhead_nbr = 16;
			var arrowhead_spd = 3;
			
			var ring_nbr = 24;
			var ring_row = 3;
			var ring_spd_min = 4;
			var ring_spd_max = 4.5;
		break;
	}
	
	
	
	
	var fairy_life = 8;
	var fairy_wait = 18;
	var fairy_spd = 3;
	
	switch(step)
	{
		case wait_card:
			instance_create_depth(0,0,0,obj_stagecard);
		break;
	}
	
	if(step > start) and (step < fairy_end)
	{
		if(step % fairy_wait == 0)
		{
			if(dir_spawn == 1)
			{
				var inst = create_enemy(EN_BLUE,room_width + 10,120,fairy_life,1);
				var inst2 = create_enemy(EN_GREEN,-10,120,fairy_life,1);
			}
			else
			{
				var inst2 = create_enemy(EN_BLUE,-10,120,fairy_life,1);
				var inst = create_enemy(EN_GREEN,room_width + 10,120,fairy_life,1);
			}
			inst.angle = 180 - rng(30,false,1);
			inst.spd = fairy_spd;
				
			inst2.angle = rng(30,false,1);
			inst2.spd = fairy_spd;
			
			inst.item_nbr = 1;
			inst2.item_nbr = 1;
			dir_spawn *= -1;
			
			
		}
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
				switch(en_type)
				{
					case EN_GREEN:
						shoot_ring(DAN_ARROWHEAD,3,arrowhead_nbr,x,y,rng(360,false,7),arrowhead_spd,sfx_shot2,1);
					break;
					case EN_BLUE:
						shoot_ring_row(DAN_ARROWHEAD,2,ring_nbr,ring_row,x,y,999,ring_spd_min,ring_spd_max,sfx_shot3,2);
					break;
				}
				state = 2;
			break;
			case 2:
				if(state_time == 40)
				{
					state = 3;
				}
			break;
			case 3:
				spd = goto_value(spd,5,0.1);
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

