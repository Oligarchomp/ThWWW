/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var card_ring = 5;
			var card_wait = 6;
			var card_change = 3;
			var card_spd_shot = 8;
			var card_deccel = 0.25;
			var card_accel = 0.04;
			var card_spd_final = 2.8;
			
			var row_wait = 42;
			var row_row = 2;
			var row_spd_shot_max = 4.5;
			var row_spd_shot_min = 1.5;
			var row_spd_final = 3;
			var row_accel = 0.08;
			var row_ring = 3;
		break;
		case 1:
			var card_ring = 9;
			var card_wait = 5;
			var card_change = 3;
			var card_spd_shot = 8;
			var card_deccel = 0.25;
			var card_accel = 0.08;
			var card_spd_final = 3.8;
			
			var row_wait = 28;
			var row_row = 2;
			var row_spd_shot_max = 5;
			var row_spd_shot_min = 2;
			var row_spd_final = 3.5;
			var row_accel = 0.08;
			var row_ring = 5;
		break;
		case 2:
			var card_ring = 12;
			var card_wait = 4;
			var card_change = 3;
			var card_spd_shot = 8;
			var card_deccel = 0.25;
			var card_accel = 0.1;
			var card_spd_final = 4.2;
			
			var row_wait = 24;
			var row_row = 2;
			var row_spd_shot_max = 5.5;
			var row_spd_shot_min = 2.5;
			var row_spd_final = 4;
			var row_accel = 0.08;
			var row_ring = 6;
		break;
		case 3:
			var card_ring = 14;
			var card_wait = 4;
			var card_change = 3;
			var card_spd_shot = 8;
			var card_deccel = 0.25;
			var card_accel = 0.15;
			var card_spd_final = 5;
			
			var row_wait = 22;
			var row_row = 2;
			var row_spd_shot_max = 6;
			var row_spd_shot_min = 3;
			var row_spd_final = 4.5;
			var row_accel = 0.08;
			var row_ring = 7;
		break;
	}
	
	var fairy_life = 200;
	var fairy_length = 240;
	
	var lots_life = 6;
	var lots_wait = 8;
	var lots_length = 115;
	var lots_spd = 4;
	var lots_angle_plus = 0.5;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_GREEN,310,-20,fairy_life,1,7,-90);
			inst.item_nbr = 9;
		break;
		case 150:
			need_fairy_time = lots_length;
			act_dir = 1;
		break;
		case 348:
			var inst = create_enemy(EN_GREEN,90,-20,fairy_life,1,7,-90);
			inst.item_nbr = 9;
		break;
		case 498:
			need_fairy_time = lots_length;
			act_dir = -1;
		break;
	}
	
	
	if(need_fairy_time > 0)
	{
		if((fairy_length - need_fairy_time) % lots_wait == 0)
		{
			var inst = create_enemy(EN_WHITE,200 - 220 * act_dir,180,lots_life,2,lots_spd,90 - act_dir * 45);
			inst.item_nbr = 2;
			inst.angle_to = 90 - act_dir * 90;
			inst.wait_off = rng(row_wait,true,1);
		}
		
		need_fairy_time -= 1;
	}
	
	
	with(obj_enemy1) // card
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
					aim_shot = rng(360,false,1);
					open = 0;
					col = 2;
				}
			break;
			case 1://shoot aim
				if(state_time < fairy_length)
				{
					if(state_time % (card_change * card_wait) == 0)
					{
						aim_shot = rng(360,false,1);
						col = col == 2 ? 4 : 2;
					}
					
					if(state_time % card_wait == 0)
					{
						shoot_ring(DAN_AMULET,col,card_ring,x,y,aim_shot,card_spd_shot,sfx_shot1,3);
					}
				}
				else
				{
					state += 1;	
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
	
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				image_xscale = 2;
				image_yscale = 2;
				state += 1;
			break;
			case 1:
				spd = goto_value(spd,0,card_deccel);
				if(spd == 0)
				{
					state += 1;	
				}
			break;
			case 2:
				spd = goto_value(spd,card_spd_final,card_accel);
			break;
		}
	}
	
	
	with(obj_enemy2)
	{
		angle = goto_value(angle,angle_to,lots_angle_plus);
		
		if(step % row_wait == wait_off)
		{
			shoot_ring_row(DAN_AMULET,3,row_ring,row_row,x,y,rng(360,false,1),row_spd_shot_min,row_spd_shot_max,sfx_shot2,2);
		}
	}
	
	with(obj_danmaku2)
	{
		switch(state)
		{
			case 0:
				image_xscale = 2;
				image_yscale = 2;
				state += 1;
			break;
			case 1:
				spd = goto_value(spd,row_spd_final,row_accel);
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

