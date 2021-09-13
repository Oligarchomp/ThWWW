/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	
	switch(player_id)
	{
		case 1:
			angle += 45;
		break;
		case 2: //sanae
			image_index = 1 + step * im_spd
		break;
		
	}
	
	// touching something
	if (!instance_exists(my_hitbox))
	{
		var inst = instance_create_depth(x,y,depth,obj_shot_base_dust);
		inst.sprite_index = sprite_index;
		inst.image_index = image_index - 1;
		
		instance_destroy();
	}
	else
	{
		var dest = y + vsp;
		while(!place_meeting(x,y,parent_enemy) and (y != dest))
		{
			y = goto_value(y,dest,1);
		}
	
		if (y < - y_offscreen)
		{
			instance_destroy(my_hitbox);
			instance_destroy();
		}
	}
	
	with (my_hitbox)
	{
		x = other.x;
		y = other.y - 1;
	}
	
	step += 1;
}