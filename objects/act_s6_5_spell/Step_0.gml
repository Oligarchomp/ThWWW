/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	var boss_spd = 20;
	boss_sp = goto_value(boss_sp,boss_spd,0.3);
	obj_boss.spd_max = boss_sp;
		
	if(spell_wait == 0)
	{
		switch(global.difficulty)
		{
			case 0:
				var arrow_wait = 1;
				var arrow_nbr = 1;
				var arrow_spd_min = 2.5;
				var arrow_spd_git = 1.3;
				var arrow_size = 2;
			break;
			case 1:
				var arrow_wait = 1;
				var arrow_nbr = 2;
				var arrow_spd_min = 3;
				var arrow_spd_git = 1.8;
				var arrow_size = 2;
			break;
			case 2:
				var arrow_wait = 1;
				var arrow_nbr = 3;
				var arrow_spd_min = 3.3;
				var arrow_spd_git = 2;
				var arrow_size = 2;
			break;
			case 3:
				var arrow_wait = 1;
				var arrow_nbr = 4;
				var arrow_spd_min = 3.5;
				var arrow_spd_git = 2;
				var arrow_size = 2;
			break;
		}
		
		var y_min = 35;
		var y_git = 120;
	
		
		switch(state)
		{
			case 0:
				boss_movement_goto(200 + 400 * dir_act,y_min + rng(y_git,false,2),boss_sp)
				state = 1;
			break;
			case 1:
				if(dir_act == 1)
				{
					if (obj_boss.x > 550)
					{
						state = 0;
						dir_act *= -1;
						obj_boss.dir = -obj_boss.dir_max;
					}
				}
				else
				{
					if (obj_boss.x < -150)
					{
						state = 0;
						dir_act *= -1;
						obj_boss.dir = obj_boss.dir_max;
					}
				}
			break;
		}
	
		if(step % arrow_wait == 0)
		{
			var aim = rng(360,false,1);
			for (var i = 0; i < arrow_nbr; i += 1)
			{
				var sp = arrow_spd_min + rng(arrow_spd_git,false,i);
				var inst = shoot(DAN_ARROW,7,obj_boss.x,obj_boss.y,aim,sp,sfx_shot1,7);
				aim += 360 / arrow_nbr;
				inst.image_xscale = arrow_size;
				inst.image_yscale = arrow_size;
				inst.x_offscreen *= arrow_size;
				inst.y_offscreen *= arrow_size;
			}
		}
	}
	
}
// Inherit the parent event
event_inherited();

