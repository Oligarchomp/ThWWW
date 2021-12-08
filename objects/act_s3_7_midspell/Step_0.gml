/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var bubble_wait = 2;
			var bubble_ring = 5;
			var bubble_spd = 3;
			
			var arrow_wait = 2;
			var arrow_nbr = 5;
			var arrow_spd = 1.8;
		break;
		case 1:
			var bubble_wait = 2;
			var bubble_ring = 7;
			var bubble_spd = 3.5;
			
			var arrow_wait = 2;
			var arrow_nbr = 7;
			var arrow_spd = 1.8;
		break;
		case 2:
			var bubble_wait = 2;
			var bubble_ring = 9;
			var bubble_spd = 3.8;
			
			var arrow_wait = 2;
			var arrow_nbr = 9;
			var arrow_spd = 1.8;
		break;
		case 3:
			var bubble_wait = 2;
			var bubble_ring = 11;
			var bubble_spd = 4;
			
			var arrow_wait = 2;
			var arrow_nbr = 11;
			var arrow_spd = 1.8;
		break;
	}

	var wait_wave = 10;
	
	
	switch(state)
	{
		case 0:
			if(first_wave)
			{
				state_time = wait_wave;
				first_wave = false;
			}
			
			if(state_time == wait_wave)
			{
				boss_charge(obj_boss.x,obj_boss.y);
				boss_movement_goto(room_width / 2, y_ref + lengthdir_y(dist_pale,90),6);
				state = 1;
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
					angle_shoot = rng(360,false,1);
				break;
			}
		break;
		case 2:
			obj_boss.x = x_ref + lengthdir_x(dist_pale,angle_pale);
			obj_boss.y = y_ref + lengthdir_y(dist_pale,angle_pale)
			obj_boss.dir = obj_boss.dir_max;
			
			angle_pale = goto_value(angle_pale,450,9);
			
			if(state_time % bubble_wait == 0)
			{
				shoot_ring(DAN_BUBBLE,4,bubble_ring,obj_boss.x,obj_boss.y,999,bubble_spd,sfx_shot1,7)
			}
			
			if(state_time % arrow_wait == 1)
			{
				shoot_ring(DAN_MENTOS,3,arrow_nbr,obj_boss.x,obj_boss.y,999,arrow_spd,sfx_shot2,6)	
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

