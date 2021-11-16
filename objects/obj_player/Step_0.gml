/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	var ev = get_current_event();
	var par = object_get_parent(ev);
	in_dialogue = (par == obj_dialogue);

	
	if (old_state != state)
	{
		old_state = state;
		state_time = 0;
	}
	else
	{
		state_time += 1;
	}

	//NOT THE BEST PLACE
	var hit_nbr = 0;
	var p = self;
	with(obj_danmaku)
	{
		var hitb = false;
		sprite_index = spr_nothing;
		var dist = sqrt(sqr(p.x - x) + sqr(p.y - y));
		
		if(p.bomb_time == 0)
		{
			if ((hit_nbr < 50) and (dist < 80)) 
			{
				hitb = true;
			}
		}
		else
		{
			if(is_cancelable)
			{
				hitb = true;
			}
		}
		
		if(hitb)
		{
			sprite_index = spr_danmaku_hitbox;
			image_index = danmaku_id;
			hit_nbr += 1;
		}
	}
	///
	
	switch(state)
	{
		case 0: // active
			focused = global.focused_down;
			if (focused)
			{
				spd = focus_spd;
			}
			else
			{
				spd = unfocus_spd;
			}
			
			if(player_id == P_MARISA) and (bomb_time > 60)
			{
				spd = ms_spd;
				in_dialogue = true;// so she stops shooting
			}
			//Movement
			x_dir = (global.right_down - global.left_down) * spd;
			y_dir = (global.down_down - global.up_down) * spd;
			
			
			if (abs(x_dir) and abs(y_dir)) // relative speed
			{
				x_dir *= sqrt(2)/ 2;
				y_dir *= sqrt(2)/ 2;
			}
			hsp = x_dir;
			vsp = y_dir;
			
			//ANIMATION
			//left and right
			if (abs(x_dir) > 0)
			{
				dir = goto_value(dir,dir_max * sign(x_dir),dir_spd);
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
			else if (dir < 0)
			{
				sprite_index = left_spr;
				image_index = abs(dir);
			}
			else if (dir > 0)
			{
				sprite_index = right_spr;
				image_index = dir;
			}
	
			if(global.invincible)
			{
				invincibility = 2;
			}
			
		
			if(!in_dialogue)
			{
				// SHOOTING
				if (global.shot_pressed)
				{
					shot_time = 0;
				}
			
				if (global.shot_down)
				{
					shot_time += 1;
					if (shot_time % shot_wait > 0)
					{
						var off = (shot_time % shot_wait) * base_shot_spd / 2;
					
						for (var i = -1; i < 2; i += 2)
						{
							var inst = instance_create_depth(x + base_shot_x_offset * i ,y - base_shot_y_offset + off,0,obj_shot_base);
							inst.alpha = 0.75 + (sin(shot_time/8) * 0.25)
							play_sound(sfx_shooting,1,false)
						}
					}
				}
			}
			
			//invincibility
			if (invincibility) 
			{
				alpha = 0.7 + (cos(state_time / 5)) * 0.25
				
				invincibility -= 1;
			}
			else
			{
				alpha = 1;
			}
			
			if (bomb_time == 0) and (!in_dialogue)
			{
				//Checking for hitboxes
				var plr = self;
				with(obj_player_hurtbox)
				{
					var meet = instance_place(x,y,parent_hitbox)//danmaku is child of hitbox
					if(meet != noone)
					{
						if(plr.invincibility == 0)
						{
							plr.state = 1;
						}
						
						if(meet.is_danmaku) and (meet.is_cancelable)
						{
							cancel_bullet(meet);
						}
					}
				}
			}
			
			
			
			
		
			//item
			while(place_meeting(x,y,obj_item_auto))
			{
				var meet = instance_place(x,y,obj_item_auto);
				instance_destroy(meet,true);
			}
			
			if(y < global.poc)
			{
				with(obj_item)
				{
					auto_collect = true;
				}
				with(obj_item_auto)
				{
					max_value = true;
				}
			}
			
		break;
		case 1: // border of life and death
			hsp = 0;
			vsp = 0;
			switch(state_time)
			{
				case 0:
					play_sound(sfx_death,1,false);
					create_confetti(x,y,20,7);
					create_confetti(x,y,20,5);
					create_confetti(x,y,20,3);
					boss_release(x,y,noone);
				break;
				case deathbomb_time:
					state = 2;
				break;
			}
			invincibility = deathbomb_time - state_time;
			
			with(obj_item_auto)
			{
				auto_collect = false;
			}
		break;
		case 2://fucking dead
			var death_spd = 0.05;
			scale = goto_value(scale,2,death_spd);
			alpha = goto_value(alpha,0,death_spd)
			
			switch(state_time)
			{
				case 0:
					with(obj_spell)
					{
						is_capturing = false;	
					}
				break;
				case 59:
					if(global.life > 0)
					{
						global.life -= 1;
					}
				break;
				case 60:
					alpha = 1;
					scale = 1;
				
					x = x_origin;
					y = y_origin;
				
					state = 0;
				
					screen_clean(false,false);
					create_shot_hitbox(0,0,1,spr_fullscreen_collision,2,10,false);
				
					invincibility = invincibility_death;
				
					with(obj_item_auto)
					{
						auto_collect = false;
					}
					
					global.bomb = 2;
				break;
			}
		break;
	}

	
	if(bomb_time == 0) 
	{
		if(global.bomb_pressed) and (state != 2) and (!in_dialogue) and (global.bomb > 0)
		{
			global.bomb -= 1;
			
			instance_create_depth(0,0,0,obj_bomb);
			state = 0;
			with(obj_spell)
			{
				is_capturing = false;
			}
		}
		
	}
	else
	{
		with(obj_item)
		{
			auto_collect = true;
		}
		
		invincibility = bomb_time;
		bomb_time -= 1;
		
		if(bomb_time == 0)
		{
			with(obj_danmaku)
			{
				if(!is_spawning)
				{
					image_xscale = visual_xscale;
					image_yscale = visual_yscale;
				}
			}
		}
		else
		{
			with(obj_danmaku)
			{
				if(!is_spawning)
				{
					image_xscale = 1;
					image_yscale = 1;
				}
			}
		}
	}
	
	
	// Moving
	while(place_meeting(x + hsp,y,obj_wall) and abs(hsp) > 0 )
	{
		hsp = hsp - sign(hsp) * 0.1;
	}
	x += hsp;
	
	while(place_meeting(x,y + vsp,obj_wall) and abs(vsp) > 0 )
	{
		vsp = vsp - sign(vsp) * 0.1;
	}
	y += vsp;
	
	var me = self;
	with(obj_player_hurtbox)
	{
		x = me.x;
		y = me.y;
	}
	
	//Visual
	if (focused)
	{
		hitbox_alpha += recursiv(hitbox_alpha,1,hitbox_spd,0.1)
		hitbox_scale += recursiv(hitbox_scale,1,hitbox_spd,0.1)
		hitbox_x = x;
		hitbox_y = y;
		
		focus_alpha += recursiv(focus_alpha, focus_alpha_max,focus_alpha_spd,0.05)
		focus_scale += recursiv(focus_scale,1,focus_scale_spd,0.1)
	}
	else
	{
		hitbox_alpha += recursiv(hitbox_alpha,0,hitbox_spd,0.1)
		hitbox_scale += recursiv(hitbox_scale,hitbox_scale_ref,hitbox_spd,0.1)
		
		focus_alpha += recursiv(focus_alpha, 0,focus_alpha_spd,0.05)
		focus_scale += recursiv(focus_scale,focus_scale_max,focus_scale_spd,0.1)
	}
	hitbox_rot += hitbox_rot_spd;
	focus_angle += focus_angle_spd;
}