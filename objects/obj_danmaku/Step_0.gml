/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	if (!is_spawning)
	{
		if(last_state != state)
		{
			last_state = state;
			state_time = 0;
		}
		else
		{
			state_time += 1;
		}
	
		image_danmaku = (color_id * image_nbr ) + (step * image_spd) % image_nbr;
	
	
		switch(rot_type)
		{
			case ROT_FOLLOW:
				rot = angle;
			break;
			case ROT_SET:
				rot = rot_set_rot;
			break;
			case ROT_SPIN:
				rot += rot_spd;
			break;
		}
	
		switch(pos_type)
		{
			case POS_ANGLE:
				hsp = lengthdir_x(spd,angle);
				vsp = lengthdir_y(spd,angle);
				
				x += hsp;
				y += vsp;
			break;
			case POS_SP:
			
				vsp = goto_value(vsp,y_grav_max,y_grav_accel);
				hsp = goto_value(hsp,x_grav_max,x_grav_accel);
				
				x += hsp;
				y += vsp;
				
				angle = find_angle(x,y,x + hsp, y + vsp);
			break;
		}
	
		if (y < -y_offscreen) or (x < - x_offscreen) or (x > room_width + x_offscreen) or (y > room_height + y_offscreen)
		{
			instance_destroy(self);
		}
	
		
	
		step += 1
	}
	else
	{
		// first thing it ever does
		var inst = instance_create_depth(x,y,depth - 1,obj_danmaku_spawn);
		inst.sprite_index = sprite_danmaku;
		inst.image_index = color_id * image_nbr;
		inst.image_angle = rot;
		inst.my_danmaku = self;
		inst.spawn_type = spawn_type;
		inst.image_xscale = image_xscale;
		inst.image_yscale = image_yscale;
		inst.is_cancelable = is_cancelable;

		is_spawning = false;
		instance_deactivate_object(self);
	}
}
