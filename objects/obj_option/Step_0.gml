/// @description Insert description here
// You can write your code in this editor

if (global.gp_active)
{
	
	if(instance_exists(obj_player))
	{
		var spd = 2.5;
		x += recursiv(x,obj_player.x,spd,0.5);
		y += recursiv(y,obj_player.y,spd,0.5);
		
		for (var i = 1; i < 5; i += 1)
		{
			var spd = 3
			if (!obj_player.focused)
			{
				x_pos[i] += recursiv(x_pos[i],orb_x[i],spd,0.2);
				y_pos[i] += recursiv(y_pos[i],orb_y[i],spd,0.2);
			}
			else
			{
				x_pos[i] += recursiv(x_pos[i],forb_x[i],spd,0.2);
				y_pos[i] += recursiv(y_pos[i],forb_y[i],spd,0.2);
			}
		}
		
		switch(player_id)
		{
			case P_MARISA:
				scale = 1 + cos(step / 14) * 0.08;
			break;
			case P_SANAE: //sanae
				scale = 1 + cos(step / 14) * 0.1;
			break;
			default: //REIMU
				image_index = step * yy_rot_spd;
				
				
			break;
		}
		
		if(!obj_player.in_dialogue)
		{
			if (global.shot_down) and (obj_player.state == 0)
			{
				if (obj_player.shot_time % shot_wait == 0)
				{
					for (var i = 1; i < 5; i += 1)
					{
						var inst = instance_create_depth(x + x_pos[i],y + y_pos[i],depth + 1, secondary_shot);
						switch(player_id)
						{
							case P_MARISA:
								
							break;
							case P_SANAE:
								var angle_dif = 10;
								inst.angle = 90 + (1.5 * angle_dif) - angle_dif * (i- 1);
							break;
						
						}
					}
				}
			}
		}
		
		
		
		step += 1;
	}
	else
	{
		instance_destroy();
	}
	
}