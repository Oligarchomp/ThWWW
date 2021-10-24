/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var bubble_wait = 1;
			var bubble_nbr = 1;
			var bubble_spd = 1.5;
			var bubble_dist = 29;
			
			var arrow_dan = DAN_ARROWHEAD;
			var arrow_wait = 1;
			var arrow_nbr = 1;
			var arrow_spd = 2;
			var arrow_dist = -29
			var arrow_aim_off = 0;
			
			var wait_wave = 20; // more than 10
		break;
		case 1:
			var bubble_wait = 1;
			var bubble_nbr = 2;
			var bubble_spd = 1.8;
			var bubble_dist = 27;
			
			var arrow_dan = DAN_ARROWHEAD;
			var arrow_wait = 1;
			var arrow_nbr = 3;
			var arrow_spd = 2;
			var arrow_dist = -27
			var arrow_aim_off = 0;
			
			var wait_wave = 20; // more than 10
		break;
		case 2:
			var bubble_wait = 1;
			var bubble_nbr = 2;
			var bubble_spd = 2;
			var bubble_dist = -360 / 24;
			
			var arrow_dan = DAN_MENTOS
			var arrow_wait = 2;
			var arrow_nbr = 8;
			var arrow_spd = 2.6;
			var arrow_dist = -8;
			var arrow_aim_off = 12;
			
			var wait_wave = 17; // more than 10
		break;
		case 3:
			var bubble_wait = 1;
			var bubble_nbr = 2;
			var bubble_spd = 2;
			var bubble_dist = -360 / 24;
			
			var arrow_dan = DAN_MENTOS
			var arrow_wait = 2;
			var arrow_nbr = 9;
			var arrow_spd = 3;
			var arrow_dist = -6;
			var arrow_aim_off = 2;
			
			var wait_wave = 11; // more than 10
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
					
					angle_shoot = rng(360,false,1);
					angle_shoot2 = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y) + arrow_aim_off * dir_pale;
				break;
			}
		break;
		case 1:
		
			if(state_time % bubble_wait == 0)
			{
				shoot_ring(DAN_BUBBLE,3,bubble_nbr,obj_boss.x,obj_boss.y,angle_shoot,0,sfx_redirect2,3);
				angle_shoot += bubble_dist * dir_pale;
			}
			
			if(state_time % arrow_wait == 0)
			{
				shoot_ring(arrow_dan,3,arrow_nbr,obj_boss.x,obj_boss.y,angle_shoot2,0,sfx_shot3,2);
				angle_shoot2 += arrow_dist * dir_pale;
			}
		
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
				case 10:
					play_sound(sfx_redirect1,1,false);
					with(obj_danmaku)
					{
						pos_type = POS_ANGLE;
					}
				break;
				case wait_wave:
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

