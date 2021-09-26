/// cancel_bullet(instance)
///@param instance instance
function cancel_bullet(argument0){

	with(argument0)
	{
		var inst = instance_create_depth(x,y,depth,obj_cancel);
		inst.image_index = color_id;
		instance_destroy();
	}
		
}