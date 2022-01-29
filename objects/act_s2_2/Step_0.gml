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
			var shoot_nbr = 10;
			//green arrowhead
			var wall_nbr = 1;
			var wall_ring = shoot_nbr / 2;
			var wall_spd = 2.5;
			
			//aim
			var mentos_wait = 50;
			var mentos_spd = 2.8;
			var aim_lenght = 80;
		break;
		case 1:
			//arrow
			var shoot_lenght = 90;
			var shoot_wait = 15;
			var shoot_nbr = 24;
			//green arrowhead
			var wall_nbr = 3;
			var wall_ring = shoot_nbr / 2;
			var wall_spd = 2.5;
			
			//aim
			var mentos_wait = 22;
			var mentos_spd = 3;
			var aim_lenght = 100;
		break;
		case 2:
			//arrow
			var shoot_lenght = 90;
			var shoot_wait = 15;
			var shoot_nbr = 32;
			//green arrowhead
			var wall_nbr = 3;
			var wall_ring = shoot_nbr / 2;
			var wall_spd = 2.5;
			
			//aim
			var mentos_wait = 18;
			var mentos_spd = 3.4;
			var aim_lenght = 100;
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
			
			//aim
			var mentos_wait = 15;
			var mentos_spd = 3.5;
			var aim_lenght = 100;
		break;
	}
	
	
	
	var fairy_life = 150;
	var small_fairy_life = 6;
	
	var fairy_lenght = 120;
	var fairy_off = 40;
	var fairy_wait = 10;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_GREEN,room_width - 50, -10,fairy_life,5,5,-90);
		break;
		case 50:
			need_fairy_time = fairy_lenght;
			need_fairy_spr_dir = 1;
			step_ref = step;
		break;
		case 200:
			var inst = create_enemy(EN_GREEN,50, -10,fairy_life,5,5,-90);
		break;
		case 250:
			need_fairy_time = fairy_lenght;
			need_fairy_spr_dir = -1;
			step_ref = step;
		break;
		case 400:
			var inst = create_enemy(EN_GREEN,room_width - 100, -10,fairy_life,5,5,-90);
		break;
		case 450:
			need_fairy_time = fairy_lenght;
			need_fairy_spr_dir = 1;
			step_ref = step;
		break;
		case 600:
			var inst = create_enemy(EN_GREEN,100, -10,fairy_life,5,5,-90);
		break;
		case 650:
			need_fairy_time = fairy_lenght;
			need_fairy_spr_dir = -1;
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
						shoot_ring(DAN_ARROW,1,shoot_nbr,x,y,angle_shoot - 360 / shoot_nbr / 2,wall_spd,sfx_shot3,8);
						
						var ang = angle_shoot;
						for(var i = ang; i < ang + 360; i += 360 / wall_ring)
						{
							shoot_arc(DAN_ARROWHEAD,3,wall_nbr,x,y,i,360 /shoot_nbr / wall_nbr,wall_spd,sfx_shot1,7);
						}
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
						shoot(DAN_MENTOS,2,x,y,999,mentos_spd,sfx_shot2,8);	
					}
				}
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

