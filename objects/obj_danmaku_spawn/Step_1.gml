/// @description Insert description here
// You can write your code in this editor
//in step begin so that the bullet can be corectly canceled

if (global.gp_active)
{
	alpha = goto_value(alpha,1,0.2);
	scale = goto_value(scale,1,0.2);
	
	if (!cancel)
	{
		if (alpha == 1)
		{
			instance_activate_object(my_danmaku);
			
			var inst = instance_create_depth(my_danmaku.x,my_danmaku.y,my_danmaku.depth - 1,obj_hitbox);
			inst.owner = my_danmaku;
			inst.danmaku_id = my_danmaku.danmaku_id;
			
			my_danmaku.my_hitbox = inst;
			
		
			//
			var inst = instance_create_depth(my_danmaku.x,my_danmaku.y,my_danmaku.depth - 1,obj_grazebox);
			inst.owner = my_danmaku;
			inst.danmaku_id = my_danmaku.danmaku_id;
			//
		
			instance_destroy(self);
		}
	}
	else
	{
		instance_activate_object(my_danmaku);
		instance_destroy(self)
	}
	
}