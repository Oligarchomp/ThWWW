/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var bubble_wait = 30;
			var bubble_arc = 1;
			var bubble_dist = 40;
			var bubble_spd_shoot = 11;
			var bubble_spd_final = 3;
			var bubble_deccel = 0.35;
			
			var ball_row = 3;
			var ball_ring = 12;
			var ball_spd_min = 1.2;
			var ball_spd_max = 3;
		break;
		case 1:
			var bubble_wait = 16;
			var bubble_arc = 3;
			var bubble_dist = 40;
			var bubble_spd_shoot = 13;
			var bubble_spd_final = 3.5;
			var bubble_deccel = 0.35;
			
			var ball_row = 4;
			var ball_ring = 16;
			var ball_spd_min = 1.3;
			var ball_spd_max = 3.2;
		break;
		case 2:
			var bubble_wait = 12;
			var bubble_arc = 3;
			var bubble_dist = 34;
			var bubble_spd_shoot = 13.5;
			var bubble_spd_final = 4;
			var bubble_deccel = 0.35;
			
			var ball_row = 5;
			var ball_ring = 18;
			var ball_spd_min = 1.5;
			var ball_spd_max = 3.4;
		break;
		case 3:
			var bubble_wait = 10;
			var bubble_arc = 5;
			var bubble_dist = 30;
			var bubble_spd_shoot = 13.5;
			var bubble_spd_final = 4;
			var bubble_deccel = 0.35;
			
			var ball_row = 5;
			var ball_ring = 20;
			var ball_spd_min = 1.5;
			var ball_spd_max = 3.5;
		break;
	}
	
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
				case 162:
				case 324:
				case 488:
					var dist = room_width / 5;
					for(var i = dist; i <= room_width - dist; i += dist)
					{
						var inst = create_enemy(EN_WHITE,i,-20,20,3,4,-90);
						inst.item_nbr = 2;
					}
					
				break;
				case 40:
				case 202:
				case 364:
				case 528:
				need_fairy_time = 100;
				break;
			}
		break;
	}
	
	var fairy_wait = 20;
	var fairy_aim_lenght = 60;
	var aim_life = 6;
	
	if(need_fairy_time > 0)
	{
		if(need_fairy_time % fairy_wait == 0)
		{
			var inst = create_enemy(EN_WHITE,-20,80,aim_life,6,5,0);
			inst.item_nbr = 1;
			
			var inst = create_enemy(EN_WHITE,room_width + 20,80,aim_life,6,5,180);
			inst.item_nbr = 1;
			
		}
		need_fairy_time -= 1;	
	}
	
	//ball shooter
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
				var aim = rng(360,false,1);
				for(var i = ball_spd_min; i < ball_spd_max; i += (ball_spd_max - ball_spd_min) / ball_row)
				{
					shoot_ring(DAN_BALL,7,ball_ring,x,y,aim,i,sfx_redirect1,5)
					aim += 180 / ball_ring;
				}
				state = 2;
			break;
			case 2:
				if(state_time == 30)
				{
					state = 3;
					angle = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 3:
				spd = goto_value(spd,3,0.05);
			break;
		}
	}
	
	//bubble shooter
	with(obj_enemy6)
	{
		if(step < fairy_aim_lenght)
		{
			if(step % bubble_wait == 0)
			{
				shoot_arc(DAN_BUBBLE,7,bubble_arc,x,y,999,bubble_dist,bubble_spd_shoot,sfx_shot1,6);
			}
		}
	}
	
	with(obj_danmaku6)
	{
		spd = goto_value(spd,bubble_spd_final,bubble_deccel);	
	}
}

// Inherit the parent event
event_inherited();

