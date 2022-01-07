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
			
			var dist_off = 3;
			
			//aim
			var mentos_wait = 35;
			var mentos_spd = 3.5;
			var mentos_arc = 1;
			var mentos_dist = 0;
			var aim_lenght = 80;
		break;
		case 1:
			var bubble_wait = 20;
			var bubble_ring = 12;
			var bubble_spd = 3;
			var pellet_ring = bubble_ring * 3;
			var pellet_dist_div = 3;
			
			var dist_off = 3;
			
			//aim
			var mentos_wait = 22;
			var mentos_arc = 3;
			var mentos_dist = 50;
			var mentos_spd = 4;
			var aim_lenght = 100;
		break;
		case 2:
			var bubble_wait = 18;
			var bubble_ring = 15;
			var bubble_spd = 3;
			var pellet_ring = bubble_ring * 3;
			var pellet_dist_div = 3;
			
			var dist_off = 3;
			
			//aim
			var mentos_wait = 18;
			var mentos_arc = 3;
			var mentos_dist = 38;
			var mentos_spd = 4.4;
			var aim_lenght = 100;
		break;
		case 3:
			var bubble_wait = 16;
			var bubble_ring = 18;
			var bubble_spd = 3;
			var pellet_ring = bubble_ring * 3;
			var pellet_dist_div = 3;
			
			var dist_off = 3;
			
			//aim
			var mentos_wait = 15;
			var mentos_arc = 3;
			var mentos_dist = 30;
			var mentos_spd = 4.5;
			var aim_lenght = 100;
		break;
	}
	
	var fairy_life = 170;
	var small_fairy_life = 6;
	
	var fairy_lenght = 120;
	var fairy_off = 40;
	var fairy_wait = 10;
	
	
	var shoot_lenght = 100;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_BLUE,80, -10,fairy_life,5,5,-90);
			inst.side = 1;
			inst.item_nbr = 5;
		break;
		case 20:
			need_fairy_time = fairy_lenght;
			need_fairy_spr_dir *= -1;
			step_ref = step;
		break;
		case 250:
			var inst = create_enemy(EN_BLUE,room_width - 80, -10,fairy_life,5,5,-90);
			inst.side = -1;
			inst.item_nbr = 5;
		break;
		case 270:
			need_fairy_time = fairy_lenght;
			need_fairy_spr_dir *= -1;
			step_ref = step;
		break;
	}
	
	
	
	if(need_fairy_time > 0)
	{
		if(step % fairy_wait == 0)
		{
			if(need_fairy_spr_dir==1)
			{
				var x_pos = fairy_off + ((step - step_ref) * 45) % (room_width - fairy_off * 3);
			}
			else
			{
				var x_pos = room_width - fairy_off - ((step - step_ref) * 45) % (room_width - fairy_off * 3);
			}
			var inst = create_enemy(EN_BLUE,x_pos,-20,small_fairy_life,4,5,-90);
			inst.item_nbr = 1;
		}
		need_fairy_time -= 1;
	}
	
	
	with(obj_enemy5)//big
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
						shoot_ring(DAN_MENTOS,1,bubble_ring,x,y,aim + 180 / bubble_ring,bubble_spd,sfx_redirect1,4);
						//shoot_ring(DAN_PELLET,7,pellet_ring,x,y,aim,bubble_spd,noone,4);
						
						aim += (360 / bubble_ring / pellet_dist_div - dist_off) * side;
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
	
	//smol
	with(obj_enemy4)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.15);
				if(spd == 0)
				{
					state = 1;
					angle = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 1://shoot
				spd = goto_value(spd,2.5,0.02);
				
				
				if(state_time < aim_lenght)
				{
					if(state_time % mentos_wait == 0)
					{
						shoot_arc(DAN_MENTOS,2,mentos_arc,x,y,999,mentos_dist,mentos_spd,sfx_shot2,2);	
					}
				}
			break;
		}
	}
	
}


// Inherit the parent event
event_inherited();

