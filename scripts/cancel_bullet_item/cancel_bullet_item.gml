/// cancel_bullet_item(instance)
///@param instance instance
function cancel_bullet_item(argument0){

	with(argument0)
	{
		create_item(ITEM_CANCEL,x,y);
		cancel_bullet(self);
	}
		
}