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
			
			var bubble_nbr = 2;
			var bubble_spd = 2;
			var bubble_dist = 16;
			
			var arrow_nbr = 8;
			var arrow_spd = 3;
			var arrow_dist = 16;
		break;
	}
	
	var spin_spd = 12;
	
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
					boss_movement_goto(room_width / 2, y_ref + lengthdir_y(dist_pale,angle_pale),6);
				break;
				case 30:
					state = 1;
					obj_boss.pos_type = POS_MANUAL;
				break;
			}
		break;
		case 1:
		
			shoot_ring(DAN_BUBBLE,3,bubble_nbr,obj_boss.x,obj_boss.y,angle_shoot,0,sfx_redirect2,3);
			angle_shoot += bubble_dist;
			
			shoot_ring(DAN_ARROWHEAD,3,arrow_nbr,obj_boss.x,obj_boss.y,-angle_shoot,0,sfx_redirect3,2);
			//angle_shoot += bubble_dist;
		
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
				
				angle_shoot = rng(360,false,1);
			}
		break;
		case 2:
			switch(state_time)
			{
				case 10:
					play_sound(sfx_redirect1,1,false);
					with(obj_danmaku)
					{
						pos_type = POS_ANGLE;
					}
				break;
				case 11:
					state = 0;
				break
			}
		break;

	}
	
	//bubble
	with(obj_danmaku3)
	{
		if(step == 0)
		{
			pos_type = POS_MANUAL;
		}
		if(pos_type == POS_ANGLE)
		{
			spd = goto_value(spd,bubble_spd,0.1);
		}
	}
	
	//arrowhead
	with(obj_danmaku2)
	{
		if(step == 0)
		{
			pos_type = POS_MANUAL;
		}
		if(pos_type == POS_ANGLE)
		{
			spd = goto_value(spd,arrow_spd,0.1);
		}
	}
	
}
// Inherit the parent event
event_inherited();

