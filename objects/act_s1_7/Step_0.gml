/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	
	var x_off = 30;
			
	var fairy_spd = 6;
	var fairy_life = 10;
	
	switch(global.difficulty)
	{
		case 0:
			var ring_nbr = 8;
			var ring_spd = 2.5;
			var arrow_nbr = 1;
			var arrow_spd = 3;
			
			var wait = 40;
		break;
		case 1:
			var ring_nbr = 15;
			var ring_spd = 2.5;
			var arrow_nbr = 3;
			var arrow_spd = 3.5;
			
			var wait = 30;
		break;
		case 2:
			var ring_nbr = 22;
			var ring_spd = 2.5;
			var arrow_nbr = 5;
			var arrow_spd = 4;
			
			var wait = 22;
		break;
		case 3:
			var ring_nbr = 32;
			var ring_spd = 2.5;
			var arrow_nbr = 5;
			var arrow_spd = 5;
			
			var wait = 22;
		break;
	}
	
	
	if(instance_exists(obj_spell))
	{
		time_wait = 90;
	}
	
	if(time_wait > 0)
	{
		time_wait -= 1;
	}
	
	if(time_wait == 0)
	{
		if (step < act_lenght - 60)
		{
			if(step % wait == 0)
			{
				var x_pos = x_off + (step * 87) % (room_width - 2 * x_off) 
				var inst = create_enemy(EN_BLUE,x_pos,-20,fairy_life ,1,fairy_spd,-90)
				inst.dir_to_go = rng(2,true,1) - 1;
				inst.item_nbr = 1;
				inst.can_revenge = false;
			}
	
			if(step % wait == wait / 2)
			{
				var x_pos = x_off + (step * 117) % (room_width - 2 * x_off) 
				var inst = create_enemy(EN_RED,x_pos,-20,fairy_life ,1,fairy_spd,-90)
				inst.dir_to_go = rng(2,true,1) - 1;
				inst.item_nbr = 1;
				inst.can_revenge = false;
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
						angle = find_angle(x,y,obj_player.x,obj_player.y);//find_angle(x,y,room_width / 2 + room_width * dir_to_go, -10)
					}
				break;
				case 3:
					spd = goto_value(spd,5,0.04);
				break;
			}
		}
	}
	
}



// Inherit the parent event
event_inherited();

