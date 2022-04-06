/// @description Insert description here
// You can write your code in this editor



if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var boss_wait_move = 250;
			var shoot_wait = 26;
			var boss_spd = 3;
			
			var ring_nbr = 3;
			var ring_spd = 3;
			var ring_spin = 25;
			
			var aim_arc = 1;
			var aim_row = 1;
			var aim_spd_min = 2;
			var aim_spd_max = 3;
			var aim_grav_accel = 0.01;
			var aim_dist = 1;
		break;
		case 1:
			var boss_wait_move = 200;
			var shoot_wait = 20;
			var boss_spd = 4.5;
			
			var ring_nbr = 6;
			var ring_spd = 3;
			var ring_spin = 18;
			
			var aim_arc = 3;
			var aim_row = 3;
			var aim_spd_min = 2.5;
			var aim_spd_max = 5;
			var aim_grav_accel = 0.05;
			var aim_dist = 52;
		break;
		case 2:
			var boss_wait_move = 180;
			var shoot_wait = 18;
			var boss_spd = 4.5;
			
			var ring_nbr = 8;
			var ring_spd = 4;
			var ring_spin = 14;
			
			var aim_arc = 3;
			var aim_row = 3;
			var aim_spd_min = 2.5;
			var aim_spd_max = 5;
			var aim_grav_accel = 0.05;
			var aim_dist = 35;
		break;
		case 3:
			var boss_wait_move = 160;
			var shoot_wait = 16;
			var boss_spd = 5;
			
			var ring_nbr = 10;
			var ring_spd = 4.5;
			var ring_spin = 12;
			
			var aim_arc = 5;
			var aim_row = 4;
			var aim_spd_min = 3;
			var aim_spd_max = 5.5;
			var aim_grav_accel = 0.05;
			var aim_dist = 30;
		break;
	}
	
	
	
	
	
	if(spell_wait == 0)
	{
		if(step % boss_wait_move = 0)
		{
			boss_movement_goto(room_width - obj_boss.x, y_ref + rng(40,true,2) - 20, boss_spd );
			shoot_ref_time = step;
			last_boss_in_position = false;
		}
		
		if(last_boss_in_position != obj_boss.in_position)
		{
			shoot_ref_time2 = step;
			angle_ref = rng(360,false,2)
			last_boss_in_position = true;
		}
		
		if (obj_boss.in_position)
		{
			if((shoot_ref_time2 + step) % shoot_wait == shoot_wait / 2)
			{

				var angle2 = angle_ref + 360 / ring_nbr / 2;
				shoot_ring(DAN_BUBBLE,4,ring_nbr ,obj_boss.x,obj_boss.y,angle_ref,ring_spd,sfx_shot1,6);
				shoot_ring(DAN_BALL,4,ring_nbr ,obj_boss.x,obj_boss.y,angle2,ring_spd,sfx_shot1,6);
				
				angle_ref += ring_spin;
			}
		}
		else
		{
			if((shoot_ref_time + step) % shoot_wait == shoot_wait / 2)
			{	
				shoot_arc_row(DAN_BALL,6,aim_arc,aim_row,obj_boss.x,obj_boss.y,999,aim_dist,aim_spd_min,aim_spd_max,sfx_shot3,5)
			}
		}
		
		with(obj_danmaku5)
		{
			pos_type = POS_SP;
			y_grav_accel = aim_grav_accel;
			y_grav_max = 10;
		}
	}
}


// Inherit the parent event
event_inherited();
