/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	var bubble_wait = 90;
	var bubble_vnbr = 4;
	var bubble_hnbr = 3;
	var bubble_spd_final = 1.5;
	var bubble_accel = 0.05;
	
	var boss_wait = 150;
	
	if(step % boss_wait == boss_wait - 1)
	{
		boss_movement_random(2,7,2);
	}
	
	if(step % bubble_wait == 0)
	{
		var dist = room_width / bubble_hnbr;
		for(var i = dist / 2; i < room_width; i += dist)
		{
			shoot(DAN_BUBBLE,6,i,-10,999,0,sfx_redirect1,7);
			shoot(DAN_BUBBLE,6,i,room_height + 10,999,0,sfx_redirect1,7);
		}
		
		var dist = room_height / bubble_vnbr;
		for(var i = dist / 2; i < room_height; i += dist)
		{
			shoot(DAN_BUBBLE,6,-10,i,999,0,sfx_redirect1,7);
			shoot(DAN_BUBBLE,6,room_width + 10,i,999,0,sfx_redirect1,7);
		}
		var aim = rng(360,false,2);
		var plus = 180 / (bubble_hnbr + bubble_vnbr) ;
		with(obj_danmaku7)
		{
			if(state == 0)
			{
				angle_re = aim;
				aim += plus;
				
				state = 1;
			}
		}
	}
	
	with(obj_danmaku7)
	{
		switch(state)
		{
			case 1:
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
				
				
				if(x = x_to) and (y = y_to)
				{
					state = 2;
					spd = 0;
					color_id = 1;
					angle = angle_re
				}
			break;
			case 2:
				spd = goto_value(spd,bubble_spd_final,bubble_accel);
			break;
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

