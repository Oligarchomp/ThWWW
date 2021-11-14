/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	var bubble_size = 166;
	
	var wave_min = 22;
	var arrow_dist = 42;
	
	var spd_reference = 50;
	var spd_div = 4.5;
	var spd_time_deccel = 60;
	var dan = DAN_MENTOS;
	
	
	var sphere_ring = 8;
	var sphere_nbr = 8;
	
	var laser_charge = 60;
	var laser_active = 50;
	var laser_wave_wait = 130;
	
	switch(state)
	{	
		case 0:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 30:
					obj_boss.x = room_width / 2;
					obj_boss.y = -1000;
					obj_boss.x_to = obj_boss.x;
					obj_boss.y_to = obj_boss.y;
					play_sound(sfx_spawn_light,1,false);
					state = 10;
					
					instance_create_depth(room_width / 2,room_height / 2, global.boss_depth,obj_bubble_timeout);
					boss_release(room_width / 2,room_height / 2,sfx_spawn_water);
				break;
			}
		break;
		case 1:
			switch(state_time)
			{
				case 80:
					play_sound(sfx_shock,1,false);
					state = 2;
	
					var inst = shoot(DAN_BALL,7,-10,-10,0,0,noone,8);
					inst.is_cancelable = false;
					inst.sprite_danmaku = spr_nothing;
				break;
			}
		break;
		case 2:
			if(state_time == wave_wait)
			{
				state = 3;
			}
		break;
		case 3:
			switch(wave_nbr % 4)
			{
				case 0://top
					for(var i = -rng(arrow_dist,false,2); i < room_width + arrow_dist; i += arrow_dist)
					{
						var sp = room_height / 2 / spd_reference;
						shoot(dan,1,i,-20,-90,sp,sfx_redirect1,3);	
					}
				break;
				case 1://right
					for(var i = -rng(arrow_dist,false,2); i < room_height + arrow_dist; i += arrow_dist)
					{
						var sp = room_width / 2 / spd_reference;
						shoot(dan,1,room_width + 20,i,180,sp,sfx_redirect1,3);	
					}
				break;
				case 2://bottom
					for(var i = -rng(arrow_dist,false,2); i < room_width + arrow_dist; i += arrow_dist)
					{
						var sp = room_height / 2 / spd_reference;
						shoot(dan,1,i,room_height + 20,90,sp,sfx_redirect1,3);	
					}
				break;
				case 3://left
					for(var i = -rng(arrow_dist,false,2); i < room_height + arrow_dist; i += arrow_dist)
					{
						var sp = room_width / 2 / spd_reference;
						shoot(dan,1,-20,i,0,sp,sfx_redirect1,3);	
					}
				break;
			}
			wave_nbr += 1;
			
			wave_wait = goto_value(wave_wait,wave_min,1);
			if(wave_wait != wave_min)
			{
				state = 2;
			}
			else
			{
				state = 43;
				play_sound(sfx_shock,1,false);
			}
		break;
		case 10://laser 1
			switch(state_time)
			{
				case 0:
					var ang = rng(360,false,9);
					play_sound(sfx_shock,1,false);
					for(var i = 0; i < 360; i += 360 / 20)
					{
						for(var j = 0; j < 3; j += 1)
						{
							shoot_laser_center(200,250,ang + i + j * 2,laser_charge,laser_active,c_white,sfx_laser2);
						}
					}
				break;
				case laser_wave_wait:
					state += 1;
				break;
			}
		break;
		case 11://laser 2
			switch(state_time)
			{
				case 0:
					play_sound(sfx_shock,1,false);
					
				break;
				case laser_wave_wait:
					state += 1;
				break;
			}
		break;
		case 12://laser 3
			switch(state_time)
			{
				case 0:
					play_sound(sfx_shock,1,false);
					
					var ang = rng(360,false,9);
					for(var i = 0; i < 360; i += 360 / 30)
					{
						var aim = ang + i;
						var x_pos = 200 + lengthdir_x(40,aim);
						var y_pos = 250 + lengthdir_y(40,aim);
						shoot_laser_center(x_pos,y_pos,aim + 90,laser_charge,laser_active,c_white,sfx_laser2);
						shoot_laser_center(x_pos,y_pos,aim,laser_charge,laser_active,c_white,sfx_laser2);	
					}
				break;
				case laser_wave_wait:
					state += 1;
				break;
			}
			
		break;
		case 13://laser 4
			switch(state_time)
			{
				case 0:
					play_sound(sfx_shock,1,false);
			
					for(var i = 0; i < 360; i += 360 / 70)
					{
						var x_pos = 200 + lengthdir_x(15,i);
						var y_pos = 250 + lengthdir_y(15,i);
						shoot_laser_center(x_pos,y_pos,i + 90,laser_charge,laser_active,c_white,sfx_laser2);	
					}
				break;
			}
			
		break;
		
		
		
		
		case 100:
			switch(state_time)
			{
				case 100:	
					boss_charge(room_width / 2,room_height / 2);
				break;
				case 130:
					for(var i = 0; i < 360; i += 360 / sphere_nbr)
					{
						for(var j = 0; j < 360; j += 360 / sphere_ring)
						{
							var inst = shoot(DAN_MENTOS,1,room_width / 2,room_height / 2,j,0,sfx_spawn_water,5);
							inst.sphere_off = degtorad(i);
						}
					}
				break;
			}
		break;
	}
	
	//wave 2
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				x_ref = x;
				y_ref = y;
				state = 1;
			break;
			case 1:
				x = x_ref + lengthdir_x(100,angle) * sin(step / 60);
				y = y_ref + lengthdir_y(100,angle) * cos(step / 60);
			
				angle += 1;
			break;
		}
	}
	
	
	
	//wave 1
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				spd_ref = spd;
				state = 1;
			break;
			case 1:
				spd = goto_value(spd,spd_ref / spd_div,spd_ref / spd_time_deccel);
			break;
		}
	}
	
	//no leaving the bubble or else you fucking die thank you
	with(obj_danmaku8)
	{
		sprite_danmaku = spr_nothing;
		
		if(get_distance(room_width / 2,room_height / 2,obj_player.x,obj_player.y) > bubble_size)
		{
			x = obj_player.x;
			y = obj_player.y;
		}
		else
		{
			x = -10;
			y = -10;
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

