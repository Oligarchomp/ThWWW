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
			
			var arrow_wait = 6;
			var arrow_nbr = 5;
			var arrow_spd = 4.3;
			var arrow_dist1 = 0;
			var arrow_dist2 = 30;
			var arrow_dist_lenght = 2;
		break;
		case 1:
			var wall_nbr = 10;
			var wall_in = 3;
			var wall_dist = 2;
			var wall_spd = 2;
			
			var arrow_wait = 4;
			var arrow_nbr = 8;
			var arrow_spd = 4.3;
			var arrow_dist1 = 0;
			var arrow_dist2 = 20;
			var arrow_dist_lenght = 3;
		break;
		case 2:
			var wall_nbr = 13;
			var wall_in = 4;
			var wall_dist = 2;
			var wall_spd = 2;
			
			var arrow_wait = 3;
			var arrow_nbr = 10;
			var arrow_spd = 4.3;
			var arrow_dist1 = 0;
			var arrow_dist2 = 12;
			var arrow_dist_lenght = 6;
		break;
		case 3:
			var wall_nbr = 16;
			var wall_in = 4;
			var wall_dist = 2;
			var wall_spd = 2;
			
			var arrow_wait = 3;
			var arrow_nbr = 12;
			var arrow_spd = 4.5;
			var arrow_dist1 = 0;
			var arrow_dist2 = 10;
			var arrow_dist_lenght = 6;
		break;
	}
	
	var wall_wait = 50;
	var wall_life = 50;
	
	if (step % wall_wait == 0)
	{
		if(step/wall_wait < ds_list_size(x_wall))
		{
			var inst = create_enemy(EN_BLUE,x_wall[|step/wall_wait],-20,wall_life,2,4.5,-90);
			inst.item_nbr = 2;
		}
	}
	
	var dan_wait = 200;
	var dan_life = 40;
	
	if (step % dan_wait == 0)
	{
		if(step/dan_wait < ds_list_size(x_dan))
		{
			var inst = create_enemy(EN_GREEN,x_dan[|step/dan_wait],-20,dan_life,1,5,-90);
			inst.item_nbr = 2;
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
				var ang = find_angle(x,y,obj_player.x,obj_player.y);//rng(360,false,3);
				for(var i = ang; i < ang + 360; i += 360 / wall_nbr)
				{
					shoot_arc(DAN_MENTOS,7,wall_in,x,y,i,wall_dist,wall_spd,sfx_shot1,5);
					shoot_arc(DAN_MENTOS,7,wall_in,x,y,i + 360 / wall_nbr / 2,-wall_dist,wall_spd + 0.5,sfx_shot1,5);
				}
				
				state = 2;
		
			break;
			case 2:
				if(state_time == 60)
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
					shoot_ring(DAN_ARROWHEAD,3,arrow_nbr,x,y,angle_shoot,arrow_spd,sfx_shot3,4);
					if((state_time / arrow_wait) % arrow_dist_lenght == arrow_dist_lenght - 1)
					{
						angle_shoot += arrow_dist2;
					}
					else
					{
						angle_shoot += arrow_dist1;
					}
				}
			break;
		}
	}
	
	
}
// Inherit the parent event
event_inherited();

