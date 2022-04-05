/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var ring_wait = 80;
			var ring_nbr = 12;
			var ring_spd_shoot = 8;
			var ring_start = 20;
			var ring_spd_final = 1.5;
			var rice_around = 10;
		break;
		case 1:
			var ring_wait = 59;
			var ring_nbr = 16;
			var ring_spd_shoot = 8;
			var ring_start = 20;
			var ring_spd_final = 2;
			var rice_around = 10;
		break;
		case 2:
			var ring_wait = 59;
			var ring_nbr = 22;
			var ring_spd_shoot = 8;
			var ring_start = 20;
			var ring_spd_final = 2.3;
			var rice_around = 10;
		break;
		case 3:
			var ring_wait = 59;
			var ring_nbr = 28;
			var ring_spd_shoot = 8;
			var ring_start = 20;
			var ring_spd_final = 2;
			var rice_around = 10;
		break;
	}
	
	var familiar_life = 25;
	var familiar_lenght = 180;
	var familiar_wait = 38;
	var active_lenght = time_active - 230;
	var x_min = 50;
	var x_git = 300;
	var y_min = 50;
	var y_git = 180;
	
	if(!instance_exists(obj_boss))
	{
		if(wait_time > 0)
		{
			wait_time -= 1;	
		}
	}
	if(wait_time == 0)
	{
		if(step < active_lenght)
		{
			if(step % familiar_wait == 0)
			{
				var x_pos = x_min + rng(x_git,false,6);
				var y_pos = y_min + rng(y_git,false,6);
				
				instance_create_depth(x_pos,y_pos,global.boss_depth,obj_familiar_spawn);
			}
		}
		
		with(obj_familiar_spawn)
		{
			if(ready_spawn)
			{
				play_sound(sfx_familiar_spawn,1,false);
				create_enemy(EN_FAMILIAR,x,y,familiar_life,3,0,0);
				
				instance_destroy();
			}
		}
		
	
		with(obj_enemy3)
		{
			if(step == familiar_lenght)
			{
				state = 2;	
			}
			switch(state)
			{
				case 0:
					if(state_time == 30)
					{
						state = 1;
					}
				break;
				case 1:
					if(state_time % ring_wait == 0)
					{
						var aim = rng(360,false,8);
						shoot_ring(DAN_RICE,1,ring_nbr,x,y,aim,ring_spd_shoot,sfx_shot1,5);
						shoot_ring(DAN_RICE,7,floor(ring_nbr / 2),x,y,rng(360,false,8),ring_spd_shoot,sfx_shot1,4);
					}
				break;
				case 2:
					if(state_time == 30)
					{
						life = 0;
						item_nbr = 0;
					}
				break;
			}
		}
		with(obj_danmaku5)
		{
			spd = goto_value(spd,ring_spd_final,0.2);	
		}
	
		with(obj_danmaku4)
		{
			switch(state)
			{
				case 0:
					spd = goto_value(spd,0,0.2);
					if(spd == 0)
					{
						state = 1;
					}
				break;
				case 1:
				if(state_time = ring_start)
				{
					state = 2;
					var x_pos = obj_player.x - rice_around + rng(rice_around * 2,false,7);
					var y_pos = obj_player.y - rice_around + rng(rice_around * 2,false,1);
					angle = find_angle(x,y,x_pos,y_pos);
					spd = ring_spd_final;
				}
			}
		}
	}
	
}
	
// Inherit the parent event
event_inherited();

