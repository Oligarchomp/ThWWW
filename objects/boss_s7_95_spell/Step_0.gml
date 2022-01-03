/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 30:
				case 60:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 90:
					boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
					state = 1;
				break;
			}
		break;
		case 1://WAVE 1
			var mentos_ring = 100;
			var mentos_col = 5;
			var mentos_wait = 46;
			var mentos_spd = 1.8;
			
			var dist = 360 / mentos_ring;
			var ring_in = mentos_ring / mentos_col / 2;
			
			if(state_time % mentos_wait == 0)
			{
				var ang = wave1_aim;
				for(var i = 0; i < 360; i += 360 / ring_in)
				{
					shoot_arc(DAN_MENTOS,6,mentos_col,obj_boss.x,obj_boss.y,ang + i,dist,mentos_spd,sfx_redirect1,2);
					shoot_arc(DAN_MENTOS,1,mentos_col,obj_boss.x,obj_boss.y,ang + i + 180 / ring_in,dist,mentos_spd,sfx_redirect1,2);
				}
				
				wave1_aim += 180 / ring_in + 3;
			}
		
		break;
		case 2://wave 2
			var spam_wait = 6;
			var spam_ring = 12;
			var spam_spd = 2.5;
			var spam_spd_git = 0.8;
			
			var aim_ring = 15;
			var aim_wait = 5;
			var aim_spd = 3.5;
			
			if(state_time % spam_wait == 0)
			{
				var sp = spam_spd + rng(spam_spd_git,false,6);
				shoot_ring(DAN_MENTOS,1,spam_ring,obj_boss.x,obj_boss.y,rng(360,false,6),sp,sfx_shot2,3);
			}
			
			if(state_time % aim_wait == 0)
			{
				shoot_ring(DAN_MENTOS,6,aim_ring,obj_boss.x,obj_boss.y,999,aim_spd,sfx_shot3,4);
			}
		
		break;
		case 3:
			var mentos_wait = 4;
			var mentos_ring = 16;
			var mentos_spd = 5;
			var mentos_spin = 1.7;
			
			if(state_time % mentos_wait == 0)
			{
				shoot_ring(DAN_MENTOS,1,mentos_ring,obj_boss.x,obj_boss.y,wave2_aim,mentos_spd,sfx_shot1,5);
				shoot_ring(DAN_MENTOS,6,mentos_ring,obj_boss.x,obj_boss.y,- wave2_aim + 180 / mentos_ring,mentos_spd,sfx_shot1,6);
				wave2_aim += mentos_spin;
			}
		break;
		case 4:
			var mentos_ring = 46;
			var mentos_wait = 60;//78
			var mentos_spd = 480 / 360;//1.2
			
			if(state_time % mentos_wait == 0)
			{
				shoot_ring(DAN_BUBBLE,1,mentos_ring,obj_boss.x,obj_boss.y,rng(360,false,6),mentos_spd,sfx_redirect1,7);
				
				var ang = rng(360,false,6);
				for(var i = 0; i < 360; i += 360 / mentos_ring)
				{
					var aim = ang + i + global.rng_patch * rng(360,false,1);
					var xx = obj_boss.x + lengthdir_x(300,aim);
					var yy = obj_boss.y + lengthdir_y(300,aim);
					var inst = shoot(DAN_BUBBLE,6,xx,yy,find_angle(xx,yy,obj_boss.x,obj_boss.y) + 180,0,noone,8);	
					inst.dist_ref = 480;
					inst.x_offscreen = 1000;
					inst.y_offscreen = 1000;
					inst.spawn_type = SPAWN_SCALE;
				}
			}
			
			var note_ring = 8;
			var note_spd = 2.2;
			var note_wait = 15;
			
			if(timeout)
			{
				if(state_time % note_wait == 0)
				{
					shoot_ring(DAN_NOTE,3.5 - 2.5 * note_dir,note_ring,obj_boss.x,obj_boss.y,999,note_spd,sfx_shot1,1);
					note_dir *= -1;	
				}
			}
		break;
		case 10:
			switch(state_time)
			{
				case 30:
					boss_charge(obj_boss.x,obj_boss.y);
					farewell = 1;
				break;
				case 60:
					boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
					state = wave;
				break;
			}
		break;
	}
	
	
	if(keyboard_check_pressed(vk_control)) and (global.debug)
	{
		life_left -= 600;	
	}
	
	
	
	if(state >= 1) and (state <= 5)
	{
		switch(state_time % 120)
		{
			case 29:
			case 59:
			case 89:
				play_sound(sfx_redirect3,1,false);
			break;
			case 119:
				screen_shake(5,0);
				play_sound(sfx_spawn_light,1,false);
				farewell *= -1;	
			break;
		}
	}
	
	if(farewell == 1)
	{
		with(obj_danmaku)
		{
			if(danmaku_id == DAN_MENTOS)
			{
				sprite_danmaku = color_id == 1 ? spr_mentos_farewell : spr_mentos;
				sprite_index = color_id == 1 ? spr_nothing : spr_danmaku_hitbox;
			}
			if(danmaku_id == DAN_BUBBLE)
			{
				sprite_danmaku = color_id == 1 ? spr_bubble_farewell : spr_bubble;
				sprite_index = color_id == 1 ? spr_nothing : spr_danmaku_hitbox;
			}
			image_index = danmaku_id;
		}
	}
	else
	{
		with(obj_danmaku)
		{
			if(danmaku_id == DAN_MENTOS)
			{
				sprite_danmaku = color_id == 6 ? spr_mentos_farewell : spr_mentos;
				sprite_index = color_id == 6 ? spr_nothing : spr_danmaku_hitbox;
			}
			if(danmaku_id == DAN_BUBBLE)
			{
				sprite_danmaku = color_id == 6 ? spr_bubble_farewell : spr_bubble;
				sprite_index = color_id == 6 ? spr_nothing : spr_danmaku_hitbox;
			}
			image_index = danmaku_id;
		}
	}
	
	with(obj_danmaku8)
	{
		dist_ref = goto_value(dist_ref,0,mentos_spd);
		x = obj_boss.x + lengthdir_x(dist_ref,angle);
		y = obj_boss.y + lengthdir_y(dist_ref,angle);	
		
		if(dist_ref == 0)
		{
			cancel_bullet(self);	
		}
	}
	
	with(obj_danmaku)
	{
		switch (state)
		{
			case 0:
				is_cancelable = false;
				state = 1;
			break;
		}
	}
	
	if(!timeout)
	{
		if(time_left < 20 * 60)
		{
			if(wave != 4)
			{
				state = 10;
				timeout = true;
				wave = 4;
				screen_clean(false,true);
				play_sound(sfx_spawn_heavy,1,false);
			}
			else
			{
				timeout = true;
				play_sound(sfx_spawn_heavy,1,false);
			}
		}
	}
	
	switch(state)
	{
		case 1:
			if(life_left < 3100)
			{
				state = 10;
				wave += 1;
				screen_clean(false,true);
				play_sound(sfx_shot1,1,false);
				invincibility = 100;
			}
		break;
		case 2:
			if(life_left < 2000)
			{
				state = 10;
				wave += 1;
				screen_clean(false,true);
				play_sound(sfx_shot1,1,false);
				invincibility = 100;
			}
		break;
		case 3:
			if(life_left < 1300)
			{
				state = 10;
				wave += 1;
				screen_clean(false,true);
				play_sound(sfx_shot1,1,false);
				invincibility = 200;
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

