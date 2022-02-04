/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var ice_row = 6;
			var ice_dist = 20;
			var ice_spd_max = 4.5;
			var ice_spd_min = 3;
			var ice_wait = 50;
			var ice_nbr = 3;//how many wall per shot
			
			var ring_wait = 50;
			var ring_spd = 3;
			var ring_nbr = 8;
		break;
		case 1:
			var ice_row = 6;
			var ice_dist = 20;
			var ice_spd_max = 5.2;
			var ice_spd_min = 3.7;
			var ice_wait = 34;
			var ice_nbr = 3;//how many wall per shot
			
			var ring_wait = 35;
			var ring_spd = 3.2;
			var ring_nbr = 12;
		break;
		case 2:
			var ice_row = 8;
			var ice_dist = 14;
			var ice_spd_max = 7;
			var ice_spd_min = 4;
			var ice_wait = 32;
			var ice_nbr = 3;//how many wall per shot
			
			var ring_wait = 27;
			var ring_spd = 3.5;
			var ring_nbr = 18;
			
		break;
		case 3:
			var ice_row = 10;
			var ice_dist = 10;
			var ice_spd_max = 8;
			var ice_spd_min = 4.5;
			var ice_wait = 30;
			var ice_nbr = 3;//how many wall per shot
			
			var ring_wait = 20;
			var ring_spd = 4;
			var ring_nbr = 24;
			
			
		break;
	}
	var time_before_cirno_freaking_dies = act_time_end;
	
	if (step == 0)
	{
		var inst = create_enemy(EN_CIRNO,room_width / 2, -20,530,1,5,-90);
		inst.item_nbr = 9;
	}
	
	
	var my_step = step;
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0://coming
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					ice_angle = 0;
				}
			break;
			case 1://shoot
				if(state_time % ice_wait == 0)
				{
					for (var a = 0; a < 360; a += 360 / ice_nbr)
					{
						var spd_plus = (ice_spd_max - ice_spd_min) / ice_row;
						for(var i = ice_row; i > 0; i -= 1)
						{
							shoot_arc(DAN_RAINDROP,1,i,x,y,ice_angle + a,ice_dist,ice_spd_max - i * spd_plus,sfx_shot2,1);
						}
					}
					ice_angle += ice_dist * 4;
				}
				if(state_time % ring_wait == ring_wait - 1)
				{
					shoot_ring(DAN_MENTOS,7,ring_nbr,x,y,999,ring_spd,sfx_shot3,2);
					
				}
			
				if(my_step == time_before_cirno_freaking_dies)
				{
					life = 0;
					item_nbr = 0;
				}
			
			break;
		}
		
		
	}
	
	
	
	
}


// Inherit the parent event
event_inherited();

