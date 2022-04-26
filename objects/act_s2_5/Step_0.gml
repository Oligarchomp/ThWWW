/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var crab_shoot_spd = 1;
			var crab_shoot_nbr = 1;
			var crab_grav = 0.03;
		break;
		case 1:
			var crab_shoot_spd = 2;
			var crab_shoot_nbr = 1;
			var crab_grav = 0.05;
		break;
		case 2:
			var crab_shoot_spd = 2;
			var crab_shoot_nbr = 2;
			var crab_grav = 0.05;
		break;
		case 3:
			var crab_shoot_spd = 2;
			var crab_shoot_nbr = 3;
			var crab_grav = 0.05;
		break;
	}
	
	
	var crab_wait = 90
	var crab_life = 45;
	var crab_dist = 40;
	
	var spell = self;
	
	
	if (step % crab_wait == 0)
	{
		global_dir *= -1;
		
		with(obj_enemy2)
		{
			state = 0;
			play_sound(sfx_redirect1,1,false);
		}
		with(obj_boss)
		{
			state2 = 0;
		}
		for(var i = 1; i < 5; i += 1)
		{
			if( i % 2 == 0)
			{
				var x_pos = room_width + 20;
				var ang = 180
				var cra_dir = 1;
			}
			else
			{
				var x_pos = -20
				var ang = 0
				var cra_dir = -1;
			}
			if(crab_nbr != 21)
			{
				var inst = create_enemy(EN_CRAB,x_pos,i * crab_dist,crab_life,2,0,0)
				inst.item_nbr = 2;
				inst.crab_dir = cra_dir;
			}
			else
			{
				global.boss = BOSS_SERENE;
				var inst = instance_create_depth(0,0,0,obj_boss);
				inst.depth -= 1;
				instance_destroy(obj_boss_indicator);
				inst.x = x_pos;
				inst.y = i * crab_dist;
				inst.pos_type = POS_ANGLE;
				inst.state2 = 0;
				inst.last_state2 = -1;
				inst.state_time2 = 0;
				inst.crab_dir = cra_dir;
			}
			inst.angle = ang;
			inst.item_nbr = 1;
			
			crab_nbr += 1;
		}
	}
	
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
					if(global.difficulty != 0) or (crab_dir == spell.global_dir)
					{
						for(var i = 0; i < crab_shoot_nbr; i += 1)
						{
							var inst = shoot(DAN_BALL,6,x,y,60 + rng(60,false,i),0.9 + rng(1,false,i + 1),sfx_shot3,3);
							inst.pos_type = POS_SP;
							inst.y_grav_accel = crab_grav;
							inst.y_grav_max = 5.5;	
						}
					}
					
					state = 2;
				}
			break;
		
		}
	}
	
	
	with(obj_boss)
	{
		if (state2 != last_state2)
		{
			last_state2 = state2;
			state_time2 = 0;
		}
		else
		{
			state_time2 += 1;
		}
	
		
		switch(state2)
		{
			case 0:
				spd = goto_value(spd,3,0.2);
				if(spd == 3)
				{
					state2 = 1;
				}
			break;
			case 1:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					if(global.difficulty != 0) or (crab_dir == spell.global_dir)
					{
						for(var i = 0; i < crab_shoot_nbr; i += 1)
						{
							var inst = shoot(DAN_BALL,6,x,y,60 + rng(60,false,i),1 + rng(1,false,i + 1),sfx_shot3,3);
							inst.pos_type = POS_SP;
							inst.y_grav_accel = 0.05;
							inst.y_grav_max = 6;	
						}
					}
					state2 = 2;
				}
			break;
		
		}
	}
	
}



// Inherit the parent event
event_inherited();

