/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var ring_wall = 2;
			var ring_wall_dist = 1;
			var ring_wait = 7;
			var ring_nbr = 5;
			var ring_spd_shoot = 9;
			var ring_spd_final = 3;
			var angle_dist = 17;
			
			var aim_row = 1;
			var aim_ring = 8;
			var aim_spd_min = 2.6;
			var aim_spd_max = 5;
		break;
		case 1:
			var ring_wall = 2;
			var ring_wall_dist = 1;
			var ring_wait = 5;
			var ring_nbr = 6;
			var ring_spd_shoot = 11;
			var ring_spd_final = 3;
			var angle_dist = 34;
			
			var aim_row = 2;
			var aim_ring = 11;
			var aim_spd_min = 2.6;
			var aim_spd_max = 5;
		break;
		case 2:
			var ring_wall = 3;
			var ring_wall_dist = 1;
			var ring_wait = 5;
			var ring_nbr = 7;
			var ring_spd_shoot = 11;
			var ring_spd_final = 3;
			var angle_dist = 35;
			
			var aim_row = 3;
			var aim_ring = 14;
			var aim_spd_min = 3;
			var aim_spd_max = 5.5;
		break;
		case 3:
			var ring_wall = 3;
			var ring_wall_dist = 1;
			var ring_wait = 4;
			var ring_nbr = 8;
			var ring_spd_shoot = 11;
			var ring_spd_final = 3;
			var angle_dist = 34;
			
			var aim_row = 3;
			var aim_ring = 16;
			var aim_spd_min = 3;
			var aim_spd_max = 5.5;
		break;
	}
	
	var fairy_life = 50;
	var fairy_wait = 25;
	
	var small_fairy_life = 10;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_BLUE,-20,80,fairy_life,4,2.5,0);
			inst.dir_dan = 1;
		break;
		case 50:
			need_fairy_time = 76;
			x_fairy = 300;
		break;
		case 200:
			var inst = create_enemy(EN_GREEN,room_width + 20,80,fairy_life,4,2.5,180);
			inst.dir_dan = -1;
		break;
		case 250:
			need_fairy_time = 76;
			x_fairy = 100;
		break;
		case 400:
			var inst = create_enemy(EN_GREEN,-20,80,fairy_life,4,2.5,0);
			inst.dir_dan = 1;
		break;
		case 450:
			need_fairy_time = 76;
			x_fairy = 300;
		break;
		case 600:
			var inst = create_enemy(EN_GREEN,room_width + 20,80,fairy_life,4,2.5,180);
			inst.dir_dan = -1;
		break;
		case 650:
			need_fairy_time = 76;
			x_fairy = 100;
		break;
	}
	
	var x_git = 40;
	
	if(need_fairy_time > 0)
	{
		if(need_fairy_time % fairy_wait == 0)
		{
			create_enemy(EN_BLUE,x_fairy - x_git + rng(2 * x_git,false,3),-20,small_fairy_life,3,4,-90);
		}
		need_fairy_time -= 1;
	}
	
	//arrow side
	with(obj_enemy4)
	{
		switch(state)
		{
			case 0:
				angle_shoot = 0;
				state = 1;
			break;
			case 1:
				if(state_time % ring_wait == 0)
				{
					for(var i = 0; i < 360; i += 360 / ring_nbr)
					{
						shoot_arc(DAN_ARROW,4,ring_wall,x,y,angle_shoot + i,ring_wall_dist,ring_spd_shoot,sfx_shot2,4);	
					}
					angle_shoot += angle_dist * dir_dan;  
				}
			break;
		}
	}
	
	with(obj_danmaku4)
	{
		spd = goto_value(spd,ring_spd_final,0.3);
	}
	//aim bubble
	with(obj_enemy3)
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
				state = 2;
				shoot_ring_row(DAN_BUBBLE,3,aim_ring,aim_row,x,y,999,aim_spd_min,aim_spd_max,sfx_redirect1,6);
			break;
			case 2:
				if(state_time == 30)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2,y);
				}
			break;
			case 3:
				spd = goto_value(spd,3,0.04);
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

