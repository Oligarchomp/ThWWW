/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) 
{
	with(obj_spell_art)
	{
		sprite_index = spr_nothing;	
	}
	
	if (spell_wait == 0)
	{
		var bubble_wait = 125;
		var bubble_nbr = 24;
		var bubble_spd = 5;
		var bubble_angle_max = 0;
		var bubble_angle_plus = 2;
	
		var mentos_start_time = 12;
		var mentos_wait = 13;
		var mentos_spd_final = 2;
		var mentos_accel = 0.04;
		
		var aim_ring = 24;
		var aim_row = 3;
		var aim_spd_min = 2;
		var aim_spd_max = 3;
		
		
		var boss_wait = 130;
		
		if(step % boss_wait == boss_wait - 1)
		{
			boss_movement_random(2,3,1);	
		}
		
		if(step % bubble_wait == 0)
		{
			var aim = rng(360,false,4);
			for(var i = 0; i < 360; i += 360 / bubble_nbr)
			{
				var inst = shoot(DAN_BUBBLE,3.5 + act_dir * 0.5,obj_boss.x,obj_boss.y,aim + i,bubble_spd,sfx_redirect1,5);
				inst.angle_to = aim + i + bubble_angle_max * act_dir;
				inst.dan_dir = act_dir;
				inst.aim_to = aim + i;
			}
			
			shoot_ring_row(DAN_BUBBLE,3.5 - act_dir * 0.5,aim_ring,aim_row,obj_boss.x,obj_boss.y,aim + 180 / aim_ring,aim_spd_min,aim_spd_max,noone,7);
			
			act_dir *= -1;
		}
		
		
		with(obj_danmaku4)
		{
			spd = goto_value(spd,mentos_spd_final,mentos_accel);	
		}
		
		with(obj_danmaku5)
		{
			angle = goto_value(angle,angle_to,bubble_angle_plus);
			if(step > mentos_start_time)
			{
				if(step % mentos_wait == 0)
				{
					//shoot(DAN_MENTOS,color_id,x,y,aim_to,0,sfx_shot3,4);
					shoot_arc(DAN_MENTOS,color_id,2,x,y,angle,50,0,sfx_shot3,4);
					aim_to += 2 * dan_dir;
				}

			}
		}
		
		
	}
}
// Inherit the parent event
event_inherited();

