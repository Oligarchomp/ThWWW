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
			
			var mentos_nbr = 4;
		break;
	}
	
	var spell = self;
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
							inst.group_id = spell.wine_group_id;
						}
						spell.wine_group_id += 1;
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
			if(state_time % 60 == 0)
			{
				nua_aim = instance_nearest(room_width / 2 + 50 * aim_dir,100,obj_danmaku5);
				aim_dir *= -1:
			}
			
		break;
	}
	
	if(instance_exists(nua_aim))
	{
		boss_movement_goto(nua_aim.x,nua_aim.y,2);
		if (sqrt(sqr(nua_aim.x - obj_boss.x) + sqr(nua_aim.y - obj_boss.y)) < 20)
		{
			var id_check = nua_aim.group_id;
			with(obj_danmaku5)
			{
				if(group_id = id_check)
				{
					cancel_bullet(self);
				}
			}
		}
	}
	
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
						inst.group_id = spell.wine_group_id;
					}
					spell.wine_group_id += 1;
				}
			break;
		}
	}
	
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
		}
	}
	
}

// Inherit the parent event
event_inherited();

