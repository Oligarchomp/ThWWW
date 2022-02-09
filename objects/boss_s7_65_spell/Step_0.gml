/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	
	var bubble_wait = 8;
	var bubble_ring = 9;
	var bubble_near = 30;
	var bubble_far = 230;
	var bubble_time = 42;
	var bubble_row = 5;
	var bubble_spin = 13;
	var bubble_deccel = 0.1;
	var bubble_leave = 0.05;
	
	var aim_ring = 3;
	var aim_spd = 0.8;
	var aim_accel = 0.01;
	
	var note_ring = 7;
	var note_spd_shot = 1.5;
	var note_spin = 7;
	var note_spd_final = 1;
	var note_deccel = 0.1;
	
	var spell = self;
	
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
					
					angle_shoot = rng(360,false,1);
					dist_shoot = bubble_far;
				break;
			}
		break;
		case 1:
			if(dist_shoot > bubble_near)
			{
				if(state_time % bubble_wait == 0)
				{
					for(var i = 0; i < 360; i += 360 / bubble_ring)
					{
						var inst = shoot(DAN_BUBBLE,3.5 - act_dir * 2.5,obj_boss.x,obj_boss.y,angle_shoot + i,0,sfx_shot1,5);
						inst.dist_ref = dist_shoot;
						inst.dist_is = 0;
						inst.is_cancelable = false;
					}
					
					angle_shoot += act_dir * bubble_spin;
					dist_shoot -= (bubble_far - bubble_near) / bubble_row;
				}
			}
			else
			{
				state += 1;	
			}
		break;
		case 2:
			switch(state_time)
			{
				case 50:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 80:
					play_sound(sfx_redirect1,1,false);
					
					with(obj_danmaku5)
					{
						var aim = rng(360,false,1)//find_angle(x,y,obj_player.x,obj_player.y);
						for(var i = 0; i < 360; i += 360 / aim_ring)
						{
							var inst = shoot(DAN_NOTE,7,x,y,aim + i,0,noone,4);
							inst.image_xscale = 2;
							inst.image_yscale = 2;
							inst.x_offscreen *= 2;
							inst.y_offscreen *= 2;
						}
						shoot_ring(DAN_NOTE,3.5 - spell.act_dir * 2.5,note_ring,x,y,rng(360,false,1),note_spd_shot,noone,3);
						state = 2;
						sprite_index = spr_nothing;
					}
				break;
				case 90:
					boss_movement_random(2,20,1);
				break;
				case 170:
					state = 0;
					act_dir *= -1;
				break;
			}
		break;
	}
	
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				if(dist_is != dist_ref)
				{
					x = obj_boss.x + lengthdir_x(dist_is,angle);
					y = obj_boss.y + lengthdir_y(dist_is,angle);
					dist_is = goto_value(dist_is,dist_ref,dist_ref / bubble_time);
				}
				else
				{
					state += 1;
					spd = get_distance(0,0,lengthdir_x(dist_ref / bubble_time,angle),lengthdir_y(dist_ref / bubble_time,angle));
				}
			break;
			case 1:
				spd = goto_value(spd,0,bubble_deccel);
			break;
			case 2:
				visual_xscale = goto_value(visual_xscale,0,bubble_leave);
				visual_yscale = goto_value(visual_yscale,0,bubble_leave);
				
				if(visual_xscale == 0)
				{
					cancel_bullet(self);	
				}
			break;
		}
	}
	
	//white aimed
	with(obj_danmaku4)
	{
		spd = goto_value(spd,aim_spd,aim_accel);	
	}
	
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				angle_to = angle + 360 * spell.act_dir;
				state += 1;
			break;
			case 1:
				angle = goto_value(angle,angle_to,note_spin);
				if(angle == angle_to)
				{
					state += 1;
				}
			break;
			case 2:
				spd = goto_value(spd,note_spd_final,note_deccel);
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

