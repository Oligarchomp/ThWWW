/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			//arrow
			var shoot_lenght = 90;
			var shoot_wait = 15;
			var shoot_nbr = 8;
			//green arrowhead
			var wall_nbr = 1;
			var wall_ring = shoot_nbr / 2;
			var wall_spd = 2.5;
			
			var wall_plus = 2;
			
		break;
		case 1:
			//arrow
			var shoot_lenght = 90;
			var shoot_wait = 15;
			var shoot_nbr = 22;
			//green arrowhead
			var wall_nbr = 3;
			var wall_ring = shoot_nbr / 2;
			var wall_spd = 2.5;
			
			var wall_plus = 2;
			
		break;
		case 2:
			//arrow
			var shoot_lenght = 90;
			var shoot_wait = 15;
			var shoot_nbr = 28;
			//green arrowhead
			var wall_nbr = 3;
			var wall_ring = shoot_nbr / 2;
			var wall_spd = 2.5;
			
			var wall_plus = 2;
		break;
		case 3:
			//arrow
			var shoot_lenght = 90;
			var shoot_wait = 15;
			var shoot_nbr = 40;
			//green arrowhead
			var wall_nbr = 3;
			var wall_ring = shoot_nbr / 2;
			var wall_spd = 2.5;
			
			var wall_plus = 2;
			
		break;
	}
	
	
	var fairy_life = 150;
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_BLUE,room_width - 60, -10,fairy_life,5);
			inst.angle = -90;
			inst.spd = 5;
			inst.side = -1;
			inst.item_nbr = 6;
		break;
		case 200:
			var inst = create_enemy(EN_BLUE,60, -10,fairy_life,5);
			inst.angle = -90;
			inst.spd = 5;
			inst.side = 1;
			inst.item_nbr = 6;
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
				}
			break;
			case 1://shoot
				if(state_time < shoot_lenght)
				{
					if(state_time % shoot_wait == 0)
					{
						shoot_ring(DAN_ARROW,1,shoot_nbr * 2,x,y,angle_shoot - 360 / shoot_nbr / 2,wall_spd,sfx_shot3,8);
						
						var ang = angle_shoot;
						for(var i = ang; i < ang + 360; i += 360 / wall_ring)
						{
							shoot_arc(DAN_ARROWHEAD,3,wall_nbr,x,y,i,360 /shoot_nbr / wall_nbr,wall_spd,sfx_shot1,7);
						}
						angle_shoot += wall_plus * side;
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

