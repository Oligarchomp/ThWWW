/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			
		break;
		case 1:
		
		break;
		case 2:
		
		break;
		case 3:
			var metal_wait = 80;
			var metal_nbr = 12;
			var metal_spd_shot = 5.5;
			var metal_deccel = 0.1;
			var metal_spd_aim = 4;
			
			var fire_wait = 140;
			var fire_spd_min = 7;
			var fire_spd_git = 9;
			var fire_y_git = 40;
			var fire_spd_shot = 2;
			var fire_spd_max = 3;
			var fire_accel = 0.05;
			var fire_spd_git = 0.4;
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
					var ang = 175;
				break;
				case 4:
					var sp = 4.6;
					var ang = 5;
				break;
				case 5:
					var sp = 5.6;
					var ang = 192;
				break;
				case 6:
					var sp = 5.6;
					var ang = -12;
				break;
			}
			var inst = create_enemy(EN_FAMILIAR,obj_boss.x,obj_boss.y,familiar_life,id_list[|i],sp,ang);
			inst.item_nbr = 0;
			
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
		var inst = shoot(DAN_FIREBALL,6,x_fire_left,y_fire_left,88 + rng(4,false,5),fire_spd_shot,noone,6);
		inst.git = rng(fire_spd_git,false,8);
		x_fire_left -= fire_spd_min + rng(fire_spd_git,false,1);
		y_fire_left += -fire_y_git / 2 + rng(fire_y_git,false,6);
	}
	if(x_fire_right < room_width)
	{
		var inst = shoot(DAN_FIREBALL,6,x_fire_right,y_fire_right,88 + rng(4,false,5),fire_spd_shot,noone,6);
		inst.git = rng(fire_spd_git,false,9);
		x_fire_right += fire_spd_min + rng(fire_spd_git,false,1);
		y_fire_right += -fire_y_git / 2 + rng(fire_y_git,false,6);
	}
	with(obj_danmaku6)
	{
		pos_type = POS_SP;
		y_grav_accel = fire_accel;
		y_grav_max = fire_spd_max + git;	
	}
	//MOON
	with(obj_enemy3)
	{
		if(state == 1)
		{
			if(state_time % moon_wait == 0)
			{
				
			}
		}
	}
}
// Inherit the parent event
event_inherited();

