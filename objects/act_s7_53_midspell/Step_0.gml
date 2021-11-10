/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	spin_spd = -2;
	
	var arrow_wait = 4;//7
	var arrow_arc = 3;
	var arrow_row = 3;
	var arrow_dist = 50;
	var arrow_spd_min = 3;
	var arrow_spd_max = 5;
	
	var bubble_wait = 5;
	var bubble_start = 140;
	var bubble_spd_max = 1.8;
	var bubble_accel = 0.1;
	
	var mentos_ring = 18;
	var mentos_wait = 20;
	var mentos_spd = 2;
	
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
			
			if(state_time % arrow_wait == 0)
			{
				//shoot_arc_row(DAN_ARROWHEAD,3,arrow_arc,arrow_row,obj_boss.x,obj_boss.y,999,arrow_dist,arrow_spd_min,arrow_spd_max,sfx_shot2,4);
				shoot_arc(DAN_ARROWHEAD,3,5,obj_boss.x,obj_boss.y,angle_pale + 90,9,6,sfx_shot2,4);
			}
			
			if(state_time % bubble_wait == 0)
			{
				var ang = angle_pale + 180;
				var inst = shoot(DAN_BUBBLE,7,obj_boss.x,obj_boss.y,ang,0,sfx_redirect1,8);
				inst.is_cancelable = false;
			}
			
			if(state_time % mentos_wait = mentos_wait - 1)
			{
				shoot_ring(DAN_MENTOS,4,mentos_ring,obj_boss.x,obj_boss.y,999,mentos_spd,sfx_shot1,5);
				
			}
			
			
			angle_pale += spin_spd;
			obj_boss.x = x_ref + lengthdir_x(dist_pale,angle_pale);
			obj_boss.y = y_ref + lengthdir_y(dist_pale,angle_pale);
			obj_boss.dir = obj_boss.dir_max;
				
		break;

	}
	
	with(obj_danmaku8)
	{
		if(state_time > bubble_start)
		{
			spd = goto_value(spd,bubble_spd_max,bubble_accel);	
		}
		
		
	}

	
}
// Inherit the parent event
event_inherited();

