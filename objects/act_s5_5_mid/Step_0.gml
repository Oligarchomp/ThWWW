/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var arrow_wait = 15;
			var arrow_lenght = 40;
			var arrow_ring = 22;
			var arrow_spd = 3;
			var arrow_spd_redirect = 2.5;
			var arrow_size = 2;
			var wave_wait = 60;
			var arrow_type = DAN_ARROW;
		break;
		case 1:
			var arrow_wait = 11;
			var arrow_lenght = 45;
			var arrow_ring = 31;
			var arrow_spd = 3.5;
			var arrow_spd_redirect = 2.5;
			var arrow_size = 2;
			var wave_wait = 50;
			var arrow_type = DAN_ARROW;
		break;
		case 2:
			var arrow_wait = 9;
			var arrow_lenght = 50;
			var arrow_ring = 38;
			var arrow_spd = 4.5;
			var arrow_spd_redirect = 3;
			var arrow_size = 2;
			var wave_wait = 40;
			var arrow_type = DAN_ARROW;
		break;
		case 3:
			var arrow_wait = 9;
			var arrow_lenght = 50;
			var arrow_ring = 45;
			var arrow_spd = 4.5;
			var arrow_spd_redirect = 3;
			var arrow_size = 2;
			var wave_wait = 35;
			var arrow_type = DAN_ARROW;
		break;
	}
	
	
	switch(state)
	{
		case 0:
			if(state_time < arrow_lenght)
			{
				if(state_time % arrow_wait == 0)
				{
					for (var i = 0; i < 360; i += 360 / arrow_ring)
					{
						var inst = shoot(arrow_type,3,obj_boss.x,obj_boss.y,angle_shoot + i,arrow_spd,sfx_shot2,5)
						inst.image_xscale = arrow_size;
						inst.image_yscale = arrow_size;
						inst.x_offscreen = arrow_size * inst.x_offscreen + 10;
						inst.y_offscreen = arrow_size * inst.y_offscreen + 10;
					}
				}
			}
			else
			{
				state += 1;
				boss_movement_random(3,20,4);
				angle_shoot = rng(360,false,1);
			}
		break;
		case 1:
			if(state_time == wave_wait)
			{
				state = 0;	
			}
		break;
	}
	
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				if(x > room_width + 40) or (x < -40)
				{
					state = 1;
					spd = arrow_spd_redirect;
					color_id = 5;
					depth += 1;
					
					angle = -angle + 180;
				}
			break;
		}
	}
	
	
}
// Inherit the parent event
event_inherited();

