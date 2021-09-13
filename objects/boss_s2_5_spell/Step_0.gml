/// @description Insert description here
// You can write your code in this editor

if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var crab_dist = 40;
			var crab_row = 2;
			var crab_far = (room_width + 2 * crab_x_off) / 1;
			var crab_spd = 2.5;
			var crab_accel = 0.05;
			var crab_wait = 55;
			var crab_angle = -70;
			var crab_height = -25;
			
			var wait_murder = 110;
			var fire_ring = 10;
			var fire_row = 2;
			var fire_spd_min = 3;
			var fire_spd_max = 5;
			var murder_lenght = 30;
			var fire_wait = 15;
		break;
		case 1:
			var crab_dist = 40;
			var crab_row = 2;
			var crab_far = (room_width + 2 * crab_x_off) / 2;
			var crab_spd = 3.3;
			var crab_accel = 0.08;
			var crab_wait = 55;
			var crab_angle = -60;
			var crab_height = -25;
			
			var wait_murder = 90;
			var fire_ring = 15;
			var fire_row = 3;
			var fire_spd_min = 3.5;
			var fire_spd_max = 5.5;
			var murder_lenght = 60;
			var fire_wait = 13;
		break;
		case 2:
			var crab_dist = 40;
			var crab_row = 3;
			var crab_far = (room_width + 2 * crab_x_off) / 2;
			var crab_spd = 3.7;
			var crab_accel = 0.1;
			var crab_wait = 55;
			var crab_angle = -45;
			var crab_height = -25;
			
			var wait_murder = 60;
			var fire_ring = 20;
			var fire_row = 3;
			var fire_spd_min = 4;
			var fire_spd_max = 6;
			var murder_lenght = 100;
			var fire_wait = 12;
		break;
		case 3:
			var crab_dist = 40;
			var crab_far = (room_width + 2 * crab_x_off) / 3;
			var crab_row = 3;
			var crab_spd = 3.1;
			var crab_accel = 0.1;
			var crab_wait = 69;
			var crab_angle = 45;
			var crab_height = room_height + 70;
			
			
			var wait_murder = 40;
			var fire_ring = 27;
			var fire_row = 3;
			var fire_spd_min = 5;
			var fire_spd_max = 7;
			var murder_lenght = 120;
			var fire_wait = 10;
		break;
	}
	
	if (old_state2 != state2)
	{
		old_state2 = state2;
		state_time2 = 0;
	}
	else
	{
		state_time2 += 1;
	}
	
	
	switch(state2)
	{
		case 0://wait fire
			if(state_time2 == wait_murder - 35)
			{
				boss_charge(obj_boss.x,obj_boss.y);
			}
			if(state_time2 == wait_murder)
			{
				state2 = 1;
			}
		break;
		case 1:
			if(state_time2 < murder_lenght)
			{
				if(state_time2 % fire_wait == 0)
				{
					shoot_ring_row(DAN_KNIFE,6,fire_ring,fire_row,obj_boss.x,obj_boss.y,999,fire_spd_min,fire_spd_max,sfx_redirect2,3);
				}
			}
			else
			{
				state2 = 2;
				boss_movement_random(3,4,0);
			}
		break;
		case 2:
			if(state_time2 == wait_murder - 35)
			{
				boss_charge(obj_boss.x,obj_boss.y);
			}
			if(state_time2 == wait_murder)
			{
				state2 = 0;
			}
		break;

	}
	
	
	switch(state)
	{
		case 0:
		// going to the right
			for(var i = -crab_x_off ; i < room_width + crab_x_off ; i += crab_far)
			{
				for(var c = 0; c < crab_row; c += 1)
				{
					var inst = shoot(DAN_CRAB,6,i + c * crab_dist,crab_height,crab_angle,0,noone,4);
					inst.is_cancelable = false;
					inst.y_offscreen = 90;
					play_sound(sfx_redirect1,1,false);
				}
			}
			state = 1;
		break;
		case 1:
			if (state_time == crab_wait * 2)
			{
				state = 2;
			}
		break;
		case 2:
		//going to the left
			var rand = rng(crab_far,true,2)
			for(var i = -crab_x_off ; i < room_width + crab_x_off ; i += crab_far)
			{
				for(var c = 0; c < crab_row; c += 1)
				{
					var inst = shoot(DAN_CRAB,6,i + c * crab_dist + rand,crab_height,180 - crab_angle,0,noone,4);
					inst.y_offscreen = 90;
					inst.is_cancelable = false;
					play_sound(sfx_redirect1,1,false);
				}
			}
			state = 3;
		break;
		case 3:
			if (state_time == crab_wait * 2)
			{
				state = 0;
			}
		break;
	}
	
	var crab_off = crab_x_off;
	//crab
	with(obj_danmaku4)
	{
		if (x > room_width + crab_off)
		{
			x = -crab_off + (x - (room_width + crab_off))
		}
		if (x < - crab_off)
		{
			x = room_width + crab_off + (x + crab_off)
		}
		switch(state)
		{
			case 0:
				spd = goto_value(spd,crab_spd,crab_accel);
				if(spd == crab_spd)
				{
					state = 1;
				}
			break;
			case 1:
				spd = goto_value(spd,0,crab_accel);
				if(spd == 0)
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == crab_wait)
				{
					state = 0;
					play_sound(sfx_redirect1,1,false);
				}
			break;
		}
	}

}


// Inherit the parent event
event_inherited();

