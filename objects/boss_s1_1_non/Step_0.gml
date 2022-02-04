/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	if(!spell_wait)
	{
		var wait_move = 100;
		if (step % wait_move == 0)
		{
			boss_movement_random(5,60,20);
		}
		
		
		switch(global.difficulty)
		{
			case 0:
				var wait_shoot = 80;
				var shoot_ang_off = 3;
				var ring_spd = 2;
				
				var bubble_nbr = 19;
				var angle_dist = 18;
			break;
			case 1:
				var wait_shoot = 50;
				var shoot_ang_off = 5;
				var ring_spd = 3.2;
				
				var bubble_nbr = 24;
				var angle_dist = 14.2;
			break;
			case 2:
				var wait_shoot = 35;
				var shoot_ang_off = 6;
				var ring_spd = 4.6;
				
				var bubble_nbr = 28;
				var angle_dist = 12.5;
			break;
			case 3:
				var wait_shoot = 30;
				var shoot_ang_off = 7;
				var ring_spd = 5;
				
				var bubble_nbr = 32;
				var angle_dist = 11;
			break;
		}
		
		
		
		var ang = 90 + shoot_ang_off*shot_dir
		
		
		if (step % wait_shoot == 0)
		{
			shoot_arc(DAN_BUBBLE,6,bubble_nbr,obj_boss.x,obj_boss.y,ang,angle_dist,ring_spd,sfx_redirect1,2);
			shoot(DAN_BALL,3,obj_boss.x,obj_boss.y,ang + 180,ring_spd,noone,1);
			shot_dir *= -1;
		}
		
	}
}

// Inherit the parent event
event_inherited();

