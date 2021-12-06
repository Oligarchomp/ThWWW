/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var ball_ring = 9;
			var ball_spd1 = 1.4;
			var ball_spd2 = 1.6;
			var extra_wave = 0;
			
			var bubble_spd_shoot = 12;
			var bubble_spd_final = 3;
			var bubble_arc = 1;
			var bubble_dist = 30;
			var bubble_wait = 26;
			
			var aim_arc = 0;
			var aim_row = 1;
			var aim_dist = 36;
			var aim_spd_min = 3;
			var aim_spd_max = 4.5;
		break;
		case 1:
			var ball_ring = 15;
			var ball_spd1 = 1.4;
			var ball_spd2 = 1.6;
			var extra_wave = 1;
			
			var bubble_spd_shoot = 14.5;
			var bubble_spd_final = 4;
			var bubble_arc = 1;
			var bubble_dist = 30;
			var bubble_wait = 26;
			
			var aim_arc = 1;
			var aim_row = 1;
			var aim_dist = 36;
			var aim_spd_min = 3;
			var aim_spd_max = 4.5;
		break;
		case 2:
			var ball_ring = 16;
			var ball_spd1 = 1;
			var ball_spd2 = 1.2;
			var extra_wave = 2;
			
			var bubble_spd_shoot = 14.5;
			var bubble_spd_final = 4;
			var bubble_arc = 3;
			var bubble_dist = 30;
			var bubble_wait = 26;
			
			var aim_arc = 1;
			var aim_row = 1;
			var aim_dist = 28;
			var aim_spd_min = 3;
			var aim_spd_max = 4.5;
		break;
		case 3:
			var ball_ring = 20;
			var ball_spd1 = 1;
			var ball_spd2 = 1.2;
			var extra_wave = 2;
			
			var bubble_spd_shoot = 14.5;
			var bubble_spd_final = 4;
			var bubble_arc = 3;
			var bubble_dist = 25;
			var bubble_wait = 26;
			
			var aim_arc = 1;
			var aim_row = 1;
			var aim_dist = 20;
			var aim_spd_min = 3;
			var aim_spd_max = 4.5;
		break;
	}
	
	var fairy_wait = 60;
	var fairy_life = 42;
	
	var aim_y_off = 60;
	var aim_life = 4;
	var aim_wait = 5;
	var aim_lenght = 200;
	
	switch(state)
	{
		case 0:
			if(state_time/fairy_wait < ds_list_size(x_fairy))
			{
				if (state_time % fairy_wait == 0)
				{
					var inst = create_enemy(EN_WHITE,room_width / 2 + x_fairy[|state_time/fairy_wait],-20,fairy_life,4,4,-90)
					inst.item_nbr = 3;
					
					var inst = create_enemy(EN_WHITE,room_width / 2 - x_fairy[|state_time/fairy_wait],-20,fairy_life,4,4,-90)
					inst.item_nbr = 3;
				}
			}
			else
			{
				state = 1;
			}
		break;
		case 1:
			if(state_time < aim_lenght)
			{
				if(state_time % aim_wait == 0)
				{
					if(aim_dir == 1)
					{
						var inst = create_enemy(EN_BLUE,-20,aim_y_off,aim_life,3,6,0);
					}
					else
					{
						var inst = create_enemy(EN_BLUE,room_width +20,aim_y_off,aim_life,3,6,180);
					}
					inst.item_nbr = 1;
					aim_dir *= -1;
				}
			}
		break;
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
					shoot_nbr = 1
					angle_shoot = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 1://shoot
				
				var ang = rng(360,false,4)
				shoot_ring(DAN_BALL,7,ball_ring,x,y,ang + 360 / ball_ring / 2,ball_spd2,sfx_redirect2,7);
				shoot_ring(DAN_BALL,7,ball_ring,x,y,ang,ball_spd1,sfx_redirect2,7);
				switch(extra_wave)
				{
					case 2:
					shoot_ring(DAN_BALL,7,ball_ring,x,y,ang  + 360 / ball_ring / 2,ball_spd2 + (ball_spd2 - ball_spd1) * 2,sfx_redirect2,7);
					case 1:
					shoot_ring(DAN_BALL,7,ball_ring,x,y,ang,ball_spd2 + (ball_spd2 - ball_spd1),sfx_redirect2,7);
					break;
				}
				
				shoot_arc_row(DAN_BUBBLE,7,aim_arc,aim_row,x,y,999,aim_dist,aim_spd_min,aim_spd_max,sfx_redirect1,8);
				state = 2;
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
			shoot_arc(DAN_BUBBLE,7,bubble_arc,x,y,999,bubble_dist,bubble_spd_shoot,sfx_shot3,8);
		}
	}
	
	with(obj_danmaku8)
	{
		if(color_id == 7)
		{
			spd = goto_value(spd,bubble_spd_final,0.35);
		}
	}
	
}
// Inherit the parent event
event_inherited();

