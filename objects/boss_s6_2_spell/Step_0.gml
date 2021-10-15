/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var anchor_size = 2;
			var anchor_spd = 25;
			var anchor_stay = 110;
			var anchor_accel = 0.05;
			
			var impact_ring = 0;
			var impact_row = 3;
			var impact_spd_min = 1;
			var impact_spd_max = 3;
			
			var debris_spd_max = 6;
			var debris_spd_less = 0.25;
			var debris_spd_git = 2;
			var debris_grav = 0.05;
			var debris_dist_plus = 5;
			var debris_dist_git = 4;
			var debris_open = 16;
			
			var spam_nbr = 80;
			var spam_spd_min = 4;
			var spam_spd_git = 4;
			var spam_grav = 0.05;
			var spam_open = 30;
			
			var wave_wait = 70;
			
			var bullet_ring = 20;
			var bullet_spd = 2;
			var bullet_wait = 120;
			var bullet_dist = 180 / bullet_ring;
		break;
		case 1:
			var anchor_size = 2;
			var anchor_spd = 25;
			var anchor_stay = 90;
			var anchor_accel = 0.05;
			
			var impact_ring = 9;
			var impact_row = 3;
			var impact_spd_min = 1;
			var impact_spd_max = 3;
			
			var debris_spd_max = 6;
			var debris_spd_less = 0.2;
			var debris_spd_git = 2;
			var debris_grav = 0.05;
			var debris_dist_plus = 4;
			var debris_dist_git = 3;
			var debris_open = 16;
			
			var spam_nbr = 92;
			var spam_spd_min = 4;
			var spam_spd_git = 4;
			var spam_grav = 0.05;
			var spam_open = 30;
			
			var wave_wait = 60;
			
			var bullet_ring = 36;
			var bullet_spd = 2.3;
			var bullet_wait = 90;
			var bullet_dist = 180 / bullet_ring;
		break;
		case 2:
			var anchor_size = 2;
			var anchor_spd = 26;
			var anchor_stay = 70;
			var anchor_accel = 0.05;
			
			var impact_ring = 13;
			var impact_row = 4;
			var impact_spd_min = 1;
			var impact_spd_max = 3;
			
			var debris_spd_max = 6;
			var debris_spd_less = 0.15;
			var debris_spd_git = 2;
			var debris_grav = 0.05;
			var debris_dist_plus = 3;
			var debris_dist_git = 2.5;
			var debris_open = 16;
			
			var spam_nbr = 128;
			var spam_spd_min = 4;
			var spam_spd_git = 4;
			var spam_grav = 0.05;
			var spam_open = 30;
			
			var wave_wait = 40;
			
			var bullet_ring = 42;
			var bullet_spd = 2.5;
			var bullet_wait = 80;
			var bullet_dist = 180 / bullet_ring;
		break;
		case 3:
			var anchor_size = 2;
			var anchor_spd = 26;
			var anchor_stay = 50;
			var anchor_accel = 0.05;
			
			var impact_ring = 16;
			var impact_row = 4;
			var impact_spd_min = 1;
			var impact_spd_max = 3;
			
			var debris_spd_max = 6;
			var debris_spd_less = 0.1;
			var debris_spd_git = 2;
			var debris_grav = 0.05;
			var debris_dist_plus = 2;
			var debris_dist_git = 2;
			var debris_open = 16;
			
			var spam_nbr = 170;
			var spam_spd_min = 4;
			var spam_spd_git = 4;
			var spam_grav = 0.05;
			var spam_open = 30;
			
			var wave_wait = 40;
			
			var bullet_ring = 52;
			var bullet_spd = 2.5;
			var bullet_wait = 70;
			var bullet_dist = 180 / bullet_ring;
		break;
	}
	var boss_wait = 145;
	var boss_start_shoot = 160;
	
	if(step > boss_start_shoot)
	{
		if(step % bullet_wait == 0)
		{
			shoot_ring(DAN_BULLET,7,bullet_ring,obj_boss.x,obj_boss.y,bullet_angle,bullet_spd,sfx_shot1,2);
			bullet_angle += bullet_dist;
		}
	}
	
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
			var inst = shoot(DAN_ANCHOR,1,x_anchor,y_spawn,-90,anchor_spd,sfx_boat,5);
			inst.image_xscale = anchor_size;
			inst.image_yscale = anchor_size;
			inst.x_offscreen = 100;
			inst.y_offscreen = 3000;
			inst.is_cancelable = false;
			
			anchor_id = inst;
			
			for(var i = 0; i < room_height + 50; i += 40)
			{
				var inst = shoot(DAN_BUBBLE,7,x_anchor,y_spawn - i,0,0,noone,6);
				inst.y_offscreen = 2000;
				inst.is_cancelable = false;
				inst.pos_type = POS_MANUAL;
				inst.dist = i;
			}
			state = 1;
		break;
		case 1:
			if(x_indicator <= room_height)
			{
				boss_charge(x_anchor,x_indicator);
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
				if(y > room_height)
				{
					state = 1;
					play_sound(sfx_shock,1,false);
					screen_shake(20,0);
					spd = 0;
					
					shoot_ring_row(DAN_BUBBLE,1,impact_ring,impact_row,x,y,90,impact_spd_min,impact_spd_max,noone,4);
				
					for(var i = 0; i < spam_nbr; i += 1)
					{
						var ang = 90 - spam_open + rng(spam_open * 2, false,i);
						var sp = spam_spd_min + rng(spam_spd_git,false,i + 1);
						var inst = shoot(DAN_BALL,7,x,y,ang,sp,noone,3);
						inst.pos_type = POS_SP;
						inst.y_grav_accel = spam_grav;
						inst.y_grav_max = 8;
						inst.y_offscreen = 200;
					}
					
					var x_pos = x;
					var sp = debris_spd_max;
					while(x_pos < room_width) and (sp >= 0)
					{
						var ang = 90 - debris_open + rng(debris_open * 2,false,x_pos + 1);
						var sp_shot = sp + rng(debris_spd_git,false,x_pos);
						var inst = shoot(DAN_BALL,2,x_pos,room_height,ang,sp_shot,noone,3);
						inst.pos_type = POS_SP;
						inst.y_grav_accel = debris_grav;
						inst.y_grav_max = 8;
						inst.y_offscreen = 200;
						
						x_pos += debris_dist_plus + rng(debris_dist_git,true,sp);
						sp -= debris_spd_less;
					}
					
					var x_pos = x;
					var sp = debris_spd_max;
					while(x_pos > 0) and (sp >= 0)
					{
						var ang = 90 - debris_open + rng(debris_open * 2,false,x_pos + 1);
						var sp_shot = sp + rng(debris_spd_git,false,x_pos);
						var inst = shoot(DAN_BALL,2,x_pos,room_height,ang,sp_shot,noone,3);
						inst.pos_type = POS_SP;
						inst.y_grav_accel = debris_grav;
						inst.y_grav_max = 8;	
						inst.y_offscreen = 200;
						
						x_pos -= debris_dist_plus + rng(debris_dist_git,true,sp);
						sp -= debris_spd_less;
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
	
	//chain
	with(obj_danmaku6)
	{
		y = spell.anchor_id.y - dist;
	}
	
	with(obj_danmaku3)
	{
		if (y > 530)
		{
			y_offscreen = 30;	
		}
	}
}

// Inherit the parent event
event_inherited();

