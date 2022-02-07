/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	
	var bubble_ring = 17;
	var bubble_spd = 1.8;
	
	var heart_ring = 5;
	var heart_spd_shoot = 3;
	var heart_deccel = 0.12;
	var heart_spd_final = 3;
	var heart_accel = 0.01;
	
	var mentos_nbr = 8;
	var mentos_spd = 1;
	
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
					state += 1;
					shoot_ring(DAN_BUBBLE,1,bubble_ring,obj_boss.x,obj_boss.y,rng(360,false,1),bubble_spd,sfx_redirect1,7);
				break;
			}
		break;
		case 1:
			switch(state_time)
			{
				case 70:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 110:
					state += 1;
					boss_movement_goto(obj_player.x,obj_player.y,2.2);
				break;
			}
		break;
		case 2:
			if(state_time % 20 == 0)
			{
				shoot_ring(DAN_MENTOS,6,mentos_nbr,obj_boss.x,obj_boss.y,rng(360,false,1),mentos_spd,sfx_redirect2,3);	
			}
			if(obj_boss.in_position)
			{
				state += 1;	
			}
		break;
		case 3:
			switch(state_time)
			{
				case 30:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 70:
					boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
					state = 1;
					shoot_ring(DAN_BUBBLE,1,bubble_ring,obj_boss.x,obj_boss.y,rng(360,false,1),bubble_spd,sfx_redirect1,7);
				break;
			}
		break;
	}


	with(obj_danmaku7)
	{
		switch(state)
		{
			case 0:
				if(collision_circle(x + hsp,y,1,obj_wall,false,true))
				{
					angle = -angle + 180; 
					state = 1;
					spd = 0;
				}
				if(collision_circle(x,y + vsp,1,obj_wall,false,true))
				{
					angle = -angle; 
					state = 1;
					spd = 0;
				}
			break;
			case 1:
				shoot_ring(DAN_HEART,1,heart_ring,x,y,rng(360,false,1),heart_spd_shoot,sfx_shot1,2);
				cancel_bullet(self);
			break;
		}
	}
	
	with(obj_danmaku2)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,heart_deccel);
				if(spd == 0)
				{
					state += 1;	
				}
			break;
			case 1:
				if(state_time == 60)
				{
					state += 1;
					play_sound(sfx_redirect1,1,false);
				}
			break;
			case 2:
				spd = goto_value(spd,heart_spd_final,heart_accel);
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

