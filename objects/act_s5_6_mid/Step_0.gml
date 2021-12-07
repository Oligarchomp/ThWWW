/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var boss_wait = 32;
			var close_off = 200;
			
			var ring_nbr = 11;
			var ring_spd = 2;
			var ring_spd_div = 1.5;
		break;
		case 1:
			var boss_wait = 26;
			var close_off = 180;
			

			var ring_nbr = 18;
			var ring_spd = 2.5;
			var ring_spd_div = 1.5;
		break;
		case 2:
			var boss_wait = 22;
			var close_off = 160;
			
			
			var ring_nbr = 20;
			var ring_spd = 3;
			var ring_spd_div = 1.5;
		break;
		case 3:
			var boss_wait = 18;
			var close_off = 145;
			
			
			var ring_nbr = 30;
			var ring_spd = 2.8;
			var ring_spd_div = 1.4;
		break;
	}
	
	var x_off = 100;
	var y_off1 = 90;
	var y_off2 = 220;
	var boss_spd = 6;
	
	var need_ring = false;
	var need_ring_slow = false;
	switch(state)
	{
		case 0:
			if(state_time == boss_wait)
			{
				boss_movement_goto(room_width / 2 + x_off,y_off1,boss_spd);
				state = 1;
				x_aim = obj_player.x;
				y_aim = obj_player.y;
			}
		break;
		case 1:
			if(obj_boss.in_position)
			{
				state = 2;
				need_ring = true;
			}
		break;
		case 2:
			if(state_time == boss_wait)
			{
				boss_movement_goto(room_width / 2 - x_off ,y_off2,boss_spd);
				state = 3;
				x_aim = obj_player.x;
				y_aim = obj_player.y;
			}
		break;
		case 3:
			if(obj_boss.in_position)
			{
				state = 4;
				need_ring = true;
			}
		break;
		case 4:
			if(state_time == boss_wait)
			{
				boss_movement_goto(room_width / 2 + x_off ,y_off2,boss_spd);
				state = 5;
				x_aim = obj_player.x;
				y_aim = obj_player.y;
			}
		break;
		case 5:
			if(obj_boss.in_position)
			{
				state = 6;
				need_ring = true;
			}
		break;
		case 6:
			if(state_time == boss_wait)
			{
				boss_movement_goto(room_width / 2 - x_off,y_off1,boss_spd);
				state = 7;
				x_aim = obj_player.x;
				y_aim = obj_player.y;
			}
		break;
		case 7:
			if(obj_boss.in_position)
			{
				state = 0;
				need_ring = true;
			}
		break;
	}
	
	if(need_ring)
	{
		var rand = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y);//rng(360,false,8);
		var sp = ring_spd
		if(need_ring_slow)
		{
			sp /= 2;	
		}
		shoot_ring(DAN_MENTOS,7,ring_nbr,obj_boss.x,obj_boss.y,rand,sp,sfx_redirect1,7);
		shoot_ring(DAN_MENTOS,5,ring_nbr,obj_boss.x,obj_boss.y,rand + 360 / ring_nbr / 2,sp / ring_spd_div,sfx_redirect1,7);	
	
	}

	
}
// Inherit the parent event
event_inherited();

