/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var shock_wave = 3;
			var shock_wait = 42;
			
			var spam_grav_max = 1.5;
			var spam_grav_git = 0.2;
			var spam_accel = 0.1;
			var spam_arrow_nbr = 20;
			var spam_open = 10;
			
			var tree_dan = DAN_MENTOS;
			var tree_nbr = 10;
			var tree_spin = 2;
			var tree_spd = 1;
			var tree_spd_div = 1.5;
			
			var aim_dan = DAN_ARROW;
			var aim_wait = 12;
			var aim_spd = 1.5;
			var aim_arc = 5;
			var aim_dist = 36;
		break;
		case 1:
			var shock_wave = 3;
			var shock_wait = 40;
			
			var spam_grav_max = 1.75;
			var spam_grav_git = 0.4;
			var spam_accel = 0.1;
			var spam_arrow_nbr = 38;
			var spam_open = 16;
			
			var tree_dan = DAN_MENTOS;
			var tree_nbr = 20;
			var tree_spin = 2;
			var tree_spd = 1.5;
			var tree_spd_div = 1.5;
			
			var aim_dan = DAN_ARROW;
			var aim_wait = 8;
			var aim_spd = 2.5;
			var aim_arc = 7;
			var aim_dist = 25;
		break;
		case 2:
			var shock_wave = 4;
			var shock_wait = 35;
			
			var spam_grav_max = 2;
			var spam_grav_git = 0.5;
			var spam_accel = 0.1;
			var spam_arrow_nbr = 46;
			var spam_open = 18;
			
			var tree_dan = DAN_BUBBLE;
			var tree_nbr = 17;
			var tree_spin = 2;
			var tree_spd = 1.5;
			var tree_spd_div = 1.5;
			
			var aim_dan = DAN_MENTOS;
			var aim_wait = 6;
			var aim_spd = 2.8;
			var aim_arc = 9;
			var aim_dist = 18;
		break;
		case 3:
			var shock_wave = 5;
			var shock_wait = 25;
			
			var spam_grav_max = 2;
			var spam_grav_git = 0.5;
			var spam_accel = 0.1;
			var spam_arrow_nbr = 52;
			var spam_open = 20;
			
			var tree_dan = DAN_BUBBLE;
			var tree_nbr = 23;
			var tree_spin = 2;
			var tree_spd = 1.5;
			var tree_spd_div = 1.5;
			
			var aim_dan = DAN_MENTOS;
			var aim_wait = 5;
			var aim_spd = 3;
			var aim_arc = 11;
			var aim_dist = 15;
		break;
	}
	
	var spam_shoot_spd = 2;
	var spam_shoot_spd_git = 1.5;
	
	var spell = self;
	
	switch(state)
	{
		case 0:
			if(state_time < shock_wave * shock_wait)
			{
				
				if(state_time % shock_wait == 0)
				{
					screen_shake(5,0);
					play_sound(sfx_shock,1,false);
					
					for(var i = 0; i < spam_arrow_nbr; i += 1)
					{
						var sp = spam_shoot_spd + rng(spam_shoot_spd_git,false,i + 3);
						var ang = 90 - spam_open + rng(spam_open * 2, false,i + 1);
						var inst = shoot(DAN_ARROW,3,rng(room_width,false,i),-50,ang,sp,noone,7);
						inst.spawn_type = SPAWN_SCALE;
						inst.image_xscale = 2;
						inst.image_yscale = 2;
						inst.x_offscreen *= 2;
						inst.y_offscreen *= 2;
						inst.pos_type = POS_SP;
						inst.y_grav_accel = spam_accel;
						inst.y_grav_max = spam_grav_max + rng(spam_grav_git,false, i + 2);	
						inst.y_offscreen = 90;
					}
					
				}
			}
			else
			{
				state = 1;	
				var rand = rng(360,false,9);
				for(var i = 0; i < 360; i += 360 / tree_nbr)
				{
					var inst = shoot(tree_dan,3,obj_boss.x,obj_boss.y,rand + i,0,noone,8);
					inst.pos_type = POS_MANUAL;
					switch(tree_dan)
					{
						case DAN_BUBBLE:
							inst.dist = 60;
						break;
						case DAN_MENTOS:
							inst.dist = 43;
						break;
					}
					inst.x_offscreen = 250;
					inst.y_offscreen = 250;
					inst.spd_to = tree_spd / tree_spd_div;
					
					var inst = shoot(tree_dan,3,obj_boss.x,obj_boss.y,rand + i + 360 / tree_nbr / 2,0,noone,8);
					inst.pos_type = POS_MANUAL;
					switch(tree_dan)
					{
						case DAN_BUBBLE:
							inst.dist = 30;
						break;
						case DAN_MENTOS:
							inst.dist = 16;
						break;
					}
					inst.x_offscreen = 250;
					inst.y_offscreen = 250;
					inst.spd_to = tree_spd;
				}
			}
		break;
		case 1:
			boss_movement_goto(obj_player.x,340, 2.6);
			if(state_time == 195)
			{
				obj_boss.x_to = obj_boss.x;
				obj_boss.y_to = obj_boss.y;
				
				boss_charge(obj_boss.x,obj_boss.y);
				state = 2;
				with(obj_danmaku8)
				{
					state = 1;	
					angle_spd = tree_spin * spell.dir_act;
				}
			}
		break;
		case 2:
			switch(state_time)
			{
				case 46:
					play_sound(sfx_redirect1,1,false);
					with(obj_danmaku8)
					{
						state = 2;	
						pos_type = POS_ANGLE;
						y_offscreen = 40;
						angle = global.rng_patch ? rng(360,false,1) : angle;
					}
				break;
				case 96:
					state = 3;
					boss_movement_goto(room_width / 2,-150,6);
				break;
			}
		break;
		case 3:
			if(!obj_boss.in_position)
			{
				if(state_time % aim_wait == aim_wait - 1) //and (obj_boss.y > 0)
				{
					shoot_arc(aim_dan,7,aim_arc,obj_boss.x,obj_boss.y,999,aim_dist,aim_spd,sfx_shot1,4);
					
					if(aim_dan == DAN_ARROW)
					{
						with(obj_danmaku4)
						{
							if(state == 0)
							{
								spawn_type = SPAWN_SCALE;
								image_xscale = 2;
								image_yscale = 2;
								state = 1;
								x_offscreen *= 2;
								y_offscreen *= 2;
							}
						}	
					}
				}
			}
			else
			{
				state = 0;
				dir_act *= -1;
			}
		break;
	}

	with(obj_danmaku8)
	{
		switch(state)
		{
			case 0:
				angle += tree_spin * spell.dir_act;
			break;
			case 1:
				angle_spd = goto_value(angle_spd,0,0.05);
				angle += angle_spd;
			break;
			case 2:
				spd = goto_value(spd,-spd_to,0.05);
			break;
		}
		if(pos_type == POS_MANUAL)
		{
			x = obj_boss.x + lengthdir_x(dist,angle);
			y = obj_boss.y + lengthdir_y(dist,angle);
		}
	}
	
}
// Inherit the parent event
event_inherited();

