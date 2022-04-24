/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var sword_size = 5;
			
			var rice_open = 30;
			var rice_spd_shoot = 4;
			var rice_spd_git = 1.5;
			var rice_spd_div = 2.5;
			var rice_nbr = 1;
			
			var sword_wait = 2;
			var sword_row = 2;
			var sword_arc = 3;
			var sword_dist = 0;
			var sword_spd_min = 1;
			var sword_i_div = 100;
			
			var stab_phase = false;
			var spin_dist = 24;
			var spin_wait = 1;
			var spin_row = 1;
			var spin_spd = 1.8;
			var spin_ring = 5;
			
			var wait_end = 100;
			
		break;
		case 1:
			var sword_size = 5;
			
			var rice_open = 22;
			var rice_spd_shoot = 4.5;
			var rice_spd_git = 1.8;
			var rice_spd_div = 2.4;
			var rice_nbr = 3;
			
			var sword_wait = 1;
			var sword_row = 2;
			var sword_arc = 3;
			var sword_dist = 0;
			var sword_spd_min = 1.5;
			var sword_i_div = 100;
			
			var stab_phase = false;
			var spin_dist = 24;
			var spin_wait = 1;
			var spin_row = 2;
			var spin_spd = 2;
			var spin_ring = 6;
			
			var wait_end = 75;
		break;
		case 2:
			var sword_size = 5;
			
			var rice_open = 24;
			var rice_spd_shoot = 4.5;
			var rice_spd_git = 1.9;
			var rice_spd_div = 2.3;
			var rice_nbr = 4;
			
			var sword_wait = 1;
			var sword_row = 2;
			var sword_arc = 3;
			var sword_dist = 90;
			var sword_spd_min = 1.1;
			var sword_i_div = 80;
			
			var stab_phase = false;
			var spin_dist = 24;
			var spin_wait = 1;
			var spin_row = 3;
			var spin_spd = 2.3;
			var spin_ring = 7;
			
			var wait_end = 50;
		break;
		case 3:
			var sword_size = 5;
			
			var rice_open = 22;
			var rice_spd_shoot = 4;
			var rice_spd_git = 2;
			var rice_spd_div = 2.2;
			var rice_nbr = 5;
			
			var sword_wait = 1;
			var sword_row = 3;
			var sword_arc = 3;
			var sword_dist = 72;
			var sword_spd_min = 1.3;
			var sword_i_div = 80;
			
			var stab_phase = true;
			var stab_wait = 1;
			var stab_ring = 11;
			var stab_row = 3;
			var stab_spd_min = 2;
			var stab_spd_max = 4;
			
			var wait_end = 50;
			
			var charge_wait = 45;
		break;
	}
	var swipe_spd = 32;
	var start_x_off = 0;
	var start_y_off = 50;
	switch(state)
	{
		case 0://charge
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
					var x_pos = obj_boss.x - 10 * sword_size * dir_act ;
					var y_pos = obj_boss.y + 10 * sword_size
					var angle_sword = find_angle(obj_boss.x,obj_boss.y,x_pos,y_pos);
					var inst = shoot(DAN_KNIFE,3,x_pos,y_pos,angle_sword,0,sfx_spawn_light,8);
					inst.spawn_type = SPAWN_SCALE;
					inst.image_xscale = sword_size;
					inst.image_yscale = sword_size;
					inst.pos_type = POS_MANUAL;
					inst.dist = sqrt(sqr(x_pos - obj_boss.x) + sqr(y_pos - obj_boss.y));
					inst.x_offscreen = 1000;
					inst.y_offscreen = 1000;
					inst.dir_dan = dir_act;
					inst.is_cancelable = false;
					inst.angle_plus = 0;
				break;
				case 30:
					boss_movement_goto(obj_boss.x + 800 * dir_act,obj_boss.y + 800,swipe_spd);
					state = 1;
					obj_boss.dir = obj_boss.dir_max * dir_act;
				break;
			}
		break;
		case 1://diag swipe 1 and 2
			if( obj_boss.y > room_height + 10)
			{
				state = 2;
				obj_boss.x = room_width / 2 + (start_x_off + 100) * dir_act;
				obj_boss.y = start_y_off - 100;
				obj_boss.dir = -obj_boss.dir_max * dir_act;
				boss_movement_goto(obj_boss.x - 800 * dir_act,obj_boss.y + 800,swipe_spd);
				obj_danmaku8.angle = -90 + 45 * dir_act;
			}
		break;
		case 2: 
			if( obj_boss.y > room_height + 10)
			{
				state = 3;
				obj_boss.y = room_height / 2 - 80;
				obj_boss.dir = obj_boss.dir_max * dir_act;
				boss_movement_goto(floor(obj_boss.x + 800 * dir_act),obj_boss.y,swipe_spd);
				obj_danmaku8.angle = -90;
			}
		break;
		case 3:
			if(obj_boss.in_position)
			{
				state = stab_phase ? 4 : 8;
			}
		break;
		case 4://start stab
			if(state_time < 60)
			{
				boss_movement_goto(obj_player.x,50,7);
			}
			else
			{
				state = 5;
			}
		break;
		case 5:
			if(state_time < charge_wait * 3)
			{
				if(state_time < charge_wait * 2)
				{
					boss_movement_goto(obj_player.x,50,2);
				}
				else
				{
					obj_boss.x_to = obj_boss.x;
					obj_boss.y_to = obj_boss.y;
				}
				
				if(state_time % charge_wait == 0)
				{
					boss_charge(obj_boss.x,obj_boss.y);
				}
			}
			else
			{
				state = 6;	
				boss_movement_goto(obj_boss.x,room_height - 30, 26);
				obj_danmaku8.state = 1;
			}
		break;
		case 6: // end
			if(state_time == wait_end)
			{
				dir_act *= -1;
				boss_movement_goto(room_width / 2 - start_x_off * dir_act,start_y_off,5);
				state = 7;
				cancel_bullet(obj_danmaku8);
			}
		break;
		case 7: // end stab
			if(obj_boss.in_position)
			{
				state = 0;
			}
		break;
		case 8: // slash spin
			if(state_time < 100)
			{
				boss_movement_goto(obj_player.x, 90, 8);
			}
			else
			{
				state = 9;
			}
		break;
		case 9:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 30:
					with(obj_danmaku8)
					{
						angle_aim = find_angle(x,y,obj_player.x,obj_player.y);
						state = 2;
					}
				break;
			}
		break;
	}
	
	var spell = self;
	//sword beeg
	with(obj_danmaku8)
	{
		var boss_spd = sqrt(sqr(obj_boss.x - obj_boss.xprevious) + sqr(obj_boss.y - obj_boss.yprevious));

		switch(state)
		{
			case 0: //slashes
				if(boss_spd >= 16)
				{
					if(state_time % sword_wait == 0)
					{
						for(var i = dist * 2 / sword_row; i <= dist * 2; i += dist * 2 / sword_row)
						{
							var xx = obj_boss.x + lengthdir_x(i - dist / sword_row,angle)
							var yy = obj_boss.y + lengthdir_y(i - dist / sword_row,angle)
							var sw_ang = 999//angle + i + angle_plus;
							var sw_spd = sword_spd_min + i / sword_i_div;
							shoot_arc(DAN_ARROW,7,sword_arc,xx,yy,sw_ang,sword_dist,sw_spd,sfx_shot2,6);
						}
					}
				}
				
				stab_angle = rng(360,false,4);
				stab_dir = sign(obj_player.x - x);
				if(stab_dir == 0)
				{
					stab_dir = 1;
				}
			break;
			case 1:	//staby stab 
				if(boss_spd >= 16)
				{
					if(state_time % stab_wait == 0)
					{
						var aim = stab_angle //find_angle(x,y,stab_aim_x,stab_aim_y)
						shoot_ring_row(DAN_ARROW,7,stab_ring,stab_row,x,y,aim,stab_spd_min,stab_spd_max,sfx_shot2,7);
						stab_angle += 7.5 * stab_dir;
					}
				}
			break;
			case 2://spin slash
				var angle_to = -90 + 360 * dir_dan;
				angle = goto_value(angle,angle_to,spin_dist);
				
				if(state_time % spin_wait == 0)
				{
					for(var i = dist * 2 / spin_row; i <= dist * 2; i += dist * 2 / spin_row)
					{
						var xx = obj_boss.x + lengthdir_x(i,angle)
						var yy = obj_boss.y + lengthdir_y(i,angle)
						var ang = angle_aim //+ i;
						shoot_ring(DAN_ARROW,3,spin_ring,xx,yy,ang,0,sfx_shot2,5);
					}
				}
				
				if(angle = angle_to)
				{
					state = 3;
					angle_spd = spin_dist * dir_dan;
				}
			break;
			case 3:
				angle_spd += recursiv(angle_spd,0,5,0.1);
				angle += angle_spd;
				if(angle_spd == 0)
				{
					state = 4;
					
					with(obj_danmaku5)
					{
						state = 1;	
					}
				}
			break;
			case 4:
				image_yscale = goto_value(image_yscale,0,0.6);
				if(image_yscale == 0)
				{
					cancel_bullet(self);
					spell.state = 6;
				}
			break;
		}
		if(boss_spd >= 16)
		{
			for(var i = 0; i < rice_nbr; i += 1)
			{
				var ang = 90 - rice_open + rng(rice_open * 2, false,i);
				var inst = shoot(DAN_RICE,3,x,y,ang,rice_spd_shoot + rng(rice_spd_git,false,i + 2),sfx_shot3,4);
			}
		}
		
		x = obj_boss.x + lengthdir_x(dist,angle);
		y = obj_boss.y + lengthdir_y(dist,angle)
	}
	
	//rice
	with(obj_danmaku4)
	{
		switch(state)
		{
			case 0:
			var sq = 5;
				if(collision_rectangle(x - sq,y - sq + vsp,x + sq,y + sq + vsp,obj_wall,false,true) and (y < 100))
				{
					state = 1;
					angle *= -1;
					spd /= rice_spd_div;
				}
			break;
		}
	}
	
	//spin arrow
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				x_offscreen = 100;
				y_offscreen = 100;
			break;
			case 1:
				spd = goto_value(spd,spin_spd,0.1);
				if(state_time == 50)
				{
					x_offscreen = 20;
					y_offscreen = 20;
				}
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

