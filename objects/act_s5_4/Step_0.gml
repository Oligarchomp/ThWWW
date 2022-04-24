/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var bubble_spd = 5;
			var bubble_wait = 24;
			var bubble_ring = 2;
			
			var bubble_open = 2;
			
			var ring_wait = 42;
			var ring_nbr = 5;
			var ring_spd_min = 3;
			var ring_spd_max = 4.2;
			var ring_spd_div = 2;
			
		break;
		case 1:
			var bubble_spd = 6;
			var bubble_wait = 14;
			var bubble_ring = 2;
			
			var bubble_open = 3;
			
			var ring_wait = 36;
			var ring_nbr = 12;
			var ring_spd_min = 3.5;
			var ring_spd_max = 5.5;
			var ring_spd_div = 2;
		break;
		case 2:
			var bubble_spd = 6.5;
			var bubble_wait = 11;
			var bubble_ring = 3;
			
			var bubble_open = 4;
			
			var ring_wait = 32;
			var ring_nbr = 16;
			var ring_spd_min = 4;
			var ring_spd_max = 6;
			var ring_spd_div = 2;
		break;
		case 3:
			var bubble_spd = 6.5;
			var bubble_wait = 8;
			var bubble_ring = 4;
			
			var bubble_open = 5;
			
			var ring_wait = 30;
			var ring_nbr = 20;
			var ring_spd_min = 4;
			var ring_spd_max = 6;
			var ring_spd_div = 2;
			
		break;
	}
	
	var fam_life = 50;
	var fam_y = 50;
	var fam_lenght = 190;
	var fam_wait = 30;
	
	
	switch(step)
	{	
		case 0:
		case 240:
		case 480:
		case 720:
			need_familiar = true;
		break;
	}
	
	if(need_familiar)
	{
		play_sound(sfx_familiar_spawn,1,false);
		create_enemy(EN_FAMILIAR,50,fam_y,fam_life,4,0,0);
		create_enemy(EN_FAMILIAR,150,fam_y,fam_life,4,0,0);
		create_enemy(EN_FAMILIAR,250,fam_y,fam_life,4,0,0);
		create_enemy(EN_FAMILIAR,350,fam_y,fam_life,4,0,0);
		need_familiar = false;	
	}
	
	
	with(obj_enemy4)
	{
		if(step == fam_lenght)
		{
			state = 2;	
		}
		switch(state)
		{
			case 0:
				if(state_time == fam_wait)
				{
					state = 1;
					angle_aim = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 1:
				if(state_time % bubble_wait == 0)
				{
					shoot_ring(DAN_BUBBLE,7,bubble_ring,x,y,angle_aim - bubble_open + rng(bubble_open * 2,false,1),bubble_spd,sfx_shot2,4);
				}
				if(state_time % ring_wait == 0)
				{
					var rand = rng(360,false,9);
					shoot_ring(DAN_MENTOS,1,ring_nbr,x,y,rand,ring_spd_max,sfx_shot1,6);
					shoot_ring(DAN_BALL,1,ring_nbr,x,y,rand + 180 / ring_nbr,ring_spd_min,sfx_shot1,5);
				}
			break;
			case 2:
				if(state_time == 30)
				{
					life = 0;
					item_nbr = 0;
				}
			break;
		}
	}
	
	
	
	//ball
	with(obj_danmaku5)
	{
		spd = goto_value(spd,ring_spd_min / ring_spd_div,0.3);
	}
	//mentos
	with(obj_danmaku6)
	{
		spd = goto_value(spd,ring_spd_max / ring_spd_div,0.3);
	}

	
}
// Inherit the parent event
event_inherited();

