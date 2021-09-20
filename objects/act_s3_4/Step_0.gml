/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			
		break;
		case 1:
			
		break;
		case 2:
			
		break;
		case 3:
			var ring_spd = 2;
			var ring_nbr = 26;
			
			var death_ring = 18;
			var death_row = 4;
			var death_spd_min = 3;
			var death_spd_max = 4;
		break;
	}
	
	var fairy_life = 30;
	var fairy_wait = 40;
	var fairy_x_off = 40;
	var spawn_lenght = 720;
	
	if(step < spawn_lenght)
	{
		if(step % fairy_wait == 0)
		{
			if (wave % 6 >= 3)
			{
				create_enemy(EN_RED,fairy_x_off + rng(20,false,3),-20,fairy_life,1,4,-90);
			}
			else
			{
				create_enemy(EN_RED,room_width - fairy_x_off - rng(20,false,3),-20,fairy_life,1,4,-90);
			}
		
			wave += 1;
		}
	}
	
	
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.05);
				if(spd == 0)
				{
					state = 1;
					angle_shot = 0;
				}
			break;
			case 1://shoot
				var ang = rng(360,false,4);
				shoot_ring(DAN_BUBBLE,7,ring_nbr,x,y,ang,ring_spd,sfx_shot2,7);
				shoot_ring(DAN_BUBBLE,7,ring_nbr,x,y,ang + 360 / ring_nbr / 2,ring_spd + 1,sfx_shot2,7);
				state = 2;
				can_revenge = false;
			break;
			case 2:
				if(state_time == 60)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2, y + 30) + 180;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	//revenge bullet
	for(var i = 0; i < ds_list_size(x_death_list); i += 1)
	{
		shoot_ring_row(DAN_BALL,6,death_ring,death_row,x_death_list[|i], y_death_list[|i],999,death_spd_min,death_spd_max,sfx_shot1,6);
	}
	
	
}
// Inherit the parent event
event_inherited();

