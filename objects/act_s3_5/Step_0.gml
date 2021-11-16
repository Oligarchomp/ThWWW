/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var ring_nbr = 5;
			var ring_spd = 2;
			
			var aim_spd = 2;
			var aim_wait = 6;
			var aim_lenght = 5;
			var aim_start = 15;
		break;
		case 1:
			var ring_nbr = 10;
			var ring_spd = 2;
			
			var aim_spd = 2.5;
			var aim_wait = 6;
			var aim_lenght = 35;
			var aim_start = 15;
		break;
		case 2:
			var ring_nbr = 17;
			var ring_spd = 2;
			
			var aim_spd = 4;
			var aim_wait = 6;
			var aim_lenght = 50;
			var aim_start = 15;
		break;
		case 3:
			var ring_nbr = 22;
			var ring_spd = 2.8;
			
			var aim_spd = 4.5;
			var aim_wait = 6;
			var aim_lenght = 50;
			var aim_start = 15;
		break;
	}
	
	var fairy_hor = 6;
	var fairy_ver = 3;
	var fairy_x_off = 30;
	var fairy_y_dist = 30;
	
	var fairy_life = 8;
	
	
	var yy_spd = 4;
	var yy_life = 40;
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
				case 120:
				case 240:
				case 360:
				case 480:
				case 600:
					need_fairy = true;
					yy_need_time = 60;
					yy_side *= -1;
					fairy_w += 1;
				break;
			}
		break;
	}
	
	if(need_fairy)
	{
		need_fairy = false;
		
		var dist = (room_width - 2 * fairy_x_off) / fairy_hor;
		for(var i = fairy_x_off; i < room_width - fairy_x_off; i += dist)
		{
			for(var j = -10; j > -10 - fairy_y_dist * fairy_ver; j -= fairy_y_dist)
			{
				var inst = create_enemy(EN_RED,i + dist / 2,j,fairy_life,2,7,-90);
				inst.item_nbr = 1;
				inst.wave = fairy_w;
			}
		}
	}
	
	if(yy_need_time > 0)
	{
		yy_need_time -= 1;
		if(yy_need_time == 0)
		{
			var x_pos = room_width / 2 + 220 * yy_side;
			var y_pos = 150;
			var ang = find_angle(x_pos,y_pos,room_width/2,y_pos);
			var inst = create_enemy(EN_BLUE,x_pos,y_pos,yy_life,1,yy_spd,ang);
			inst.item_nbr = 2;
		}
	}
	
	//static fairy
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0: //coming down
				spd = goto_value(spd,0,0.2);
				if (spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shooting
				
					shoot_ring(DAN_ARROWHEAD,7,ring_nbr + wave,x,y,90,ring_spd,sfx_shot3,3);

					state = 2;
			break;
			case 2: //waiting
				if (state_time > 30)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2,y) + 180;
				}
			break;
			case 3: //leaving
				spd = goto_value(spd,3,0.1);
			break;
		}
	}
	
	//aim fairy
	with(obj_enemy1)
	{
		if(step > aim_start)
		{
			if(step < aim_start + aim_lenght)
			{
				if(step % aim_wait == 0)
				{
					shoot(DAN_MENTOS,3,x,y,999,aim_spd,sfx_shot1,4);
				}
			}
			else
			{
				angle = goto_value(angle,90,1.5);
			}
		}
		
	}
	
}

// Inherit the parent event
event_inherited();

