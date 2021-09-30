/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var arrow_wait = 10;
			var arrow_ring = 2;
			var arrow_row = 2;
			var arrow_spd_min_shoot = 10;
			var arrow_spd_max_shoot = 20;
			var arrow_frame_stop = 20;
			var arrow_spd_div = 5;
			var arrow_dist = 33;
			
			var bubble_nbr = 8;
			var bubble_wait = 40;
			var bubble_spd = 2.5;
		break;
		case 1:
			var arrow_wait = 7;
			var arrow_ring = 3;
			var arrow_row = 2;
			var arrow_spd_min_shoot = 10;
			var arrow_spd_max_shoot = 20;
			var arrow_frame_stop = 20;
			var arrow_spd_div = 4.5;
			var arrow_dist = 25;
			
			var bubble_nbr = 12;
			var bubble_wait = 35;
			var bubble_spd = 3;
		break;
		case 2:
			var arrow_wait = 6;
			var arrow_ring = 4;
			var arrow_row = 2;
			var arrow_spd_min_shoot = 10;
			var arrow_spd_max_shoot = 20;
			var arrow_frame_stop = 20;
			var arrow_spd_div = 4.5;
			var arrow_dist = 20;
			
			var bubble_nbr = 14;
			var bubble_wait = 33;
			var bubble_spd = 3.2;
		break;
		case 3:
			var arrow_wait = 5;
			var arrow_ring = 4;
			var arrow_row = 2;
			var arrow_spd_min_shoot = 10;
			var arrow_spd_max_shoot = 20;
			var arrow_frame_stop = 20;
			var arrow_spd_div = 4.5;
			var arrow_dist = 17;
			
			var bubble_nbr = 16;
			var bubble_wait = 30;
			var bubble_spd = 3.5;
		break;
	}
	var fairy_life = 100000;
	var fairy_life_killable = 100;
	var shoot_lenght = 320;
	
	if(step == 0)
	{
		var inst = create_enemy(EN_RED,room_width / 2,-20,fairy_life,1,7,-90);
		inst.item_nbr = 15;
		inst.dir_dan = 1;
		
	}
	
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
					angle_shoot = 0;
				}
			break;
			case 1://shoot aim
				if(state_time < shoot_lenght)
				{
					if(state_time == 250)
					{
						life = fairy_life_killable;
					}
					if(state_time % arrow_wait == 0)
					{
						shoot_ring_row(DAN_ARROW,3,arrow_ring,arrow_row,x,y,angle_shoot,arrow_spd_min_shoot,arrow_spd_max_shoot,sfx_shot1,6);
						shoot_ring_row(DAN_ARROW,2,arrow_ring,arrow_row,x,y,-angle_shoot,arrow_spd_min_shoot,arrow_spd_max_shoot,sfx_shot1,6);
						angle_shoot += arrow_dist;
						with(obj_danmaku6)
						{
							if(state == 0)
							{
								x_offscreen = 200;
								y_offscreen = 200;
							}
						}
					}
					if(state_time % bubble_wait == 0)
					{
						shoot_ring(DAN_BUBBLE,6,bubble_nbr,x,y,999,bubble_spd,sfx_redirect1,8);
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
				spd = goto_value(spd,2,0.04);
			break;
		}
	}
	
	with(obj_danmaku6)
	{
		switch(state)
		{
			case 0:
				state = 1;
			break;
			case 1:
				if(state_time == 0)
				{
					spd_ref = spd;
					x_ref = x;
					y_ref = y;
				}
				spd = goto_value(spd,0,spd_ref / arrow_frame_stop);
				if(spd == 0)
				{
					state = 2;
					if(color_id == 2)
					{
						var dir_spin = 1;
					}
					else
					{
						var dir_spin = -1;
					}
					angle_max = angle + (sqrt(sqr(x - x_ref) + sqr(y - y_ref))) * dir_spin ;
				}
			break;
			case 2:
				angle = goto_value(angle_max,angle,0.5);
				spd = goto_value(spd,spd_ref / arrow_spd_div,0.1)
				if(state_time == 60)
				{
					x_offscreen = 20;
					y_offscreen = 20;
				}
			break;
		}
	}
}
// Inherit the parent event
event_inherited();

