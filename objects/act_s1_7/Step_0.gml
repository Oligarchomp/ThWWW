/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	var wait = 22;
	var x_off = 30;
			
	var fairy_spd = 6;
	var fairy_life = 10;
	
	switch(global.difficulty)
	{
		case 0:
			var ring_nbr = 8;
			var ring_spd = 4;
			var arrow_nbr = 1;
			var arrow_spd = 3;
		break;
		case 1:
			var ring_nbr = 12;
			var ring_spd = 3.5;
			var arrow_nbr = 3;
			var arrow_spd = 3.5;
		break;
		case 2:
			var ring_nbr = 16;
			var ring_spd = 4;
			var arrow_nbr = 5;
			var arrow_spd = 4;
		break;
		case 3:
			var ring_nbr = 20;
			var ring_spd = 2.5;
			var arrow_nbr = 5;
			var arrow_spd = 5;
		break;
	}
	
	
	if(!instance_exists(obj_spell))
	{
		if (step < act_lenght - 60)
		{
			if(step % wait == 0)
			{
				var x_pos = x_off + (step * 87) % (room_width - 2 * x_off) 
				var inst = create_enemy(EN_BLUE,x_pos,-20,fairy_life ,1)
				inst.angle = -90;
				inst.spd = fairy_spd;
				inst.dir_to_go = rng(2,true,1) - 1;
				inst.item_nbr = 1;
			}
	
			if(step % wait == wait / 2)
			{
				var x_pos = x_off + (step * 117) % (room_width - 2 * x_off) 
				var inst = create_enemy(EN_RED,x_pos,-20,fairy_life ,1)
				inst.angle = -90;
				inst.spd = fairy_spd;
				inst.dir_to_go = rng(2,true,1) - 1;
				inst.item_nbr = 1;
			}
		}
	
	
		with(obj_enemy1)
		{
			switch(state)
			{
				case 0: //arrival
					spd = goto_value(spd,0,0.2);
					if(spd == 0)
					{
						state = 1;
					}
				break;
				case 1://shoot
					switch(en_type)
					{
						case EN_BLUE:
							shoot_arc(DAN_ARROW,7,arrow_nbr,x,y,999,2,arrow_spd,sfx_shot2,3)
						break;
						case EN_RED:
							shoot_ring(DAN_RICE,6,ring_nbr,x,y,999,ring_spd,sfx_shot1,3);
						break;
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
	
}



// Inherit the parent event
event_inherited();

