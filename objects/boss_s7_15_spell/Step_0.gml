/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	var bubble_wait = 90;
	var bubble_nbr = 14;
	var bubble_spd_final = 1.5;
	var bubble_accel = 0.05;
	
	var boss_wait = 150;
	
	if(step % boss_wait == boss_wait - 1)
	{
		boss_movement_random(2,7,2);
	}
	
	with(obj_danmaku7)
	{
		switch(state)
		{
			case 0:
				if(state_time == 0)
				{
					angle = find_angle(obj_player.x,obj_player.y,x,y);
					dist_ref = sqrt(sqr(x - obj_player.x) + sqr(y - obj_player.y));
					dist_is = dist_ref;
					x_to = obj_player.x;
					y_to = obj_player.y;
					
					dist_div = 300;
				}
				
				if(state_time < 100)
				{
					dist_div = goto_value(dist_div,160,1)
				}
				else
				{
					dist_div = goto_value(dist_div,1000,1.5)
				}
				
				dist_is = goto_value(dist_is,0,dist_ref / dist_div);
				
				x = x_to + lengthdir_x(dist_is,angle);
				y = y_to + lengthdir_y(dist_is,angle);
				
				
				if(x == x_to) and (y == y_to)
				{
					state = 1;
					spd = 0;
					color_id = 1;
					angle = angle_re;
					x_offscreen = 30;
					y_offscreen = 30;
				}
			break;
			case 1:
				spd = goto_value(spd,bubble_spd_final,bubble_accel);
			break;
		}
	}
	
	
	if(step % bubble_wait == 0)
	{
		var an = rng(360,false,4);
		var dist = 340;
		for(var i = 0; i < 360; i += 360 / bubble_nbr)
		{
			var ang = an + i;
			var inst = shoot(DAN_BUBBLE,6,room_width / 2 + lengthdir_x(dist,ang),room_height / 2 + lengthdir_y(dist,ang),0,0,sfx_redirect1,7);
			inst.spawn_type = SPAWN_SCALE;
			inst.x_offscreen = 400;
			inst.y_offscreen = 400;
			inst.angle_re = ang;
		}
	}
	
	
	
	
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

