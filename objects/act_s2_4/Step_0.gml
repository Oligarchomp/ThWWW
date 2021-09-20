/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			//actually isn't aimed
			var aim_spd = 2;

			var aim_ring = 5;
			
			var tri_spd = 1.5;
			var tri_dist = 2;
			var tri_div = 20;
		break;
		case 1:
			//actually isn't aimed
			var aim_spd = 2.3;

			var aim_ring = 13;
			
			var tri_spd = 2;
			var tri_dist = 2;
			var tri_div = 6;
		break;
		case 2:
			//actually isn't aimed
			var aim_spd = 2.5;

			var aim_ring = 23;
			
			var tri_spd = 2;
			var tri_dist = 2;
			var tri_div = 4;
		break;
		case 3:
			//actually isn't aimed
			var aim_spd = 2.5;
			
			var aim_ring = 26;
			
			var tri_spd = 2;
			var tri_dist = 2;
			var tri_div = 3;
		break;
	}
	
	var fairy_lenght = 500;
	var fairy_wait = 25;
	var fairy_y_off = 20
	var fairy_life = 14;
	
	var fairy_wait_big = 100;
	var big_life = 80;
	
	
	if(step < fairy_lenght)
	{
		if(step % fairy_wait == 0)
		{
			var inst = create_enemy(EN_BLUE,-20,fairy_y_off + rng(100,false,3),fairy_life,5)
			inst.angle = 0;
			inst.spd = 3;
			
			var inst = create_enemy(EN_BLUE,room_width + 20,fairy_y_off + rng(100,false,3),fairy_life,5)
			inst.angle = 180;
			inst.spd = 3;
		}
		
		if(step % fairy_wait_big == 0)
		{
			var inst = create_enemy(EN_GREEN,big_list[|step/fairy_wait_big],-20,big_life,4)
			inst.angle = -90;
			inst.spd = 4;
		}
	
	}
	
	//small
	with(obj_enemy5)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot
					shoot_ring(DAN_ARROWHEAD,1,aim_ring,x,y,rng(360,false,4),aim_spd,sfx_shot3,3);
					state = 2;
			break;
			case 2:
				if(state_time == 30)
				{
					state = 3;
					angle = find_angle(x,y,room_width / 2, y - 50);
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	//big
	with(obj_enemy4)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					shoot_nbr = 1
					angle_shoot = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 1://shoot
				if(state_time < 40)
				{
					if(state_time % tri_div == 0)
					{
						shoot_arc(DAN_ARROWHEAD,2,shoot_nbr,x,y,angle_shoot,tri_dist,tri_spd,sfx_shot2,4);
						shoot_nbr += 1;
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 60)
				{
					state = 3;
					angle = 90;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	
}

// Inherit the parent event
event_inherited();

