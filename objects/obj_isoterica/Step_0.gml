/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	col = make_color_hsv(col_step % 255,100,255);
	
	switch(image_angle)
	{
		case 0:
			x = goto_value(x,room_width,spd);
		break;
		case -90:
			y = goto_value(y,room_height,spd);
			
		break;
	}
	
	if(!activated)
	{
		if !((x == xprevious) and (y == yprevious))
		{
			if (step % 2 == 0)
			{
				var inst = instance_create_depth(x,y,depth,obj_iso_part);
				inst.col = col;
			}
		}
		
	}
	else
	{
		if(activated_time == 0)
		{
			var inst = create_shot_hitbox(x,y,1,spr_bomb_isoterica_collision,2.5,60,true);
			inst.image_angle = image_angle;
			
		}
		
		if(activated_time <= 60)
		{
			y_scale += recursiv(y_scale,4,5,0.1);
		}
		else
		{
			y_scale += recursiv(y_scale,0,6,1);
			if (y_scale == 0)
			{
				instance_destroy(self);
			}
		}
		

		activated_time +=1;
	}
	
	col_step += y_scale;
	
	step += 1;
}