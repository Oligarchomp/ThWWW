/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var shot_wait = 6;
			var shot_spd_shoot = 7;
			var shot_spd_final = 20;
			var shot_deccel = 0.2;
			var shot_accel = 0.03;
			var shot_ring = 11;
			var shot_row = 5;
		break;
		case 1:
			var shot_wait = 6;
			var shot_spd_shoot = 7;
			var shot_spd_final = 20;
			var shot_deccel = 0.2;
			var shot_accel = 0.04;
			var shot_ring = 18;
			var shot_row = 5;
		break;
		case 2:
			var shot_wait = 6;
			var shot_spd_shoot = 7;
			var shot_spd_final = 20;
			var shot_deccel = 0.2;
			var shot_accel = 0.045;
			var shot_ring = 25;
			var shot_row = 5;
		break;
		case 3:
			var shot_wait = 6;
			var shot_spd_shoot = 7;
			var shot_spd_final = 20;
			var shot_deccel = 0.2;
			var shot_accel = 0.05;
			var shot_ring = 28;
			var shot_row = 5;
		break;
	}
	var fairy_wait = 75;
	var fairy_life = 40;
	var fairy_lenght = 1300;
	
	if(instance_exists(obj_boss))
	{
		wait_time = 90;
	}
	
	if(wait_time > 0)
	{
		wait_time -= 1;
	}
	
	if(wait_time == 0) 
	{
		if(step < fairy_lenght) and (step < 21 * 60)
		{
			if (step % fairy_wait == 0)
			{	
				var inst = create_enemy(EN_GREEN,280,-20,fairy_life,5,6,-90);
				inst.shot_dir = 1;
				var inst = create_enemy(EN_GREEN,120,-20,fairy_life,5,6,-90);
				inst.shot_dir = -1;
			}
		}
	
		
		with(obj_enemy5)
		{
			switch(state)
			{
				case 0:
					spd = goto_value(spd,0,0.2);
					if(spd == 0)
					{
						state = 1;
						shoot_nbr = 0;
						aim = rng(360,false,1);
						first = true;
					}
				break;
				case 1://shoot aim
					
					if(shoot_nbr < shot_row)
					{
						if(state_time % shot_wait == 0)
						{
							for(var i = 0; i < 360; i += 360 / shot_ring)
							{
								var inst = shoot(first ? DAN_BUBBLE : DAN_MENTOS,3,x,y,aim + i,shot_spd_shoot,sfx_shot1,3 - first);
							}
							first = false;
							shoot_nbr += 1;
						}
					}
					else
					{
						state = 2;
					}
				break;
				case 2:
					if(state_time == 30)
					{
						state = 3;
						angle = -90;
					}
				break;
				case 3:
					spd = goto_value(spd,2,0.04);
				break;
			}
		}
	
		with(obj_danmaku3)
		{
			switch(state)
			{
				case 0:
					spd = goto_value(spd,0,shot_deccel);
					if(spd == 0)
					{
						state += 1;	
					}
				break;
				case 1:
					spd = goto_value(spd,shot_spd_final,shot_accel);
				break;
			}
		}
		with(obj_danmaku2) // same
		{
			switch(state)
			{
				case 0:
					spd = goto_value(spd,0,shot_deccel);
					if(spd == 0)
					{
						state += 1;	
					}
				break;
				case 1:
					spd = goto_value(spd,shot_spd_final,shot_accel);
				break;
			}
		}
		
	}
}
	

// Inherit the parent event
event_inherited();

