/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var bird_wait = 5;
			var bird_accel = 0.05;
			var bird_spd_min = 1.8;
			var bird_spd_git = 0.2;
			var bird_angle = 80;
			var bird_open = 5;
			
			var wave_lenght = 240;
			var wave_wait = 320;
			
			var arc_wait = 60;
			var arc_nbr = 4;
			var arc_dist = 17;
			var arc_spd = 1.6;
			var arc_spd_div = 1;
			var arc_aim_open = 20;
			
			var bird_off = 80;
		break;
		case 1:
			var bird_wait = 3;
			var bird_accel = 0.05;
			var bird_spd_min = 2;
			var bird_spd_git = 0.25;
			var bird_angle = 80;
			var bird_open = 6;
			
			var wave_lenght = 240;
			var wave_wait = 320;
			
			var arc_wait = 46;
			var arc_nbr = 6;
			var arc_dist = 14;
			var arc_spd = 1.6;
			var arc_spd_div = 1;
			var arc_aim_open = 20;
			
			var bird_off = 58;
		break;
		case 2:
			var bird_wait = 2
			var bird_accel = 0.05;
			var bird_spd_min = 2.2;
			var bird_spd_git = 0.4;
			var bird_angle = 80;
			var bird_open = 6;
			
			var wave_lenght = 240;
			var wave_wait = 320;
			
			var arc_wait = 42;
			var arc_nbr = 8;
			var arc_dist = 12;
			var arc_spd = 1.6;
			var arc_spd_div = 1;
			var arc_aim_open = 20;
			
			var bird_off = 55;
		break;
		case 3:
			var bird_wait = 1;
			var bird_accel = 0.05;
			var bird_spd_min = 2.3;
			var bird_spd_git = 0.4;
			var bird_angle = 80;
			var bird_open = 6;
			
			var wave_lenght = 240;
			var wave_wait = 320;
			
			var arc_wait = 40;
			var arc_nbr = 10;
			var arc_dist = 10;
			var arc_spd = 1.6;
			var arc_spd_div = 1;
			var arc_aim_open = 20;
			
			var bird_off = 150;
		break;
	}
	
	
	
	
	switch(state)
	{
		case 0:
			act_dir *= -1;
			wave_time = wave_lenght;
			state = 1;
		break;
		case 1:
			if(state_time < wave_wait)
			{
				if(state_time > 30) and (state_time < wave_wait - 100)
				{
					
					if(state_time % arc_wait == 0)
					{
						var ang = find_angle(obj_boss.x,obj_boss.y,200 - 200 * act_dir,165) + arc_aim_open - rng(arc_aim_open * 2,false,3);
						shoot_arc(DAN_BUBBLE,1,arc_nbr,obj_boss.x,obj_boss.y,ang,arc_dist,arc_spd,sfx_redirect1,7);
					}
				}
			}
			else
			{
				state = 0;
				boss_movement_random(3,5,2);
			}
		break;
	}
	
	
	if(wave_time > 0 )
	{
		var need_dove = false;
		
		if(step % bird_wait == 0)
		{
			need_dove = true;
		}
		
		if(need_dove)
		{
			var ang = -90 + bird_angle * act_dir - bird_open + rng(bird_open * 2,false,2);
			var inst = shoot(DAN_BIRD,6,200 - 220 * act_dir,rng(room_height + bird_off,false,6) - bird_off,ang,0,noone,4);
			inst.spd_to = bird_spd_min + rng(bird_spd_git,false,9);	
		}
		
		wave_time -= 1;
	}
	
	//birb
	with(obj_danmaku4)
	{
		spd = goto_value(spd,spd_to,bird_accel);
	}
	
	//bubble
	with(obj_danmaku7)
	{
		switch(state)
		{
			case 0:
				var sq = 5;
				var found_wall = false;
				if (y < 480)
				{
					if(collision_rectangle(x - sq + hsp,y - sq ,x + sq + hsp,y + sq,obj_wall,false,true))
					{
						found_wall = true;
						angle = -angle + 180;
					}
				
					if (collision_rectangle(x - sq,y - sq + vsp,x + sq,y + sq + vsp,obj_wall,false,true))
					{
						found_wall = true;
						angle *= -1;
					}
				}
				
				if(found_wall)
				{
					state = 1;
					spd /= arc_spd_div;
				}
			break;
		}
	}
}

// Inherit the parent event
event_inherited();

