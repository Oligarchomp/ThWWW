/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var wait_shoot = 20;
			var shoot_nbr = 4;
			var shoot_dist = 16;
			var shoot_start = 30; //when start moving
			var shoot_spd = 2;
		break;
		case 1:
			var wait_shoot = 10;
			var shoot_nbr = 6;
			var shoot_dist = 15;
			var shoot_start = 30; //when start moving
			var shoot_spd = 2.5;
		break;
		case 2:
			var wait_shoot = 7;
			var shoot_nbr = 6;
			var shoot_dist = 14;
			var shoot_start = 30; //when start moving
			var shoot_spd = 3;
		break;
		case 3:
			var wait_shoot = 5;
			var shoot_nbr = 6;
			var shoot_dist = 9;
			var shoot_start = 30; //when start moving
			var shoot_spd = 3;
		break;
	}
	
	var fairy_spd = 5;
	var fairy_wait = 25;
	var fairy_y_off = 60;
	var fairy_y_git = 50;
	var fairy_life = 7;
	
	if(instance_exists(obj_spell))
	{
		wait_time = 90;
	}
	
	wait_time = goto_value(wait_time,0,1);
	
	if(wait_time == 0)
	{
		if(step % fairy_wait == 0) and (step < time_active)
		{
			if((step / fairy_wait) % 2 == 0)
			{
				var x_pos = -20;
			}
			else
			{
				var x_pos = room_width + 20;
			}
			var y_pos =  fairy_y_off + rng(fairy_y_git,false,7)
			var angle = find_angle(x_pos,y_pos,room_width / 2,y_pos - 20);
			create_enemy(EN_GREEN,x_pos,y_pos,fairy_life,5,fairy_spd,angle);
			
		}
		
		
		with(obj_enemy5)
		{
			if(step == 0)
			{
				angle_shoot = rng(360,false,4);
				dir_dan = (x > room_width / 2) * 2 - 1;
			}
			if (step % wait_shoot == 0)
			{
				shoot_ring(DAN_ARROWHEAD,7,shoot_nbr,x,y,angle_shoot,0,sfx_shot2,8);
				angle_shoot += shoot_dist * dir_dan;
			}
		}
		
		with(obj_danmaku8)
		{
			switch(state)
			{
				case 0:
					if(state_time > shoot_start)
					{
						state = 1;
					}
				break;
				case 1:
					spd = goto_value(spd,shoot_spd,0.1);
				break;
			}
			
		}
		
	}
	
}

// Inherit the parent event
event_inherited();

