/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var bubble_wait = 15;
			var bubble_arc = 1;
			var bubble_dist = 45;
			var bubble_open = 4;
			var bubble_spd_min = 4;
			var bubble_spd_git = 1;
		break;
		case 1:
			var bubble_wait = 8;
			var bubble_arc = 3;
			var bubble_dist = 45;
			var bubble_open = 4;
			var bubble_spd_min = 4.8;
			var bubble_spd_git = 1.3;
		break;
		case 2:
			var bubble_wait = 6;
			var bubble_arc = 3;
			var bubble_dist = 40;
			var bubble_open = 4;
			var bubble_spd_min = 5.2;
			var bubble_spd_git = 1.5;
		break;
		case 3:
			var bubble_wait = 6;
			var bubble_arc = 5;
			var bubble_dist = 36;
			var bubble_open = 4;
			var bubble_spd_min = 5.2;
			var bubble_spd_git = 1.5;
		break;
	}
	
	var fairy_lenght = 112;
	
	var wave_wait = 200;
	
	
	if(instance_exists(obj_spell))
	{
		wait_time = 90;
	}
	
	wait_time = goto_value(wait_time,0,1);
	
	if(wait_time == 0)
	{
		if(step <= 1020)
		{
			if(step % wave_wait == 0)
			{
				for(var i = 50; i <= 350; i += 50)
				{
					var inst = create_enemy(EN_GREEN,i,-20,14,7,4,-90);
					inst.item_nbr = 1;
				}
			}
		}
	}
	
	with(obj_enemy7)
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
				if(state_time < fairy_lenght)
				{
					if(state_time % bubble_wait == 0)
					{
						var sp = bubble_spd_min + rng(bubble_spd_git,false,6);
						var ang = find_angle(x,y,obj_player.x,obj_player.y) + bubble_open - rng(bubble_open * 2,false,7);
						shoot_arc(DAN_MENTOS,7,bubble_arc,x,y,ang,bubble_dist,sp,sfx_shot1,8);	
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
					angle = 90;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
}

// Inherit the parent event
event_inherited();

