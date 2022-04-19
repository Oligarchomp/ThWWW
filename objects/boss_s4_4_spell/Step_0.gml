/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var rock_spd = 9;
			var rock_arc_side = 5;
			var rock_arc_top = 7; // odd, and the middle one isn't spawn ( so it's -1)
			var rock_angle_dist_side = 22;
			var rock_angle_dist_top = 30;
			var rock_dist_max = 90;
			
			var rock_side_off = 258;
			
			var ring_nbr = 18;
			var ring_spd_shoot = 7;
			var ring_spd_final = 1.5;
			var ring_accel = 0.1;
			
			var wave_wait = 135;
		break;
		case 1:
			var rock_spd = 9;
			var rock_arc_side = 6;
			var rock_arc_top = 9; // odd, and the middle one isn't spawn ( so it's -1)
			var rock_angle_dist_side = 22;
			var rock_angle_dist_top = 30;
			var rock_dist_max = 90;
			
			var rock_side_off = 258;
			
			var ring_nbr = 23;
			var ring_spd_shoot = 7;
			var ring_spd_final = 1.5;
			var ring_accel = 0.1;
			
			var wave_wait = 130;
		break;
		case 2:
			var rock_spd = 9;
			var rock_arc_side = 7;
			var rock_arc_top = 11; // odd, and the middle one isn't spawn ( so it's -1)
			var rock_angle_dist_side = 20;
			var rock_angle_dist_top = 25;
			var rock_dist_max = 90;
			
			var rock_side_off = 258;
			
			var ring_nbr = 29;
			var ring_spd_shoot = 7;
			var ring_spd_final = 1.6;
			var ring_accel = 0.1;
			
			var wave_wait = 125;
		break;
		case 3:
			var rock_spd = 9;
			var rock_arc_side = 8;
			var rock_arc_top = 13; // odd, and the middle one isn't spawn ( so it's -1)
			var rock_angle_dist_side = 18.5;
			var rock_angle_dist_top = 21;
			var rock_dist_max = 90;
			
			var rock_side_off = 253;
			
			var ring_nbr = 28;
			var ring_spd_shoot = 7;
			var ring_spd_final = 1.6;
			var ring_accel = 0.1;
			
			var wave_wait = 120;
		break;
	}
			
	switch(state)
	{
		case 0:
			boss_movement_goto(room_width / 2 + 120 * wave_dir,y_pos_ref,4);
			for(var i = -90 - rock_arc_side * rock_angle_dist_side / 2; i < -90 + rock_arc_side * rock_angle_dist_side / 2; i += rock_angle_dist_side)
			{
				var inst = shoot(DAN_ROCK,6,obj_boss.x,obj_boss.y,i,0,sfx_spawn_light,7);
				inst.pos_type = POS_MANUAL;
				inst.dist = 0;
				inst.angle_final = global.rng_patch ? rng(360,false,1) : i + rock_side_off * wave_dir + rock_angle_dist_side / 2;
				inst.rot = rng(360,false,2);
				inst.is_cancelable = false;
			}
			state = 1;
			wave_dir *= -1;
		break;
		case 1:
			switch(state_time)
			{
				case 40:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 80:
					with(obj_danmaku7)
					{
						if(state == 0)
						{
							state = 1;
							pos_type = POS_ANGLE;
							spd = rock_spd;
						}
					}
				break;
				case wave_wait:
					state = 2;
				break;
			}
		break;
		case 2:
			boss_movement_goto(room_width / 2 ,y_pos_ref,4);
			for(var i = -90 - rock_arc_top * rock_angle_dist_top / 2; i < -90 + rock_arc_top * rock_angle_dist_top / 2; i += rock_angle_dist_top)
			{
				var pos_off = rock_angle_dist_top / 2;
				if (i + pos_off != -90)
				{
					var inst = shoot(DAN_ROCK,6,obj_boss.x,obj_boss.y,i ,0,sfx_spawn_light,7);
					inst.pos_type = POS_MANUAL;
					inst.dist = 0;
					inst.angle_final = global.rng_patch ? rng(360,false,1) : i + 180 * wave_dir + pos_off;
					inst.rot = rng(360,false,2);
					inst.is_cancelable = false;
				}
			}
			state = 3;
		break;
		case 3:
			switch(state_time)
			{
				case 40:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 80:
					with(obj_danmaku7)
					{
						if(state == 0)
						{
							state = 1;
							pos_type = POS_ANGLE;
							spd = rock_spd;
						}
					}
				break;
				case wave_wait:
					state = 0;
				break;
			}
		break;
	}
	with(obj_danmaku_spawn)
	{
		if(sprite_index == spr_rock)
		{
			x = obj_boss.x;
			y = obj_boss.y;
		}
	}
	
	//Dwayne
	with(obj_danmaku7)
	{
		switch(state)
		{
			case 0:
				dist += recursiv(dist,rock_dist_max,18,0.1);
				angle += recursiv(angle,angle_final,10,0.1);
				
				x = obj_boss.x + lengthdir_x(dist,angle);
				y = obj_boss.y + lengthdir_y(dist,angle);
			break;
			case 1:
				var need_shoot = false;
				var sq = 20;
				if(collision_rectangle(x - sq + hsp,y - sq ,x + sq + hsp,y + sq,obj_wall,false,true))
				{
					angle = -angle + 180;
					var need_shoot = true;
					var x_off = 20 * sign(hsp);
					var y_off = 0;
				}
				
				if(collision_rectangle(x - sq,y - sq + vsp,x + sq,y + sq + vsp,obj_wall,false,true))
				{
					angle = -angle;
					var need_shoot = true;
					var x_off = 9;
					var y_off = 20 * sign(vsp);
				}
				if(need_shoot)
				{
					shoot_ring(DAN_BALL,2,ring_nbr,x + x_off,y + y_off,rng(360,false,5),ring_spd_shoot,sfx_shot1,6);
					state = 2;
					spd /= 2.2;
				}
			break;
		}
	}
	
	with(obj_danmaku6)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.5);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1:
				spd = goto_value(spd,ring_spd_final,ring_accel);
			break;
		}
		
	}
	
}
// Inherit the parent event
event_inherited();

