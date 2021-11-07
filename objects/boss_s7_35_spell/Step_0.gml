/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	var metronome_nbr = 7;
	var metronome_wait = 3;
	var metronome_far = 180;
	var metronome_spin = 13;
	var metronome_row = 2;
	var metronome_arc = 3;
	var metronome_dist = 50;
	var metronome_spd_min = 2;
	var metronome_spd_max = 5;
	
	var ring_nbr = 17;
	var ring_row = 3;
	var ring_spd_min = 1.8;
	var ring_spd_max = 3.5;
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y)
				break;
				case 30:
					boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
					state = 1;
				break;
			}
		break;
		case 1:
			var met_to = -90 + 90 * act_dir;
			if(metronome_wave < metronome_nbr)
			{
				metronome_angle = goto_value(metronome_angle,met_to,metronome_spin);
				
				var x_pos = obj_boss.x + lengthdir_x(metronome_far,metronome_angle);
				var y_pos = obj_boss.y + lengthdir_y(metronome_far,metronome_angle);
				
				
				
				if(metronome_angle = met_to)
				{
					act_dir *= -1;
					metronome_wave += 1;
					
					var ang = rng(360,false,1);
					var dan = rng(19,true,7);
					switch(dan)
					{
						case 5: //bubble
							var dep = 8;
						break;
						case 8://heart
						case 12:
							var dep = 7;
						break;
						case 1://anchor
							dan = 19;
							var dep = 3;
						break;
						case 14: //pellet
							var dep = 1;
						break;
						default:
							var dep = 3;
						break;
					}
					
					for(var i = ring_spd_min; i < ring_spd_max; i += (ring_spd_max - ring_spd_min ) / ring_row)
					{
						shoot_ring(dan,3.5 - act_dir * 2.5,ring_nbr,x_pos,y_pos,ang,i,sfx_redirect1,dep);
						ang += 180 / ring_nbr;
					}
					with(obj_danmaku)
					{
						x_offscreen = 100;	
					}
				}
				
				if(state_time % metronome_wait == 0)
				{
					shoot_arc_row(DAN_KNIFE,3.5 - act_dir * 2.5,metronome_arc,metronome_row,x_pos,y_pos,999,metronome_dist,metronome_spd_min,metronome_spd_max,sfx_shot3,5);
				}
			}
			else
			{
				metronome_wave = 0;	
				state = 2;
			}
		break;
		case 2:
			switch(state_time)
			{
				case 20:
					boss_movement_random(3,9,2);
				break;
				case 80:
					state = 0;
				break;
			}
		break;
	}
	
	
	
	
	
	
	//SHIELD
	if(obj_player.bomb_time != 0)
	{
		if(can_shield)
		{
			obj_boss.alpha = 0.4;
			obj_boss.mask_index = spr_nothing;
			can_shield = false;
			instance_create_depth(obj_boss.x,obj_boss.y,obj_boss.depth - 1, obj_shield_reverence);
		}
	}
	else
	{
		obj_boss.alpha = 1;
		obj_boss.mask_index = spr_boss_hurtbox;
		can_shield = true;
		with(obj_shield_reverence)
		{
			state = 1;	
		}
	}
	
}

// Inherit the parent event
event_inherited();

