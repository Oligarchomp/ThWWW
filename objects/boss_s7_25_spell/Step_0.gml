/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	
	var mentos_wait = 15;
	var mentos_start = 10;
	var mentos_accel  = 0.02;
	var mentos_spd = 3;
	var mentos_dist = 80;
	var mentos_ring = 10;
	
	var bubble_ring = 20;
	var bubble_row = 4;
	
	switch(step % 130)
	{
		case 0:
			boss_charge(obj_boss.x,obj_boss.y);
		break;
		case 30:
			if(act_dir == 1)
			{
				var col = 1;
			}
			else
			{
				var col = 6;
			}
			shoot_ring_row(DAN_BUBBLE,col,bubble_ring,bubble_row,obj_boss.x,obj_boss.y,rng(360,false,8),2,5,sfx_redirect1,7);
			act_dir *= -1;
		break;
		case 80:
			boss_movement_random(2,4,1);
		break;
	}
	
	if(step % mentos_wait == 0)
	{
		var ang = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y);
		
		var dist_plr = sqrt(sqr(obj_player.x - obj_boss.x) + sqr(obj_player.y - obj_boss.y)) - mentos_dist;
		
		for(var i = 0; i < 360; i += 360 / mentos_ring)
		{
			var aim = ang + i;
			shoot(DAN_MENTOS,1,obj_boss.x + lengthdir_x(mentos_dist,aim),obj_boss.y + lengthdir_y(mentos_dist,aim),aim,0,sfx_shot3,5);
		
			shoot(DAN_MENTOS,6,obj_boss.x + lengthdir_x(dist_plr,aim),obj_boss.y + lengthdir_y(dist_plr,aim),aim,0,sfx_shot3,5);
		
		}
	}
	
	
	with(obj_danmaku5)
	{
		if(step > mentos_start)
		{
			spd = goto_value(spd,mentos_spd,mentos_accel);
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

