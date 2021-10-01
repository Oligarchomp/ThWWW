/// @description Insert description here
// You can write your code in this editor


if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var spam_wait = 25;
			var spam_nbr = 2;
			var spam_spd = 3;
			var spam_open = 60;
			
			var bubble_wait = 50;
			var bubble_spd = 3;
			var bubble_accel = 0.02;
		break;
		case 1:
			var spam_wait = 19;
			var spam_nbr = 3;
			var spam_spd = 3;
			var spam_open = 60;
			
			var bubble_wait = 40;
			var bubble_spd = 3;
			var bubble_accel = 0.02;
		break;
		case 2:
			var spam_wait = 16;
			var spam_nbr = 4;
			var spam_spd = 3;
			var spam_open = 60;
			
			var bubble_wait = 32;
			var bubble_spd = 3;
			var bubble_accel = 0.02;
		break;
		case 3:
			var spam_wait = 12;
			var spam_nbr = 4;
			var spam_spd = 3;
			var spam_open = 60;
			
			var bubble_wait = 30;
			var bubble_spd = 3;
			var bubble_accel = 0.02;
		break;
	}
	
	var spawn_lenght = 600;
	var spawn_wait = 13;
	
	var f_life = 3;
	
	var big_life = 40;
	var big_shoot_lenght = 61;
	var big_wait = 80;
	
	if(step < spawn_lenght)
	{
		if(step % spawn_wait == 0)
		{
			create_enemy(EN_GREEN,room_width / 2 - 220 * spawn_dir,80,f_life,3,4,90 - 90 * spawn_dir)	
			spawn_dir *= -1;
		}
	}

	
	if (step % big_wait == 0)
	{
		if(step/big_wait < ds_list_size(x_list))
		{
			var inst = create_enemy(EN_BLUE,x_list[|step/big_wait], -20, big_life,4,5.5,-90);
			inst.item_nbr = 4;
		}
	}
	
	
	if(step % spam_wait = spam_wait - 1)
	{
		with(obj_enemy3)
		{
			for(var i = 0; i < spam_nbr; i += 1)
			{
				var ang = 90 - spam_open + rng(spam_open * 2,false,9);
				var inst = shoot(DAN_BALL,3,x,y,ang,spam_spd,sfx_shot1,2);
				inst.pos_type = POS_SP;
				inst.y_grav_accel = 0.05;
				inst.y_grav_max = 6;	
			}
		}
		
	}
	
	
	with(obj_enemy4)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot aim
				if(state_time < big_shoot_lenght)
				{
					if(state_time % bubble_wait == 0)
					{
						shoot(DAN_BUBBLE,2,x,y,999,0,sfx_redirect1,4);
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 70)
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
	
	with(obj_danmaku4)
	{
		spd = goto_value(spd,bubble_spd,bubble_accel);
	}
	
}
// Inherit the parent event
event_inherited();

