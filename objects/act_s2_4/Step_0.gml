/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	
	switch(global.difficulty)
	{
		case 0:
			var aim_spd_shoot = 5;
			var aim_spd_final = 2.5;
			var aim_wait = 45;
			
			var tri_spd = 1.5;
			var tri_dist = 2;
			var tri_div = 20;
		break;
		case 1:
			var aim_spd_shoot = 6;
			var aim_spd_final = 2.5;
			var aim_wait = 22;

			
			var tri_spd = 2;
			var tri_dist = 2;
			var tri_div = 6;
		break;
		case 2:
			var aim_spd_shoot = 7;
			var aim_spd_final = 3
			var aim_wait = 16;

			
			var tri_spd = 2;
			var tri_dist = 2;
			var tri_div = 4;
		break;
		case 3:
			var aim_spd_shoot = 8;
			var aim_spd_final = 3.5;
			var aim_wait = 10;
			
			var tri_spd = 2;
			var tri_dist = 2;
			var tri_div = 3;
		break;
	}
	
	var fairy_lenght = 570;
	var fairy_wait = 25;
	var fairy_y_off = 20
	var fairy_life = 8;
	
	var fairy_wait_big = 100;
	var big_life = 80;
	
	
	if(step < fairy_lenght)
	{
		
		if(step % fairy_wait == 0)
		{
			var inst = create_enemy(EN_BLUE,-20,fairy_y_off + rng(100,false,3),fairy_life,5,3,-20)
			inst.item_nbr = 1;
			var inst = create_enemy(EN_BLUE,room_width + 20,fairy_y_off + rng(100,false,3),fairy_life,5,3,200)
			inst.item_nbr = 1;
		}
		
		if(step % fairy_wait_big == 0)
		{
			var inst = create_enemy(EN_GREEN,big_list[step/fairy_wait_big],-20,big_life,4,4,-90);
		}
	
	}
	
	//small
	with(obj_enemy5)
	{
		angle = goto_value(angle,90,0.4);
		
		if(step % aim_wait == aim_wait - 1)
		{
			shoot(DAN_BALL,1,x,y,999,aim_spd_shoot,sfx_shot3,3);
		}
		
	}
	
	with(obj_danmaku3)
	{
		spd = goto_value(spd,aim_spd_final,0.2);		
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

