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
			var bubble_wait = 16;
			var bubble_ring = 4;
			var bubble_spd_shoot = 8;
			var bubble_deccel = 0.2;
			var bubble_angle_plus = 9.8;
			var bubble_aim_dist = 70;
			
			var laser_nbr = 1;
			
			var note_row = 4;
			var note_spd_min = 1;
			var note_spd_max = 3;
			var note_open = 5;

			
			var boss_wait = 150;
			
			if(step % boss_wait == boss_wait - 1)
			{
				boss_movement_random(1,2,1);	
			}
			
			if(step % bubble_wait == 0)
			{
				shoot_ring(DAN_BUBBLE,1,bubble_ring,obj_boss.x,obj_boss.y,shoot_angle,bubble_spd_shoot,sfx_shot1,5);
				shoot_ring(DAN_BUBBLE,6,bubble_ring,obj_boss.x,obj_boss.y,-shoot_angle - 180 / bubble_ring,bubble_spd_shoot,sfx_shot1,6);
				
				shoot_angle += bubble_angle_plus;
			}
			
			
			//blue
			with(obj_danmaku5)
			{
				switch(state)
				{
					case 0:
						spd = goto_value(spd,0,bubble_deccel);
						if(spd == 0)
						{
							state = 1;
						}
					break;
					case 1:
						switch(state_time)
						{
							case 0:
								for(var i = 0; i < 360; i += 360 / laser_nbr)
								{
									shoot_laser(x,y,angle - bubble_aim_dist + i,40,30,c_white,sfx_laser2);
								}
							break;
							case 40:
								for(var i = note_spd_min; i < note_spd_max; i += (note_spd_max - note_spd_min) / note_row)
								{
									var rand = -note_open + rng(note_open * 2, false,9);
									shoot(DAN_NOTE,color_id,x,y,angle - bubble_aim_dist + rand,i,sfx_redirect1,3);
								}
								state = 2;
							break;
						}
					break;
					case 2:
						visual_xscale = goto_value(visual_xscale,0,0.1);
						visual_yscale = goto_value(visual_yscale,0,0.1);
						
						if(visual_xscale == 0)
						{
							cancel_bullet(self);
						}
					break;
				}
			}
			
			//red
			with(obj_danmaku6)
			{
				switch(state)
				{
					case 0:
						spd = goto_value(spd,0,bubble_deccel);
						if(spd == 0)
						{
							state = 1;
						}
					break;
					case 1:
						switch(state_time)
						{
							case 0:
								for(var i = 0; i < 360; i += 360 / laser_nbr)
								{
									shoot_laser(x,y,angle + bubble_aim_dist + i,40,30,c_white,sfx_laser2);
								}
							break;
							case 40:
								for(var i = note_spd_min; i < note_spd_max; i += (note_spd_max - note_spd_min) / note_row)
								{
									var rand = -note_open + rng(note_open * 2, false,9);
									shoot(DAN_NOTE,color_id,x,y,angle + bubble_aim_dist + rand,i,sfx_redirect1,3);
								}
								state = 2;
							break;
						}
					break;
					case 2:
						visual_xscale = goto_value(visual_xscale,0,0.1);
						visual_yscale = goto_value(visual_yscale,0,0.1);
						
						if(visual_xscale == 0)
						{
							cancel_bullet(self);
						}
					break;
				}
			}
		
		
		break;
	}
	
}
// Inherit the parent event
event_inherited();

