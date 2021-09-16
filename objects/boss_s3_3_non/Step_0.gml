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
			var boss_wait = 60;
			
			var aim_spd_max = 4;
			var aim_spd_min = 3;
			var aim_row = 4;
			var aim_wait = 2;
			var aim_arc = 7;
			var aim_dist = 18;
		break;
	}
	
	
	switch(state)
	{
		case 0:
			if(state_time == 10)
			{
				boss_movement_goto(room_width / 2, y_ref + lengthdir_y(dist_pale,90),6);
				state = 1;
				boss_charge(obj_boss.x,obj_boss.y);
			}
		break;
		case 1:
			switch(state_time)
			{
				case 30:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 60:
					state = 2;
					obj_boss.pos_type = POS_MANUAL;
				break;
			}
		break;
		case 2:
			obj_boss.x = x_ref + lengthdir_x(dist_pale,angle_pale);
			obj_boss.y = y_ref + lengthdir_y(dist_pale,angle_pale)
			obj_boss.dir = obj_boss.dir_max;
			
			angle_pale = goto_value(angle_pale,450,9);
			
			if(state_time % aim_wait == 0)
			{
				var aim = find_angle(obj_boss.x,obj_boss.y,x_ref + rng(10,false,3) - 5,y_ref + rng(10,false,1) - 5);
				shoot_arc_row(DAN_ARROWHEAD,1,aim_arc,aim_row,obj_boss.x,obj_boss.y,aim,aim_dist,aim_spd_min,aim_spd_max,sfx_shot2,3);
			}
			
			if(angle_pale = 450)
			{
				angle_pale = 450 + dir * 360;
				state = 0;
				obj_boss.pos_type = POS_SP;
				dir *= -1;
			}
		break;
		
	}
	
	
	
	
}

// Inherit the parent event
event_inherited();

