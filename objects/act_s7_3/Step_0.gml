/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	var fairy_lenght = 140;
	
	var ball_wait = 30;
	var ball_ring = 18;
	var ball_spd_shoot = 8;
	var pellet_spd_shoot = 6.5;
	var spd_div = 3;
	var deccel_time = 15;
	
	switch(step)
	{
		case 560:
		case 280:
		case 0:
			for(var i = 40; i <= 360; i += 80)
			{
				var inst = create_enemy(EN_BLUE,i,-20,28,6,4,-90);
				inst.item_nbr = 7;
			}
		break;
	}
	
	
	with(obj_enemy6)
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
				if(state_time < fairy_lenght)
				{
					if(state_time % ball_wait == 0)
					{
						var aim = rng(360,false,4);
						shoot_ring(DAN_BALL,1,ball_ring,x,y,aim,ball_spd_shoot,sfx_shot2,7);
						shoot_ring(DAN_PELLET,1,ball_ring,x,y,aim + 180 / ball_ring,pellet_spd_shoot,sfx_shot2,1);
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2://wait
				if(state_time == 40)
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
	//ball
	with(obj_danmaku7)
	{
		switch(state)
		{
			case 0:
				spd_ref = spd;
				state = 1;
			break;
			case 1:
				spd = goto_value(spd,spd_ref / spd_div,spd_ref / deccel_time);
			break;
		}
	}
	//pellet
	with(obj_danmaku1)
	{
		switch(state)
		{
			case 0:
				spd_ref = spd;
				state = 1;
			break;
			case 1:
				spd = goto_value(spd,spd_ref / spd_div,spd_ref / deccel_time);
			break;
		}
	}
}
// Inherit the parent event
event_inherited();

