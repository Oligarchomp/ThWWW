/// @description Insert description here
// You can write your code in this editor

if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var wait_move = 120
		
			var wait_knife = 40;
			var knife_nbr_row = 2;
			var knife_nbr_arc = 3;
			var knife_spd_min = 2;
			var knife_spd_max = 3;
			var knife_dist = 27
			
			var angle_shoot_plus = knife_dist * knife_nbr_arc;
		break;
		case 1:
			var wait_move = 120
		
			var wait_knife = 29;
			var knife_nbr_row = 3;
			var knife_nbr_arc = 4;
			var knife_spd_min = 2;
			var knife_spd_max = 3.5;
			var knife_dist = 20
			
			var angle_shoot_plus = knife_dist * knife_nbr_arc + 4;
		break;
		case 2:
			var wait_move = 120
		
			var wait_knife = 19;
			var knife_nbr_row = 4;
			var knife_nbr_arc = 4;
			var knife_spd_min = 2.5;
			var knife_spd_max = 5.2;
			var knife_dist = 10
			
			var angle_shoot_plus = knife_dist * knife_nbr_arc;
		break;
		case 3:
			var wait_move = 120
		
			var wait_knife = 17;
			var knife_nbr_row = 5;
			var knife_nbr_arc = 5;
			var knife_spd_min = 2.7;
			var knife_spd_max = 5.6;
			var knife_dist = 10
			
			var angle_shoot_plus = knife_dist * knife_nbr_arc;
		break;
	}
	
	switch(state)
	{
		case 0:
			if(state_time % wait_knife == 0)
			{
				for(var i = -angle_dist; i <= angle_dist; i += 2* angle_dist)
				{
					var x_pos = obj_boss.x + lengthdir_x(i,angle_shoot);
					var y_pos = obj_boss.y + lengthdir_y(i,angle_shoot);
					shoot_arc_row(DAN_KNIFE,6,knife_nbr_arc,knife_nbr_row,x_pos,y_pos,angle_shoot + 90,knife_dist ,knife_spd_min,knife_spd_max,sfx_shot2,3);
					shoot_arc_row(DAN_KNIFE,7,knife_nbr_arc,knife_nbr_row,x_pos,y_pos,angle_shoot - 90,knife_dist ,knife_spd_min,knife_spd_max,sfx_shot2,3);
				}
				
				angle_shoot += angle_shoot_plus ;
			}
			
			if(state_time % wait_move == 0)
			{
				boss_movement_random(1,2,0);
				
			}
		break;
	}
	
	
}


// Inherit the parent event
event_inherited();

