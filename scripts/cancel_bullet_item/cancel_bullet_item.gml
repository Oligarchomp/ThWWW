/// cancel_bullet_item(instance)
///@param instance instance
function cancel_bullet_item(argument0){

	with(argument0)
	{
		var inst = instance_create_depth(x,y,depth,obj_cancel);
		inst.image_index = color_id;
		create_item(ITEM_CANCEL,x,y);
		instance_destroy();
	}
		
}