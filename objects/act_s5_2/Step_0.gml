/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var ring_nbr = 8;
			var ring_row = 3;
			var ring_spd_min = 3;
			var ring_spd_max = 4;
			
			var arrow_ring = 8;
			var arrow_spd = 1.2;
			var arrow_wait = 42;
		break;
		case 1:
			var ring_nbr = 14;
			var ring_row = 4;
			var ring_spd_min = 3;
			var ring_spd_max = 4.5;
			
			var arrow_ring = 12;
			var arrow_spd = 1.4;
			var arrow_wait = 38;
		break;
		case 2:
			var ring_nbr = 17;
			var ring_row = 4;
			var ring_spd_min = 3.5;
			var ring_spd_max = 5;
			
			var arrow_ring = 16;
			var arrow_spd = 1.5;
			var arrow_wait = 34;
		break;
		case 3:
			var ring_nbr = 20;
			var ring_row = 4;
			var ring_spd_min = 3.5;
			var ring_spd_max = 5;
			
			var arrow_ring = 20;
			var arrow_spd = 1.5;
			var arrow_wait = 30;
		break;
	}
	
	var fam_life = 50;
	var fam_time = 58;
	var fam_dist = 60;
	var fam_item = 10;
	
	var fairy_life = 60;
	var fairy_spd = 8;
	var fairy_deccel = 0.1;
	var fairy_lenght = 120;
	var fairy_wait = 110;
	
	switch(step)
	{
		case 0:
			play_sound(sfx_familiar_spawn,1,false);
			var inst = create_enemy(EN_FAMILIAR,0,60,fam_life,4,0,0);
			inst.item_nbr = fam_item;
			inst.dir_act = 1;
		break;
		case 150:
			play_sound(sfx_familiar_spawn,1,false);
			var inst = create_enemy(EN_FAMILIAR,room_width,110,fam_life,4,0,0);
			inst.item_nbr = fam_item;
			inst.dir_act = -1;
		break;
		case 300:
			play_sound(sfx_familiar_spawn,1,false);
			var inst = create_enemy(EN_FAMILIAR,0,80,fam_life,4,0,0);
			inst.item_nbr = fam_item;
			inst.dir_act = 1;
		break;
		case 450:
			play_sound(sfx_familiar_spawn,1,false);
			var inst = create_enemy(EN_FAMILIAR,room_width,50,fam_life,4,0,0);
			inst.item_nbr = fam_item;
			inst.dir_act = -1;
		break;
	}
	
	if (step % fairy_wait == 0)
	{
		if(step/fairy_wait < ds_list_size(x_list))
		{
			var inst = create_enemy(EN_BLUE,x_list[|step/fairy_wait],-20,fairy_life,5,fairy_spd,-90);
			inst.item_nbr = 9;
		}
	}
	
	//familiar
	with(obj_enemy4)
	{
		switch(step)
		{
			case 1:
				if(x > room_width + 30) or (x < -30)
				{
					instance_destroy(self);
				}
				else
				{
					shoot_ring_row(DAN_MENTOS,7,ring_nbr,ring_row,x,y,999,ring_spd_min,ring_spd_max,sfx_redirect1,6);	
				}
			break;
			case fam_time:
				
				play_sound(sfx_familiar_spawn,1,false);
				var inst = create_enemy(EN_FAMILIAR,x + fam_dist * dir_act,y,life,4,0,0);
				inst.item_nbr = item_nbr;
				inst.dir_act = dir_act;
				
				instance_destroy(self);
			break;
		}
	}
	
	//fairy
	with(obj_enemy5)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,fairy_deccel);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot aim
				if(state_time < fairy_lenght)
				{
					if(state_time % arrow_wait == 0)
					{
						shoot_ring(DAN_ARROW,1,arrow_ring,x,y,rng(360,false,2),arrow_spd,sfx_shot2,5);
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
				spd = goto_value(spd,3,0.05);
			break;
		}
	}
}
// Inherit the parent event
event_inherited();

