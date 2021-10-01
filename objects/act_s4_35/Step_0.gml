/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var ring_nbr = 26;
			var ring_spd_shot = 9;
			var ring_spd_final = 3;
			
			var arrow_nbr = 12;
			var arrow_spd_min = 1;
			var arrow_spd_max = 4;
			var arrow_dist = 20;
		break;
		case 1:
			var ring_nbr = 32;
			var ring_spd_shot = 9;
			var ring_spd_final = 3;
			
			var arrow_nbr = 19;
			var arrow_spd_min = 1;
			var arrow_spd_max = 4;
			var arrow_dist = 15;
		break;
		case 2:
			var ring_nbr = 38;
			var ring_spd_shot = 9;
			var ring_spd_final = 3.5;
			
			var arrow_nbr = 24;
			var arrow_spd_min = 1;
			var arrow_spd_max = 4.5;
			var arrow_dist = 13;
		break;
		case 3:
			var ring_nbr = 46;
			var ring_spd_shot = 9;
			var ring_spd_final = 3.5;
			
			var arrow_nbr = 26;
			var arrow_spd_min = 1;
			var arrow_spd_max = 4.5;
			var arrow_dist = 11;
		break;
	}
	
	var spawn_dist = 60;
	var f_life = 18;
	var fairy_wait = 28;
	
	switch(state)
	{
		case 0:	
			if(state_time % fairy_wait == 0)
			{
				x_spawn -= spawn_dist;
				if(x_spawn > 0)
				{
					create_enemy(EN_GREEN,x_spawn,-20,f_life,7,4.2,-90);
				}
				else
				{
					x_spawn = 0;
					state = 1;
				}
			}
		break;
		case 1:
			if(state_time == 60)
			{
				state = 2;
			}
		break;
		case 2:
			if(state_time % fairy_wait == 0)
			{
				x_spawn += spawn_dist;
				if(x_spawn < room_width)
				{
					create_enemy(EN_GREEN,x_spawn,-20,f_life,7,4.2,-90);
				}
				else
				{
					state = 3;
				}
			}
		break;
	}
	
	with(obj_enemy7)
	{
		switch(state)
		{
			case 0:
				if(state_time == 1)
				{
					shoot_ring(DAN_MENTOS,2,ring_nbr,x,y,rng(360,false,6),ring_spd_shot,sfx_shot2,4);
				}
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot aim
				var angle_shoot = find_angle(x,y,obj_player.x,obj_player.y);
				var dist = 0;
				var sp = arrow_spd_max;
				for(var i = 0; i < arrow_nbr; i += 1)
				{
					shoot_arc(DAN_ARROW,3,2,x,y,angle_shoot,dist,sp,sfx_shot1,3);
					dist += arrow_dist;
					sp -= (arrow_spd_max - arrow_spd_min) / arrow_nbr;
				}
					
				state = 2;
			break;
			case 2:
				if(state_time == 30)
				{
					state = 3;
					angle = -90;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.04);
			break;
		}
	}
	
	with(obj_danmaku4)
	{
		spd = goto_value(spd,ring_spd_final,0.3);
		
	}
	
}
// Inherit the parent event
event_inherited();

