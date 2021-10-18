/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
					
		break;
		case 1:
					
		break;
		case 2:
					
		break;
		case 3:
			var bullet_wait = 12;
			var bullet_ring = 18;
			var bullet_spd_shot = 6;
			var bullet_spd_final = 3;
			var bullet_angle_max = 160;
			var bullet_angle_plus = 4;
			var bullet_dist = -3;
		break;
	}
	
	var boss_wait = 145;
	if(step % boss_wait == boss_wait - 1)
	{
		boss_movement_random(1,2,1);
	}
	
	if(step % bullet_wait == 0)
	{
		for(var i = 0; i < 360; i += 360 / bullet_ring)
		{
			if((step / bullet_wait) % 2 == 0)
			{
				var dan = DAN_BUBBLE;
				var col1 = 1;
				var col2 = 0;
			}
			else
			{
				var dan = DAN_BULLET;
				var col1 = 7;
				var col2 = 7;
			}
			var inst = shoot(dan,col1,obj_boss.x,obj_boss.y,bullet_angle + i,bullet_spd_shot,sfx_shot2,3);
			inst.angle_to = inst.angle + bullet_angle_max;
			inst.x_offscreen = 200;
					
			var inst = shoot(dan,col2,obj_boss.x,obj_boss.y,-bullet_angle - 180 + i,bullet_spd_shot,sfx_shot2,4);
			inst.angle_to = inst.angle - bullet_angle_max;
			inst.x_offscreen = 200;
		}
		
		bullet_angle += bullet_dist;
	}
		
	
			
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				angle = goto_value(angle,angle_to,bullet_angle_plus);
				spd = goto_value(spd,bullet_spd_final,0.04)
				
				if(state_time == 100)
				{
					state = 1;
					x_offscreen = 30;
				}
			break;
		}
	}
	
	with(obj_danmaku4)
	{
		switch(state)
		{
			case 0:
				angle = goto_value(angle,angle_to,bullet_angle_plus);
				spd = goto_value(spd,bullet_spd_final,0.04)
				
				if(state_time == 100)
				{
					state = 1;
					x_offscreen = 30;
				}
			break;
		}
	}
	
}

// Inherit the parent event
event_inherited();

