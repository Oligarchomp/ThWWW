/// @description Insert description here
// You can write your code in this editor

if (global.gp_active)
{
	ds_list_clear(global.x_death_list);//need to be used right away by the act object
	ds_list_clear(global.y_death_list);
	
	
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
				case BOSS_PALE:
					instance_create_depth(0,0, global.spell_bg_depth,obj_spell_bg_pale);
				break;
				case BOSS_IKU:
					instance_create_depth(0,0, global.spell_bg_depth,obj_spell_bg_iku);
				break;
				case BOSS_YUUTO:
					instance_create_depth(0,0, global.spell_bg_depth,obj_spell_bg_yuuto);
				break;
				case BOSS_FEZA:
					instance_create_depth(0,0, global.spell_bg_depth,obj_spell_bg_feza);
				break;
				case BOSS_NUA:
					instance_create_depth(0,0, global.spell_bg_depth,obj_spell_bg_nua);
				break;
				case BOSS_REVERENCE:
					instance_create_depth(0,0, global.spell_bg_depth,obj_spell_bg_reverence);
				break;
			}
			
			with(obj_boss_info)
			{
				spell_nbr -= 1;
			}
			
			spell_initialize = true;
		}
		
		if(!is_spell)
		{
			global.spell_life = .2;
		}
		
	}
	
	
	life_uncover = goto_value(life_uncover,global.game_x_offset + life_bar_size,5);
	
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
	if(!is_timeout)
	{
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
	}
	else
	{
		life_left = (time_left * life) / time;
		with(obj_boss)
		{
			mask_index = spr_nothing;
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
		if(!is_timeout)
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
		}
		else
		{
			mask_index = spr_boss_hurtbox;
		}
		
		if(is_spell)
		{
			global.spell_life = 1;
			
			
			create_confetti(obj_boss.x,obj_boss.y,30,8);
			
		}
		
		if(need_cancel_bonus) and (time_left > 0)
		{
			//cancel bonus
			var plus = 2000;
			var total = 0;
			with(obj_danmaku)
			{
				var inst = instance_create_depth(x,y,0,obj_score);
				inst.bonus = plus;
				
				total += plus;
				plus = goto_value(plus,8000,20);
			}
			
			var inst = instance_create_depth(room_width / 2, 50,0,obj_bonus_cancel);
			inst.bonus = total;
			
			add_score(total);
		}
		
		
		repeat(item_nbr)
		{
			create_item(ITEM_POINT,obj_boss.x - item_dist + rng(item_dist * 2 ,true,2),obj_boss.y - item_dist + rng(item_dist * 2,true,2));
		}
		
		
		if (is_capturing)
		{
			play_sound(sfx_spell_capture,1,false);
			add_score(bonus);
			
			if(global.play_type == PLAY_MANUAL) and (!global.rng_patch)
			{
				var key = get_difficulty_key(0,global.difficulty);
				data_write(global.spell_file,data_name,key,cap_history + 1);
			}
			
			var inst = instance_create_depth(room_width / 2,150,0,obj_get_spell);
			inst.bonus = bonus;
		}
		else
		{
			if(is_spell)
			{
				instance_create_depth(room_width / 2,150,0,obj_bonus_failed);
			}
		}
		
		
		screen_clear(time_left > 0,true);
		
		repeat(2)//carefull
		{
			audio_play_sound_on(global.sfx_emitter,sfx_shot1,false,1);
		}
	
		event_next();
		instance_destroy();
	}
	

	if (spell_wait == 0)
	{
		if(is_spell)
		{
			with(parent_bg)
			{
				instance_deactivate_object(self);
			}
		}
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
		if(!is_timeout)
		{
			bonus -= floor(bonus_max / (time / 60 * 95))// floor(bonus_max / 5000);//
			bonus -= bonus % 10;
		}
	}
	else
	{
		spell_wait -= 1;
	}
	

}
