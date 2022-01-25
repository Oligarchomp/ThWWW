/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var ring_nbr = 5;
			var ring_spd1 = 1.5;
			var ring_spd2 = 2;
			
			var rev_row = 0;
			var rev_spd_min = 3.5;
			var rev_spd_max = 5;
		break;
		case 1:
			var ring_nbr = 9;
			var ring_spd1 = 1.8;
			var ring_spd2 = 2.4;
			
			var rev_row = 3;
			var rev_spd_min = 3.5;
			var rev_spd_max = 5;
		break;
		case 2:
			var ring_nbr = 12;
			var ring_spd1 = 1.8;
			var ring_spd2 = 2.4;
			
			var rev_row = 4;
			var rev_spd_min = 3;
			var rev_spd_max = 5.5;
		break;
		case 3:
			var ring_nbr = 16;
			var ring_spd1 = 1.8;
			var ring_spd2 = 2.4;
			
			var rev_row = 4;
			var rev_spd_min = 3;
			var rev_spd_max = 5.5;
		break;
	}
	
	var lenght = 630;
	var fairy_wait = 12;
	
	var fairy_life = 10;
	var	fairy_spd = 4;
	var fairy_open = 14;
	
	if(step < lenght)
	{
		if(step % fairy_wait == 0)
		{
			var ang = -90 + fairy_open - rng(fairy_open * 2,false,6);
			var inst = create_enemy(EN_GREEN,40 + rng(320,true,2),-20,fairy_life,5,fairy_spd,ang);
			inst.wait_shot = 10 + rng(70,true,9);
			inst.item_nbr = 2;
		}
	}
	
	with(obj_enemy5)
	{
		if(wait_shot > 0)
		{
			wait_shot -= 1;
			if(wait_shot == 0)
			{
				var rand = rng(360,false,1);
				shoot_ring(DAN_BALL,3,ring_nbr,x,y,rand,ring_spd1,sfx_shot1,4);
				shoot_ring(DAN_BALL,4,ring_nbr,x,y,rand + 180 / ring_nbr,ring_spd2,sfx_shot1,4);
			}
		}
		else
		{
			can_revenge = false;
		}
	}
	
	if(global.difficulty != 0)
	{
		for(var i = 0; i < ds_list_size(x_death_list); i += 1)
		{
			shoot_row(DAN_BUBBLE,6,rev_row,x_death_list[|i],y_death_list[|i],999,rev_spd_min,rev_spd_max,sfx_redirect1,5)
		}
	}
	
}
// Inherit the parent event
event_inherited();

