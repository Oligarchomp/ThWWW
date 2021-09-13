/// @description Insert description here
// You can write your code in this editor

if (global.gp_active)
{

	// start of the spell
	if (step == 0)
	{
		if (is_spell) and (!spell_initialize)
		{
			instance_create_depth(0,0,0,obj_spell_bg_text);
			instance_create_depth(0,0,depth + 1,obj_spell_art);
			play_sound(sfx_spell_declaration,1,false);
			
			switch(user_id)
			{
				case BOSS_APPLE:
					instance_create_depth(0,0, global.spell_bg_depth,obj_spell_bg_apple);
				break;
				case BOSS_SERENE:
					instance_create_depth(0,0, global.spell_bg_depth,obj_spell_bg_serene);
				break;
			}
			
			spell_initialize = true;
		}
		
		if(!is_spell)
		{
			global.spell_life = .2;
		}
		
	}
	
	
	life_uncover = goto_value(life_uncover,global.game_x_offset + life_bar_size,5);
	
	//mission failed
	if (obj_player.state == 2)
	{
		is_capturing = false;
	}
	
	if (invincibility > 0)
	{
		invincibility -= 1;
	}

	// Text
	if (is_spell)
	{
		switch(text_state)
		{
			case 0://appearing
				text_alpha += recursiv(text_alpha,1,text_appearing_spd,0.1);
				text_x += recursiv(text_x,text_x_final,text_appearing_spd, 0.1);
			
				if (text_x == text_x_final) and (text_alpha == 1)
				{
					text_state = 1;
				}
			break;
			case 1://slide
				text_y += recursiv(text_y,text_y_final,text_sliding_spd, 0.05);
				if (text_y == text_y_final)
				{
					text_state = 2;
				}
			break;
		}
		
		if(text_y < spell_info_y )
		{
			spell_info_alpha = goto_value(spell_info_alpha,1,0.05);
		}
	}
	else
	{
		spell_info_alpha = goto_value(spell_info_alpha,1,0.05);
	}


	//Check for damage

	var damage = 0;
	with(obj_boss)
	{
		var damage = check_damage();
	
	
		if (damage > 0)
		{
			if( other.invincibility == 0)
			{
				{
					other.life_left -= damage;
				}
			}
		}
	}
	
	
	// taking damage sfx
	
	if (damage > 0)
	{
		if (life_left > life_almost)
		{
			play_sound(sfx_damage,1,false);
		}
		else
		{
			play_sound(sfx_damage_low,1,false);
		}
	}
	
	// ticking clock
	if (time < time_ticking_low)
	{
		switch(time_left)
		{
			case 300:
			case 240:
				play_sound(sfx_timer1,1,false);
			break;
			case 180:
			case 120:
			case 60:
				play_sound(sfx_timer2,1,false);
			break;
		}
	}
	else
	{
		switch(time_left)
		{
			case 480:
			case 420:
			case 360:
			case 300:
				play_sound(sfx_timer1,1,false);
			break;
			case 240:
			case 180:
			case 120:
			case 60:
				play_sound(sfx_timer2,1,false);
			break;
		}
	}
	time_left -= 1;
	

	
	// end of spell
	if (life_left <= 0) or (time_left <= 0)
	{
		if(time_left == 0)
		{
			is_capturing = false;
			item_nbr = 0;
			if(is_spell)
			{
				play_sound(sfx_timeout,1,false);
			}
		}
		
		if(is_spell)
		{
			global.spell_life = 1;
			with(obj_boss_info)
			{
				spell_nbr -= 1;
			}
			
			repeat(item_nbr)
			{
				create_item(ITEM_POINT,x - item_dist + rng(item_dist * 2 ,true,2),y - item_dist + rng(item_dist * 2,true,2));
			}
			
			create_confetti(obj_boss.x,obj_boss.y,30,8);
		}
		
		if (is_capturing)
		{
			play_sound(sfx_spell_capture,1,false);
			add_score(bonus);
			
			var key = get_difficulty_key(0);
			data_write(global.spell_file,data_name,key,cap_history + 1);
			
			var inst = instance_create_depth(room_width / 2,150,0,obj_get_spell);
			inst.bonus = bonus;
		}

		screen_clear(true,true);
		
		repeat(2)//carefull
		{
			audio_play_sound(sfx_shot1,1,false);
		}
	
		event_next();
		instance_destroy();
	}
	

	if (spell_wait == 0)
	{
		//curstom
		if (old_state != state)
		{
			old_state = state;
			state_time = 0;
		}
		else
		{
			state_time += 1;
		}
		
		
		step += 1;
		
		bonus -= floor(bonus_max / 5000);
		bonus -= bonus % 10;
	}
	
	if (spell_wait > 0)
	{
		spell_wait -= 1;
	}
	

}
