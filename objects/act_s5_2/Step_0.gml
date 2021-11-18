/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var mentos_wait = 6;
			var mentos_arc = 3;
			var mentos_dist = 50;
			var mentos_spd = 8;
			var mentos_accel = 0.02;
			var mentos_start = 50;
			
			var ring_nbr = 6;
			var ring_spd = 1;
		break;
		case 1:
			var mentos_wait = 5;
			var mentos_arc = 5;
			var mentos_dist = 40;
			var mentos_spd = 8;
			var mentos_accel = 0.02;
			var mentos_start = 50;
			
			var ring_nbr = 12;
			var ring_spd = 1;
		break;
		case 2:
			var mentos_wait = 4;
			var mentos_arc = 5;
			var mentos_dist = 34;
			var mentos_spd = 8;
			var mentos_accel = 0.02;
			var mentos_start = 50;
			
			var ring_nbr = 14;
			var ring_spd = 1;
		break;
		case 3:
			var mentos_wait = 4;
			var mentos_arc = 7;
			var mentos_dist = 30;
			var mentos_spd = 8;
			var mentos_accel = 0.02;
			var mentos_start = 50;
			
			var ring_nbr = 16;
			var ring_spd = 1;
		break;
	}
	
	var fairy_life = 14;
	var fairy_spd = 6;
	var fairy_deccel = 0.3;
	var fairy_lenght = 45;
	
	
	if(step < 700)
	{
		if(step % 200 == 0)
		{
			var inst = create_enemy(EN_BLUE,room_width / 2,-20,fairy_life,6,fairy_spd,-90);
			inst.item_nbr = 7;
			inst.dan_wait = mentos_start;
			var inst = create_enemy(EN_BLUE,room_width / 2 + 100,-20,fairy_life,6,fairy_spd,-90);
			inst.item_nbr = 7;
			inst.dan_wait = mentos_start;
			var inst = create_enemy(EN_BLUE,room_width / 2 - 100,-20,fairy_life,6,fairy_spd,-90);
			inst.item_nbr = 7;
			inst.dan_wait = mentos_start;
		}
		
	}
	
	
	//fairy
	with(obj_enemy6)
	{
		switch(state)
		{
			case 0:
				if(state_time < fairy_lenght)
				{
					if(state_time % mentos_wait == 1)
					{
						for( var i = -mentos_dist * (mentos_arc - 1) / 2; i < mentos_dist * (mentos_arc + 1) / 2; i += mentos_dist)
						{
							var inst = shoot(DAN_MENTOS,1,x,y,0,0,sfx_shot1,3);	
							inst.off = i;
							inst.start = dan_wait;
						}
						dan_wait -= mentos_wait;
					}
				}
				else
				{
					state = 1;
				}
			break;
			case 1:
				spd = goto_value(spd,0,fairy_deccel);
				if(spd == 0)
				{
					state = 2;
				}
			break;
			case 2://shoot aim
				shoot_ring(DAN_BUBBLE,1,ring_nbr,x,y,rng(360,false,4),ring_spd,sfx_redirect1,8);
				state = 3;
				can_revenge = false;
			break;
			case 3:
				if(state_time == 30)
				{
					state = 4;
					angle = 90;
				}
			break;
			case 4:
				spd = goto_value(spd,3,0.05);
			break;
		}
	}
	//mentos
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				if(step == start)
				{
					angle = find_angle(x,y,obj_player.x,obj_player.y) + off;
					state = 1;
				}
			break;
			case 1:
				spd = goto_value(spd,mentos_spd,mentos_accel);
			break;
		}
	}
	
	for(var i = 0; i < ds_list_size(x_death_list); i += 1)
	{
		shoot_ring(DAN_BUBBLE,6,ring_nbr,x_death_list[|i],y_death_list[|i],rng(360,false,4),ring_spd,sfx_redirect1,8);
	}
}
// Inherit the parent event
event_inherited();

