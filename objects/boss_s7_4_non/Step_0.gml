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
			var bubble_wait = 4;
			var bubble_nbr = 18;
			var time_change = 30;
			var bubble_spd = 9;
			var note_spd1 = 1.3;
			var note_spd2 = 1;
		
			var boss_wait = 110;
			
			if(step % boss_wait = boss_wait -1)
			{
				boss_movement_random(4,50,10);	
			}
			
			if(step % bubble_wait == 0)
			{
				var aim = rng(360,false,7);
				
				for(var i = 0; i < 360; i += 360 / bubble_nbr)
				{
					if(act_dir == 1)
					{
						var col = 1;
						var sp = note_spd1;
						var danid = 1;
					}
					else
					{
						var col = 6
						var sp = note_spd2;
						var danid = 2;
					}
					var inst = shoot(DAN_BUBBLE,col,obj_boss.x,obj_boss.y,aim + i,bubble_spd,sfx_shot2,7);
					inst.spd_to = sp
					inst.dan = danid;
				
				}
				
				act_dir *= -1;
			}
		
		
			
			with(obj_danmaku7)
			{
				if(step == time_change)
				{
					 shoot(DAN_NOTE,color_id,x,y,angle,spd_to,noone,dan);
					 cancel_bullet(self);
				}
				
			}
		
		
		break;
	}
	
}
// Inherit the parent event
event_inherited();

