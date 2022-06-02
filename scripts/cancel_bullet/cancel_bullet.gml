/// cancel_bullet(instance)
///@param instance instance
function cancel_bullet(argument0){

	with(argument0)
	{
		var inst = instance_create_depth(x,y,depth,obj_cancel);
		inst.image_index = color_id;
		
		var cancel_size = 1;
		switch(danmaku_id)
		{
			case DAN_BUBBLE:
				cancel_size = 2.5;
			break;
			case DAN_MENTOS:
				cancel_size = 1.5;
			break;
			case DAN_ANCHOR:
				cancel_size = 3;
			break;
			case DAN_ROCK:
				cancel_size = 2.2;
			break;
			case DAN_HEART:
				cancel_size = 1.4;
			break;
			case DAN_STARBIG:
				cancel_size = 1.1;
			break;
		}
		
		inst.scale *= image_xscale * cancel_size;
		instance_destroy();
	}
		
}