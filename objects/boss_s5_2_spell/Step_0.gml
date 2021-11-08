/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var shock_wave = 3;
			var shock_wait = 42;
			
			var spam_grav_max = 2.5;
			var spam_grav_git = 1;
			var spam_accel = 0.1;
			var spam_bubble_nbr = 2;
			var spam_ball_nbr = 10;
			var spam_rice_nbr = 15;
			var spam_open = 10;
			
			var tree_dan = DAN_BALL;
			var tree_nbr = 16;
			var tree_spin = 2;
			var tree_spd = 1.5;
			var tree_spd_div = 1.5;
			
			var aim_size = 1;
			var aim_wait = 12;
			var aim_spd = 3;
			var aim_arc = 5;
			var aim_dist = 30;
		break;
		case 1:
			var shock_wave = 3;
			var shock_wait = 40;
			
			var spam_grav_max = 2.5;
			var spam_grav_git = 1;
			var spam_accel = 0.1;
			var spam_bubble_nbr = 5;
			var spam_ball_nbr = 24;
			var spam_rice_nbr = 32;
			var spam_open = 16;
			
			var tree_dan = DAN_MENTOS;
			var tree_nbr = 20;
			var tree_spin = 2;
			var tree_spd = 1.5;
			var tree_spd_div = 1.5;
			
			var aim_size = 1;
			var aim_wait = 8;
			var aim_spd = 3;
			var aim_arc = 7;
			var aim_dist = 19;
		break;
		case 2:
			var shock_wave = 4;
			var shock_wait = 35;
			
			var spam_grav_max = 2.5;
			var spam_grav_git = 1;
			var spam_accel = 0.1;
			var spam_bubble_nbr = 6;
			var spam_ball_nbr = 25;
			var spam_rice_nbr = 33;
			var spam_open = 18;
			
			var tree_dan = DAN_BUBBLE;
			var tree_nbr = 20;
			var tree_spin = 2;
			var tree_spd = 1.5;
			var tree_spd_div = 1.5;
			
			var aim_size = 2;
			var aim_wait = 6;
			var aim_spd = 3;
			var aim_arc = 9;
			var aim_dist = 18;
		break;
		case 3:
			var shock_wave = 4;
			var shock_wait = 34;
			
			var spam_grav_max = 2.5;
			var spam_grav_git = 1;
			var spam_accel = 0.1;
			var spam_bubble_nbr = 7;
			var spam_ball_nbr = 30;
			var spam_rice_nbr = 40;
			var spam_open = 21;
			
			var tree_dan = DAN_BUBBLE;
			var tree_nbr = 23;
			var tree_spin = 2;
			var tree_spd = 1.5;
			var tree_spd_div = 1.5;
			
			var aim_size = 2;
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
					
					for(var i = 0; i < spam_bubble_nbr; i += 1)
					{
						var sp = spam_shoot_spd + rng(spam_shoot_spd_git,false,i + 3);
						var ang = 90 - spam_open + rng(spam_open * 2, false,i + 1);
						var inst = shoot(DAN_BUBBLE,3,rng(room_width,false,i),-50,ang,sp,noone,7);	
						inst.pos_type = POS_SP;
						inst.y_grav_accel = spam_accel;
						inst.y_grav_max = spam_grav_max + rng(spam_grav_git,false, i + 2);	
						inst.y_offscreen = 90;
					}
					
					for(var i = 0; i < spam_ball_nbr; i += 1)
					{
						var sp = spam_shoot_spd + rng(spam_shoot_spd_git,false,i + 3);
						var ang = 90 - spam_open + rng(spam_open * 2, false,i + 1);
						var inst = shoot(DAN_BALL,3,rng(room_width,false,i),-30,ang,sp,noone,6);	
						inst.pos_type = POS_SP;
						inst.y_grav_accel = spam_accel;
						inst.y_grav_max = spam_grav_max + rng(spam_grav_git,false, i + 2);	
						inst.y_offscreen = 70;
					}
					
					for(var i = 0; i < spam_rice_nbr; i += 1)
					{
						var sp = spam_shoot_spd + rng(spam_shoot_spd_git,false,i + 3);
						var ang = 90 - spam_open + rng(spam_open * 2, false,i + 1);
						var inst = shoot(DAN_RICE,3,rng(room_width,false,i),-30,ang,sp,noone,5);	
						inst.pos_type = POS_SP;
						inst.y_grav_accel = spam_accel;
						inst.y_grav_max = spam_grav_max + rng(spam_grav_git,false, i + 2);	
						inst.y_offscreen = 70;
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
							inst.dist = 50;
						break;
						case DAN_BALL:
							inst.dist = 30;
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
							inst.dist = 25;
						break;
						case DAN_BALL:
							inst.dist = 15;
						break;
					}
					inst.x_offscreen = 250;
					inst.y_offscreen = 250;
					inst.spd_to = tree_spd;
				}
			}
		break;
		case 1:
			boss_movement_goto(obj_player.x,max(obj_player.y - 150,100), 3);
			if(state_time == 160)
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
					var aim = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y);
					for(var i = -(aim_arc - 1) / 2 * aim_dist; i < (aim_arc + 1) / 2 * aim_dist; i += aim_dist)
					{
						var inst = shoot(DAN_ARROW,7,obj_boss.x,obj_boss.y,aim + i,aim_spd,sfx_shot1,4);	
						inst.image_xscale = aim_size;
						inst.image_yscale = aim_size;
						inst.spawn_type = SPAWN_SCALE;
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
				QED = 0;
			break;
			case 1:
				angle_spd = goto_value(angle_spd,0,0.05);
				angle += angle_spd;
			break;
			case 2:
				spd = goto_value(spd,-spd_to,0.05);
				
				var sq = 18;
				if(QED > 0)
				{
					if(collision_rectangle(x - sq + hsp,y - sq ,x + sq + hsp,y + sq,obj_wall,false,true))
					{
						angle = -angle + 180;
						QED -= 1;
					}
				
					if(collision_rectangle(x - sq,y - sq + vsp,x + sq,y + sq + vsp,obj_wall,false,true))
					{
						angle = -angle;
						QED -= 1;
					}
				}
				
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

