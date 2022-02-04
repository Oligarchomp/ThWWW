/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var bubble_spd_shoot = 12;
			var bubble_spd_final = 3;
			var bubble_arc = 1;
			var bubble_dist = 30;
			var bubble_wait = 26;
			
			var ring_wait = 30;
			var ring_lenght = 90;
			var ring_spd_to = 6;
			var ring_accel = 0.02;
			var ring_nbr = 11;
		break;
		case 1:
			var bubble_spd_shoot = 13;
			var bubble_spd_final = 3;
			var bubble_arc = 1;
			var bubble_dist = 30;
			var bubble_wait = 26;
			
			var ring_wait = 20;
			var ring_lenght = 105;
			var ring_spd_to = 6;
			var ring_accel = 0.04;
			var ring_nbr = 16;
		break;
		case 2:
			var bubble_spd_shoot = 14.5;
			var bubble_spd_final = 4;
			var bubble_arc = 3;
			var bubble_dist = 30;
			var bubble_wait = 26;
			
			var ring_wait = 18;
			var ring_lenght = 105;
			var ring_spd_to = 10;
			var ring_accel = 0.05;
			var ring_nbr = 24;
		break;
		case 3:
			var bubble_spd_shoot = 14.5;
			var bubble_spd_final = 4;
			var bubble_arc = 5;
			var bubble_dist = 25;
			var bubble_wait = 26;
			
			var ring_wait = 15;
			var ring_lenght = 105;
			var ring_spd_to = 10;
			var ring_accel = 0.05;
			var ring_nbr = 28;
		break;
	}
	
	var fairy_wait = 120;
	var fairy_life = 60;
	
	if (step % fairy_wait == 0)
	{
		if(step/fairy_wait < array_length(x_fairy))
		{
			var inst = create_enemy(EN_WHITE,x_fairy[step/fairy_wait],-20,fairy_life,4,4,-90)
			inst.item_nbr = 3;
		}
	}
	
	var aim_y_off = 60;
	var aim_life = 4;
	var aim_wait = 5;
	var aim_wave = 5;
	
	if(step < aim_wave * fairy_wait )
	{
		if (step % fairy_wait == fairy_wait / 2)
		{
			need_aim_time = 40;
			aim_dir *= -1;
		}
	}
	
	if(need_aim_time > 0)
	{
		if(step % aim_wait == 0)
		{
			if(aim_dir == 1)
			{
				var inst = create_enemy(EN_WHITE,-20,aim_y_off,aim_life,3,6,0)
			}
			else
			{
				var inst = create_enemy(EN_WHITE,room_width +20,aim_y_off,aim_life,3,6,180)
			}
			inst.item_nbr = 1;
		}
		need_aim_time -= 1;
	}
	
	//big
	with(obj_enemy4)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					angle_shot = 0;
				}
			break;
			case 1://shoot
				if(state_time < ring_lenght)
				{
					if(state_time % ring_wait == 0)
					{
						shoot_ring(DAN_MENTOS,7,ring_nbr,x,y,rng(360,false,6),0,sfx_redirect2,2);
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
					angle = 90;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	//aim
	with(obj_enemy3)
	{
		if(state_time % bubble_wait == 0)
		{
			shoot_arc(DAN_BUBBLE,7,bubble_arc,x,y,999,bubble_dist,bubble_spd_shoot,sfx_shot3,3);
		}
	}
	
	with(obj_danmaku3)
	{
		spd = goto_value(spd,bubble_spd_final,0.35);
	}
	with(obj_danmaku2)
	{
		spd = goto_value(spd,ring_spd_to,ring_accel);
	}
	
	
}
// Inherit the parent event
event_inherited();

