/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	var x_off = 60;
	var big_life = 130;
	
	
	switch(global.difficulty)
	{
		case 0:
			var mentos_nbr = 3;
			var mentos_spd = 2;
			var mentos_plus = 20;
			
			var bubble_ring_nbr = 4;
			var bubble_row_nbr = 1;
			var bubble_spd_min = 2;
			var bubble_spd_max = 3;
		break;
		case 1:
			var mentos_nbr = 5;
			var mentos_spd = 3.5
			var mentos_plus = -20;
			
			var bubble_ring_nbr = 6;
			var bubble_row_nbr = 2;
			var bubble_spd_min = 2;
			var bubble_spd_max = 3.5;
		break;
		case 2:
			var mentos_nbr = 6;
			var mentos_spd = 4
			var mentos_plus = 20;
			
			var bubble_ring_nbr = 8;
			var bubble_row_nbr = 2;
			var bubble_spd_min = 2;
			var bubble_spd_max = 3.5;
		break;
		case 3:
			var mentos_nbr = 8;
			var mentos_spd = 4.5
			var mentos_plus = 12;
			
			var bubble_ring_nbr = 10;
			var bubble_row_nbr = 2;
			var bubble_spd_min = 2;
			var bubble_spd_max = 4;
		break;
	}
	var mentos_wave = 9;
	var mentos_wait = 12;
	
	
	
	if (step == 0)
	{
		//big
		var inst = create_enemy(EN_RED,x_off,-20,big_life,1);
		inst.angle = -90;
		inst.spd = 5
		inst.item_nbr = 5;
		
		var inst = create_enemy(EN_RED,room_width - x_off,-20,big_life,1);
		inst.angle = -90;
		inst.spd = 5
		inst.item_nbr = 5;
	}
	
	
	with (obj_enemy1)
	{
		switch(state)
		{
			case 0://arrival
				spd = goto_value(spd,0,0.1)
				if(spd == 0)
				{
					state = 1;
					mentos_angle = rng(360,false,3);
					bubble_angle = 0;
				}
			break;
			case 1: // shoot
				var bubble_wave = 2;
				
				var shoot_time = mentos_wait * mentos_wave
				
				if (state_time < shoot_time)
				{
					if (state_time % mentos_wait == 0)
					{
						shoot_ring(DAN_MENTOS,7,mentos_nbr,x,y,mentos_angle,mentos_spd,sfx_shot3,3)
						mentos_angle += mentos_plus;
					}
					
					if (state_time % (shoot_time / bubble_wave) == 0)
					{
						shoot_ring_row(DAN_BUBBLE,6,bubble_ring_nbr,bubble_row_nbr,x,y,bubble_angle,bubble_spd_min,bubble_spd_max,sfx_redirect1,4)
						bubble_angle += 360 / bubble_ring_nbr / 2;
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2://waiting
				if (state_time > 70)
				{
					state = 3;
				}
			break;
			case 3://departure
				spd = 2;
			break;
		}
	}
	
}


// Inherit the parent event
event_inherited();

