/// @description Insert description here
// You can write your code in this editor

if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var fan_shoot_wait = 15;
			var fan_nbr = 3;
			var fan_dist = 9;
			var fan_spd = 2.6;
			var fan_plus = 9;
			var boss_wait = 180;
		break;
		case 1:
			var fan_shoot_wait = 9;
			var fan_nbr = 4;
			var fan_dist = 6;
			var fan_spd = 3.2;
			var fan_plus = 7;
			var boss_wait = 180;
		break;
		case 2:
			var fan_shoot_wait = 5;
			var fan_nbr = 4;
			var fan_dist = 5.5;
			var fan_spd = 3.9;
			var fan_plus = 6.6;
			var boss_wait = 150;
		break;
		case 3:
			var fan_shoot_wait = 4;
			var fan_nbr = 5;
			var fan_dist = 5.6;
			var fan_spd = 4.4;
			var fan_plus = 6.7;
			var boss_wait = 150;
		break;
	}
	
	if(step % boss_wait == boss_wait -1)
	{
		boss_movement_random(0.5,1,1);
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

