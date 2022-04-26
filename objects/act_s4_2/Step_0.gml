/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var row_arc = 3;
			var row_spd1 = 2;
			var row_spd2 = 1.5;
			var row_dist = 40;
			
			var aim_ring = 6;
			var aim_spd = 2.2;
		break;
		case 1:
			var row_arc = 5;
			var row_spd1 = 2.2;
			var row_spd2 = 1.5;
			var row_dist = 26;
			
			var aim_ring = 15;
			var aim_spd = 3.4;
		break;
		case 2:
			var row_arc = 7;
			var row_spd1 = 2.2;
			var row_spd2 = 1.5;
			var row_dist = 22;
			
			var aim_ring = 24;
			var aim_spd = 3.8;
		break;
		case 3:
			var row_arc = 9;
			var row_spd1 = 2.2;
			var row_spd2 = 1.5;
			var row_dist = 19;
			
			var aim_ring = 28;
			var aim_spd = 4;
		break;
	}
	
	
	var fairy_life = 9;
	var fairy_wait = 18;
	
	var lots_wait = 8;
	var lots_life = 8;
	var lots_length = 100;
	var lots_spd = 6;
	var lots_angle_plus = 0.8;
	
	var spell = self;
	
	
	switch(step)
	{
		case 0:
		case 340:
		case 680:
			need_fairy_time = lots_length;
			act_dir = 1;
			x_aim = obj_player.x;
			y_aim = obj_player.y;
		break;
		case 170:
		case 510:
		case 850:
			need_fairy_time = lots_length;
			act_dir = -1;
			x_aim = obj_player.x;
			y_aim = obj_player.y;
		break;
		
	}

	if(step % fairy_wait == 0) and (step < 1000)
	{
		var xx = act_dir2 == 1 ? 50 + x_off % 300 : 350 - x_off % 300;
		var inst = create_enemy(EN_GREEN,xx,-20,fairy_life,1,5,-90);
		inst.item = 1;
		inst.can_revenge = false;
		
		act_dir2 *= -1;
		
		x_off += 50;
	}


	if(need_fairy_time > 0)
	{
		if((lots_length - need_fairy_time) % lots_wait == 0)
		{
			var inst = create_enemy(EN_WHITE,200 - 220 * act_dir,80,lots_life,2,lots_spd,-90 + act_dir * 45);
			inst.item_nbr = 1;
			inst.angle_to = -90 + act_dir * 90;
			inst.can_revenge = false;
		}
		
		need_fairy_time -= 1;
	}
	
	with(obj_enemy2)//amulet row
	{
		angle = goto_value(angle,angle_to,lots_angle_plus);
		
		if(step == 15)
		{
			var aim = find_angle(x,y,spell.x_aim,spell.y_aim);
			shoot_arc(DAN_AMULET,3,row_arc - 1,x,y,aim,row_dist,row_spd2,sfx_shot2,3);
			shoot_arc(DAN_AMULET,7,row_arc,x,y,aim,row_dist,row_spd1,sfx_shot2,3);
			
			can_revenge = false;
		}
	}
	
	with(obj_danmaku3)//row
	{
		switch(state)
		{
			case 0:
				image_xscale = 2;
				image_yscale = 2;
				state += 1;
			break;
		}
	}
	
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.15);
				if(spd == 0)
				{
					state += 1;
					aim_to = rng(360,false,1)//find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 1:
				shoot_ring(DAN_MENTOS,3,aim_ring,x,y,aim_to,aim_spd,sfx_redirect2,2);
				state += 1;
			break;
			case 2:
				if(state_time == 35)
				{
					angle = find_angle(x,y,obj_player.x,obj_player.y);
					state += 1;	
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.08);
			break;
		}
	}
	
	with(obj_danmaku2)
	{
		switch(state)
		{
			case 0:
				state += 1;
			break;
		}
	}

}
// Inherit the parent event
event_inherited();

