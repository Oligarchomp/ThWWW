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

