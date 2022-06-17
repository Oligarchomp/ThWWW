/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var bullet_wait = 24;
			var bullet_ring = 11;
			var bullet_spd = 2.1;
			var bullet_angle_max = 160;
			var bullet_angle_plus = 2.6;
			var bullet_dist = -6;	
		break;
		case 1:
			var bullet_wait = 17;
			var bullet_ring = 15;
			var bullet_spd = 2.6;
			var bullet_angle_max = 160;
			var bullet_angle_plus = 3;
			var bullet_dist = -4;	
		break;
		case 2:
			var bullet_wait = 14;
			var bullet_ring = 18;
			var bullet_spd = 2.8;
			var bullet_angle_max = 160;
			var bullet_angle_plus = 3;
			var bullet_dist = -3;	
		break;
		case 3:
			var bullet_wait = 12;
			var bullet_ring = 20;
			var bullet_spd = 3;
			var bullet_angle_max = 160;
			var bullet_angle_plus = 3;
			var bullet_dist = -3;
		break;
	}
	
	var boss_wait = 145;
	if(step % boss_wait == boss_wait - 1)
	{
		boss_movement_random(0.5,2,1);
	}
	
	if(step % bullet_wait == 0)
	{
		for(var i = 0; i < 360; i += 360 / bullet_ring)
		{
			if((step / bullet_wait) % 2 == 0)
			{
				var col = 2;
			}
			else
			{
				var col = 7;
			}
			var inst = shoot(DAN_MENTOS,col,obj_boss.x,obj_boss.y,bullet_angle + i,bullet_spd,sfx_shot2,3);
			inst.angle_to = inst.angle + bullet_angle_max;
			inst.x_offscreen = 200;
					
			var inst = shoot(DAN_MENTOS,col,obj_boss.x,obj_boss.y,-bullet_angle - 180 + i,bullet_spd,sfx_shot2,4);
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

