/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			
		break;
		case 1:
			
		break;
		case 2:
			
		break;
		case 3:
			var bubble_wait = 10;
			var bubble_nbr = 10;
			var bubble_spd_shoot = 14;
			var bubble_spd_final = 3;
			var bubble_dist = 360 / bubble_nbr / 2;
			
			var aim_wait = 16;
			var aim_spd_shoot = 15;
			var aim_spd_final = 2;
			var aim_ring = 38;
		break;
	}
	
	var shoot_lenght = 150;
	var fairy_life = 90;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_GREEN,100,-20,fairy_life,1,5,-90);
			inst.dir_shoot = 1;
			inst.item_nbr = 10;
			var inst = create_enemy(EN_GREEN,300,-20,fairy_life,1,5,-90);
			inst.dir_shoot = -1;
			inst.item_nbr = 10;
		break;
		case stagecard_time:
			instance_create_depth(0,0,0,obj_stagecard);
		break;
	}
	
	
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					angle_shoot = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 1://shoot aim
				if(state_time < shoot_lenght)
				{
					if(state_time % bubble_wait == 0)
					{
						angle_shoot += bubble_dist * dir_shoot;
						var aim = angle_shoot;
						
						shoot_ring(DAN_BUBBLE,3,bubble_nbr,x,y,aim,bubble_spd_shoot,sfx_shot1,6);
					}
					
					if(state_time % aim_wait == 0)
					{
						shoot_ring(DAN_BALL,2,aim_ring,x,y,999,aim_spd_shoot,sfx_shot2,5);
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 30)
				{
					state = 3;
					angle = 90;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.04);
			break;
		}
	}
	//aim
	with(obj_danmaku5)
	{
		spd = goto_value(spd,aim_spd_final,0.5);
	}
	
	//bubble
	with(obj_danmaku6)
	{
		spd = goto_value(spd,bubble_spd_final,0.5);
	}
}
// Inherit the parent event
event_inherited();

