/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	var spell = self;
	
	
	var bubble_size = 166;
	
	//wave1
	var mentos_nbr = 14;
	var mentos_spd_final = 4;
	var mentos_accel = 0.25;
	var mentos_wait_min = 20;
	
	//wave 3
	var wave_min = 2;
	var arrow_dist = 34;
	
	var spd_reference = 50;
	var spd_div = 4.5;
	var spd_time_deccel = 60;
	var dan = DAN_NOTE;
	
	//wave 2
	var sphere_ring = 10;
	var sphere_nbr = 10;
	
	
	
	//wave 1 mentos
	with(obj_danmaku6)
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
					cancel_bullet(self);
				}
			break;
			case 1:
				spd = goto_value(spd,mentos_spd_final,mentos_accel);
			break;
		}
	}
	

	switch(state)
	{	
		case 0:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 30:
					
					instance_create_depth(room_width / 2, room_height / 2,0,obj_staybubble);
					
					shoot_ring(DAN_BUBBLE,1,5,obj_boss.x,obj_boss.y,999,1.5,sfx_redirect1,7);
					shoot_ring(DAN_BUBBLE,6,5,obj_boss.x,obj_boss.y,998,1.5,sfx_redirect1,7);
					
					play_sound(sfx_spawn_light,1,false);
					state = 1;
					
					instance_create_depth(room_width / 2,room_height / 2, global.boss_depth,obj_bubble_timeout);
					boss_release(room_width / 2,room_height / 2,sfx_spawn_water);
				break;
			}
		break;
		case 1:
			switch(state_time)
			{
				case 10:
					obj_boss.x = room_width / 2;
					obj_boss.y = -1000;
					obj_boss.x_to = obj_boss.x;
					obj_boss.y_to = obj_boss.y;
				break;
				case 110:
					play_sound(sfx_shock,1,false);
					state = 2;
	
					var inst = shoot(DAN_BALL,7,-10,-10,0,0,noone,8);
					inst.is_cancelable = false;
					inst.sprite_danmaku = spr_nothing;
				break;
			}
		break;
		case 2:
			var dist = 340;
			for(var i = 0; i < 360; i += 360 / mentos_nbr)
			{
				var ang = i + global.rng_patch * rng(360,false,1);
				var inst = shoot(DAN_MENTOS,1,room_width / 2 + lengthdir_x(dist,ang),room_height / 2 + lengthdir_y(dist,ang),0,0,sfx_redirect1,6);
				inst.spawn_type = SPAWN_SCALE;
				inst.x_offscreen = 400;
				inst.y_offscreen = 400;
				inst.angle_re = ang;
				inst.is_cancelable = false;
			}
			
			mentos_wait = goto_value(mentos_wait,mentos_wait_min,1);
			
			state = mentos_wait != mentos_wait_min ? 3 : 4;
		break;
		case 3:
			if(state_time == mentos_wait)
			{
				state = 2;
			}
		break;
		case 4:
			switch(state_time)
			{
				case 0:
					play_sound(sfx_shock,1,false);
				break;
				case 120:
					state = 5;
				break;
			}
		break;
		//Bubble
		case 5:
			switch(state_time)
			{
				case 100:	
					boss_charge(room_width / 2,room_height / 2);
				break;
				case 130:
					mat_motion = create_rotation_matrix(x_spd,y_spd,z_spd);
					
					for(var i = 0; i <= 180; i += 180 / sphere_nbr)
					{
						var angle1 = degtorad(i);
						var dan = sin(angle1) == 0? DAN_MENTOS : DAN_BALL;
						
						for(var j = 0; j < 360; j += 360 / sphere_ring)
						{
							var inst = shoot(dan,8,room_width / 2,room_height / 2,j - i,0,sfx_spawn_water,5);
							var angle2 = degtorad(j);
							
							inst.xx = bubble_ray * sin(angle1) * cos(angle2);
							inst.yy = bubble_ray * sin(angle1) * sin(angle2);
							inst.zz = bubble_ray * cos(angle1);
							
							inst.bubble_way = 0;
							
							inst.is_cancelable = false;
						}
					}
					
					state += 1;
				break;
			}
		break;
		case 6:
			switch(state_time)
			{
				case 1000:
					play_sound(sfx_photo_charge,1,false);
				break;
				case 1100:
					with(obj_danmaku5)
					{
						state = 2;
					}
					
					play_sound(sfx_redirect1,1,false);
					state = 7;
				break;
			}
			
			if(state_time > 1000)			
			{
				x_spd = goto_value(x_spd,0,x_spd_ref / 100);
				y_spd = goto_value(y_spd,0,y_spd_ref / 100);
				z_spd = goto_value(z_spd,0,z_spd_ref / 100);
				
				mat_motion = create_rotation_matrix(x_spd,y_spd,z_spd);
			}
		break;
		case 7:
			if(state_time == 120)
			{
				state = 8;
				play_sound(sfx_shock,1,false);
			}
		break;
		case 8:
			if(state_time == wave_wait)
			{
				state = 9;
			}
		break;
		case 9:
			switch(wave_nbr % 4)
			{
				case 0://top
					for(var i = -rng(arrow_dist,false,2); i < room_width + arrow_dist; i += arrow_dist)
					{
						var sp = room_height / 2 / spd_reference;
						var inst = shoot(dan,6,i,-20,-90,sp,sfx_redirect1,3);
					}
				break;
				case 1://right
					for(var i = -rng(arrow_dist,false,2); i < room_height + arrow_dist; i += arrow_dist)
					{
						var sp = room_width / 2 / spd_reference;
						var inst = shoot(dan,6,room_width + 20,i,180,sp,sfx_redirect1,3);
					}
				break;
				case 2://bottom
					for(var i = -rng(arrow_dist,false,2); i < room_width + arrow_dist; i += arrow_dist)
					{
						var sp = room_height / 2 / spd_reference;
						var inst = shoot(dan,6,i,room_height + 20,90,sp,sfx_redirect1,3);
					}
				break;
				case 3://left
					for(var i = -rng(arrow_dist,false,2); i < room_height + arrow_dist; i += arrow_dist)
					{
						var sp = room_width / 2 / spd_reference;
						var inst = shoot(dan,6,-20,i,0,sp,sfx_redirect1,3);
					}
				break;
			}
			inst.is_cancelable = false;
			inst.spawn_type = SPAWN_SCALE;
			
			wave_nbr += 1;
			
			wave_wait = goto_value(wave_wait,wave_min,1);
			
			state = 8;
		break;
		
	}
	
	//wave 2 Otohime Bubble
	with(obj_danmaku5)
	{
		var percent = (bubble_way / spell.bubble_ray);
		color = make_color_hsv(185 + (xx / 20) * percent,120 + (xx / 1.5) * percent,220);//150
		
		switch(state)
		{
			case 0:
				x_ref = x;
				y_ref = y;
				state = 1;
			break;
			case 1:
				bubble_way += min(0.45,recursiv(bubble_way,spell.bubble_ray,30,0.1));
				
				var vect = transform_3d(xx,yy,zz,spell.mat_motion);
				
				xx = vect[0];
				yy = vect[1];
				zz = vect[2];
		
				x = x_ref + yy * percent;
				y = y_ref + zz * percent;
				depth = global.player_depth + floor(xx / 12);
			break;
			case 2:
				spd = goto_value(spd,2.5,0.01);
			break;
		}
	}
	
	
	
	//wave 1 Presto
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
	
	
	
	
}

