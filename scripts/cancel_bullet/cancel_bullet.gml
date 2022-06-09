/// cancel_bullet(instance)
///@param instance instance
function cancel_bullet(argument0){

	with(argument0)
	{
		var inst = instance_create_depth(x,y,depth,obj_cancel);
		inst.sprite_index = sprite_danmaku;
		inst.angle = rot;
		inst.image_index = color_id * image_nbr;
		
		inst.scale *= visual_xscale;
		inst.scale_ref = inst.scale;
		
		instance_destroy();
	}
		
}