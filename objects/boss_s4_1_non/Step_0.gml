/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var star_arc = 11;
			var star_dist = 17;
			var star_rnd = 15;
			var star_row = 3;
			var star_spd_min = 8;
			var star_spd_max = 16;
			var star_spd_redirect_div = 4.2;
			var star_accel = 0.1;
			var star_wait_move = 0;
			var star_wait = 55;
			var star_frame_stop = 20;
		break;
		case 1:
			var star_arc = 12;
			var star_dist = 13;
			var star_rnd = 15;
			var star_row = 3;
			var star_spd_min = 6;
			var star_spd_max = 18;
			var star_spd_redirect_div = 4;
			var star_accel = 0.1;
			var star_wait_move = 0;
			var star_wait = 43;
			var star_frame_stop = 20;	
		break;
		case 2:
			var star_arc = 13;
			var star_dist = 15;
			var star_rnd = 15;
			var star_row = 4;
			var star_spd_min = 8;
			var star_spd_max = 20;
			var star_spd_redirect_div = 4.2;
			var star_accel = 0.1;
			var star_wait_move = 0;
			var star_wait = 33;
			var star_frame_stop = 20;	
		break;
		case 3:
			var star_dist = 13.5;
			var star_arc = 15;
			var star_rnd = 15;
			var star_row = 4;
			var star_spd_min = 8;
			var star_spd_max = 20;
			var star_spd_redirect_div = 4;
			var star_accel = 0.1;
			var star_wait_move = 0;
			var star_wait = 30;
			var star_frame_stop = 20;
		break;
	}
	
	var boss_wait = 158;
	
	if(step % boss_wait == boss_wait - 1)
	{
		boss_movement_random(3,9,3);
	}
	
	if(step % star_wait == 0)
	{
		if(wave_dir == 1)
		{
			var col = 3;
		}
		else
		{
			var col = 2;
		}
		var aim = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y) + 180 - star_rnd + rng(star_rnd * 2,false,5);
		shoot_arc_row(DAN_STARBIG,col,star_arc,star_row,obj_boss.x,obj_boss.y,aim,star_dist,star_spd_min,star_spd_max,sfx_shot1,3);
		wave_dir *= -1;
	}
	
	var spell = self;
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				if(state_time == 0)
				{
					dir_dan = spell.wave_dir;
					spd_ref = spd;
					y_offscreen = 90;
				}
				spd = goto_value(spd,0,spd_ref / star_frame_stop);
				if(spd == 0)
				{
					state = 1;
					angle += spd_ref * dir_dan;
				}
			break;
			case 1:
				if(state_time == star_wait_move)
				{
					state = 2;
				}
			break;
			case 2:
				spd = goto_value(spd,-spd_ref / star_spd_redirect_div,star_accel);
				if(state_time == 100)
				{
					y_offscreen = 30;
				}
			break;
		}
	}
	
	
}
// Inherit the parent event
event_inherited();

