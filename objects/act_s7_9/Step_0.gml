/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	var laser_wave = 9;
	var laser_wait = 95;
	
	var aim_lenght = 200;
	var aim_wait = 32;
	var aim_ring = 11;
	var aim_spd = 3; // is actually the blue mentos
	
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_RED,room_width / 2, -20,10000,1,6,-90);
			inst.item_nbr = 20;
		break;
		case 50:
		case 450:
		case 850:
			need_fairy_time = 60;
			act_dir = 1;
		break;
		case 250:
		case 650:
		//case 900://900
			need_fairy_time = 60;
			act_dir = -1;
		break;
	}
	
	var fairy_wait = 20;
	if(need_fairy_time > 0)
	{
		if(need_fairy_time % fairy_wait == 0)
		{
			var inst = create_enemy(EN_BLUE,room_width / 2 + (170 - rng(50,false,6)) * act_dir,-5 - rng(15,false,9),14,2,4 + rng(1,false,3),-90);
			inst.can_revenge = false;
		}
		need_fairy_time -= 1;	
	}
	
	//beeg
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
					laser_w = 0;
				}
			break;
			case 1://shoot
				if(laser_w < laser_wave)
				{	
					laser_w += 1;
					state = 10;
					laser_ang = find_angle(x,y,obj_player.x,obj_player.y);
					laser_plus = 0;
				//	laser_acc = 0;
					boss_charge(x,y);
				}
				else
				{
					state = 2;
					life = 6;
				}
			break;
			case 10:
				if(laser_plus < 10)
				{
					if(state_time % 2 == 0 )
					{
						shoot_laser(x,y,laser_ang + laser_plus,45,30,c_white,sfx_laser2);
						shoot_laser(x,y,laser_ang - laser_plus,45,30,c_white,sfx_laser2);
						//laser_acc += 2;
						laser_plus += 2//laser_acc;
					}
				}
				else
				{
					state = 11;
				}
			break;
			case 11:
				switch(state_time)
				{
					case 50:
						shoot_ring(DAN_BUBBLE,6,18,x,y,999,3,sfx_redirect1,8);
						shoot_ring(DAN_BUBBLE,6,18,x,y,998,2.2,sfx_redirect1,8);
					break;
					case laser_wait:
						state = 1;
					break;
				}
			break;
			case 2://wait
				if(state_time == 60)
				{
					state = 3;
					angle = 90;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	//smol
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					laser_w = 0;
				}
			break;
			case 1://shoot
				if(state_time < aim_lenght)
				{	
					if(state_time % aim_wait == 0)
					{
						shoot_ring(DAN_MENTOS,1,aim_ring,x,y,rng(360,false,4),aim_spd,sfx_shot1,7);
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2://wait
				if(state_time == 60)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2,300) + 180;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	
	
	for(var i = 0; i < ds_list_size(global.x_death_list); i += 1)
	{
		create_item(ITEM_LIFE,global.x_death_list[|i],global.y_death_list[|i]);
		with(obj_laser)
		{
			instance_destroy();	
		}
	}
}
// Inherit the parent event
event_inherited();

