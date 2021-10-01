/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var draw_angle_dist = 15;
			var draw_wait = 8;
			var draw_nbr = 5;
			var draw_start = 40;
			var draw_spd = 3.5;
			
			var bubble_ring = 9;
			var bubble_row = 2;
			var bubble_spd_min = 3;
			var bubble_spd_max = 3.5;
		break;
		case 1:
			var draw_angle_dist = 15;
			var draw_wait = 6;
			var draw_nbr = 7;
			var draw_start = 40;
			var draw_spd = 3.5;
			
			var bubble_ring = 13;
			var bubble_row = 3;
			var bubble_spd_min = 3;
			var bubble_spd_max = 4;
		break;
		case 2:
			var draw_angle_dist = 15;
			var draw_wait = 5;
			var draw_nbr = 10;
			var draw_start = 40;
			var draw_spd = 3.5;
			
			var bubble_ring = 13;
			var bubble_row = 5;
			var bubble_spd_min = 3;
			var bubble_spd_max = 5;
		break;
		case 3:
			var draw_angle_dist = 15;
			var draw_wait = 4;
			var draw_nbr = 12;
			var draw_start = 40;
			var draw_spd = 3.5;
			
			var bubble_ring = 16;
			var bubble_row = 5;
			var bubble_spd_min = 3;
			var bubble_spd_max = 5;
		break;
	}
	
	var fairy_y_off = 60;
	var fairy_life = 40;
	var fairy_lenght = 780;
	
	var fairy_wait = 80;
	if(step < fairy_lenght)
	{
		if(step % fairy_wait == 0)
		{
			if((step / fairy_wait) % 2 == 0)
			{
				var inst = create_enemy(EN_RED,-20,fairy_y_off, fairy_life,1,10.5,20);
				inst.dir_dan = 1;
			}
			else
			{
				var inst = create_enemy(EN_RED,room_width + 20,fairy_y_off, fairy_life,1,10.5,-200);
				inst.dir_dan = -1;
			}
			inst.angle_shoot = rng(360,false,3);
		}
	}
	
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				if(state_time % draw_wait == 0)
				{
					shoot_ring(DAN_BALL,3,draw_nbr,x,y,angle_shoot,0,sfx_shot3,2);
					angle_shoot += draw_angle_dist * dir_dan;
				}
			
				spd = goto_value(spd,0,0.15);
				angle = goto_value(angle,-90,1);
				if(spd == 0)
				{
					state = 1;					
				}
			break;
			case 1://shoot
				
				shoot_ring_row(DAN_BUBBLE,6,bubble_ring,bubble_row,x,y,999,bubble_spd_min,bubble_spd_max,sfx_redirect1,3);
				state = 2;
			break;
			case 2:
				if(state_time == 60)
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
	
	with(obj_danmaku2)
	{
		if(step >  draw_start)
		{
			spd = goto_value(spd,draw_spd,0.1);
		}
		
	}
}
	
// Inherit the parent event
event_inherited();

