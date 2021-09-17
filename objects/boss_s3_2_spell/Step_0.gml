/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and(spell_wait == 0)
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
			var bubble_nbr = 24;
			var shoot_wait = 3;
			var step1_angle_spd = 5;
			var step2_angle_spd = 1;
			
			var bubble_wait = 30;//must be a multiple of 2
		break;
	}
	var wait_move = 150;
	
	if(step % wait_move == wait_move - 1)
	{
		boss_movement_random(2,3,1);
	}
	
	switch(state)
	{
		case 0:
			if(state_time == bubble_wait / 2)
			{
				dir_shoot *= -1;
			}
		
			if(state_time < bubble_wait)
			{
				if(state_time % shoot_wait == 0)
				{
					for (var i = 0; i < bubble_nbr; i += 1)
					{
						var ang = angle_shoot + 360 / bubble_nbr * i
						var col = 3.5 + dir_shoot * 0.5;
						if(state_time % (bubble_wait / 2) == 0)
						{
							var inst = shoot(DAN_BUBBLE,col,obj_boss.x,obj_boss.y,ang,5,sfx_shot1,3);
						}
						else
						{
							var inst = shoot(DAN_ARROWHEAD,col,obj_boss.x,obj_boss.y,ang,5,sfx_shot1,3);
							
						}
						inst.angle_ref = ang + 360 * dir_shoot;
						inst.dir_dan = dir_shoot;
					}
		
				}
			}
			else
			{
				state = 1;
				angle_shoot = rng(360,false,5);
				
			}
		break;
		case 1:
			if(state_time == 30)
			{
				state = 0;
			}
		break;
	}

	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				angle = goto_value(angle,angle_ref, step1_angle_spd)
				if(angle == angle_ref)
				{
					state = 1;
				}
			break;
			case 1:
				angle = goto_value(angle,angle_ref + 140 * dir_dan, step2_angle_spd)
			break;
		}
		
	}
	
}

// Inherit the parent event
event_inherited();

