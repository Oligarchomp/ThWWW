/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var wood_wait = 45
			var wood_nbr = 8;
			var wood_angle_plus = 25;
			var wood_spd = 2.5;
			
			var water_nbr = 13;
			var water_y_accel = 0.05;
			var water_x_accel = 0.01;
			var water_spd_shot_min = 1;
			var water_spd_shot_git = 3;
			var water_y_grav = 3;
			var water_x_grav = -1;
			var water_wait = 145;
			var water_open = 70;
			
			var metal_wait = 175;
			var metal_nbr = 8;
			var metal_spd_shot = 6;
			var metal_deccel = 0.1;
			var metal_spd_aim = 3;
			
			var earth_wait = 161;
			var earth_nbr_wall = 13;
			var earth_nbr_in = 5;
			var earth_dist_in = 1;
			var earth_spd = 1.5;
			
			var fire_wait = 182;
			var fire_spd_min = 40;
			var fire_spd_git = 30;
			var fire_y_git = 70;
			var fire_spd_shot = 2;
			var fire_spd_max = 3;
			var fire_accel = 0.05;
			var fire_spd_git = 0.4;
		break;
		case 1:
			var wood_wait = 36
			var wood_nbr = 12;
			var wood_angle_plus = 25;
			var wood_spd = 2.5;
			
			var water_nbr = 22;
			var water_y_accel = 0.05;
			var water_x_accel = 0.01;
			var water_spd_shot_min = 1;
			var water_spd_shot_git = 3;
			var water_y_grav = 3;
			var water_x_grav = -1;
			var water_wait = 130;
			var water_open = 70;
			
			var metal_wait = 145;
			var metal_nbr = 8;
			var metal_spd_shot = 6;
			var metal_deccel = 0.1;
			var metal_spd_aim = 3;
			
			var earth_wait = 141;
			var earth_nbr_wall = 15;
			var earth_nbr_in = 5;
			var earth_dist_in = 1;
			var earth_spd = 1.5;
			
			var fire_wait = 152;
			var fire_spd_min = 28;
			var fire_spd_git = 28;
			var fire_y_git = 70;
			var fire_spd_shot = 2;
			var fire_spd_max = 3;
			var fire_accel = 0.05;
			var fire_spd_git = 0.4;
		break;
		case 2:
			var wood_wait = 36
			var wood_nbr = 12;
			var wood_angle_plus = 25;
			var wood_spd = 2.5;
			
			var water_nbr = 22;
			var water_y_accel = 0.05;
			var water_x_accel = 0.01;
			var water_spd_shot_min = 1;
			var water_spd_shot_git = 3;
			var water_y_grav = 3;
			var water_x_grav = -1;
			var water_wait = 130;
			var water_open = 70;
			
			var metal_wait = 145;
			var metal_nbr = 8;
			var metal_spd_shot = 6;
			var metal_deccel = 0.1;
			var metal_spd_aim = 3;
			
			var earth_wait = 141;
			var earth_nbr_wall = 15;
			var earth_nbr_in = 5;
			var earth_dist_in = 1;
			var earth_spd = 1.5;
			
			var fire_wait = 152;
			var fire_spd_min = 28;
			var fire_spd_git = 28;
			var fire_y_git = 70;
			var fire_spd_shot = 2;
			var fire_spd_max = 3;
			var fire_accel = 0.05;
			var fire_spd_git = 0.4;
			
			var sun_wait = 160;
			var sun_ring = 12;
			var sun_row = 4;
			var sun_spd_min = 2.5;
			var sun_spd_max = 4;
			
			var moon_wait = 130;
			var moon_nbr = 26;
			var moon_spd = 1.5;
		break;
		case 3:
			var wood_wait = 30
			var wood_nbr = 16;
			var wood_angle_plus = 25;
			var wood_spd = 2.5;
			
			var water_nbr = 30;
			var water_y_accel = 0.05;
			var water_x_accel = 0.01;
			var water_spd_shot_min = 1;
			var water_spd_shot_git = 3;
			var water_y_grav = 3;
			var water_x_grav = -1;
			var water_wait = 130;
			var water_open = 70;
			
			var metal_wait = 145;
			var metal_nbr = 12;
			var metal_spd_shot = 6;
			var metal_deccel = 0.1;
			var metal_spd_aim = 3;
			
			var earth_wait = 141;
			var earth_nbr_wall = 20;
			var earth_nbr_in = 5;
			var earth_dist_in = 1;
			var earth_spd = 1.5;
			
			var fire_wait = 140;
			var fire_spd_min = 19;
			var fire_spd_git = 16;
			var fire_y_git = 70;
			var fire_spd_shot = 2;
			var fire_spd_max = 3;
			var fire_accel = 0.05;
			var fire_spd_git = 0.4;
			
			var sun_wait = 150;
			var sun_ring = 15;
			var sun_row = 4;
			var sun_spd_min = 2.5;
			var sun_spd_max = 4;
			
			var moon_wait = 130;
			var moon_nbr = 32;
			var moon_spd = 1.5;
		break;
	}
	
	var familiar_life = 100;
	
	for(var i = 0; i < ds_list_size(id_list); i += 1)
	{
		time_list[|i] -= 1;
		if(time_list[|i] == 0)
		{
			play_sound(sfx_familiar_spawn,1,false);
			var sp = 0;
			var ang = 0;
			switch(id_list[|i])
			{
				case 1:
					var sp = 3;
					var ang = 190;
				break;
				case 2:
					var sp = 3;
					var ang = -10;
				break;
				case 3:
					var sp = 4.6;
					var ang = 5;
				break;
				case 4:
					var sp = 4.6;
					var ang = 175;
				break;
				case 6:
					var sp = 5.6;
					var ang = 192;
				break;
				case 7:
					var sp = 5.6;
					var ang = -12;
				break;
			}
			var inst = create_enemy(EN_FAMILIAR,obj_boss.x,obj_boss.y,familiar_life,id_list[|i],sp,ang);
			inst.item_nbr = 0;
			inst.familiar_id = id_list[|i];
			
			ds_list_delete(time_list,i)
			ds_list_delete(id_list,i)
		}
	}
	

	// for all familiar
	with(obj_enemy)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if (spd == 0)
				{
					state = 1;
				}
			break;
		}
	}
	//WOOD
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				wood_angle = 0;
			break;
			case 1:
				if(state_time % wood_wait == 0)
				{
					shoot_ring(DAN_BALL,3,wood_nbr,x,y,wood_angle,wood_spd,sfx_shot3,1);
					wood_angle += wood_angle_plus;
				}
			break;
		}
	}
	//WATER
	with(obj_enemy2)
	{
		if(state == 1)
		{
			if(state_time % water_wait == 0)
			{
				for(var i = 0; i < water_nbr; i += 1)
				{
					var ang = 70 - water_open + rng(water_open * 2,false,i);
					var sp = water_spd_shot_min + rng(water_spd_shot_git,false,i + 1)
					var inst = shoot(DAN_RAINDROP,2,x,y,ang,sp,sfx_shot3,2);
					inst.pos_type = POS_SP;
					inst.y_grav_accel = water_y_accel;
					inst.y_grav_max = water_y_grav;
					inst.x_grav_accel = water_x_accel;
					inst.x_grav_max = water_x_grav;
				}
			}
		}
	}
	
	//METAL
	with(obj_enemy3)
	{
		if(state == 1)
		{
			if(state_time % metal_wait == 0)
			{
				shoot_ring(DAN_KNIFE,7,metal_nbr,x,y,rng(360,false,2),metal_spd_shot,sfx_shot2,3);
				var me = self;
				with(obj_danmaku3)
				{
					x_ref = me.x;
					y_ref = me.y;
					x_offscreen = 80;
					y_offscreen = 80;
				}
			}
			
			
		}
	}
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,metal_deccel);
				if(spd == 0)
				{
					state = 1;
					var ang = find_angle(x_ref,y_ref,obj_player.x,obj_player.y);
					angle = ang;
					spd = metal_spd_aim;
				}
			break;
		}
	}
	//EARTH
	with(obj_enemy4)
	{
		if(state == 1)
		{
			if(state_time % earth_wait == 0)
			{
				var ang = rng(360,false,2);
				for(var i = ang; i < ang + 360; i += 360 / earth_nbr_wall)
				{
					shoot_arc(DAN_ARROWHEAD,5,earth_nbr_in,x,y,i,earth_dist_in,earth_spd,sfx_shot1,4);
					shoot_arc(DAN_ARROWHEAD,5,earth_nbr_in,x,y,i + 360 / earth_nbr_wall / 2,earth_dist_in,earth_spd * 1.2,sfx_shot1,4);
				}
			}
		}
	}
	//FIRE
	if(step % fire_wait == 0)
	{
		x_fire_left = obj_boss.x;
		y_fire_left = obj_boss.y;
		x_fire_right = obj_boss.x;
		y_fire_right = obj_boss.y;
		play_sound(sfx_redirect1,1,false);
	}
	if(x_fire_left > 0)
	{
		var inst = shoot(DAN_FIREBALL,6,x_fire_left,y_fire_left,88 + rng(4,false,5),fire_spd_shot,noone,5);
		inst.git = rng(fire_spd_git,false,8);
		x_fire_left -= fire_spd_min + rng(fire_spd_git,false,1);
		y_fire_left += -fire_y_git / 2 + rng(fire_y_git,false,6);
	}
	if(x_fire_right < room_width)
	{
		var inst = shoot(DAN_FIREBALL,6,x_fire_right,y_fire_right,88 + rng(4,false,5),fire_spd_shot,noone,5);
		inst.git = rng(fire_spd_git,false,9);
		x_fire_right += fire_spd_min + rng(fire_spd_git,false,1);
		y_fire_right += -fire_y_git / 2 + rng(fire_y_git,false,6);
	}
	with(obj_danmaku5)
	{
		pos_type = POS_SP;
		y_grav_accel = fire_accel;
		y_grav_max = fire_spd_max + git;	
	}
	//SUN
	with(obj_enemy6)
	{
		if(state == 1)
		{
			if(state_time % sun_wait == 0)
			{
				shoot_ring_row(DAN_MENTOS,4,sun_ring,sun_row,x,y,999,sun_spd_min,sun_spd_max,sfx_redirect1,6);
			}
		}
	}
	//MOON
	with(obj_enemy7)
	{
		if(state == 1)
		{
			if(state_time % moon_wait == 0)
			{
				shoot_ring(DAN_BUBBLE,0,moon_nbr,x,y,rng(360,false,2),moon_spd,sfx_redirect2,7);
			}
		}
	}
}
// Inherit the parent event
event_inherited();

