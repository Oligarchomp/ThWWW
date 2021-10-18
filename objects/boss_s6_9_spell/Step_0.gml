/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	var anchor_nbr = 0;
	switch(global.difficulty)
	{
		case 0:
			var bullet_wait = 15;
			var bullet_ring = 15;
			var bullet_spd_shot = 5;
			var bullet_spd_final = 3;
			var bullet_accel = 0.06;
			var bullet_lenght = 40;
			var bullet_wave = 130;
			var bullet_angle_max = 70;
			var bullet_angle_plus = 3;
					
			var bubble_wait = bullet_wave;
			var bubble_nbr = 12;
			var bubble_spd_shoot = 5.8;
			var bubble_spd_final = 2.2;
			var bubble_angle_max = 0;
			var bubble_angle_plus = 2.5;
					
			var mentos_nbr = 14;
			var mentos_spd = 1.8;
			var mentos_wait = 56;
			
			var anchor_nbr = 6;
			var anchor_spd_max = 10;
			var anchor_accel = 0.05;
			var anchor_wait = 150;
		break;
		case 1:
			var bullet_wait = 15;
			var bullet_ring = 17;
			var bullet_spd_shot = 6.3;
			var bullet_spd_final = 3;
			var bullet_accel = 0.06;
			var bullet_lenght = 40;
			var bullet_wave = 120;
			var bullet_angle_max = 100;
			var bullet_angle_plus = 3;
					
			var bubble_wait = bullet_wave;
			var bubble_nbr = 17;
			var bubble_spd_shoot = 5.8;
			var bubble_spd_final = 2.5;
			var bubble_angle_max = 0;
			var bubble_angle_plus = 2.5;
					
			var mentos_nbr = 17;
			var mentos_spd = 2;
			var mentos_wait = 46;
			
			var anchor_nbr = 8;
			var anchor_spd_max = 10;
			var anchor_accel = 0.05;
			var anchor_wait = 130;
		break;
		case 2:
			var bullet_wait = 15;
			var bullet_ring = 19;
			var bullet_spd_shot = 6.5;
			var bullet_spd_final = 3.1;
			var bullet_accel = 0.06;
			var bullet_lenght = 40;
			var bullet_wave = 108;
			var bullet_angle_max = 100;
			var bullet_angle_plus = 3;
					
			var bubble_wait = bullet_wave;
			var bubble_nbr = 20;
			var bubble_spd_shoot = 5.8;
			var bubble_spd_final = 2.5;
			var bubble_angle_max = 0;
			var bubble_angle_plus = 2.5;
					
			var mentos_nbr = 20;
			var mentos_spd = 2;
			var mentos_wait = 42;
			
			var anchor_nbr = 10;
			var anchor_spd_max = 10;
			var anchor_accel = 0.06;
			var anchor_wait = 115;
		break;
		case 3: 
			var bullet_wait = 15;
			var bullet_ring = 22;
			var bullet_spd_shot = 6.5;
			var bullet_spd_final = 3.1;
			var bullet_accel = 0.06;
			var bullet_lenght = 40;
			var bullet_wave = 95;
			var bullet_angle_max = 100;
			var bullet_angle_plus = 3;
					
			var bubble_wait = bullet_wave;
			var bubble_nbr = 24;
			var bubble_spd_shoot = 5.8;
			var bubble_spd_final = 2.5;
			var bubble_angle_max = 0;
			var bubble_angle_plus = 2.5;
					
			var mentos_nbr = 25; 
			var mentos_spd = 2;
			var mentos_wait = 36;
			
			var anchor_nbr = 13;
			var anchor_spd_max = 10;
			var anchor_accel = 0.07;
			var anchor_wait = 100;
		break;
	}
	
	if(phase == 4)//timeout
	{	
		anchor_wait = round(anchor_wait / 2)
	}
	
	
	switch(state)
	{
		case 3:
		//anchor
			if(step % anchor_wait == 0)
			{
				var aim = find_angle(obj_boss.x,obj_boss.x,obj_player.x,obj_player.y);
				for(var i = 0; i < 360 ; i += 360 / anchor_nbr)
				{
					var inst = shoot(DAN_ANCHOR,1,obj_boss.x,obj_boss.y,aim + i,0,sfx_spawn_light,1);
					inst.spawn_type = SPAWN_SCALE;
					inst.is_cancelable = false;
				}
			}
		//NO BREAK
		case 2:
		
			//mentos
			if(step % mentos_wait == 0)
			{
				var aim = rng(360,false,4);
				for(var i = 0; i < 360; i += 360 / mentos_nbr)
				{
					var inst = shoot(DAN_MENTOS,7,obj_boss.x,obj_boss.y,aim + i,mentos_spd,sfx_shot1,4);
					inst.is_cancelable = false;
				}
				
			//	mentos_aim += 180 / mentos_nbr;
			}
		//NO BREAK
		case 1:
			//bubble
			if(step % bubble_wait == floor(bubble_wait / 2))
			{
				var aim = rng(360,false,1);
				for(var i = 0; i < 360; i += 360 / bubble_nbr)
				{
					var inst = shoot(DAN_BUBBLE,1,obj_boss.x,obj_boss.y,aim  + i,bubble_spd_shoot,sfx_redirect1,5);
					inst.angle_to = inst.angle + bubble_angle_max * bubble_dir;
					inst.is_cancelable = false;
				}
				bubble_dir *= -1;
			}
		//NO BREAK
		case 0:
			//Bullet
			if(step % bullet_wave == 0)
			{
				bullet_time = bullet_lenght;
				bullet_aim += 180 / bullet_ring;//rng(360,false,4);
			}
	
			if(bullet_time > 0)
			{
				if((bullet_lenght - bullet_time) % bullet_wait == 0)
				{
					for(var i = 0; i < 360; i += 360 / bullet_ring)
					{
						var inst = shoot(DAN_HEART,1,obj_boss.x,obj_boss.y,bullet_aim + i,bullet_spd_shot,sfx_shot2,3);
						inst.angle_to = inst.angle + bullet_angle_max;
						inst.is_cancelable = false;
						var inst = shoot(DAN_HEART,1,obj_boss.x,obj_boss.y,bullet_aim + i,bullet_spd_shot,sfx_shot2,3);
						inst.angle_to = inst.angle - bullet_angle_max;
						inst.is_cancelable = false;
					}	
				}
		
				bullet_time -= 1;
			}
		break;
	}
	
	
	//bullet
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,bullet_spd_final,bullet_accel);
				angle = goto_value(angle,angle_to,bullet_angle_plus);
				if(state_time == 80)
				{
					state = 1;
				}
			break;
		}
	}
	//bubble
	with(obj_danmaku5)
	{
		angle = goto_value(angle,angle_to,bubble_angle_plus);
		spd = goto_value(spd,bubble_spd_final,0.1);
	}
	//anchor
	with(obj_danmaku1)
	{
		spd = goto_value(spd,anchor_spd_max,anchor_accel);
	}
	
	if(keyboard_check_pressed(vk_control))
	{
		life_left -= 500;
	}
	switch(phase)
	{
		case 0:
			if(life_left < 3100)
			{
				phase = 1;
				state = 1;
			}
		break;
		case 1:
			if(life_left < 2500)
			{
				phase = 2;
				state = 2;
			}
		break;
		case 2:
			if(life_left < 1700)
			{
				phase = 3;
				state = 3;
			}
		break;
	}
	
	if(phase != 4)
	{
		if(time_left < timeout_time)
		{
			phase = 4;	
			state = 3;
			//screen_clean(false,true);
			play_sound(sfx_boat,1,false);
			//step = 0;
		}
	}
	
	if(obj_player.bomb_time != 0)
	{
		if(can_shield)
		{
			instance_create_depth(obj_boss.x,obj_boss.y,obj_boss.depth - 1, obj_shield_nua);
			can_shield = false;
			obj_boss.mask_index = spr_nothing;
			obj_boss.alpha = 0.4;
		}
	}
	else
	{
		obj_boss.mask_index = spr_boss_hurtbox;
		obj_boss.alpha = 1;
		can_shield = true;
		with(obj_shield_nua)
		{
			state = 1;
		}
	}
	
}

// Inherit the parent event
event_inherited();

