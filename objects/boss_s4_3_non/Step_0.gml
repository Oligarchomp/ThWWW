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
			var ring_nbr = 20;
			var pos_dist = 30;
			var ring_wait = 8;
			var ring_spd_max = 8;
			var release_wait = 20;
			var wave_wait = 60;
		break;
	}
	
	switch(state)
	{
		case 0:
			if(pos > 0)
			{
				if(state_time % ring_wait == 0)
				{
					for(var i = 0; i < ring_nbr; i += 1)
					{
						var ang = angle_shoot + i * 360 / ring_nbr
						if(i % 2 == 0)
						{
							var col = 6;
						}
						else
						{
							var col = 2;
						}
						var inst = shoot(DAN_STARBIG,col,obj_player.x,obj_player.y,ang,0,sfx_shot1,3);
						inst.dist = pos;
						inst.x_ref = obj_boss.x + lengthdir_x(pos,ang);
						inst.y_ref = obj_boss.y + lengthdir_y(pos,ang);
						inst.angle_ref = ang + 180;
						inst.pos_type = POS_MANUAL;
					}
					pos -= pos_dist;
					angle_shoot += 360 / ring_nbr / 2;
				}
			}
			else
			{
				state = 1;
			}
		break;
		case 1:
		var release_wait2 = release_wait + 30;
			switch(state_time)
			{
				case release_wait:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case release_wait2:
					boss_release(obj_boss.x,obj_boss.y,sfx_redirect1);
				break;
	
			}
		break;
	}
	
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				dist -= min(ring_spd_max,abs(recursiv(dist,0,15,0.1)));
				x = x_ref + lengthdir_x(dist,angle_ref);
				y = y_ref + lengthdir_y(dist,angle_ref);
			break;
		}
	}
	
	
}
// Inherit the parent event
event_inherited();

