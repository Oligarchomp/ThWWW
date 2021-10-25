/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(spell_wait)
	{
		case 30:
			boss_charge(obj_boss.x,obj_boss.y)
		break;
		case 0:
			switch(global.difficulty)
			{
				case 0:
					var torpedo_wait = 120;
					var torpedo_tail_wait = 18;
					var torpedo_lenght = 100;
					var torpedo_ring = 16;
					var torpedo_spd = 1.5;
					var torpedo_angle_plus = 1;
					var torpedo_angle_max = 90;
			
					var off_div = 4;
				break;
				case 1:
					var torpedo_wait = 86;
					var torpedo_tail_wait = 13;
					var torpedo_lenght = 70;
					var torpedo_ring = 18;
					var torpedo_spd = 2;
					var torpedo_angle_plus = 1;
					var torpedo_angle_max = 100;
			
					var off_div = 3;
				break;
				case 2:
					var torpedo_wait = 70;
					var torpedo_tail_wait = 11;
					var torpedo_lenght = 60;
					var torpedo_ring = 19;
					var torpedo_spd = 2;
					var torpedo_angle_plus = 1;
					var torpedo_angle_max = 110;
			
					var off_div = 3;
				break;
				case 3:
					var torpedo_wait = 70;
					var torpedo_tail_wait = 9;
					var torpedo_lenght = 60;
					var torpedo_ring = 20;
					var torpedo_spd = 2.5;
					var torpedo_angle_plus = 1;
					var torpedo_angle_max = 110;
			
					var off_div = 3;
				break;
			}
	
			var boss_wait = 220;
	
			if(step % boss_wait == boss_wait -1)
			{
				boss_movement_random(1,2,0);
			}
	
			if(step % torpedo_wait == 0)
			{
				ds_list_add(angle_list,angle_torpedo);
				ds_list_add(time_list,torpedo_lenght);
				ds_list_add(dir_list,act_dir);
		
				ds_list_add(angle_list,angle_torpedo);
				ds_list_add(time_list,torpedo_lenght);
				ds_list_add(dir_list,-act_dir);
		
		
				angle_torpedo = rng(360,false,5);
			}
	
			for(var i = 0; i < ds_list_size(angle_list); i += 1)
			{
				if(time_list[|i] > 0)
				{
					if((torpedo_lenght - time_list[|i]) % torpedo_tail_wait == 0)
					{
						if(time_list[|i] == torpedo_lenght)
						{
							var dan = DAN_BUBBLE;
							var col = 1;
							var num = 5;
						}
						else
						{
							var dan = DAN_BULLET;
							var col = 7;
							var num = 4;
						}
				
						var aim =  angle_list[|i] + dir_list[|i] * time_list[|i] / off_div;
						for(var t = 0 ; t < 360; t += 360 / torpedo_ring)
						{
							var inst = shoot(dan,col,obj_boss.x,obj_boss.y,aim + t,torpedo_spd,sfx_shot1,num);
							if(instance_exists(inst))
							{
								inst.dir = dir_list[|i];
								inst.angle_to = inst.angle + torpedo_angle_max * inst.dir;
							}
						}
					}
		
					time_list[|i] -= 1;
				}
			}
	
			with(obj_danmaku5)
			{
				angle = goto_value(angle,angle_to,torpedo_angle_plus);
			}
			with(obj_danmaku4)
			{
				angle = goto_value(angle,angle_to,torpedo_angle_plus);
			}
		break;
	}
}

// Inherit the parent event
event_inherited();

