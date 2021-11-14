/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{

	var shoot_wait = 3;
	var shoot_angle_plus = -5.2;
	var amulet_row = 3;
	var amulet_spd_min = 1.4;
	var amulet_spd_max = 1.8;
	var dist_shoot = 280;
	
	var aim_nbr = 16;
	var aim_spd = 1.2;
	
	switch(spell_wait)
	{
		case 0:
			switch(state)
			{
				case 0:
					switch(state_time)
					{
						case 0:
							for(var i = 0; i <= room_width; i += 50)
							{
								boss_charge(i,0);
								boss_charge(i,room_height);
							}
							for(var i = 0; i <= room_height; i += 50)
							{
								boss_charge(0,i);
								boss_charge(room_width,i);
							}
						break;
						case 20:
							var inst = shoot(DAN_PELLET,7,room_width / 2, -200,-45,0,noone,8);
							inst.is_cancelable = false;
							inst.y_offscreen = 400;
							var inst = shoot(DAN_PELLET,7,room_width / 2, room_height + 200,-45,0,noone,8);
							inst.is_cancelable = false;
							inst.y_offscreen = 400;
							var inst = shoot(DAN_PELLET,7,-200, room_height / 2,135,0,noone,8);
							inst.is_cancelable = false;
							inst.x_offscreen = 400;
							var inst = shoot(DAN_PELLET,7,room_width + 200, room_height / 2,135,0,noone,8);
							inst.is_cancelable = false;
							inst.x_offscreen = 400;
						break;
						case 40:
							play_sound(sfx_boss_release,1,false);
						break;
						case 70:
							boss_charge(obj_boss.x,obj_boss.y);
						break;
						case 100:
							boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
							state = 1;
							with(obj_danmaku8)
							{
								state = 2;	
							}
						break;
					}
				break;
				case 1:
					switch(state_time % 118)
					{
						case 1:
							shoot_ring(DAN_MENTOS,3.5 - 2.5 * act_dir,aim_nbr,obj_boss.x,obj_boss.y,999,aim_spd,sfx_redirect1,6);
							act_dir *= -1;
						break;
						case 70:
							boss_movement_random(2,10,2);
						break;
						case 130:
							//boss_charge(obj_boss.x,obj_boss.y);
						break;
					}
				break;
			}
	
	
	
			with(obj_danmaku8)
			{
				switch(state)
				{
					case 0:
						var col = y > room_height ? 3 : 1;
					
						shoot_arc_row(DAN_BUBBLE,col,18,3,x,y,find_angle(x,y,room_width / 2,room_height / 2),5.5,8,13.5,noone,7)
						state = 1;
					break;
					case 2:
						if(state_time % shoot_wait == 0)
						{
							angle += shoot_angle_plus;
							shoot_row(DAN_AMULET,1,amulet_row,x + lengthdir_x(dist_shoot,angle),y + lengthdir_y(dist_shoot,angle),angle,amulet_spd_min,amulet_spd_max,sfx_shot2,2);
							var sp = amulet_spd_max //+ (amulet_spd_max - amulet_spd_min) / amulet_row
							shoot(DAN_KNIFE,6,x + lengthdir_x(dist_shoot,angle),y + lengthdir_y(dist_shoot,angle),angle,sp,sfx_shot2,1);
						}
					break;
				}
			}
	
			with(obj_danmaku7)
			{
				switch(state)
				{
					case 0:
						is_cancelable = false;
						y_offscreen = 400;
						x_offscreen = 400;
						spd_ref = spd;
						state = 1;
					break;
					case 1:
						spd = goto_value(spd,0,spd_ref / 50);
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
		break;
	}
}

// Inherit the parent event
event_inherited();

