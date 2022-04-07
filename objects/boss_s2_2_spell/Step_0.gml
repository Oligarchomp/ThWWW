/// @description Insert description here
// You can write your code in this editor

if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var wait_move = 136;
			
			var crab_start = 150;
		
			var knife_row_dist = 100;
			var knife_row_spd = 1;
			var knife_row_wait = 100;
			
			var crab_lenght = 90;
			var crab_wait = 50;
			var crab_spd = 3;
			
			var crab_step_wait = 210;
			
			var crab_step_max = 1000;
			
			var vertical = false;
			var final_wave = false;
		break;
		case 1:
			var wait_move = 136;
			
			var crab_start = 150;
		
			var knife_row_dist = 90;
			var knife_row_spd = 1.4;
			var knife_row_wait = 56;
			
			var crab_lenght = 115;
			var crab_wait = 40;
			var crab_spd = 5;
			
			var crab_step_wait = 135;
			
			var crab_step_max = 1000;
			
			var vertical = false;
			var final_wave = false;
		break;
		case 2:
			var wait_move = 136;
			
			var crab_start = 150;
		
			var knife_row_dist = 70;
			var knife_row_spd = 1.8;
			var knife_row_wait = 40;
			
			var crab_lenght = 90;
			var crab_wait = 40;
			var crab_spd = 6;
			
			var crab_step_wait = 80;
			
			var crab_step_max = 3;
			
			var vertical = true;
			var final_wave = false;
		break;
		case 3:
			var wait_move = 136;
			
			var crab_start = 150;
		
			var knife_row_dist = 50;
			var knife_row_spd = 2;
			var knife_row_wait = 30;
			
			var crab_lenght = 120;
			var crab_wait = 40;
			var crab_spd = 6;
			
			var crab_step_wait = 70;
			
			var crab_step_max = 3;
			
			var vertical = true;
			var final_wave = true;
		break;
	}
	
	if(step % wait_move == wait_move - 1)
	{
		boss_movement_random(3,7,0);
		
	}
	
	if (step > crab_start)
	{
		switch(state)
		{
			case 0:
				switch(state_time)
				{
					case 0:
						var y_pos = floor(obj_player.y / knife_row_dist) * knife_row_dist 
						
						var inst = instance_create_depth(room_width,y_pos + knife_row_dist,global.boss_depth,obj_crabcharge);
						inst.angle = 180;
						inst.yscale = knife_row_dist;
						
						play_sound(sfx_boss_charge,1,false);
					
						array_push(x_crab, room_width + 30);
						array_push(y_crab,y_pos);
						array_push(time_crab, crab_lenght)
						crab_step += 1;
					break;
					case crab_step_wait:
						if(crab_step == crab_step_max)
						{
							state = 2;
							crab_step = 0;
						}
						else
						{
							state = 1;
						}
					break;
				}
			break;
			case 1:
				switch(state_time)
				{
					case 0:
						var y_pos = floor(obj_player.y / knife_row_dist) * knife_row_dist 
						
						var inst = instance_create_depth(0,y_pos,global.boss_depth,obj_crabcharge);
						inst.angle = 0;
						inst.yscale = knife_row_dist;
						
						play_sound(sfx_boss_charge,1,false);
					
						array_push(x_crab, - 30);
						array_push(y_crab,y_pos);
						array_push(time_crab, crab_lenght)
						crab_step += 1;
					
					break;
					case crab_step_wait:
						if(crab_step == crab_step_max)
						{
							state = 2;
							crab_step = 0;
						}
						else
						{
							state = 0;
						}
					break;
				}
			break;
			case 2:
				switch(state_time)
				{
					case 0:
						var x_pos = floor(obj_player.x / knife_row_dist) * knife_row_dist 
			
						var inst = instance_create_depth(x_pos + knife_row_dist,0,global.boss_depth,obj_crabcharge);
						inst.angle = -90;
						inst.yscale = knife_row_dist;
						
						play_sound(sfx_boss_charge,1,false);
					
						array_push(x_crab, x_pos);
						array_push(y_crab,-30);
						array_push(time_crab, crab_lenght)
						crab_step += 1;
					break;
					case crab_step_wait:
						if(crab_step == crab_step_max)
						{
							if(final_wave)
							{
								state = 4;
							}
							else
							{
								state = 0;
							}
							crab_step = 0;
						}
						else
						{
							state = 3;
						}
					break;
				}
			break;
			case 3:
				state = 2;
			break;
			case 4:
				switch(state_time)
				{
					case 20:
						var y_pos = floor(obj_player.y / knife_row_dist) * knife_row_dist 
					
						var inst = instance_create_depth(room_width,y_pos + knife_row_dist,global.boss_depth,obj_crabcharge);
						inst.angle = 180;
						inst.yscale = knife_row_dist;
						
						play_sound(sfx_boss_charge,1,false);
					
						array_push(x_crab, room_width + 30);
						array_push(y_crab,y_pos);
						array_push(time_crab, crab_lenght)
					break;
					case 30:
						var x_pos = floor(obj_player.x / knife_row_dist) * knife_row_dist 
						
						var inst = instance_create_depth(x_pos + knife_row_dist,0,global.boss_depth,obj_crabcharge);
						inst.angle = -90;
						inst.yscale = knife_row_dist;
						
						play_sound(sfx_boss_charge,1,false);
					
						array_push(x_crab, x_pos);
						array_push(y_crab,-30);
						array_push(time_crab, crab_lenght)
						break;
					case 40:
						var y_pos = floor(obj_player.y / knife_row_dist) * knife_row_dist 
						
						var inst = instance_create_depth(0,y_pos,global.boss_depth,obj_crabcharge);
						inst.angle = 0;
						inst.yscale = knife_row_dist;
						
						play_sound(sfx_boss_charge,1,false);
					
						array_push(x_crab, - 30);
						array_push(y_crab,y_pos);
						array_push(time_crab, crab_lenght)
					break;
					case 160:
						state = 0;
					break;
				}
			break;
		}
	}
	else
	{
		state_time = -1;
	}
	
	for(var i = 0 ; i < array_length(x_crab); i += 1)
	{
		if(time_crab[i] > 0)
		{
			
			time_crab[i] -= 1;
			
			if(time_crab[i] < crab_lenght - crab_wait)
			{
				if(y_crab[i] < 0)
				{
					shoot(DAN_KNIFE,5,x_crab[i] + rng(knife_row_dist,false,3),y_crab[i],-90,crab_spd + rng(5,false,1),sfx_redirect1,4);
				}
				else if (x_crab[i] < 0)
				{
					shoot(DAN_KNIFE,5,x_crab[i],y_crab[i] + rng(knife_row_dist,false,3),0,crab_spd + rng(5,false,1),sfx_redirect1,4);
				}
				else if (x_crab[i] > room_width)
				{
					shoot(DAN_KNIFE,5,x_crab[i],y_crab[i] + rng(knife_row_dist,false,3),180,crab_spd + rng(5,false,1),sfx_redirect1,4);
				}
			}
		}
		else
		{
			array_delete(time_crab,i,1)
			array_delete(x_crab,i,1)
			array_delete(y_crab,i,1)
		}
		
	}
	
	
	
	
	//rows
	if(step % knife_row_wait == 0)
	{
		var i_plus = knife_row_dist;
		for(var i = 0; i <= room_height; i += i_plus )
		{
			if((i / i_plus) % 2 == 0)
			{
				var x_pos = room_width + 20;
				var ang = 180;
			}
			else
			{
				var x_pos = -20;
				var ang = 0;
			}
			shoot(DAN_KNIFE,6,x_pos,i,ang,knife_row_spd,sfx_shot3,3);
			
			if(vertical)
			{
				shoot(DAN_KNIFE,6,i,-20,-90,knife_row_spd,sfx_shot3,3);
			}
		}
	}
	
}





// Inherit the parent event
event_inherited();
