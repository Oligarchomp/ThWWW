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
			 var bubble_ring = 18;
			 var bubble_wait = 9;
			 var bubble_angle_plus = 4.2;
			 var bubble_spd = 7;//9
			 
			 var wait_min = 13;//10
			 var wait_max = 42;//33
			 
			 var spd_min = 1;
			 var spd_max = 3.2;
		
			var boss_wait = 140;
			
			if(step % boss_wait == boss_wait - 1)
			{
				boss_movement_random(2,3,1);	
			}
		
			if(step % bubble_wait == 0)
			{
				var wait_change = floor((wait_min + wait_max) / 2 + sin(step / 40) * (wait_max - wait_min) / 2);
				var sp = (spd_min + spd_max) / 2 - sin(step / 40) * (spd_max - spd_min) / 2;
			
				for(var i = 0; i < 360; i += 360 / bubble_ring)
				{
					var inst = shoot(DAN_BUBBLE,6,obj_boss.x,obj_boss.y,shoot_angle + i,bubble_spd,sfx_shot2,8);
					inst.wait_note = wait_change;
					inst.note_spd = sp;
					
					var inst = shoot(DAN_BUBBLE,1,obj_boss.x,obj_boss.y,-shoot_angle - 360 / bubble_ring - i,bubble_spd,sfx_shot2,7);
					inst.wait_note = wait_max - (wait_change - wait_min);
					inst.note_spd = spd_max - (sp - spd_min);
				}
				
				shoot_angle += bubble_angle_plus;
			}
		
			with(obj_danmaku8)
			{
				if(step == wait_note)
				{
					shoot(DAN_NOTE,color_id,x,y,angle,note_spd,noone,4);
					cancel_bullet(self);
				}
			}
			
			with(obj_danmaku7)
			{
				if(step == wait_note)
				{
					shoot(DAN_NOTE,color_id,x,y,angle,note_spd,noone,3);
					cancel_bullet(self);
				}
			}
		
		break;
	}
	
}
// Inherit the parent event
event_inherited();

