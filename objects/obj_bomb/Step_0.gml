/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	if (old_state != state)
	{
		old_state = state;
		state_time = 0;
	}
	else
	{
		state_time += 1;
	}
	
	
	//ART
	art_y += art_spd;

	if (step < 60)
	{
		if (art_alpha < art_alpha_max)
		{
			art_alpha += 0.02;
		}
	}
	else
	{
		art_alpha = goto_value(art_alpha,0,0.02)
	}
	//text
	if(step < 90)
	{
		text_x += recursiv(text_x,text_x_final,text_sliding_spd,0.01);
	}
	else
	{
		text_y += recursiv(text_y,550,text_sliding_spd,0.01);
	}
	
	switch(player_id)
	{
		case P_REIMU:
			switch(state)
			{
				case 0:
					if(state_time == 30)
					{
						state = 1;
					}
				break;
				case 1:
					if (state_time < 120)
					{
						if(state_time % 15 == 0)
						{
							play_sound(sfx_fantasy,1,false);
							instance_create_depth(obj_player.x,obj_player.y,global.player_shot_depth + 1,obj_fantasy);
						}
					}
					else
					{
						instance_destroy();
					}
				break;
		
			}
		break;
		case P_MARISA:
			screen_shake(5 + rng(5,true,1),5 + rng(5,true,2));
			open = open_ref + cos(step/6) * 8;
			repeat(9)
			{
				var inst = instance_create_depth(obj_player.x,obj_player.y - y_shoot_off,global.player_shot_depth + 1,obj_masterspark);
				inst.angle = 90 - open + rng(open * 2,false,4);
			}
			
			create_shot_hitbox(obj_player.x,obj_player.y ,1,spr_bomb_masterspark_collision,1.4,2,true);
		break;
		case P_SANAE:
			var wait = 6;
			
			if(iso_offset_y <= room_height)
			{
				if (step % wait == 0)
				{
					var inst = instance_create_depth(iso_offset_x,-10,global.player_shot_depth - 1,obj_isoterica);
					inst.image_angle = -90;
					iso_offset_x += room_width / iso_nbr;
				}
				
				if(step % wait == wait / 2)
				{
					var inst = instance_create_depth(-10,iso_offset_y,global.player_shot_depth - 1,obj_isoterica);
					inst.image_angle = 0;
					iso_offset_y += room_height / iso_nbr;
				}
			}
			else
			{
				switch(activation_wait)
				{
					case activation_wait_ref:
						play_sound(sfx_liberate,1,false);
					break;
					case 0:
						if(activation_wait == 0)
						{
							with(obj_isoterica)
							{
								activated = true;
							}
							screen_shake(17,0);
							play_sound(sfx_mofbomb,1,false);
							instance_destroy();
						}
					break;
				}
				
				activation_wait -= 1;
			}
		break;
	}
	
	if(step == time)
	{
		instance_destroy(self);
	}
	
	
	step += 1;
}