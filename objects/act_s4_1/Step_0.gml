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
		break;
		case 1:
			var card_ring = 9;
			var card_wait = 5;
			var card_change = 3;
			var card_spd_shot = 8;
			var card_deccel = 0.25;
			var card_accel = 0.05;
			var card_spd_final = 3.1;
		break;
		case 2:
			var card_ring = 11;
			var card_wait = 4;
			var card_change = 3;
			var card_spd_shot = 8;
			var card_deccel = 0.25;
			var card_accel = 0.08;
			var card_spd_final = 3.6;
		break;
		case 3:
			var card_ring = 13;
			var card_wait = 4;
			var card_change = 3;
			var card_spd_shot = 8;
			var card_deccel = 0.25;
			var card_accel = 0.1;
			var card_spd_final = 4.5;
		break;
	}
	
	var fairy_life = 60;
	var fairy_length = 150;
	
	switch(step)
	{
		case 150:
			fairy_off = 150;
		case 0:
			var inst = create_enemy(EN_GREEN,room_width / 2 + fairy_off,-20,fairy_life,1,7,-90);
			inst.item_nbr = 5;
			var inst = create_enemy(EN_GREEN,room_width / 2 - fairy_off,-20,fairy_life,1,7,-90);
			inst.item_nbr = 5;
		break;
		case stagecard_time:
			instance_create_depth(0,0,0,obj_stagecard);
		break;
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
					first = true;
				}
			break;
			case 1://shoot aim
				if(state_time < fairy_length)
				{
					if(state_time % (card_change * card_wait) == 0)
					{
						aim_shot = rng(360,false,1);
						col = col == 3 ? 4 : 3;
						first = true;
					}
					
					if(state_time % card_wait == 0)
					{
						for (var i = 0; i < 360; i += 360 / card_ring)
						{
							var inst = shoot(DAN_AMULET,col,x,y,aim_shot + i,card_spd_shot,sfx_shot1,3);
							inst.image_xscale = 2;
							inst.image_yscale = 2;
						}
						
						first = false;
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
				spd = goto_value(spd,0,card_deccel);
				if(spd == 0)
				{
					state += 1;	
				}
			break;
			case 1:
				spd = goto_value(spd,card_spd_final,card_accel);
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

