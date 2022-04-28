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
			
			var note_ring = 41;
			var note_spd_shoot = 7;
			var note_spd_final = 1.5;
			var note_deccel = 0.1;

			
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
				
				shoot_ring(DAN_NOTE,3.5 + act_dir * 2.5,note_ring,obj_boss.x,obj_boss.y,rng(360,false,1),note_spd_shoot,sfx_redirect1,1)
				act_dir *= -1;
			}
			
			with(obj_danmaku1)
			{
				spd = goto_value(spd,note_spd_final,note_deccel);	
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
								//shoot_ring(DAN_NOTE,color_id,note_ring,x,y,rng(360,false,1),note_spd,sfx_redirect1,1)
								state = 2;
							break;
						}
					break;
					case 2:
						visual_xscale = goto_value(visual_xscale,0,0.03);
						visual_yscale = goto_value(visual_yscale,0,0.03);
						
						if(visual_xscale == 0)
						{
							instance_destroy();
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
								//shoot_ring(DAN_NOTE,color_id,note_ring,x,y,rng(360,false,1),note_spd,sfx_redirect1,1)
								state = 2;
							break;
						}
					break;
					case 2:
						visual_xscale = goto_value(visual_xscale,0,0.03);
						visual_yscale = goto_value(visual_yscale,0,0.03);
						
						if(visual_xscale == 0)
						{
							instance_destroy();
						}
					break;
				}
			}
		break;
	}
	
}
// Inherit the parent event
event_inherited();

