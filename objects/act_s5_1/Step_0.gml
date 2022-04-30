/// @description Insert description here
// You can write your code in this editor


if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var shoot_wait = 15;
			
			var ball_spd = 2;
			var ball_angle = 90;
			
			var mentos_spd = 1.5;
			var mentos_angle = 120;
			
			var rev_nbr = 8;
			var rev_spd = 1.5;
		break;
		case 1:
			var shoot_wait = 8;
			
			var ball_spd = 2.3;
			var ball_angle = 90;
			
			var mentos_spd = 1.8;
			var mentos_angle = 120;
			
			var rev_nbr = 20;
			var rev_spd = 1.5;
		break;
		case 2:
			var shoot_wait = 6;
			
			var ball_spd = 2.5;
			var ball_angle = 90;
			
			var mentos_spd = 2;
			var mentos_angle = 120;
			
			var rev_nbr = 26;
			var rev_spd = 1.5;
		break;
		case 3:
			var shoot_wait = 5;
			
			var ball_spd = 2.5;
			var ball_angle = 90;
			
			var mentos_spd = 2;
			var mentos_angle = 120;
			
			var rev_nbr = 32;
			var rev_spd = 1.5;
		break;
	}
	
	var f_life = 110;
	var shoot_lenght = 180;
	
	var familiar_nbr = 5;
	var familiar_life = 55;
	
	var familiar_spin_spd = 1.9;
	
	switch(step)
	{
		case 0:
			var fairy = create_enemy(EN_RED,room_width / 2,-50,f_life,1,9.5,-90)
			fairy.can_revenge = false;
			fairy.item_nbr = 18;
			
			var rand = rng(360,false,1);
			for(var i = 0; i < 360; i += 360 / familiar_nbr)
			{
				var inst = create_enemy(EN_FAMILIAR,room_width / 2,50,familiar_life,2,0,rand + i);
				inst.pos_type = POS_MANUAL;
				inst.dir_fam = 1;
				inst.dist = 0;
				inst.dist_max = 50;
				inst.item_nbr = 0;
				inst.my_fairy = fairy;
				inst.can_really_revenge = true;
				
				var inst = create_enemy(EN_FAMILIAR,room_width / 2,50,familiar_life,2,0,rand + i);
				inst.pos_type = POS_MANUAL;
				inst.dir_fam = -1;
				inst.dist = 0;
				inst.dist_max = 100;
				inst.item_nbr = 0;
				inst.my_fairy = fairy;
				inst.can_really_revenge = true;
			}
			
			play_sound(sfx_familiar_spawn,1,false);
		break;
		case stagecard_time:
			instance_create_depth(0,0,0,obj_stagecard);
		break;
	}

	//fairy
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
					wall_aim = 0;
				}
			break;
			case 1://shoot aim
				if(state_time >= shoot_lenght)
				{
					state = 2;
				}
				else
				{
					with(obj_enemy2)
					{
						state = 1;
					}
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
				spd = goto_value(spd,3,0.05);
				if(y < 0)
				{
					with(obj_enemy2)
					{
						can_really_revenge = false;	
					}
				}
			break;
		}
	}

	//familiar
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
			break;
			case 1:
				if(state_time % shoot_wait == 0)
				{
					var aim = angle + ball_angle;
					shoot(DAN_ARROW,7,x,y,aim,ball_spd,sfx_shot2,1);
					
					var aim = angle + mentos_angle;
					shoot(DAN_MENTOS,6,x,y,aim,mentos_spd,noone,2);
				}
			break;
		}
		can_revenge = false;
		
		dist += recursiv(dist,dist_max,10,0.1);
		angle += familiar_spin_spd * dir_fam;
		
		if(instance_exists(my_fairy))
		{
			x = my_fairy.x + lengthdir_x(dist,angle);
			y = my_fairy.y + lengthdir_y(dist,angle);
		}
		else
		{
			if(can_really_revenge)
			{
				can_revenge = true;
			}
			
			life = 0;
		}
	}	
	
	for(var i = 0; i < array_length(global.x_death_list); i += 1)
	{
		shoot_ring(DAN_MENTOS,1,rev_nbr,global.x_death_list[i],global.y_death_list[i],rng(360,false,7),rev_spd,sfx_redirect1,6);
	}
}

// Inherit the parent event
event_inherited();

