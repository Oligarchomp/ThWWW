/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	if(is_thunder)
	{
		alpha = goto_value(alpha,0,0.08);
	
		if(alpha == 0)
		{
			instance_destroy();	
		}
	
		if(step == 0)
		{
		
			if(angle_plus == 999)
			{
				angle_plus = 0;	
			}
		
			var dist = sprite_get_width(sprite_index) * x_scale;
			x_new = x + lengthdir_x(dist,angle);
			y_new = y + lengthdir_y(dist,angle);
		
			if(x_new < room_width) and (x_new > 0) and (y_new > 0) and (y_new < room_height)
			{
				var inst = instance_create_depth(x_new,y_new,depth,obj_thunder);
				var rand = -60 + rng(120,false,1);
				inst.angle = angle + rand + angle_plus;
				inst.angle_plus = -rand;
			
			
				if(rng(20,true,1) == 0)
				{
					var inst = instance_create_depth(x_new,y_new,depth,obj_thunder);
					var rand = -60 + rng(120,false,1);
					inst.angle = angle + rand + angle_plus;
					inst.angle_plus = -rand;
				}
			}
			
		}
	
		step += 1;
	}
	else // feza warning
	{
		if (old_state != state)
		{
			old_state = state;
			state_time = 0;
		}
		else
		{
			state_time += 1;
		}
		
		switch(state)
		{
			case 0:
				w_alpha = goto_value(w_alpha,0.5,0.04);
				
				x += lengthdir_x(w_spd,w_angle);
				y += lengthdir_y(w_spd,w_angle);
				
				w_spd = goto_value(w_spd,0,0.1);
				if(w_spd == 0)
				{
					state += 1;	
				}
			break;
			case 1:
				w_alpha = goto_value(w_alpha,0,0.04);
				
				if(w_alpha == 0)
				{
					instance_destroy();	
				}
			break;
		}
		
	}
}
