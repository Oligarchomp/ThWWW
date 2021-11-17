/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var bubble_wait = 12;
			var bubble_ring = 10;
			var bubble_open = 6;
			var bubble_spd_min = 4;
			var bubble_spd_git = 0.8;
		break;
		case 1:
			var bubble_wait = 10;
			var bubble_ring = 12;
			var bubble_open = 7;
			var bubble_spd_min = 4.2;
			var bubble_spd_git = 1.1;
		break;
		case 2:
			var bubble_wait = 8;
			var bubble_ring = 13;
			var bubble_open = 8;
			var bubble_spd_min = 4.4;
			var bubble_spd_git = 1.2;
		break;
		case 3:
			var bubble_wait = 6;
			var bubble_ring = 15;
			var bubble_open = 8;
			var bubble_spd_min = 4.6;
			var bubble_spd_git = 1.4;
		break;
	}
	
	var fairy_lenght = 90;
	var fairy_y_off = 60;
	var fairy_life = 40;
	
	
	switch(step)
	{
		case 0:
			need_fairy_time = 120;
			act_dir = -1;
		break;
		case 140:
			need_fairy_time = 120;
			act_dir = 1;
		break;
		case 280:
			need_fairy_time = 120;
			act_dir = -1;
		break;
		case 420:
			need_fairy_time = 120;
			act_dir = 1;
		break;
		case 560:
			need_fairy_time = 120;
			act_dir = -1;
		break;
		case 700:
			need_fairy_time = 120;
			act_dir = 1;
		break;
	}
	
	var fairy_wait = 40;
	if(need_fairy_time > 0)
	{
		if(need_fairy_time % fairy_wait == 0)
		{
			var inst = create_enemy(EN_GREEN,room_width / 2 + (170 + need_fairy_time / 1.5) * act_dir,fairy_y_off, fairy_life,1,10.5,-90 - 110 * act_dir);
			inst.dir_dan = act_dir;
			inst.angle_shoot = 0;
		}
		need_fairy_time -= 1;
	}
	
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				
				spd = goto_value(spd,0,0.15);
				angle = goto_value(angle,-90,1);
				if(spd == 0)
				{
					state = 1;					
				}
			break;
			case 1://shoot
				
				if(state_time < fairy_lenght)
				{
					if(state_time % bubble_wait == 0)
					{
						var ang = find_angle(x,y,obj_player.x,obj_player.y) + bubble_open - rng(bubble_open * 2,false,8);
						var sp = bubble_spd_min + rng(bubble_spd_git,false,5);
						shoot_ring(DAN_MENTOS,6,bubble_ring,x,y,ang,sp,sfx_shot1,8)
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 50)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2,y) + 180;
				}
			break;
			case 3:
				spd = goto_value(spd,3,0.05);
			break;
		}
	}
	
}
	
// Inherit the parent event
event_inherited();

