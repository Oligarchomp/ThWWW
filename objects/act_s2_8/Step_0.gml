/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var crab_shoot_nbr = 0;
			var tri_spd = 2.5;
			var tri_dist = 2;
			var tri_div = 2;
			
			var shot_type = 0;
		break;
		case 1:
			
			var aim_spd = 4;
			var tri_spd = 3;
			var tri_dist = 2;
			var tri_div = 10;
			
			var shot_type = 1;
		break;
		case 2:
			var crab_shoot_nbr = 1;
			var tri_spd = 3;
			var tri_dist = 2;
			var tri_div = 6;
			
			var shot_type = 0;
		break;
		case 3:
			var crab_shoot_nbr = 2;
			var tri_spd = 3;
			var tri_dist = 2;
			var tri_div = 5;
			
			var shot_type = 0;
		break;
	}
	
	
	var crab_wait = 60
	var crab_life = 45;
	var crab_dist = 40;
	var crab_lenght = 450;
	
	var fairy_wait = 120;
	var fairy_life = 90;
	
	if (step % fairy_wait == 0)
	{
		if(step/fairy_wait < ds_list_size(x_fairy))
		{
			var inst = create_enemy(EN_GREEN,x_fairy[|step/fairy_wait],-20,fairy_life,4)
			inst.angle = -90;
			inst.spd = 4;
		}
	}
	
	
	if (step % crab_wait == 0)
	{
		
		
		with(obj_enemy2)
		{
			state = 0;
			play_sound(sfx_redirect1,1,false);
		}
		if(step < crab_lenght)
		{
			for(var i = 1; i < 5; i += 1)
			{
				if( i % 2 == 0)
				{
					var x_pos = room_width + 20;
					var ang = 180
				}
				else
				{
					var x_pos = -20
					var ang = 0
				}
			
				var inst = create_enemy(EN_CRAB,x_pos,i * crab_dist,crab_life,2)
			
				inst.angle = ang;
				inst.item_nbr = 1;
			
			}
		}
	}
	
	//crab
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,3,0.2);
				if(spd == 3)
				{
					state = 1;
				}
			break;
			case 1:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					if(shot_type == 0)
					{
						for(var i = 0; i < crab_shoot_nbr; i += 1)
						{
							var inst = shoot(DAN_BALL,6,x,y,60 + rng(60,false,i),1 + rng(1,false,i + 1),sfx_shot3,3);
							inst.pos_type = POS_SP;
							inst.y_grav_accel = 0.05;
							inst.y_grav_max = 6;	
						}
					}
					else
					{
						var inst = shoot(DAN_BALL,6,x,y,999,aim_spd,sfx_shot3,3);
					}
					
					state = 2;
				}
			break;
		
		}
	}
	
	//big
	with(obj_enemy4)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					shoot_nbr = 1
					angle_shoot = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 1://shoot
				if(state_time < 40)
				{
					if(state_time % tri_div == 0)
					{
						shoot_arc(DAN_ARROWHEAD,2,shoot_nbr,x,y,angle_shoot,tri_dist,tri_spd,sfx_shot2,4);
						shoot_nbr += 1;
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2:
				if(state_time == 60)
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
	
}



// Inherit the parent event
event_inherited();

