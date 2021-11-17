/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var wall_nbr = 6;
			var wall_in = 3;
			var wall_dist = 2;
			var wall_spd = 1.8;
			var wall_wait = 80;
			
			var arrow_wait = 6;
			var arrow_arc = 3;
			var arrow_spd = 2.5;
			var arrow_dist = 36;
			var arrow_spin = 38;
		break;
		case 1:
			var wall_nbr = 10;
			var wall_in = 3;
			var wall_dist = 2;
			var wall_spd = 2;
			var wall_wait = 75;
			
			var arrow_wait = 4;
			var arrow_arc = 4;
			var arrow_spd = 2.8;
			var arrow_dist = 32;
			var arrow_spin = 34;
		break;
		case 2:
			var wall_nbr = 13;
			var wall_in = 3;
			var wall_dist = 2.5;
			var wall_spd = 2;
			var wall_wait = 72;
			
			var arrow_wait = 3;
			var arrow_arc = 5;
			var arrow_spd = 3;
			var arrow_dist = 28;
			var arrow_spin = 30;
		break;
		case 3:
			var wall_nbr = 16;
			var wall_in = 3;
			var wall_dist = 2.5;
			var wall_spd = 2;
			var wall_wait = 70;
			
			var arrow_wait = 3;
			var arrow_arc = 6;
			var arrow_spd = 3;
			var arrow_dist = 28;
			var arrow_spin = 30;
		break;
	}
	
	
	var wall_lenght = 180;
	var wall_fairy_wait = 210;
	var wall_life = 40;
	if(step < wall_fairy_wait * 4)
	{
		if (step % wall_fairy_wait == 0)
		{
			var inst = create_enemy(EN_BLUE,room_width / 2 - 84,-20,wall_life,2,4.5,-90);
			inst.item_nbr = 5;
			var inst = create_enemy(EN_BLUE,room_width / 2 + 84,-20,wall_life,2,4.5,-90);
			inst.item_nbr = 5;
		}
	}
	
	var dan_wait = 200;
	var dan_life = 30;
	
	if(step < dan_wait * 4)
	{
		if (step % dan_wait == 0)
		{
			var inst = create_enemy(EN_GREEN,room_width / 2 + 150 * act_dir,-20,dan_life,1,5,-90);
			inst.fairy_dir = act_dir;
			inst.item_nbr = 2;
		
			act_dir *= -1;
		}
	}
	
	//wall
	with(obj_enemy2)
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
			case 1://shoot
				if(state_time < wall_lenght)
				{
					if(state_time % wall_wait == 0)
					{
						var ang = find_angle(x,y,obj_player.x,obj_player.y);//rng(360,false,3);
						for(var i = ang; i < ang + 360; i += 360 / wall_nbr)
						{
							shoot_arc(DAN_MENTOS,7,wall_in,x,y,i,wall_dist,wall_spd,sfx_shot1,5);
							shoot_arc(DAN_MENTOS,7,wall_in,x,y,i + 360 / wall_nbr / 2,-wall_dist,wall_spd + 0.5,sfx_shot1,5);
						}
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 10)
				{
					state = 3;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	//not wall
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2,y);
					angle_shoot = 0;
				}
			break;
			case 3:
				spd = goto_value(spd,2.5,0.1);
				if(state_time % arrow_wait == 0)
				{
					shoot_arc(DAN_ARROWHEAD,3,arrow_arc,x,y,angle_shoot,arrow_dist,arrow_spd,noone,4);
					shoot_arc(DAN_ARROWHEAD,3,arrow_arc,x,y,angle_shoot + 180,arrow_dist,arrow_spd,sfx_shot3,4);
					angle_shoot += arrow_spin * fairy_dir;
				}
			break;
		}
	}
	
	
}
// Inherit the parent event
event_inherited();

