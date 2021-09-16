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
			var fan_shoot_wait = 20;
			var fan_nbr = 5;
			var fan_dist = 7;
			var fan_spd = 5;
		break;
	}
	
	switch(state)
	{
		case 0:
			if(state_time % fan_shoot_wait == 0)
			{
				for(var i = 0; i < 360; i += 360 / 3)
				{
					shoot_arc(DAN_ARROWHEAD,3,fan_nbr,obj_boss.x,obj_boss.y,angle_shoot,fan_dist,fan_spd,sfx_shot1,2);
				}
		
			}
		
		break;
		
		
		
	}
	
	
	
	
}

// Inherit the parent event
event_inherited();

