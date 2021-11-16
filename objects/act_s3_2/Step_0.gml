/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var bubble_ring = 10;
			var bubble_spd1 = 2.5;
			var bubble_spd2 = 3;
			var extra_wave = false;
		break;
		case 1:
			var bubble_ring = 20;
			var bubble_spd1 = 2.5;
			var bubble_spd2 = 3;
			var extra_wave = false;
		break;
		case 2:
			var bubble_ring = 24;
			var bubble_spd1 = 2.5;
			var bubble_spd2 = 3;
			var extra_wave = true;
		break;
		case 3:
			var bubble_ring = 31;
			var bubble_spd1 = 2.5;
			var bubble_spd2 = 3;
			var extra_wave = true;
		break;
	}
	
	var fairy_wait = 60;
	var fairy_life = 48;
	
	if (step % fairy_wait == 0)
	{
		if(step/fairy_wait < ds_list_size(x_fairy))
		{
			var inst = create_enemy(EN_GREEN,x_fairy[|step/fairy_wait],-20,fairy_life,4,4,-90)
			inst.item_nbr = 3;
		}
	}
	
	with(obj_enemy4)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					shoot_nbr = 1
					angle_shoot = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 1://shoot
				
				var ang = rng(360,false,4)
				shoot_ring(DAN_BUBBLE,3,bubble_ring,x,y,ang + 360 / bubble_ring / 2,bubble_spd2,sfx_redirect1,8);
				shoot_ring(DAN_BUBBLE,7,bubble_ring,x,y,ang,bubble_spd1,noone,8);
				if(extra_wave)
				{
					shoot_ring(DAN_BUBBLE,7,bubble_ring,x,y,ang,bubble_spd2 + (bubble_spd2 - bubble_spd1),noone,8);
				}
				state = 2;
			break;
			case 2:
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
	
}
// Inherit the parent event
event_inherited();

