/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	big_x_off = 30;
	big_y_off = 80;


	var wait_spawn_big = 60;
	var big_life = 45;
	
	switch(global.difficulty)
	{
		case 0:
			var big_wait_shoot = 180;
			var wall_nbr = 4;
			var wave = 1;
			var wait = 20;
			var arc_num = 1;
		break;
		case 1:
			var big_wait_shoot = 70;
			var wall_nbr = 4;
			var wave = 2;
			var wait = 35;
			var arc_num = 3;
		break;
		case 2:
			var big_wait_shoot = 60;
			var wall_nbr = 7;
			var wave = 2;
			var wait = 30;
			var arc_num = 4;
		break;
		case 3:
			var big_wait_shoot = 50;
			var wall_nbr = 8;
			var wave = 3;
			var wait = 20;
			var arc_num = 4;
		break;
	}
	


	//spawn bubble fairy
	if (step == wait_spawn_big) or (step == wait_spawn_big * 3)  or (step == wait_spawn_big * 5)
	{
		var inst = create_enemy(EN_RED,room_width + big_x_off,big_y_off,big_life,4,1,-180);
		inst.item_nbr = 2;
	}
	
	if (step == wait_spawn_big* 2) or (step == wait_spawn_big * 4) or (step == wait_spawn_big * 6) 
	{
		var inst = create_enemy(EN_RED,-big_x_off,big_y_off,big_life,4,1,0);
		inst.item_nbr = 2;
	}
	
	with(obj_enemy4)
	{
		if (other.step % big_wait_shoot == 0)
		{
			shoot(DAN_BUBBLE,6,x,y,90,3,sfx_redirect1,7);
		}
	}
	
	with(obj_danmaku7)
	{
		pos_type = POS_SP;
		y_grav_accel = 0.1;
		y_grav_max = 5;
	}
	
	// small wall fairy
	
	var wait_spawn_small = 60;
	var x_off = 35;
	var fairy_nbr = 10;
	
	if (step < fairy_nbr *  wait_spawn_small)
	{
		if (step %  wait_spawn_small = wait_spawn_small -1)
		{
			var inst = create_enemy(EN_GREEN,x_off + (step * 3) % (room_width - 2 * x_off),-20,30,5,4.5,-90)
			inst.item_nbr = 2;
		}
	}
	
	with(obj_enemy5)
	{
		switch(state)
		{
			case 0: //coming down
				spd = goto_value(spd,0,0.08);
				if (spd == 0)
				{
					wall_ang_shoot = rng(360,true,4)
					state = 1;
				}
			break;
			case 1://shooting
				

				if (state_time < wave * wait)
				{
					if(state_time % wait == 0) 
					{
						
						for (var i = 0; i < wall_nbr; i += 1)
						{
							shoot_arc(DAN_ARROW,3,arc_num,x,y,wall_ang_shoot + i * 360 / wall_nbr,3,3,sfx_shot2,2);
						}
					
						wall_ang_shoot += 15;
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2: //waiting
				if (state_time > 60)
				{
					state = 3
				}
			break;
			case 3: //leaving
				spd = 2;
			break;
		}
	}
}


// Inherit the parent event
event_inherited();

