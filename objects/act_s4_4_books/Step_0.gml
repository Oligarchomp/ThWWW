/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	//I'm sorry
	switch(global.difficulty)
	{
		case 0:
			
		break;
		case 1:
			
		break;
		case 2:
			
		break;
		case 3:
			var book_time = 300;
			var book_wait = 40;
			var book_ring = 12;
			var book_row = 2;
			var book_spd_shoot_min = 10.5;
			var book_spd_shoot_max = 14;
			var book_div = 3.5;
			
			var pellet_dist = 8;
		break;
	}
	
	var fairy_life = 90;
	if(step == 0)
	{
		var x_off1 = 50;
		var x_off2 = 120;
		create_enemy(EN_GREEN,room_width / 2,-20,fairy_life,1,4,-90);
		create_enemy(EN_GREEN,room_width / 2 + x_off1,-20,fairy_life,1,6,-90);
		create_enemy(EN_GREEN,room_width / 2 - x_off1,-20,fairy_life,1,6,-90);
		create_enemy(EN_GREEN,room_width / 2 + x_off2,-20,fairy_life,1,5,-90);
		create_enemy(EN_GREEN,room_width / 2 - x_off2,-20,fairy_life,1,5,-90);
		with(obj_enemy1)
		{
			item_nbr = 6;
		}
	}
	
	//books
	with(obj_enemy1)
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
				if(state_time < book_time)
				{
					if(state_time % book_wait == 0)
					{
						var ang = rng(360,false,1)
						shoot_ring_row(DAN_BALL,3,book_ring,book_row,x,y,ang,book_spd_shoot_min,book_spd_shoot_max,sfx_shot2,4);
						shoot_ring_row(DAN_PELLET,3,book_ring,book_row,x,y,ang + pellet_dist,book_spd_shoot_min,book_spd_shoot_max,sfx_shot2,4);
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
	
	with(obj_danmaku4)
	{
		switch(state)
		{
			case 0:
				if(state_time == 0)
				{
					spd_ref = spd;
				}
				spd = goto_value(spd,spd_ref / book_div,0.5);
			break;
		}
	}
	
	
}

event_inherited();