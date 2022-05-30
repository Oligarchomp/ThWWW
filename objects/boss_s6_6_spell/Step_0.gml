/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var wine_spd = 0.5;
			var	wine_row = 5; // must be odd
			var wine_dist = room_width / wine_row;
			
			var grape_col = 3;
			var wine_col = 7;
			
			var mentos_nbr = 3;
			var mentos_spd = 1.2;
			var mentos_accel = 0.005;
			
			var misha_nbr = 14;
			var misha_spd = 1.5;
			
			var bubble_row = 1;
			var bubble_spd_min = 2;
			var bubble_spd_max = 4;
			
			var catch_nbr = 5;
			var catch_spd_shot = 5;
			var catch_angle_plus = 4;
			
			var nua_lenght = 280;
			var nua_wait = 70;
		break;
		case 1:
			var wine_spd = 1;
			var	wine_row = 5; // must be odd
			var wine_dist = room_width / wine_row;
			
			var grape_col = 3;
			var wine_col = 7;
			
			var mentos_nbr = 4;
			var mentos_spd = 1.4;
			var mentos_accel = 0.008;
			
			var misha_nbr = 20;
			var misha_spd = 1.8;
			
			var bubble_row = 2;
			var bubble_spd_min = 2.1;
			var bubble_spd_max = 3.2;
			
			var catch_nbr = 6;
			var catch_spd_shot = 5;
			var catch_angle_plus = 4;
			
			var nua_lenght = 280;
			var nua_wait = 70;
		break;
		case 2:
			var wine_spd = 1;
			var	wine_row = 7; // must be odd
			var wine_dist = room_width / wine_row;
			
			var grape_col = 3;
			var wine_col = 7;
			
			var mentos_nbr = 3;
			var mentos_spd = 1.5;
			var mentos_accel = 0.01;
			
			var misha_nbr = 25;
			var misha_spd = 1.9;
			
			var bubble_row = 3;
			var bubble_spd_min = 2.5;
			var bubble_spd_max = 4.5;
			
			var catch_nbr = 8;
			var catch_spd_shot = 5;
			var catch_angle_plus = 4;
			
			var nua_lenght = 280;
			var nua_wait = 60;
		break;
		case 3:
			var wine_spd = 1;
			var	wine_row = 7; // must be odd
			var wine_dist = room_width / wine_row;
			
			var grape_col = 0;
			var wine_col = 6;
			
			var mentos_nbr = 6;
			var mentos_spd = 1.5;
			var mentos_accel = 0.005;
			
			var misha_nbr = 30;
			var misha_spd = 2;
			
			var bubble_row = 4;
			var bubble_spd_min = 2.5;
			var bubble_spd_max = 5;
			
			var nua_lenght = 280;
			var nua_wait = 50;
		break;
	}
	
	
	//catch hard
	with(obj_danmaku6)
	{
		switch(state)
		{
			case 0:
				if(state_time == 0)
				{
					angle_to = angle + 360;
					y_offscreen = 200;
					x_offscreen = 200;
					is_cancelable = false;
				}
				else
				{
					angle = goto_value(angle,angle_to,catch_angle_plus);
				}
					
				
				if(angle == angle_to)
				{
					state = 1;
					y_offscreen = 40;
					x_offscreen = 40;
				}
			break;
		}
	}
	
	
	switch(state)
	{
		case 0: 
			play_sound(sfx_shock,1,false);
			for(var i = 0; i <wine_row; i += 1)
			{
				var x_pos = wine_dist / 2 + i * wine_dist;
				var inst = shoot(DAN_MENTOS,0,x_pos,-wine_dist * 2 - (i % 2 == wave_off) * wine_dist,90,0,noone,1);
				inst.is_cancelable = false;
				inst.y_offscreen = 5000;
				inst.pellet_id = i;
				inst.wine_nbr = 0;
			}
			
			with(obj_danmaku1)
			{
				if(pellet_id = (wine_row - 1) / 2)
				{
					for(var i = y; i < room_height + wine_dist * 3; i += wine_dist * 2)
					{
						shoot_laser_center(x,i,45,60,55,c_white,sfx_laser1)
						shoot_laser_center(x,i,-45,60,55,c_white,sfx_laser1)
					}
				}
			}
			state = 1;
			
			wave_off += 1;
			wave_off %= 2;
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
							var inst = shoot(DAN_MENTOS,grape_col,x,i,rand + 360 / mentos_nbr * m,0,noone,5);
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
						shoot_ring(DAN_BUBBLE,wine_col,misha_nbr,obj_boss.x,obj_boss.y,rng(360,false,7),misha_spd,sfx_redirect1,7);		
						shoot_row(DAN_BUBBLE,grape_col,bubble_row,obj_boss.x,obj_boss.y,999,bubble_spd_min,bubble_spd_max,noone,8);
					break;
					case move:
						boss_movement_random(2,4,2);
					break;
				}
			}
			else
			{
				switch(global.difficulty)
				{
					case 0:
					case 1:
					case 2:
						state = 5;
					break;
					case 3:
						state = 4;
					break;
				}
			}
		break;
		case 4://Lunatic
			switch(state_time)
			{
				case 40:
					play_sound(sfx_photo_charge,1,false);
				break;
				case 60:
					with(obj_danmaku1)
					{
						state = 2;
					}
				break;
				case 130:
					play_sound(sfx_redirect1,1,false);
					with(obj_danmaku5)
					{
						state = 1;
						y_offscreen = 20;
						is_cancelable = true;
					}
				break;
				case 230:
					state = 0;
					with(obj_danmaku1)
					{
						cancel_bullet(self);	
					}
				break;
			}
		break;
		case 5://hard
			switch(state_time)
			{
				case 20:
					boss_charge(obj_boss.x,obj_boss.y)
				break;
				case 50:
					shoot_ring(DAN_BUBBLE,1,catch_nbr,obj_boss.x,obj_boss.y,-90 + 180 / catch_nbr,catch_spd_shot,sfx_shot1,6);
				break;
				case 260:
					state = 3;
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
						var inst = shoot(DAN_MENTOS,grape_col,x,room_height + 30,rand + 360 / mentos_nbr * m,0,noone,5);
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
				
				//for hard
				if(instance_exists(obj_danmaku6))
				{
					var obj = instance_nearest(x,y,obj_danmaku6);
					if(get_distance(x,y,obj.x,obj.y) < 44) //collision_circle(x,y,30,obj_danmaku6,false,true))
					{
						state = 1;
						play_sound(sfx_redirect2,1,false);
					}
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

