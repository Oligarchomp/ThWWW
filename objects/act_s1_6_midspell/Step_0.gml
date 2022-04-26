/// @description Insert description here
// You can write your code in this editor


if(global.gp_active)
{
	if (!spell_wait)
	{
		switch(global.difficulty)
		{
			case 0:
				var y_grav = 0;
				var bubble_spd = 1.2;
				var bubble_wait = 100;
				var bubble_nbr = 9;
				var bubble_grav_max = 7;
				
				var arrow_row = 3;
				var arrow_dist = 46;
				var arrow_angle = 999;
				var arrow_spd = 3;
				var arrow_grav = 0;
				var arrow_grav_max = 7;
			break;
			case 1:
				var y_grav = 0;
				var bubble_spd = 3;
				var bubble_wait = 45;
				var bubble_nbr = 14;
				var bubble_grav_max = 7;
				
				var arrow_row = 5;
				var arrow_dist = 19;
				var arrow_angle = 999;
				var arrow_spd = 4;
				var arrow_grav = 0;
				var arrow_grav_max = 7;
			break;
			case 2:
				var y_grav = 0;
				var bubble_spd = 4;
				var bubble_wait = 45;
				var bubble_nbr = 15;
				var bubble_grav_max = 7;
				
				var arrow_row = 7;
				var arrow_dist = 12;
				var arrow_angle = 90;
				var arrow_spd = 3.8;
				var arrow_grav = 0.1;
				var arrow_grav_max = 8;
			break;
			case 3:
				var y_grav = 0.1;
				var bubble_spd = 3.8;
				var bubble_wait = 45;
				var bubble_nbr = 12;
				var bubble_grav_max = 7;
				
				var arrow_row = 11;
				var arrow_dist = 10;
				var arrow_angle = 90;
				var arrow_spd = 3.8;
				var arrow_grav = 0.1;
				var arrow_grav_max = 9;
			break;
		}
		
		
		if (step % bubble_wait == 0)
		{
			shoot_ring(DAN_BUBBLE,6,bubble_nbr,obj_boss.x,obj_boss.y,rng(360,true,2),bubble_spd,sfx_shot1,2);
		}
	
		if(!obj_boss.in_position)
		{
			if (step % 3 == 0)
			{
				shoot_arc(DAN_ARROWHEAD,4,arrow_row,obj_boss.x,obj_boss.y,arrow_angle,arrow_dist ,arrow_spd,sfx_shot2,1);
			}
		}
	
		if (step % 100 == 0)
		{
			boss_movement_random(4,70,10);
		}
	
		with(obj_danmaku2)
		{
			pos_type = POS_SP;
			y_grav_accel = y_grav;
			y_grav_max = bubble_grav_max;	
		}
	
		with(obj_danmaku1)
		{
			pos_type = POS_SP;
			y_grav_accel = arrow_grav;
			y_grav_max = arrow_grav_max;
		}
	
	}
}


// Inherit the parent event
event_inherited();

