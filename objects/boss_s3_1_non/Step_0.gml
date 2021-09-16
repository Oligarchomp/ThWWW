/// @description Insert description here
// You can write your code in this editor

if(global.gp_active) and (spell_wait == 0)
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
			var fan_shoot_wait = 4;
			var fan_nbr = 5;
			var fan_dist = 5.5;
			var fan_spd = 4.5;
			var fan_plus = 7;
			var boss_wait = 135;
		break;
	}
	
	if(step % boss_wait == 0)
	{
		boss_movement_random(5,20,3);
	}
	
	switch(state)
	{
		case 0:
			if(state_time % fan_shoot_wait == 0)
			{
				for(var i = 0; i < 360; i += 360 / 3)
				{
					shoot_arc(DAN_ARROWHEAD,3,fan_nbr,obj_boss.x,obj_boss.y,angle_shoot + i,fan_dist,fan_spd,sfx_shot1,2);
					shoot_arc(DAN_ARROWHEAD,4,fan_nbr,obj_boss.x,obj_boss.y,-angle_shoot + i,fan_dist,fan_spd,sfx_shot1,2);
				}
				angle_shoot += fan_plus;
			}
		
		break;
		
		
		
	}
	
	
	
	
}

// Inherit the parent event
event_inherited();

