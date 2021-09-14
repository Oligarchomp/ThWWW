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
			var shoot_lenght = 90;
			var shoot_wait = 12;
			var shoot_nbr = 40;
			
			var wall_nbr = 3;
			var wall_ring = shoot_nbr / 2;
			var wall_spd = 2.5;
			var wall_wait = 20;
			
			var fairy_lenght = 120;
			var fairy_off = 40;
			var fairy_wait = 10;
			
			var ring_nbr = 18;
			var ring_row = 2;
			var ring_spd_min = 5;
			var ring_spd_max = 5.2;
		break;
	}
	
	var fairy_life = 165;
	var small_fairy_life = 6;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_BLUE,room_width - 50, -10,fairy_life,5);
			inst.angle = -90;
			inst.spd = 5;
		break;
		case 50:
			need_fairy_time = fairy_lenght;
			need_fairy_spr_dir = 1;
			step_ref = step;
		break;
		case 200:
			var inst = create_enemy(EN_BLUE,50, -10,fairy_life,5);
			inst.angle = -90;
			inst.spd = 5;
		break;
		case 250:
			need_fairy_time = fairy_lenght;
			need_fairy_spr_dir = -1;
			step_ref = step;
		break;
		case 400:
			var inst = create_enemy(EN_BLUE,room_width - 100, -10,fairy_life,5);
			inst.angle = -90;
			inst.spd = 5;
		break;
		case 450:
			need_fairy_time = fairy_lenght;
			need_fairy_spr_dir = 1;
			step_ref = step;
		break;
		case 600:
			var inst = create_enemy(EN_BLUE,100, -10,fairy_life,5);
			inst.angle = -90;
			inst.spd = 5;
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
			var inst = create_enemy(EN_GREEN,x_pos,-20,small_fairy_life,4);
			inst.angle = -90;
			inst.spd = 5;
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
					if(state_time % wall_wait == 0)
					{
						
					}
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
	
	with(obj_enemy4)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.15);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot
				shoot_ring_row(DAN_ARROWHEAD,1,ring_nbr,ring_row,x,y,999,ring_spd_min,ring_spd_max,sfx_shot2,7);
					state = 2;
			break;
			case 2:
				spd = goto_value(spd,2,0.1);
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

