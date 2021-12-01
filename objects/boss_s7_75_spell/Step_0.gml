/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	
	var bubble_ring = 20;
	var bubble_row = 9;
	var bubble_spd_min = 1;
	var bubble_spd_max = 15;
	var bubble_stop_time = 52;
	var bubble_spin = 10;
	
	var spd_min = 0.2;
	var bubble_hold = 190;
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 30:
					boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
					
					var ang = rng(360,false,4);
					for(var i = bubble_spd_min; i < bubble_spd_max; i += (bubble_spd_max - bubble_spd_min) / bubble_row)
					{
						shoot_ring(DAN_BUBBLE,3.5 - act_dir * 2.5,bubble_ring,obj_boss.x,obj_boss.y,ang,i,noone,8);
						ang += bubble_spin * act_dir;
					}
					act_dir *= -1;
					state = 1;
				break;
			}
		break;
		case 1:
			if(state_time == 300)
			{
				state = 0;	
			}
		
		break;
	}
	
	
	
	with(obj_danmaku8)
	{
		switch(state)
		{
			case 0:
				spd_ref = spd;
				state += 1;
			break;
			case 1:
				spd = goto_value(spd,0,spd_ref / bubble_stop_time);
				if(spd == spd_min)
				{
					state += 1;
				}
			break;
			case 2:
				if(state_time == bubble_hold)
				{
					state += 1;
					play_sound(sfx_redirect1,1,false);
				}
			break;
			case 3:
				spd = goto_value(spd,10,bubble_accel);
			break;
		}
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

