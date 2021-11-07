/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var laser_ring = 12;
			var laser_wait = 86;
			var laser_nbr = 2;
			var laser_dist = 50;
			
			var star_wait = 40;
			var star_nbr = 16;
			var star_spd_shot = 9;
			var star_deccel = 0.2;
			var star_spd_final = 2;
			var star_spd_final2 = 1.5;
		break;
		case 1:
			var laser_ring = 22;
			var laser_wait = 72;
			var laser_nbr = 2;
			var laser_dist = 50;
			
			var star_wait = 25;
			var star_nbr = 24;
			var star_spd_shot = 9;
			var star_deccel = 0.2;
			var star_spd_final = 2.5;
			var star_spd_final2 = 2;
		break;
		case 2:
			var laser_ring = 24;
			var laser_wait = 68;
			var laser_nbr = 2;
			var laser_dist = 50;
			
			var star_wait = 21;
			var star_nbr = 28;
			var star_spd_shot = 9;
			var star_deccel = 0.2;
			var star_spd_final = 2.5;
			var star_spd_final2 = 2;
		break;
		case 3:
			var laser_ring = 26;
			var laser_wait = 65;
			var laser_nbr = 2;
			var laser_dist = 50;
			
			var star_wait = 20;
			var star_nbr = 32;
			var star_spd_shot = 9;
			var star_deccel = 0.2;
			var star_spd_final = 2.5;
			var star_spd_final2 = 2;
		break;
	}
	
	var fairy_life = 500;
	var shoot_lenght = 350;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_RED,200,-20,fairy_life,2,5,-90);
			inst.item_nbr = 18;
		break;
	}

	
	// big
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					angle_shoot = rng(360,false,7);
				}
			break;
			case 1://shoot aim
				if(state_time < shoot_lenght)
				{
					
					if(state_time % laser_wait == 0)
					{
						for(var j = 0; j < 360; j += 360 / laser_ring)
						{
							for(var i = 0; i < 360; i += 360 / laser_nbr)
							{
								shoot_laser(x + lengthdir_x(laser_dist,angle_shoot + j),y + lengthdir_y(laser_dist,angle_shoot + j),angle_shoot + j + 90 + i,40,30,c_white,sfx_laser2);
							}
						}
						angle_shoot = rng(360,false,7);
					}
					
					if(state_time % star_wait == 0)
					{
						var aim = rng(360,false,6);
						shoot_ring(DAN_STARBIG,3,star_nbr,x,y,aim,star_spd_shot,sfx_shot1,3)	
						shoot_ring(DAN_STARBIG,6,star_nbr,x,y,aim,star_spd_shot,sfx_shot1,4)	
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
				spd = goto_value(spd,2,0.04);
			break;
		}
	}
	
	with(obj_danmaku3)
	{
		spd = goto_value(spd,star_spd_final,star_deccel);
	}
	with(obj_danmaku4)
	{
		spd = goto_value(spd,star_spd_final2,star_deccel);
	}
	
}
// Inherit the parent event
event_inherited();

