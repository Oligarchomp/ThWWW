/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var futo_wait = 5;
			var futo_size = 2; //:)
			var futo_ring = 10;
			var futo_lenght = 60;
			var futo_spd_shot = 4;
			var futo_spd_final = 4;
			var futo_deccel = 0.1;
			var futo_accel = 0.05;
			var futo_spin = 1.8;
			var futo_wave_wait = 60;
	
			var arrow_size = 2;
			var arrow_ring = 15;
			var arrow_spd = 2;
			var arrow_wait = 70;
		break;
		case 1:
			var futo_wait = 5;
			var futo_size = 2; //:)
			var futo_ring = 15;
			var futo_lenght = 60;
			var futo_spd_shot = 5;
			var futo_spd_final = 7;
			var futo_deccel = 0.15;
			var futo_accel = 0.07;
			var futo_spin = 1.9;
			var futo_wave_wait = 60;
	
			var arrow_size = 2;
			var arrow_ring = 20;
			var arrow_spd = 2.8;
			var arrow_wait = 44;
		break;
		case 2:
			var futo_wait = 5;
			var futo_size = 2; //:)
			var futo_ring = 20;
			var futo_lenght = 60;
			var futo_spd_shot = 7;
			var futo_spd_final = 8;
			var futo_deccel = 0.25;
			var futo_accel = 0.08;
			var futo_spin = 2;
			var futo_wave_wait = 42;
	
			var arrow_size = 2;
			var arrow_ring = 26;
			var arrow_spd = 3;
			var arrow_wait = 36;
		break;
		case 3:
			var futo_wait = 5;
			var futo_size = 2; //:)
			var futo_ring = 23;
			var futo_lenght = 60;
			var futo_spd_shot = 8;
			var futo_spd_final = 8;
			var futo_deccel = 0.275;
			var futo_accel = 0.08;
			var futo_spin = 2.1;
			var futo_wave_wait = 40;
	
			var arrow_size = 2;
			var arrow_ring = 32;
			var arrow_spd = 3;
			var arrow_wait = 30;
		break;
	}
	


	
	switch(state)
	{
		case 0:
			if(state_time < futo_lenght)
			{
				if(state_time % futo_wait == 0)
				{
					for(var i = 0; i < 360; i += 360 / futo_ring)
					{
						var inst = shoot(DAN_ARROW,3,obj_boss.x,obj_boss.y,angle_shoot + i,futo_spd_shot,sfx_shot2,4);
						inst.image_xscale = futo_size;
						inst.image_yscale = futo_size;
						inst.x_offscreen *= 2;
						inst.y_offscreen *= 2;
					}
					
					
					angle_shoot += futo_spin * dir_act;
				}
			}
			else
			{
				state += 1;
				boss_movement_random(3,40,3);
			}
		break;
		case 1:
			if(state_time == futo_wave_wait)
			{
				state = 0;
				dir_act *= -1;
				angle_shoot = rng(360,false,1);
			}
		break;
	}
	
	if(step % arrow_wait == 0)
	{
		var rand = rng(360,false,1);
		for(var i = 0; i < 360; i += 360 / arrow_ring)
		{
			var inst = shoot(DAN_ARROW,5,obj_boss.x,obj_boss.y,rand + i,arrow_spd,sfx_shot1,3);
			inst.image_xscale = arrow_size;
			inst.image_yscale = arrow_size;
			inst.x_offscreen *= 2;
			inst.y_offscreen *= 2;
		}
		
	}
	
	
	
	with(obj_danmaku4)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,futo_deccel);
				if(spd == 0)
				{
					state += 1;	
					play_sound(sfx_redirect2,1,false);
				}
			break;
			case 1:
				spd = goto_value(spd,futo_spd_final,futo_accel);
			break;
		}
		
	}
	
}
// Inherit the parent event
event_inherited();

