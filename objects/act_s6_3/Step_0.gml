/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var bubble_wait = 68;
			var bubble_ring = 12;
			var bubble_spd_shoot = 5;
			var bubble_spd_final = 3;
			var bubble_lenght = 18;
			
			var ball_wait = 6;
			var ball_start = 30;
			var ball_spd = 2;
		break;
		case 1:
			var bubble_wait = 54;
			var bubble_ring = 16;
			var bubble_spd_shoot = 6;
			var bubble_spd_final = 3;
			var bubble_lenght = 18;
			
			var ball_wait = 6;
			var ball_start = 30;
			var ball_spd = 2;
		break;
		case 2:
			var bubble_wait = 52;
			var bubble_ring = 18;
			var bubble_spd_shoot = 7;
			var bubble_spd_final = 3;
			var bubble_lenght = 19;
			
			var ball_wait = 5;
			var ball_start = 30;
			var ball_spd = 2;
		break;
		case 3:
			var bubble_wait = 50;
			var bubble_ring = 20;
			var bubble_spd_shoot = 7;
			var bubble_spd_final = 3;
			var bubble_lenght = 20;
			
			var ball_wait = 4;
			var ball_start = 30;
			var ball_spd = 2;
		break;
	}
	
	var f_life = 30;
	var shoot_lenght = 160;
	
	switch(state_time)
	{
		case 0:
		case 300:
			var inst = create_enemy(EN_BLUE,-20,110,f_life,1,4,0);
			inst.item_nbr = 15;
			var inst = create_enemy(EN_BLUE,room_width + 20,110,f_life,1,4,180);
			inst.item_nbr = 15;
		break;
	}
	
	with(obj_enemy1)
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
				if(state_time < shoot_lenght)
				{
					if(state_time % bubble_wait == 0)
					{
						for(var i = 0; i < 360; i += 360 / bubble_ring)
						{
							var ang = find_angle(x,y,obj_player.x,obj_player.y);
							var inst = shoot(DAN_BUBBLE,1,x,y,ang + i,bubble_spd_shoot,sfx_redirect1,7);
							inst.dan_off = i;
						}
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
					angle = angle + 180;
				}
			break;
			case 3:
				spd = goto_value(spd,3,0.05);
			break;
		}
	}
	
	with(obj_danmaku7)
	{
		switch(state)
		{
			case 0:
				if(state_time < bubble_lenght)
				{
					if(state_time % ball_wait == ball_wait - 1)
					{
						var ang = find_angle(x,y,obj_player.x,obj_player.y) + dan_off;
						var inst = shoot(DAN_BALL,1,x,y,ang,0,sfx_shot2,4);
					}
				}
				else
				{
					state = 1;
				}
			break;
			case 1:
				spd = goto_value(spd,bubble_spd_final,0.2);
			break;
		}
	}
	
	with(obj_danmaku4)
	{
		if(step > ball_start)
		{
			spd = goto_value(spd,ball_spd,0.1);	
		}
		
	}
	
	
}
// Inherit the parent event
event_inherited();

