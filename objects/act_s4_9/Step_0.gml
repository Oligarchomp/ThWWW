/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var ball_wait = 22;
			var ball_spd = 2;
			var ball_ring = 20;
			
			var bubble_wait = 30;
			var bubble_spd = 2.5;
			var bubble_ring = 8;
			var bubble_angle_plus = 13;
			
			var mentos_ring = 12;
			var mentos_wait = 25;
			var mentos_spd = 3;
			var mentos_angle_plus = -6.7;
		break;
		case 1:
			var ball_wait = 12;
			var ball_spd = 2.7;
			var ball_ring = 27;
			
			var bubble_wait = 20;
			var bubble_spd = 3.3;
			var bubble_ring = 10;
			var bubble_angle_plus = 10.5;
			
			var mentos_ring = 18;
			var mentos_wait = 17;
			var mentos_spd = 3.7;
			var mentos_angle_plus = -6.7;
		break;
		case 2:
			var ball_wait = 10;
			var ball_spd = 3;
			var ball_ring = 30;
			
			var bubble_wait = 20;
			var bubble_spd = 3.5;
			var bubble_ring = 12;
			var bubble_angle_plus = 7.7;
			
			var mentos_ring = 20;
			var mentos_wait = 16;
			var mentos_spd = 4;
			var mentos_angle_plus = -5.7;
		case 3:
			var ball_wait = 10;
			var ball_spd = 3;
			var ball_ring = 32;
			
			var bubble_wait = 18;
			var bubble_spd = 3.5;
			var bubble_ring = 14;
			var bubble_angle_plus = 7.2;
			
			var mentos_ring = 22;
			var mentos_wait = 15;
			var mentos_spd = 4;
			var mentos_angle_plus = -5.5;
		break;
	}
	var fairy_life = 100000;
	var fairy_life_killable = 160;
	var shoot_lenght = 320;
	
	if(step == 0)
	{
		var inst = create_enemy(EN_RED,room_width / 2,-20,fairy_life,6,7,-90);
		inst.item_nbr = 14;
		inst.dir_dan = 1;
		
	}
	
	with(obj_enemy6)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
					angle_bubble = rng(360,false,5);
					angle_mentos = rng(360,false,5);
				}
			break;
			case 1://shoot aim
				if(state_time < shoot_lenght)
				{
					if(state_time == 260)
					{
						life = fairy_life_killable;
					}
					if(state_time % ball_wait == 0)
					{
						var ang = -90 + 180 / ball_ring;
						shoot_ring(DAN_BALL,3,ball_ring,x,y,ang,ball_spd,sfx_shot3,4);
					}
					
					if(state_time % bubble_wait == 0)
					{
						shoot_ring(DAN_BUBBLE,6,bubble_ring,x,y,angle_bubble,bubble_spd,sfx_redirect2,6);
						angle_bubble += bubble_angle_plus;
					}
					
					if(state_time % mentos_wait == 0)
					{
						shoot_ring(DAN_MENTOS,1,mentos_ring,x,y,angle_mentos,mentos_spd,sfx_shot2,5);	
						angle_mentos += mentos_angle_plus;
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
	

}
// Inherit the parent event
event_inherited();

