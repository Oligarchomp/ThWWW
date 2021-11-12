/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	var mentos_wait = 8;
	var mentos_ring = 8;
	var mentos_spd_shot = 8;
	var mentos_deccel = 0.2;
	var mentos_spd_final = 3;
	var mentos_accel = 0.1;
	var mentos_spin = 8;
	var mentos_angle_plus = -30;
	
	var bubble_wait = 50;
	var bubble_ring = 17;
	var bubble_spd_shoot = 7;
	var bubble_spd_final = 1.5;
	var bubble_deccel = 0.15;
	
	var shoot_lenght = 90;
	var arrow_wait = 14;
	var arrow_ring = 16;
	var arrow_spd = 5.5;
	
	var fairy_life = 160;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_RED,-20,160,fairy_life,6,1.8,30);
			inst.item_nbr = 14;
			inst.fairy_dir = 1;
			inst.angle_shoot = 90;
		break;
		case 150:
			need_fairy_time = 100;
			act_dir = 1;
		break;
		case 400:
			var inst = create_enemy(EN_RED,room_width + 20,160,fairy_life,6,1.8,150);
			inst.item_nbr = 14;
			inst.fairy_dir = -1;
			inst.angle_shoot = 90;
		break;
		case 550:
			need_fairy_time = 100;
			act_dir = -1;
		break;
	}
	
	var fairy_wait = 20;
	if(need_fairy_time > 0)
	{
		if(need_fairy_time % fairy_wait == 0)
		{
			create_enemy(EN_BLUE,200 - (30 + rng(80,false,1)) * act_dir,-20,10,1,4,-90);	
		}
		
		need_fairy_time -= 1;
	}
	
	with(obj_enemy6)
	{
		angle -= 0.15 * fairy_dir;
		
		if(state_time % mentos_wait == 1)
		{
			for(var i = 0; i < 360; i += 360 / mentos_ring)
			{
				var inst = shoot(DAN_MENTOS,6,x,y,angle_shoot + i,mentos_spd_shot,sfx_shot3,3);
				inst.dan_dir = fairy_dir;
			}
			angle_shoot += mentos_spin * fairy_dir;
		}
		
		if(state_time % bubble_wait == bubble_wait - 1)
		{
			shoot_ring(DAN_BUBBLE,7,bubble_ring,x,y,rng(360,false,9),bubble_spd_shoot,sfx_shot1,8);
		}
	}

	
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot aim
				if(state_time < shoot_lenght)
				{
					if(state_time % arrow_wait == 0)
					{
						shoot_ring(DAN_ARROW,1,arrow_ring,x,y,999,arrow_spd,sfx_shot2,1)
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
					angle = find_angle(x,y,room_width / 2, y - 100);
				}
			break;
			case 3:
				spd = goto_value(spd,3,0.05);
			break;
		}
	}
	
	
	
	//mentos
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,mentos_deccel)
				if(spd == 0)
				{
					state = 1;
					play_sound(sfx_redirect1,1,false);
					angle += mentos_angle_plus * dan_dir;
				}
			break;
			case 1:
				spd = goto_value(spd,mentos_spd_final,mentos_accel);
			break;
		}
	}
	
	//bubble
	with(obj_danmaku8)
	{
		spd = goto_value(spd,bubble_spd_final,bubble_deccel);	
	}
	
}
// Inherit the parent event
event_inherited();

