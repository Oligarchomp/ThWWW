/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	
	if (homming_time > 0)
	{
		if (instance_exists(parent_enemy))
		{
			var target = instance_nearest(x,y,parent_enemy);
			angle = find_angle(x,y,target.x,target.y);
			angle = target.mask_index == spr_nothing ? 90 : angle;
		}
		else
		{
			angle = 90;
		}
		
		homming_time -= 1;
	}
	else
	{
		angle = 90;
	}
	
	var dis = lengthdir_x(max_spd,angle);
	hsp = goto_value(hsp,dis,acc)
		
		
	var dis = lengthdir_y(max_spd,angle);
	vsp = goto_value(vsp,dis,acc)
		
	x += hsp;
	y += vsp;
	
	with (my_hitbox)
	{
		x = other.x;
		y = other.y;
	}
	
	if (!instance_exists(my_hitbox))
	{
		var inst = instance_create_depth(x,y,depth,obj_shot_base_dust);
		inst.sprite_index = sprite_index;
		inst.image_index = image_index;
		
		instance_destroy();
		instance_destroy(my_hitbox);
	}
	
	if (y < -offscreen) or (y > room_height + 20)
	{
		instance_destroy();
		instance_destroy(my_hitbox);
	}
	
	rot = find_angle(0,0,hsp,vsp);
}