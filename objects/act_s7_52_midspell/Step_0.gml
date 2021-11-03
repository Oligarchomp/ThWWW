/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) 
{
	switch(spell_wait)
	{
		case 30:
			boss_charge(obj_boss.x,obj_boss.y);
		break;
		case 1:
			boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
			shoot_ring(DAN_BUBBLE,4,32,obj_boss.x,obj_boss.y,999,5.5,noone,8);
		break;
		case 0:
			var bubble_nbr = 28;
			var bubble_spd_shot = 9;
			var bubble_deccel = 0.1;
			var bubble_spd = 3;
	
			var mentos_wait = 13;
			var mentos_nbr = 10;
			var mentos_spd = 4;
			var mentos_angle_plus = 180 / mentos_nbr / 4;
	
	
			var boss_wait = 149;
	
			switch(state)
			{
				case 0:
					if(step % boss_wait == boss_wait -1)
					{
						boss_movement_random(1,1,1);
					}
	
					if(step % mentos_wait == 0)
					{
						for(var i = 0; i < 360; i += 360 / mentos_nbr)
						{
							var inst = shoot(DAN_MENTOS,3,obj_boss.x,obj_boss.y,angle_shoot + i,mentos_spd,sfx_shot1,5);
							var inst = shoot(DAN_MENTOS,3,obj_boss.x,obj_boss.y,-angle_shoot - 180 / mentos_nbr + i,mentos_spd,sfx_shot1,5);
		
						}
						angle_shoot += mentos_angle_plus;
					}


					switch(step % 80)
					{
						case 0:
							shoot_ring(DAN_BUBBLE,3,bubble_nbr,0,0,rng(360,false,2),bubble_spd_shot,sfx_redirect1,6);
						break;
						case 40:
							shoot_ring(DAN_BUBBLE,4,bubble_nbr,room_width,0,rng(360,false,2),bubble_spd_shot,sfx_redirect1,6);
						break;
					}	
				break;
			}
	
			with(obj_danmaku6)
			{
				spd = goto_value(spd,bubble_spd,bubble_deccel);
			}
		break;
	}
	
}
// Inherit the parent event
event_inherited();

