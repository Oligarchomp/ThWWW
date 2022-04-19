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
			
			var row_arc = 3;
			var row_spd1 = 2.2;
			var row_spd2 = 1.5;
			var row_dist = 38;
		break;
		case 1:
			var card_ring = 9;
			var card_wait = 5;
			var card_change = 3;
			var card_spd_shot = 8;
			var card_deccel = 0.25;
			var card_accel = 0.05;
			var card_spd_final = 3.1;
			
			var row_arc = 5;
			var row_spd1 = 2.2;
			var row_spd2 = 1.5;
			var row_dist = 26;
		break;
		case 2:
			var card_ring = 11;
			var card_wait = 4;
			var card_change = 3;
			var card_spd_shot = 8;
			var card_deccel = 0.25;
			var card_accel = 0.08;
			var card_spd_final = 3.6;
			
			var row_arc = 7;
			var row_spd1 = 2.2;
			var row_spd2 = 1.5;
			var row_dist = 22;
		break;
		case 3:
			var card_ring = 13;
			var card_wait = 4;
			var card_change = 3;
			var card_spd_shot = 8;
			var card_deccel = 0.25;
			var card_accel = 0.1;
			var card_spd_final = 4.5;
			
			var row_arc = 9;
			var row_spd1 = 2.2;
			var row_spd2 = 1.5;
			var row_dist = 19;
		break;
	}
	
	var fairy_life = 100;
	var fairy_length = 180;
	
	var lots_wait = 8;
	var lots_life = 8;
	var lots_length = 100;
	var lots_spd = 6;
	var lots_angle_plus = 0.8;
	
	var spell = self;
	
	switch(step)
	{
		case 0:
			need_fairy_time = lots_length;
			act_dir = -1;
			x_aim = obj_player.x;
			y_aim = obj_player.y;
		break;
		case 100:	
			var inst = create_enemy(EN_GREEN,100,-20,fairy_life,1,7,-90);
			inst.item_nbr = 5;
		break;
		case 240:
			need_fairy_time = lots_length;
			act_dir = 1;
			x_aim = obj_player.x;
			y_aim = obj_player.y;
		break;
		case 340:
			var inst = create_enemy(EN_GREEN,300,-20,fairy_life,1,7,-90);
			inst.item_nbr = 5;
		break;
		case 480:
			need_fairy_time = lots_length + 30;
			final = true;
			x_aim = obj_player.x;
			y_aim = obj_player.y;
		break;
		case 610:
			var inst = create_enemy(EN_GREEN,200,-20,fairy_life,1,7,-90);
			inst.item_nbr = 5;
		break;
	}
	
	
	if(need_fairy_time > 0)
	{
		if((fairy_length - need_fairy_time) % lots_wait == 0)
		{
			var inst = create_enemy(EN_RED,200 - 220 * act_dir,80,lots_life,2,lots_spd,-90 + act_dir * 45);
			inst.item_nbr = 2;
			inst.angle_to = -90 + act_dir * 90;
			
			if(final)
			{
				var inst = create_enemy(EN_RED,200 - 220 * -act_dir,80,lots_life,2,lots_spd,-90 + -act_dir * 45);
				inst.item_nbr = 2;
				inst.angle_to = -90 + -act_dir * 90;
			}
			//inst.wait_off = rng(mentos_wait,true,1);
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
					col = 3;
				}
			break;
			case 1://shoot aim
				if(state_time < fairy_length)
				{
					if(state_time % (card_change * card_wait) == 0)
					{
						aim_shot = rng(360,false,1);
						col = col == 4 ? 3 : 4;
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
	
	with(obj_enemy2)
	{
		angle = goto_value(angle,angle_to,lots_angle_plus);
		
		if(step == 16)
		{
			var aim = find_angle(x,y,spell.x_aim,spell.y_aim);
			shoot_arc(DAN_AMULET,5,row_arc - 1,x,y,aim,row_dist,row_spd2,sfx_shot2,4);
			shoot_arc(DAN_AMULET,6,row_arc,x,y,aim,row_dist,row_spd1,sfx_shot2,4);
		}
	}
	
	with(obj_danmaku4)//row
	{
		switch(state)
		{
			case 0:
				image_xscale = 2;
				image_yscale = 2;
				state += 1;
			break;
		}
	}
	
	with(obj_danmaku3)// multi
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

	
}
// Inherit the parent event
event_inherited();

