/// @description Insert description here
// You can write your code in this editor

if (global.gp_active)
{
	
	if (state != last_state)
	{
		last_state = state;
		state_time = 0;
	}
	else
	{
		state_time += 1;
	}
	
	switch(state)
	{
		case 0://normal
		break;
		case 1://leaving
			if (x == x_to) and (y == y_to)
			{
				instance_destroy(self)
			}
		break;
		case 2: //death
			var ang = rng(360,true,2);
			
			if (state_time % 3 == 0)
			{
				var inst = instance_create_depth(x,y,depth -1,obj_boss_explode);
				inst.scale = rng(1,false,5);
				
			}
			
			var boss_death = boss_id;
			
			if((global.game_type == GAME_SPELL) or (global.game_type == GAME_STAGE)) and (boss_death != BOSS_YUUTO)
			{
				boss_death = 0;//default to normal death	
			}
			
			switch(boss_death)
			{
				case BOSS_NUA:
				case BOSS_REVERENCE:
				switch(state_time)
				{
					case 0:
						boss_movement_goto(x + lengthdir_x(50,ang),y + lengthdir_y(50,ang),0.2);
						play_sound(sfx_boss_preexplosion,1,false);
						for (var i = 0; i < 30; i += 1)
						{
							var inst = instance_create_depth(x,y,depth -1,obj_boss_explode);
							inst.scale = rng(1.5,false,i);
						}
					break;
					case 10:
					case 20:
					case 30:
					case 40:
					case 50:
					case 60:
						play_sound(sfx_boss_preexplosion,1,false);
						for (var i = 0; i < 30; i += 1)
						{
							var inst = instance_create_depth(x,y,depth -1,obj_boss_explode);
							inst.scale = rng(1.5,false,i);
						}
					break;
					case 70:
						screen_shake(30,20);
						play_sound(sfx_boss_explosion,1,false);
						for (var i = 0; i < 200; i += 1)
						{
							var inst = instance_create_depth(x,y,depth -1,obj_boss_explode);
							inst.scale = rng(4,false,i);
						}
						instance_destroy();
					break;
				}
				
				break;
				default:
					switch(state_time)
					{
						case 0:
							boss_movement_goto(x + lengthdir_x(30,ang),y + lengthdir_y(30,ang),0.5);
							play_sound(sfx_boss_preexplosion,1,false);
						break;
						case 40:
				
							screen_shake(20,10);
							if(boss_id != BOSS_YUUTO)
							{
								play_sound(sfx_boss_explosion,1,false);
								repeat(120)
								{
									instance_create_depth(x,y,depth -1,obj_boss_explode);
								}
							}
							else
							{
								play_sound(sfx_boom,1,false);	
								instance_create_depth(x,y,depth -1,obj_boom);
							}
							instance_destroy();
						break;
					}
				break;
			}
		break;
	}
	
	switch(pos_type)
	{
		case POS_SP:
			//Movement
			var ang = find_angle(x,y,x_to,y_to);
			
			var xa = recursiv(x, x_to, 4, 0.5);
			var ya = recursiv(y, y_to, 4, 0.5);
			
			var hyp = sqrt(sqr(xa) + sqr(ya));
			if (hyp > spd_max)
			{
				hyp = spd_max;
			}
			
			hsp = lengthdir_x(hyp,ang);
			vsp = lengthdir_y(hyp,ang);
		break;
		case POS_ANGLE:
			hsp = lengthdir_x(spd,angle)
			vsp = lengthdir_y(spd,angle)
		break;
	}

	
	//

	
	if (abs(hsp) > 0) or (abs(vsp) > 0)
	{
		dir = goto_value(dir,dir_max * (hsp == 0 ? spr_dir : sign(hsp)),dir_spd);
		
		switch(movement_type)
		{
			case 0:
			case 3:
				spr_dir = sign(dir);
			break;
		}
	}
	else if (rot == 0)
	{
		dir = goto_value(dir,0,dir_spd);
	}
	
	
	switch(movement_type)
	{
		case 1:
			if(!in_position) and (rot == 0)
			{
				rot += 360;
			}
			rot = goto_value(rot,0,20);
		case 0:
			if (dir == 0)
			{
				sprite_index = idle_spr;
				image_index = state_time * idle_spd;
			}
			else 
			{
				sprite_index = move_spr;
				image_index = abs(dir);
			}
		break;
		case 2:
			if (dir == 0)
			{
				sprite_index = idle_spr;
				image_index = state_time * idle_spd;
			}
			else if(dir > 0)
			{
				sprite_index = move_right_spr;
				image_index = abs(dir);
			}
			else
			{
				sprite_index = move_left_spr;
				image_index = abs(dir);
			}
		break;
		case 3:
			sprite_index = idle_spr;
			image_index = state_time * idle_spd;
		break;
	}
	
	
	// taking damage sfx when no pattern active
	if (!instance_exists(obj_spell))
	{
		var damage = check_damage();
		
		if(damage > 0)
		{
			play_sound(sfx_damage,1,false);
		}
	}
	
	
	x += hsp;
	y += vsp;
	
	in_position = ((x == x_to) and (y == y_to))
	
	
	//setting hitbox
	if (instance_exists(my_hitbox))
	{
		my_hitbox.x = x;
		my_hitbox.y = y;
	}
	
}