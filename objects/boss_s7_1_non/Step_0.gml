/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(spell_wait)
	{
		case 0:
			var note_wait = 76;
			var note_ring = 26;
			var note_row = 5;
			var note_spd_shot = 7;
			var note_deccel = 0.2;
			var note_spd_min = 1.5;
			var note_spd_max = 4.5;
			var note_angle_min = 5;
			var note_angle_max = 140;
			var note_accel = 0.1;
			
			var boss_wait = 133;
			
			if(step % boss_wait == boss_wait - 1)
			{
				boss_movement_random(2,4,2);	
			}
			
			
			if(step % note_wait == 0)
			{
				var aim = rng(180,false,5);
				for(var i = 0; i < 360; i += 360 / note_ring)
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
						
						var inst = shoot(DAN_MENTOS,col,obj_boss.x,obj_boss.y,aim + i * act_dir,note_spd_shot,sfx_redirect1,5);
						inst.spd_to = note_spd_min + (note_spd_max - note_spd_min) / note_row * r;
						inst.angle_plus = note_angle_min + (note_angle_max - note_angle_min) / note_row * r * act_dir;
					}
				}
				
				act_dir *= -1;
			}
		
			with(obj_danmaku5)
			{
				switch(state)
				{
					case 0:
					 spd = goto_value(spd,0,note_deccel);
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
		
		break;
	}
	
}
// Inherit the parent event
event_inherited();

