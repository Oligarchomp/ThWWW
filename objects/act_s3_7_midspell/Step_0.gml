/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var bubble_ring = 8;
			var bubble_spd_shot = 8;
			var bubble_spd_final = 2;
			var bubble_deccel = 0.1;
			
			var mentos_wait = 2;
			var mentos_ring= 4;
			var mentos_spd_min = 1
			var mentos_spd_git = 1.5;
			var mentos_accel_time = 20;
		break;
		case 1:
			var bubble_ring = 14;
			var bubble_spd_shot = 8;
			var bubble_spd_final = 2;
			var bubble_deccel = 0.1;
			
			var mentos_wait = 2;
			var mentos_ring= 10;
			var mentos_spd_min = 1
			var mentos_spd_git = 1.9;
			var mentos_accel_time = 20;
		break;
		case 2:
			var bubble_ring = 17;
			var bubble_spd_shot = 8;
			var bubble_spd_final = 2;
			var bubble_deccel = 0.1;
			
			var mentos_wait = 2;
			var mentos_ring= 12;
			var mentos_spd_min = 1
			var mentos_spd_git = 2.1;
			var mentos_accel_time = 20;
		break;
		case 3:
			var bubble_ring = 20;
			var bubble_spd_shot = 8;
			var bubble_spd_final = 2;
			var bubble_deccel = 0.1;
			
			var mentos_wait = 2;
			var mentos_ring= 16;
			var mentos_spd_min = 1
			var mentos_spd_git = 2.2;
			var mentos_accel_time = 20;
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
			
			switch(state_time) 
			{
				case 0:
					shoot_ring(DAN_BUBBLE,3.5 - dir * 0.5,bubble_ring,obj_boss.x,obj_boss.y,999,bubble_spd_shot,sfx_redirect1,7)
				break;
				case wait_wave:
					boss_charge(obj_boss.x,obj_boss.y);
					boss_movement_goto(room_width / 2, y_ref + lengthdir_y(dist_pale,90),6);
					state = 1;
				break;
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
			
			if(state_time % mentos_wait == 0)
			{
				var sp = mentos_spd_min + rng(mentos_spd_git,false,1);
				shoot_ring(DAN_MENTOS,3.5 - dir * 0.5,mentos_ring,obj_boss.x,obj_boss.y,rng(360,false,4),sp,sfx_redirect2,5);	
			}
		break;
		
	}

	
	with(obj_danmaku7)
	{
		spd = goto_value(spd,bubble_spd_final,bubble_deccel);	
	}
	
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				spd_ref = spd;
				spd = 0;
				state = 1;
			break;
			case 1:
				spd = goto_value(spd,spd_ref,spd_ref / mentos_accel_time);
				if(spd == spd_ref)
				{
					shoot(DAN_BALL,color_id,x,y,angle,spd,noone,3);
					cancel_bullet(self);
					state = 2;
				}
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

