/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var wave_time = 80;
			var wave_lenght = 65;
			
			var aim_wait = 6;
			var aim_arc = 3;
			var aim_dist = 40;
			var aim_spd = 9;
			var aim_spd_aim = 5;
			var aim_deccel = 0.2;
			
			var ring_wait = 12;
			
			var ring_big_arc = 3;
			var ring_big_dist = 70;
			
			var ring_dist = 32;
			var ring_arc = 3;
			var ring_spd_shoot = 7;
			var ring_deccel = 0.2;
			var ring_spd_aim = 3;
			
			var close_wait = 13;
			var close_ring = 10;
			var close_spd_shoot = 10;
			var close_deccel = 0.2;
			var close_dist = 48;
			var close_spd_aim = 2;
		break;
		case 1:
			var wave_time = 80;
			var wave_lenght = 70;
			
			var aim_wait = 5;
			var aim_arc = 5;
			var aim_dist = 25;
			var aim_spd = 9;
			var aim_spd_aim = 5;
			var aim_deccel = 0.2;
			
			var ring_wait = 10;
			
			var ring_big_arc = 4;
			var ring_big_dist = 50;
			
			var ring_dist = 24;
			var ring_arc = 3;
			var ring_spd_shoot = 8;
			var ring_deccel = 0.2;
			var ring_spd_aim = 3;
			
			var close_wait = 12;
			var close_ring = 10;
			var close_spd_shoot = 10.5;
			var close_deccel = 0.2;
			var close_dist = 48;
			var close_spd_aim = 2;
		break;
		case 2:
			var wave_time = 80;
			var wave_lenght = 72;
			
			var aim_wait = 5;
			var aim_arc = 7;
			var aim_dist = 22;
			var aim_spd = 9;
			var aim_spd_aim = 6;
			var aim_deccel = 0.2;
			
			var ring_wait = 9;
			
			var ring_big_arc = 5;
			var ring_big_dist = 50;
			
			var ring_dist = 22;
			var ring_arc = 3;
			var ring_spd_shoot = 8;
			var ring_deccel = 0.2;
			var ring_spd_aim = 3;
			
			var close_wait = 11;
			var close_ring = 13;
			var close_spd_shoot = 11;
			var close_deccel = 0.2;
			var close_dist = 46;
			var close_spd_aim = 2;
		break;
		case 3:
			var wave_time = 80;
			var wave_lenght = 75;
			
			var aim_wait = 4;
			var aim_arc = 7;
			var aim_dist = 20;
			var aim_spd = 9;
			var aim_spd_aim = 6;
			var aim_deccel = 0.2;
			
			
			var ring_big_arc = 6;
			var ring_big_dist = 45;
			
			var ring_wait = 8;
			var ring_dist = 18;
			var ring_arc = 3;
			var ring_spd_shoot = 9;
			var ring_deccel = 0.2;
			var ring_spd_aim = 3;
			
			var close_wait = 12;
			var close_ring = 15;
			var close_spd_shoot = 11.5;
			var close_deccel = 0.2;
			var close_dist = 40;
			var close_spd_aim = 2;
		break;
	}
	
	var boss_wait = wave_time * 3;
	if(step % boss_wait == boss_wait - 1)
	{
		boss_movement_random(8,3,3)
	}
	
	var wave_time2 = wave_time * 2;
	switch(state_time % (wave_time * 3))
	{
		case 0:
			dir_act *= -1;
			aim_time = wave_lenght;
		break;
		case wave_time:
			ring_x_to = noone;
			ring_y_to = noone;
			ring_angle = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y);
			ring_time = wave_lenght;
		break;
		case wave_time2:
			close_x_to = noone;
			close_y_to = noone;
			close_angle = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y);
			close_time = wave_lenght;
		break;
	}
	
	//SPIN
	if(aim_time > 0)
	{
		if(step % aim_wait == 0)
		{
			shoot_arc(DAN_ARROW,7,aim_arc,obj_boss.x,obj_boss.y,999,aim_dist,aim_spd,sfx_shot1,5)
		}
		
		aim_time -= 1
	}
	
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				x_offscreen = 50;
				y_offscreen = 110;
		
				spd = goto_value(spd,0,aim_deccel);
				if(spd == 0)
				{
					state = 1;
					spd = aim_spd_aim;
					angle = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 1:
				if(state_time == 60)
				{
					x_offscreen = 20;
					y_offscreen = 20;
				}
			break;
		}
	}
	
	//ring
	if(ring_time > 0)
	{
		if(step % ring_wait == 0)
		{
			for(var d = 0; d < ring_arc; d += 1)
			{
				for(var i = -(ring_big_arc - 1) * ring_big_dist / 2; i < (ring_big_arc + 1) * ring_big_dist / 2; i += ring_big_dist)
				{
					var inst = shoot(DAN_ARROW,3,obj_boss.x,obj_boss.y,ring_angle + i,ring_spd_shoot,sfx_shot2,3);
					inst.dan_id = d;
				}
			}
		}
		
		ring_time -= 1;
	}
	
	var spell = self;
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				x_offscreen = 40;
				y_offscreen = 40;
		
				spd = goto_value(spd,0,ring_deccel);
				if(spd == 0)
				{
					state = 1;
					spd = ring_spd_aim;
					var aim = find_angle(x,y,obj_player.x,obj_player.y);
					
					if(spell.ring_x_to == noone)
					{
						spell.ring_x_to = obj_player.x;	
						spell.ring_y_to = obj_player.y;	
					}
					var aim = find_angle(x,y,spell.ring_x_to,spell.ring_y_to);
					switch(dan_id)
					{
						case 0:
							angle = aim;
						break;
						case 1:
							angle = aim - ring_dist;
						break;
						case 2:
							angle =aim + ring_dist;
						break;
					}
				}
			break;
			case 1:
				if(state_time == 60)
				{
					x_offscreen = 20;
					y_offscreen = 20;
				}
			break;
		}
	}
	
	//CLOSE
	if(close_time > 0)
	{
		if(step % close_wait == 0)
		{
			for(var d = 0; d < close_ring; d += 1)
			{
				for(var i = -close_dist; i <= close_dist; i += close_dist)
				{
					var inst = shoot(DAN_ARROW,5,obj_boss.x,obj_boss.y,close_angle + i,close_spd_shoot,sfx_shot3,4);
					inst.dan_id = d;
				}
			}
		}
		close_time -= 1;	
	}
	
	with(obj_danmaku4)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,close_deccel);
				if(spd == 0)
				{
					spd = close_spd_aim;
					
					if(spell.close_x_to == noone)
					{
						spell.close_x_to = obj_player.x;	
						spell.close_y_to = obj_player.y;	
					}
					var aim = find_angle(x,y,spell.close_x_to,spell.close_y_to);
					
					
					angle = aim + dan_id * 360 / close_ring;
					
					state = 1;
				}
				
			break;
			
		}
		
		
	}
	
}
// Inherit the parent event
event_inherited();

