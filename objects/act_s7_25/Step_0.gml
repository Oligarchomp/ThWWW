/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	var mentos_wait = 90;
	var mentos_ring = 32;
	var mentos_spd = 2.4;
	var mentos_accel = 0.05;
	
	var fairy_life = 100;
	var fairy_spd = 1;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_RED,room_width / 2,-15,fairy_life,7,fairy_spd,-90);
			inst.item_nbr = 12;
		break;
		case 140:
			var inst = create_enemy(EN_RED,room_width / 2 + 40,-15,fairy_life,7,fairy_spd,-90);
			inst.item_nbr = 12;
			var inst = create_enemy(EN_RED,room_width / 2 - 40,-15,fairy_life,7,fairy_spd,-90);
			inst.item_nbr = 12;
		break;
		case 280:
			var inst = create_enemy(EN_RED,room_width / 2 + 80,-15,fairy_life,7,fairy_spd,-90);
			inst.item_nbr = 12;
			var inst = create_enemy(EN_RED,room_width / 2 - 80,-15,fairy_life,7,fairy_spd,-90);
			inst.item_nbr = 12;
		break;
		case 700:
		case 560:
		case 420:
			var inst = create_enemy(EN_RED,room_width / 2 + 120,-15,fairy_life,7,fairy_spd,-90);
			inst.item_nbr = 12;
			var inst = create_enemy(EN_RED,room_width / 2 - 120,-15,fairy_life,7,fairy_spd,-90);
			inst.item_nbr = 12;
		break;
		
	}
	
	
	with(obj_enemy7)
	{
		if(y < 340)
		{
			if(state_time % mentos_wait == 1)
			{
				shoot_ring(DAN_MENTOS,7,mentos_ring,x,y,rng(360,false,5),mentos_spd,sfx_redirect1,2);
			}
		}
	}
	
	with(obj_danmaku2)
	{
		spd = goto_value(spd,mentos_spd,mentos_accel);	
	}
}
// Inherit the parent event
event_inherited();

