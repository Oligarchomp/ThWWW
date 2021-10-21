/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var aim_wait = 92;
			var aim_arc = 1;
			var aim_row = 3;
			var aim_dist = 40;
			var aim_spd_min = 2;
			var aim_spd_max = 4;
			
			var ring_nbr = 7;
			var ring_spd = 2;
		break;
		case 1:
			var aim_wait = 86;
			var aim_arc = 3;
			var aim_row = 3;
			var aim_dist = 40;
			var aim_spd_min = 2;
			var aim_spd_max = 5;
			
			var ring_nbr = 9;
			var ring_spd = 2;
		break;
		case 2:
			var aim_wait = 78;
			var aim_arc = 3;
			var aim_row = 3;
			var aim_dist = 40;
			var aim_spd_min = 2;
			var aim_spd_max = 5;
			
			var ring_nbr = 12;
			var ring_spd = 2;
		break;
		case 3:
			var aim_wait = 76;
			var aim_arc = 5;
			var aim_row = 3;
			var aim_dist = 40;
			var aim_spd_min = 2;
			var aim_spd_max = 5;
			
			var ring_nbr = 14;
			var ring_spd = 2;
		break;
	}
	
	var x_dist = 60;
	var f_dist = (room_width - x_dist * 2) / 4;
	
	var fairy_life = 75;
	var fam_life = 30;
	
	var shoot_lenght = 230;
	
	switch(state_time)
	{
		case 700:
			var x_pos = x_dist + f_dist * rng(4,true,8);
			
			play_sound(sfx_familiar_spawn,1,false);
			var inst = create_enemy(EN_BLUE,x_pos,-120,fairy_life,2,8,-90);
			inst.item_nbr = 12;
		//no break
		case 350:
			var x_pos = x_dist + f_dist * rng(4,true,1);
			
			play_sound(sfx_familiar_spawn,1,false);
			var inst = create_enemy(EN_BLUE,x_pos,-70,fairy_life,2,8,-90);
			inst.item_nbr = 12;
		//no break;
		case 0:
			var x_pos = x_dist + f_dist * rng(4,true,6);
			
			play_sound(sfx_familiar_spawn,1,false);
			var inst = create_enemy(EN_BLUE,x_pos,-20,fairy_life,2,8,-90);
			inst.item_nbr = 12;
		break;
	}
	
	
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
				if(state_time == 1)
				{
					for(var i = x + x_dist ; i < room_width - x_dist; i += f_dist)
					{
						var inst = create_enemy(EN_FAMILIAR,i,y,fam_life,3,0,-90);
						inst.my_fairy = self;
						inst.pos_type = POS_MANUAL;
						inst.item_nbr = 12;
					}
					
					for(var i = x - x_dist ; i > x_dist; i -= f_dist)
					{
						var inst = create_enemy(EN_FAMILIAR,i,y,fam_life,3,0,-90);
						inst.my_fairy = self;
						inst.pos_type = POS_MANUAL;
						inst.item_nbr = 12;
					}
				}
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot aim
				if(state_time < shoot_lenght)
				{
					if(state_time % aim_wait == 0)
					{
						shoot_arc_row(DAN_BUBBLE,3,aim_arc,aim_row,x,y,999,aim_dist,aim_spd_min,aim_spd_max,sfx_redirect1,6);
					
						var en = self;
						with(obj_enemy3)
						{
							if(my_fairy == en)
							{
								shoot_ring(DAN_BUBBLE,1,ring_nbr,x,y,999,ring_spd,sfx_shot1,7);
							}
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
					life = 0;
					item_nbr = 0;
					
					var en = self;
					with(obj_enemy3)
					{
						if(my_fairy == en)
						{
							item_nbr = 0;
						}
					}
				}
			break;
			
		}
	}
	
	
	with(obj_enemy3)
	{
		if(instance_exists(my_fairy))
		{
			y = my_fairy.y;
		}
		else
		{
			life = 0;
		}
	}
	
	
}
// Inherit the parent event
event_inherited();

