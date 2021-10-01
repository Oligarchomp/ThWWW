/// @description Insert description here
// You can write your code in this edito

if (global.gp_active)
{
	// state
	if (last_state != state)
	{
		last_state = state;
		state_time = 0;
	}
	else
	{
		state_time += 1;
	}
	
	
	// ANIMATION
	switch(move_type)
	{
		case 0:
			if (abs(hsp) > 0)
			{
				dir = goto_value(dir,dir_max * sign(hsp),dir_spd);
		
				spr_dir = sign(dir);
			}
			else
			{
				dir = goto_value(dir,0,dir_spd);
			}
	
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
		case 1:
			sprite_index = idle_spr;
			image_index = state_time * idle_spd;
		break;
	}
	
	//checking damage
	
	var damage = 0;
	if (y > 0) and (y < room_width) and (x > 0) and (x < room_width) 
	{
		var damage = check_damage();
	}
	
	life -= damage;
	
	if(damage > 0)
	{
		if (life > life_low)
		{
			play_sound(sfx_damage,1,false);
		}
		else
		{
			play_sound(sfx_damage_low,1,false);
		}
	}

	if(life <= 0)
	{
		play_sound(sfx_enemy_defeat,1,false);
		
		if (can_revenge)
		{
		var event = get_current_event()
			if(instance_exists(event))
			{
				if (object_get_parent(event) == obj_act) or (object_get_parent(event) == obj_spell)
				{
					ds_list_add(event.x_death_list,x);
					ds_list_add(event.y_death_list,y);
				}
			}
		}
		
		//instance_create_depth(x,y,depth,obj_enemy_defeat);
		create_confetti(x,y,8,4);
		
		repeat(item_nbr)
		{
			create_item(ITEM_POINT,x - item_dist + rng(item_dist * 2 ,true,2),y - item_dist + rng(item_dist * 2,true,2));
		}
		
		
		instance_destroy();
	}
	
	switch(en_type)
	{
		case EN_FAMILIAR:
			rot += rot_spd;
		break;
	}
	
	if(global.gp_active)
	{
		switch(pos_type)
		{
			case POS_ANGLE:
				hsp = lengthdir_x(spd,angle)
				vsp = lengthdir_y(spd,angle)
			
				x += hsp;
				y += vsp;
			break;
			case POS_SP:
				x += hsp;
				y += vsp;
			break;
			case POS_MANUAL:
		
			break;
		
		}
	}
	
	//offscreen
	if (step > 60)
	{
		if (x < -offscreen) or (x > room_width + offscreen) or (y < -offscreen) or (y > room_height + offscreen)
		{
			instance_destroy();
		}
	}
	
	step += 1;
}
