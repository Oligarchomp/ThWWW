/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var spin_spd = 4;
			
			var bubble_way = 3;
			var bubble_spd = 1.7;
			var bubble_time = 1;
			
			var head_way = 0;
			var head_spd = 3;
			var head_time = 5;
			var head_layer = 0;
			var head_accel = 0.08;
		break;
		case 1:
			var spin_spd = 4;
			
			var bubble_way = 5;
			var bubble_spd = 2.5;
			var bubble_time = 2;
			
			var head_way = 10;
			var head_spd = 2.4;
			var head_time = 3;
			var head_layer = 1;
			var head_accel = 0.08;
		break;
		case 2:
			var spin_spd = 4;
			
			var bubble_way = 5;
			var bubble_spd = 3;
			var bubble_time = 2;
			
			var head_way = 18;
			var head_spd = 2.5;
			var head_time = 3;
			var head_layer = 2;
			var head_accel = 0.08;
		break;
		case 3:
			var spin_spd = 4;
			
			var bubble_way = 5;
			var bubble_spd = 2.5;
			var bubble_time = 2;
			
			var head_way = 20;
			var head_spd = 2.8;
			var head_time = 3;
			var head_layer = 4;
			var head_accel = 0.08;
		break;
	}
	
	
	
	if(angle_charge != angle_charge_to)
	{
		repeat(15)
		{
			angle_charge = goto_value(angle_charge, angle_charge_to,1);
		
			var dist = 180;
			var inst = instance_create_depth(x_ref + lengthdir_x(dist,angle_charge),y_ref + lengthdir_y(dist,angle_charge),global.boss_depth,obj_spincharge);
			inst.angle = angle_charge;
		}
	}
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
					boss_movement_goto(room_width / 2, y_ref + lengthdir_y(dist_pale,angle_pale),6);
				break;
				case 40:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 70:
					state = 1;
					obj_boss.pos_type = POS_MANUAL;
				break;
			}
		break;
		case 1:
			
			var aim = find_angle(obj_boss.x,obj_boss.y,x_ref,y_ref);
			//bubble
			var inst = shoot(DAN_BUBBLE,7,obj_boss.x,obj_boss.y,aim,0,sfx_redirect2,2);
			inst.pos_type = POS_MANUAL;
			inst.pot_spd = bubble_spd;
			inst.wait_start = (abs(angle_pale - angle_start) % (360 / bubble_way)) * bubble_time;
			
			//arrowhead
			for(var i = 0; i < head_layer ; i += 1)
			{
				var inst = shoot(DAN_ARROWHEAD,3,obj_boss.x,obj_boss.y,aim,0,sfx_redirect3,1);
				inst.pos_type = POS_MANUAL;
				inst.pot_spd = head_spd;
				inst.wait_start = (abs(angle_pale - angle_start) % (360 / head_way)) * head_time;
				inst.wait_start += ((360 / head_way) * head_time) * i;
			}

			
			
			//garbage
			shoot(DAN_BUBBLE,3,obj_boss.x,obj_boss.y,aim + 180,3 + rng(3,false,2),noone,3);
			
			var dest = 90 + 360 * dir_pale
			angle_pale = goto_value(angle_pale,dest,spin_spd);
			obj_boss.x = x_ref + lengthdir_x(dist_pale,angle_pale);
			obj_boss.y = y_ref + lengthdir_y(dist_pale,angle_pale);
			obj_boss.dir = obj_boss.dir_max;
				
			
				
			if(angle_pale == dest)
			{
				state = 2;
				angle_pale = 90;
				obj_boss.pos_type = POS_SP;
				
				dir_pale *= -1;
			}
		break;
		case 2:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 50:
					play_sound(sfx_redirect1,1,false);
					with(obj_danmaku)
					{
						pos_type = POS_ANGLE;
					}
				break;
				case 200:
					state = 0;
					angle_charge = 90;
					angle_charge_to = 90 + dir_pale * 360;
				break
			}
		break;

	}
	
	
	with(obj_danmaku2)
	{
		if(pos_type == POS_ANGLE)
		{
			if(wait_start == 0)
			{
				spd = goto_value(spd,pot_spd,0.1);
			}
			else
			{
				wait_start -= 1;
			
			}
		}
	}
	with(obj_danmaku1)
	{
		if(pos_type == POS_ANGLE)
		{
			if(wait_start == 0)
			{
				spd = goto_value(spd,pot_spd,head_accel);
			}
			else
			{
				wait_start -= 1;
			
			}
		}
		
	}
	
}
// Inherit the parent event
event_inherited();

