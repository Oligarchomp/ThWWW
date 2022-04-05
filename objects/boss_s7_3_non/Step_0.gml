/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(spell_wait)
	{
		case 30:
			boss_charge(obj_boss.x,obj_boss.y);
		break;
		case 1:
			boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
		break;
		case 0:
			var bubble_wait = 35;
			var bubble_ring = 16;
			var bubble_spd = 5;
			
			var laser_wait = 90;
			var laser_nbr = 24;
			
			var note_row = 5;
			var note_spd_min = 2.6;
			var note_spd_max = 5;
			
			
			if(step % laser_wait == laser_wait - 1)
			{
				var aim = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y);
				for(var i = 0; i < 360; i += 360 / laser_nbr)
				{
					shoot_laser(obj_boss.x,obj_boss.y,aim + i, 40,30,c_white,sfx_laser2);
				}
			}
			
			if(step % laser_wait == 40)
			{
				boss_movement_random(2,4,1);	
				
				if(laser_dir == 1)
				{
					var col = 1;
				}
				else
				{
					var col = 6;
				}
				
				with(obj_laser)
				{
					var aim = find_angle(x,y,x_to,y_to);
					shoot_row(DAN_NOTE,col,note_row,x,y,aim,note_spd_min,note_spd_max,sfx_redirect1,2);
				}
				
				laser_dir *= -1;
			}
			
			
			if(step % bubble_wait == 0)
			{
				if(act_dir == 1)
				{
					var col = 1;
				}
				else
				{
					var col = 6
				}
				
				shoot_ring(DAN_BUBBLE,col,bubble_ring,obj_boss.x,obj_boss.y,999,bubble_spd,sfx_redirect2,6);
				
				act_dir *= -1;
			}
			
			
		break;
	}
	
}
// Inherit the parent event
event_inherited();

