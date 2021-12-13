/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	var fam_wait = 11 - need_ball * 2 - need_bubble * 2;
	var move_dist = 10 + need_ball * 2 + need_bubble * 2;
	var mentos_spd = 0.8;
	var ball_spd = 0.95;
	var bubble_spd = 0.65;
	
	var dist = 10;
	var width_max = room_width + dist;
	var width_min = - dist;
	var height_max = room_height + dist;
	var height_min = - dist;
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					boss_charge(x_pos,y_pos)
				break;
				case 30:
					obj_boss.alpha = 0.4;
					obj_boss.mask_index = spr_nothing;
					obj_hitbox.sprite_index = spr_nothing;
					instance_create_depth(obj_boss.x,obj_boss.y,obj_boss.depth - 1, obj_shield_reverence);
				
				
					boss_release(x_pos,y_pos,sfx_boss_release);
					
					var inst = create_enemy(EN_FAMILIAR,x_pos,y_pos,99999999,1,0,0);
					inst.item_nbr = 0;
					
					var inst = create_enemy(EN_FAMILIAR,x_pos,y_pos,99999999,2,0,0);
					inst.item_nbr = 0;
					
					play_sound(sfx_familiar_spawn,1,false);
					state += 1;
				break;
			}
		break;
		case 1:// top
			x_pos += move_dist;
			if(x_pos > width_max)
			{
				y_pos += x_pos - width_max;
				x_pos = width_max;
				state += 1;
			}
		break;
		case 2:// right
			y_pos += move_dist;
			if(y_pos > height_max)
			{
				x_pos -= y_pos - height_max;
				y_pos = height_max;
				state += 1;
			}
		break;
		case 3:// bottom
			x_pos -= move_dist;
			if(x_pos < width_min)
			{
				y_pos += x_pos - width_min;
				x_pos = width_min;
				state += 1;
			}
		break;
		case 4:// left
			y_pos -= move_dist;
			if(y_pos < height_min)
			{
				x_pos -= y_pos - height_min;
				y_pos = height_min;
				state = 1;
			}
		break;
	}
	
	switch(time_left)
	{
		case 730:
			boss_charge(room_width / 2,0)
		break;
		case 690:
			boss_release(room_width / 2,0,sfx_boss_release);
			need_ball = true;
			shoot_step = 0;
		break;
		case 250:
			boss_charge(room_width / 2,0)
		break;
		case 220:
			boss_release(room_width / 2,0,sfx_boss_release);
			need_bubble = true;
			shoot_step = 0;
		break;
	}
	
	var spell = self;
	with(obj_enemy1)
	{
		x = spell.x_pos;
		y = spell.y_pos;
	}
	
	with(obj_enemy2)
	{
		x = room_width - spell.x_pos;
		y = spell.y_pos;
	}
		
	
	if(shoot_step % fam_wait == 0) and (state > 0)
	{
		if(need_ball)
		{
			shoot(DAN_BALL,1,x_pos,y_pos,999,ball_spd,noone,3)
			
			shoot(DAN_BALL,6,room_width - x_pos,y_pos,999,ball_spd,noone,3)
		}
		if(need_bubble)
		{
			var inst = shoot(DAN_BUBBLE,1,x_pos,y_pos,999,bubble_spd,noone,5)
			inst.is_cancelable = false;
			var inst = shoot(DAN_BUBBLE,6,room_width - x_pos,y_pos,999,bubble_spd,noone,5)
			inst.is_cancelable = false;
		}
		
		var inst = shoot(DAN_MENTOS,1,x_pos,y_pos,999,mentos_spd,sfx_redirect1,4)
		inst.is_cancelable = false;
		var inst = shoot(DAN_MENTOS,6,room_width - x_pos,y_pos,999,mentos_spd,sfx_redirect1,4)
		inst.is_cancelable = false;
	}
	
	shoot_step += 1;
}

// Inherit the parent event
event_inherited();

