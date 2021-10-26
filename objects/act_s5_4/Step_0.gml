/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var bubble_spd = 5;
			var bubble_wait = 26;
			var bubble_ring = 2;
			
			var ring_wait = 44;
			var ring_nbr = 6;
			var ring_spd_min = 3.5;
			var ring_spd_max = 5.5;
			var ring_spd_div = 2;
			
			var rice_wait = 20;
			var rice_spd_shoot = 7;
			var rice_start = 10;
			var rice_spd_final = 2.5;
			var rice_around = 8;
		break;
		case 1:
			var bubble_spd = 6;
			var bubble_wait = 16;
			var bubble_ring = 3;
			
			var ring_wait = 36;
			var ring_nbr = 12;
			var ring_spd_min = 4;
			var ring_spd_max = 6;
			var ring_spd_div = 2;
			
			var rice_wait = 13;
			var rice_spd_shoot = 7;
			var rice_start = 10;
			var rice_spd_final = 3;
			var rice_around = 20;
		break;
		case 2:
			var bubble_spd = 6.5;
			var bubble_wait = 14;
			var bubble_ring = 4;
			
			var ring_wait = 32;
			var ring_nbr = 15;
			var ring_spd_min = 4;
			var ring_spd_max = 6;
			var ring_spd_div = 2;
			
			var rice_wait = 10;
			var rice_spd_shoot = 7;
			var rice_start = 10;
			var rice_spd_final = 3;
			var rice_around = 25;
		break;
		case 3:
			var bubble_spd = 6.5;
			var bubble_wait = 10;
			var bubble_ring = 5;
			
			var ring_wait = 30;
			var ring_nbr = 20;
			var ring_spd_min = 4;
			var ring_spd_max = 6;
			var ring_spd_div = 2;
			
			var rice_wait = 8;
			var rice_spd_shoot = 7;
			var rice_start = 10;
			var rice_spd_final = 3;
			var rice_around = 30;
		break;
	}
	
	var fam_life = 18;
	var fam_y = 50;
	var fam_lenght = 150;
	var fam_wait = 35;
	
	var fairy_life = 2;
	var fairy_wait = 20;
	var fairy_y = 178;
	var fairy_spd = 5;
	
	switch(step)
	{	
		case 0:
		case 200:
		case 400:
		case 600:
			need_familiar = true;
		break;
		case 60:
		case 260:
		case 460:
		case 660:
			need_fairy_time = 100;
			fairy_dir *= -1;
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
	
	if(need_fairy_time > 0)
	{
		if(need_fairy_time % fairy_wait == 0)
		{
			create_enemy(EN_BLUE,200 - 220 * fairy_dir,fairy_y,fairy_life,3,fairy_spd,90 - 90 * fairy_dir)
			
		}
		
		need_fairy_time -= 1;
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
					shoot_ring(DAN_BUBBLE,7,bubble_ring,x,y,angle_aim,bubble_spd,sfx_shot2,4);
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
	
	//fairy
	with(obj_enemy3)
	{
		if(step % rice_wait == 0)
		{
			shoot(DAN_RICE,7,x,y,rng(360,false,5),rice_spd_shoot,sfx_shot3,3);
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
	
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1:
			if(state_time = rice_start)
			{
				state = 2;
				var x_pos = obj_player.x - rice_around + rng(rice_around * 2,false,7);
				var y_pos = obj_player.y - rice_around + rng(rice_around * 2,false,1);
				angle = find_angle(x,y,x_pos,y_pos);
				spd = rice_spd_final;
			}
		}
	}
	
}
// Inherit the parent event
event_inherited();

