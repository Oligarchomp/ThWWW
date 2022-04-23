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
			var aim_dist = 56;
			var aim_spd_min = 2;
			var aim_spd_max = 3.5;
			
			var ring_wait = 40;
			var ring_nbr = 1;
			var ring_accel = 0.01;
			var ring_shoot_spd = 0.1;
		break;
		case 1:
			var aim_wait = 86;
			var aim_arc = 3;
			var aim_row = 3;
			var aim_dist = 46;
			var aim_spd_min = 2;
			var aim_spd_max = 4;
			
			var ring_wait = 30;
			var ring_nbr = 2;
			var ring_accel = 0.014;
			var ring_shoot_spd = 0.3;
		break;
		case 2:
			var aim_wait = 78;
			var aim_arc = 3;
			var aim_row = 3;
			var aim_dist = 40;
			var aim_spd_min = 2;
			var aim_spd_max = 5;
			
			var ring_wait = 26;
			var ring_nbr = 3;
			var ring_accel = 0.018;
			var ring_shoot_spd = 0.5;
		break;
		case 3:
			var aim_wait = 76;
			var aim_arc = 5;
			var aim_row = 3;
			var aim_dist = 40;
			var aim_spd_min = 2;
			var aim_spd_max = 5;
			
			var ring_wait = 22;
			var ring_nbr = 4;
			var ring_accel = 0.018;
			var ring_shoot_spd = 0.5;
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
			inst.item_nbr = 10;
		//no break
		case 350:
			var x_pos = x_dist + f_dist * rng(4,true,1);
			
			play_sound(sfx_familiar_spawn,1,false);
			var inst = create_enemy(EN_BLUE,x_pos,-70,fairy_life,2,8,-90);
			inst.item_nbr = 10;
		//no break;
		case 0:
			var x_pos = x_dist + f_dist * rng(4,true,6);
			
			play_sound(sfx_familiar_spawn,1,false);
			var inst = create_enemy(EN_BLUE,x_pos,-20,fairy_life,2,8,-90);
			inst.item_nbr = 10;
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
						inst.item_nbr = 8;
					}
					
					for(var i = x - x_dist ; i > x_dist; i -= f_dist)
					{
						var inst = create_enemy(EN_FAMILIAR,i,y,fam_life,3,0,-90);
						inst.my_fairy = self;
						inst.pos_type = POS_MANUAL;
						inst.item_nbr = 8;
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
						shoot_arc_row(DAN_BUBBLE,1,aim_arc,aim_row,x,y,999,aim_dist,aim_spd_min,aim_spd_max,sfx_redirect1,5);
					
					}
					
					if(state_time % ring_wait == 0)
					{
						var en = self;
						with(obj_enemy3)
						{
							if(my_fairy == en)
							{
								repeat(ring_nbr)
								{
									var inst = shoot(DAN_AMULET,7,x,y,rng(180,false,1),ring_shoot_spd + rng(0.5,false,1),sfx_shot1,4);
									inst.pos_type = POS_SP;
									inst.y_grav_accel = ring_accel;
									inst.y_grav_max = 8;	
								}
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

