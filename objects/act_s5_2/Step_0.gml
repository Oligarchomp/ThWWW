/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var mentos_wait = 6;
			var mentos_ring = 5;
			var mentos_spd = 1.8;
			var mentos_accel = 0.012;
			var mentos_start = 50;
			var mentos_spin = 20;
			
			var ring_nbr = 6;
			var ring_spd = 1;
		break;
		case 1:
			var mentos_wait = 5;
			var mentos_ring = 7;
			var mentos_spd = 2;
			var mentos_accel = 0.015;
			var mentos_start = 50;
			var mentos_spin = 17;
			
			var ring_nbr = 12;
			var ring_spd = 1;
		break;
		case 2:
			var mentos_wait = 4;
			var mentos_ring = 9;
			var mentos_spd = 2.2;
			var mentos_accel = 0.015;
			var mentos_start = 50;
			var mentos_spin = 14;
			
			var ring_nbr = 14;
			var ring_spd = 1;
		break;
		case 3:
			var mentos_wait = 4;
			var mentos_ring = 11;
			var mentos_spd = 2.2;
			var mentos_accel = 0.015;
			var mentos_start = 50;
			var mentos_spin = 12;
			
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
			inst.angle_shoot = rng(360,false,6);
			inst.fairy_dir = act_dir;
			var inst = create_enemy(EN_BLUE,room_width / 2 + 100,-20,fairy_life,6,fairy_spd,-90);
			inst.item_nbr = 7;
			inst.dan_wait = mentos_start;
			inst.angle_shoot = rng(360,false,6);
			inst.fairy_dir = act_dir;
			var inst = create_enemy(EN_BLUE,room_width / 2 - 100,-20,fairy_life,6,fairy_spd,-90);
			inst.item_nbr = 7;
			inst.dan_wait = mentos_start;
			inst.angle_shoot = rng(360,false,6);
			inst.fairy_dir = act_dir;
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
						for( var i = 0; i < 360; i += 360 / mentos_ring)
						{
							var inst = shoot(DAN_MENTOS,1,x,y,angle_shoot + i,0,sfx_shot1,3);	
							inst.start = dan_wait;
						}
						dan_wait -= mentos_wait;
						angle_shoot += mentos_spin * fairy_dir;
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
				shoot_ring(DAN_MENTOS,7,ring_nbr,x,y,rng(360,false,4),ring_spd,sfx_redirect1,8);
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
					//angle = find_angle(x,y,obj_player.x,obj_player.y) + off;
					state = 1;
				}
			break;
			case 1:
				spd = goto_value(spd,mentos_spd,mentos_accel);
			break;
		}
	}
	
	for(var i = 0; i < ds_list_size(global.x_death_list); i += 1)
	{
		shoot_ring(DAN_MENTOS,6,ring_nbr,global.x_death_list[|i],global.y_death_list[|i],rng(360,false,4),ring_spd,sfx_redirect1,8);
	}
}
// Inherit the parent event
event_inherited();

