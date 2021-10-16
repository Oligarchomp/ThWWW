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
			var wine_spd = 1;
			var	wine_row = 7; // must be odd
			var wine_dist = room_width / wine_row;
			
			var mentos_nbr = 6;
			var mentos_spd = 1.6;
			var mentos_accel = 0.005;
			
			var misha_nbr = 30;
			var misha_spd = 2;
			
			var bubble_row = 4;
			var bubble_spd_min = 2.5;
			var bubble_spd_max = 5;
			
			var nua_wait = 50;
		break;
	}
	
	var spell = self;
	
	var nua_lenght = 280;
	
	switch(state)
	{
		case 0: 
			play_sound(sfx_shock,1,false);
			for(var i = 0; i <wine_row; i += 1)
			{
				var x_pos = wine_dist / 2 + i * wine_dist;
				var inst = shoot(DAN_PELLET,7,x_pos,-wine_dist * 2 - (i % 2 == 0) * wine_dist,90,0,noone,1);
				inst.is_cancelable = false;
				inst.y_offscreen = 5000;
				inst.pellet_id = i;
				inst.wine_nbr = 0;
			}
			
			with(obj_danmaku1)
			{
				if(pellet_id = (wine_row - 1) / 2)
				{
					for(var i = y; i < room_height + wine_dist * 2; i += wine_dist * 2)
					{
						instance_create_depth(x,i,0,obj_wine_laser);
						var inst = instance_create_depth(x,i,0,obj_wine_laser);
						inst.image_xscale = -1;
					}
				}
			}
			state = 1;
		break;
		case 1:
			if(state_time == 60)
			{
				state = 2;
				
				with(obj_danmaku1)
				{
					for(var i = y; i < room_height; i += wine_dist * 2)
					{
						wine_nbr += 1;
						
						var rand = rng(360,false,floor(i));
						for(var m = 0 ; m < mentos_nbr; m += 1)
						{
							var inst = shoot(DAN_MENTOS,0,x,i,rand + 360 / mentos_nbr * m,0,noone,5);
							inst.wine_id = wine_nbr;
							inst.my_pellet = self;
							inst.y_offscreen = 500;
							inst.is_cancelable = false;
						}
					}
				}
			}
		break;
		case 2:
			if(state_time == 60)
			{
				state = 3;
				with(obj_danmaku1)
				{
					state = 1;
				}
			}
		break;
		case 3:
			if(state_time < nua_lenght)
			{
				var move = floor(nua_wait / 2);
				switch(state_time % nua_wait)
				{
					case 0:
						shoot_ring(DAN_BUBBLE,6,misha_nbr,obj_boss.x,obj_boss.y,rng(360,false,7),misha_spd,sfx_redirect1,7);		
						shoot_row(DAN_BUBBLE,0,bubble_row,obj_boss.x,obj_boss.y,999,bubble_spd_min,bubble_spd_max,noone,8);
					break;
					case move:
						boss_movement_random(2,4,2);
					break;
				}
			}
			else
			{
				state = 4;
			}
		break;
		case 4:
			switch(state_time)
			{
				case 60:
					with(obj_danmaku1)
					{
						state = 2;
					}
					play_sound(sfx_photo_charge,1,false);
				break;
				case 140:
					play_sound(sfx_redirect1,1,false);
					with(obj_danmaku5)
					{
						state = 1;
						y_offscreen = 20;
						is_cancelable = true;
					}
				break;
				case 240:
					state = 0;
					with(obj_danmaku1)
					{
						cancel_bullet(self);	
					}
				break;
			}
		break;
	}
	
	//reference pellet
	with(obj_danmaku1)
	{
		switch(state)
		{
			case 1:
				spd = goto_value(spd,wine_spd,0.02);
				
				if(state_time % floor((wine_dist * 2 / wine_spd)) == 0)
				{
					var rand = rng(360,false,6);
					wine_nbr += 1;
					
					for(var m = 0 ; m < mentos_nbr; m += 1)
					{
						var inst = shoot(DAN_MENTOS,0,x,room_height + 30,rand + 360 / mentos_nbr * m,0,noone,5);
						inst.wine_id = wine_nbr;
						inst.my_pellet = self;
						inst.y_offscreen = 500;
						inst.is_cancelable = false;
					}
				}
			break;
			case 2:
				spd = goto_value(spd,0,0.02);
			break;
		}
	}
	//mentos
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				y = my_pellet.y + wine_id * wine_dist * 2;
				if(y < 100)
				{
					y_offscreen = 20;
				}
			break;
			case 1:
				spd = goto_value(spd,mentos_spd,mentos_accel);
			break;
		}
	}
}

// Inherit the parent event
event_inherited();

