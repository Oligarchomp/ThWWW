/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var anchor_size = 2;
			var anchor_spd = 16;
			var anchor_stay = 100;
			var anchor_accel = 0.05;
			
			var impact_ring = 12;
			var impact_row = 6;
			var impact_spd_min = 0.7;
			var impact_spd_max = 1.8;
			
			var need_ball = true;
			var impact_ball_mult = 1.1;
			
			var tray_start = 90;
			var tray_wait = 3;
			var tray_row = 4;
			var tray_spin = 30;
			var tray_spd_min = 1.6;
			var tray_spd_max = 3.2;
			var tray_frame_accel = 90;
			
			var wave_wait = 60;
		break;
		case 1:
			var anchor_size = 2;
			var anchor_spd = 20;
			var anchor_stay = 90;
			var anchor_accel = 0.05;
			
			var impact_ring = 18;
			var impact_row = 7;
			var impact_spd_min = 0.7;
			var impact_spd_max = 1.8;
			
			var need_ball = true;
			var impact_ball_mult = 1.1;
			
			var tray_start = 90;
			var tray_wait = 2;
			var tray_row = 4;
			var tray_spin = 24;
			var tray_spd_min = 1.9;
			var tray_spd_max = 3.8;
			var tray_frame_accel = 90;
			
			var wave_wait = 50;
		break;
		case 2:
			var anchor_size = 2;
			var anchor_spd = 23;
			var anchor_stay = 50;
			var anchor_accel = 0.05;
			
			var impact_ring = 20;
			var impact_row = 7;
			var impact_spd_min = 0.7;
			var impact_spd_max = 1.8;
			
			var need_ball = true;
			var impact_ball_mult = 1.1;
			
			var tray_start = 00;
			var tray_wait = 1;
			var tray_row = 5;
			var tray_spin = 19;
			var tray_spd_min = 2;
			var tray_spd_max = 4;
			var tray_frame_accel = 90;
			
			var wave_wait = 40;
		break;
		case 3:
			var anchor_size = 2;
			var anchor_spd = 26;
			var anchor_stay = 50;
			var anchor_accel = 0.05;
			
			var impact_ring = 26;
			var impact_row = 13;
			var impact_spd_min = 0.7;
			var impact_spd_max = 2.5;
			
			var need_ball = false;
			var impact_ball_mult = 1;
			
			var tray_start = 90;
			var tray_wait = 1;
			var tray_row = 5;
			var tray_spin = 14;
			var tray_spd_min = 2;
			var tray_spd_max = 4;
			var tray_frame_accel = 90;
			
			var wave_wait = 40;
		break;
	}
	var boss_wait = 145;
	
	if(step % boss_wait == boss_wait - 1)
	{
		boss_movement_random(3,7,2);
	}
	
	var indicator_plus = 50;
	
	switch(state)
	{
		case 0:
			var y_spawn = -1100;
			play_sound(sfx_boat,1,false);
			x_anchor = obj_player.x;
			
			x_anchor = min(x_anchor,365);
			x_anchor = max(x_anchor,35);
			if(x_anchor > room_width / 2)
			{
				x_anchor = max(x_anchor,300);
			}
			else
			{
				x_anchor = min(x_anchor,100);
			}
				
			var inst = shoot(DAN_ANCHOR,1,x_anchor,y_spawn,-90,anchor_spd,sfx_boat,5);
			inst.image_xscale = anchor_size;
			inst.image_yscale = anchor_size;
			inst.x_offscreen = 100;
			inst.y_offscreen = 3000;
			inst.is_cancelable = false;
			inst.angle = -90 // for the rng patch
			
			anchor_id = inst;
			
			for(var i = 0; i < room_height + 50; i += 40)
			{
				var inst = shoot(DAN_BUBBLE,7,x_anchor,y_spawn - i,0,0,noone,6);
				inst.y_offscreen = 2000;
				inst.is_cancelable = false;
				inst.pos_type = POS_MANUAL;
				inst.dist = i;
				inst.rot_type = ROT_SET;
			}
			state = 1;
		break;
		case 1:
			if(state_time == 0)
			{
				boss_charge_row(x_anchor,-45,-90,6,56,10);	
			}
			
			if(x_indicator <= room_height)
			{
				//boss_charge_sfx(x_anchor,x_indicator,noone);
				x_indicator += indicator_plus;
			}
			else
			{
				if(!instance_exists(anchor_id)) //mind when spawning
				{
					state = 2;
					x_indicator = 0;
				}
			}
		break;
		case 2:
			if(state_time == wave_wait)
			{
				state = 0;
			}
		break;
	}
	
	var spell = self;
	//anchor
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				if(state_time = 0)
				{
					angle_dist = tray_start;	
				}
				if(y > 0)
				{
					if(state_time % tray_wait == 0)
					{
						angle_dist += tray_spin;
					
						for(var i = tray_spd_min; i < tray_spd_max; i += (tray_spd_max - tray_spd_min) / tray_row)
						{
							for(var j = -(angle_dist - 1) / 2; j <= (angle_dist + 1) / 2; j += angle_dist)
							{
								var inst = shoot(DAN_BUBBLE,7,x,y,90 + j,0,sfx_redirect1,7);
								inst.spd_to = i;
							}
						}
					}
			
				}
				
				if(y > room_height)
				{
					state = 1;
					play_sound(sfx_shock,1,false);
					screen_shake(20,0);
					spd = 0;
					
					var aim = rng(360,false,5);
					for(var i = impact_spd_min; i < impact_spd_max; i += (impact_spd_max - impact_spd_min) / impact_row)
					{
						shoot_ring(DAN_MENTOS,1,impact_ring,x,room_height,aim,i,noone,4);
						if(need_ball)
						{
							shoot_ring(DAN_BALL,1,impact_ring,x,room_height,aim,i * impact_ball_mult,noone,3);
						}
						aim += 180 / impact_ring;
					}
				}
			break;
			case 1:
				if(state_time == anchor_stay)
				{
					state = 2;
					y_offscreen = 100;
					with(obj_danmaku6)
					{
						y_offscreen = 40;	
					}
					
					sfx_time = 0;
					sfx_spd = 18;
				}	
			break;
			case 2:
				spd -= anchor_accel;
				sfx_time += 1;
				if(sfx_time % sfx_spd == sfx_spd - 1)
				{
					sfx_time = 0;
					sfx_spd = goto_value(sfx_spd,5,1);
					play_sound(sfx_shot3,1,false);	
				}
			break;
		}
	}
	//tray
	with(obj_danmaku7)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,spd_to,spd_to / tray_frame_accel);
			break;
		}
	}
	
	//chain
	with(obj_danmaku6)
	{
		y = spell.anchor_id.y - dist;
	}
}

// Inherit the parent event
event_inherited();