// Inherit the parent event
event_inherited();
/*

var laser_charge = 60;
	var laser_active = 50;
	var laser_wave_wait = 130;
//laser
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
					
					var ang = rng(360,false,9);
					for(var i = 0; i < 360; i += 360 / 24)
					{
						var aim = ang + i;
						var x_pos = 200 + lengthdir_x(110,aim);
						var y_pos = 250 + lengthdir_y(110,aim);
						shoot_laser_center(x_pos,y_pos,aim,laser_charge,laser_active,c_white,sfx_laser2);
						shoot_laser_center(x_pos,y_pos,aim - 90,laser_charge,laser_active,c_white,sfx_laser2);	
					}
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
					
					play_sound(sfx_shock,1,false);
					
					var ang = rng(360,false,9);
					for(var i = 0; i < 360; i += 360 / 40)
					{
						ang += 360 / 40;
						var aim = ang + i;
						var x_pos = 200 + lengthdir_x(40,aim);
						var y_pos = 250 + lengthdir_y(40,aim);
						shoot_laser_center(x_pos,y_pos,aim,laser_charge,laser_active,c_white,sfx_laser2);
						shoot_laser_center(x_pos,y_pos,aim - 45,laser_charge,laser_active,c_white,sfx_laser2);	
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
					
					var ang = rng(360,false,9);
					for(var i = 0; i < 360; i += 360 / 26)
					{
						var aim = ang + i;
						var x_pos = 200 + lengthdir_x(100,aim);
						var y_pos = 250 + lengthdir_y(100,aim);
						shoot_laser_center(x_pos,y_pos,aim,laser_charge,laser_active,c_white,sfx_laser2);
						shoot_laser_center(x_pos,y_pos,aim - 90,laser_charge,laser_active,c_white,sfx_laser2);	
					}
				break;
				case laser_wave_wait:
					state += 1;
				break;
			}
		break;
		case 14://laser 5
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
		case 15://laser 6
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
		