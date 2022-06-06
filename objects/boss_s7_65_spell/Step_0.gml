/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) 
{
	if (spell_wait == 0)
	{
		var bubble_wait = 8;
		var bubble_ring = 9;
		var bubble_near = 70;
		var bubble_far = 440;
		var bubble_row = 5;
		var bubble_spin = 20;
		var bubble_leave = 0.05;
	
		var aim_ring = 3;
		var aim_spd = 0.8;
		var aim_accel = 0.01;
	
		var note_ring = 6;
		var note_spd_shot = 1.2;
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
						angle_shoot = first_wave ? 10 : rng(360,false,1);
						dist_shoot = bubble_near;
					
						first_wave = false;
					
						var angle_sht = angle_shoot;
						var dist_sht = dist_shoot;
					
						while(dist_sht < bubble_far)
						{
							for(var i = 0; i < 360; i += 360 / bubble_ring)
							{
								boss_charge_circle(obj_boss.x + lengthdir_x(dist_sht,angle_sht + i),obj_boss.y + lengthdir_y(dist_sht,angle_sht + i),26);		
							}
						
							angle_sht += act_dir * bubble_spin;
							dist_sht += (bubble_far - bubble_near) / bubble_row;
						}
					
						with(obj_circlecharge)
						{
							state = 3;	
						}
					break;
					case 40:
						boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
						state += 1;
					break;
				}
			break;
			case 1:
				if(dist_shoot < bubble_far)
				{
					if(state_time % bubble_wait == 0)
					{
						for(var i = 0; i < 360; i += 360 / bubble_ring)
						{
							var inst = shoot(DAN_BUBBLE,3.5 - act_dir * 2.5,obj_boss.x + lengthdir_x(dist_shoot,angle_shoot + i),obj_boss.y + lengthdir_y(dist_shoot,angle_shoot + i),angle_shoot + i,0,sfx_shot1,5);
							inst.is_cancelable = false;
						}
					
						angle_shoot += act_dir * bubble_spin;
						dist_shoot += (bubble_far - bubble_near) / bubble_row;
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
					case 20:
						boss_charge(obj_boss.x,obj_boss.y);
					break;
					case 50:
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
					case 80:
						boss_movement_random(2,20,1);
					break;
					case 140:
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
					instance_nearest(x,y,obj_circlecharge).state = 5;
					state += 1;
				break;
				case 2:
					visual_xscale = goto_value(visual_xscale,0,bubble_leave);
					visual_yscale = goto_value(visual_yscale,0,bubble_leave);
				
					if(visual_xscale == 0)
					{
						instance_destroy();
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
	
	
		with(obj_circlecharge)
		{
			switch(state)
			{
				case 3:
					alpha = goto_value(alpha,0.6,0.04);
					if(alpha == 0.6)
					{
						state += 1;	
					}
				break;
				case 5:
					alpha = goto_value(alpha,0,0.04);
					if(alpha == 0)
					{
						instance_destroy();
					}
				break;
			}
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

