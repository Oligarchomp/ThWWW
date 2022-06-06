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
			var ring_wait = 76;
			var ring_nbr = 21;
			var ring_spd_shot = 6;
			var ring_deccel = 0.2;
			
			var note_row = 7;
			var note_spd_min = 1.5;
			var note_spd_max = 3.2;
			var note_angle_min = 20;
			var note_angle_max = 60;
			var note_accel = 0.1;
			
			var bubble_row = 4;
			var bubble_spd_min = 1.6;
			var bubble_spd_max = 3.9;
			var bubble_angle_min = 5;
			var bubble_angle_max = 90;
			var bubble_accel = 0.1;
			
			var boss_wait = 133;
			
			if(step % boss_wait == boss_wait - 1)
			{
				boss_movement_random(2,4,2);	
			}
			
			
			if(step % ring_wait == 0)
			{
				var aim = rng(180,false,5);
				var aim2 = rng(180,false,6);
				for(var i = 0; i < 360; i += 360 / ring_nbr)
				{
					for(var r = 0; r < note_row; r += 1)
					{
						if(act_dir == 1)
						{
							var col = 1;
						}
						else
						{
							var col = 6;
						}
						
						var inst = shoot(DAN_NOTE,col,obj_boss.x,obj_boss.y,aim + i * act_dir,ring_spd_shot,sfx_redirect1,5);
						inst.spd_to = note_spd_max - (note_spd_max - note_spd_min) / note_row * r;
						inst.angle_plus = global.rng_patch ? rng(360,false,1) : (note_angle_max - (note_angle_max - note_angle_min) / note_row * r) * act_dir;
					}
					
					for(var r = 0; r < bubble_row; r += 1)
					{
						if(act_dir == 1)
						{
							var col = 1;
						}
						else
						{
							var col = 6;
						}
						
						var inst = shoot(DAN_BUBBLE,col,obj_boss.x,obj_boss.y,aim2 + i * act_dir,ring_spd_shot,sfx_redirect1,6);
						inst.spd_to = bubble_spd_min + (bubble_spd_max - bubble_spd_min) / bubble_row * r;
						inst.angle_plus = global.rng_patch ? rng(360,false,1) : (bubble_angle_min + (bubble_angle_max - bubble_angle_min) / bubble_row * r) * act_dir;
					}
				}
				
				act_dir *= -1;
			}
			//note
			with(obj_danmaku5)
			{
				switch(state)
				{
					case 0:
					 spd = goto_value(spd,0,ring_deccel);
					 if(spd == 0)
					 {
						 state = 1;
						 angle += angle_plus;
						 
						 play_sound(sfx_redirect1,1,false);
					 }
					break;
					case 1:
						spd = goto_value(spd,spd_to,note_accel);
					break;
				}
			}
			
			//bubble
			with(obj_danmaku6)
			{
				switch(state)
				{
					case 0:
					 spd = goto_value(spd,0,ring_deccel);
					 if(spd == 0)
					 {
						 state = 1;
						 angle += global.rng_patch ? rng(360,false,1) : angle_plus;
						 
						 play_sound(sfx_redirect1,1,false);
					 }
					break;
					case 1:
						spd = goto_value(spd,spd_to,bubble_accel);
					break;
				}
			}
		
		break;
	}
	
}
// Inherit the parent event
event_inherited();

