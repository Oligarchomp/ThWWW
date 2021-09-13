///screen_clear(star_item,including_uncancelable)
///@param star_item boolean
///@param including_uncancelable boolean
function screen_clear(argument0,argument1){
	
	var star_item = argument0;
	var cancel_uncancelable = argument1;
	
	with(obj_danmaku_spawn)
	{
		cancel = true;
	}
	
	with(obj_danmaku)
	{
		if(star_item)
		{
			create_item(ITEM_CANCEL,x,y,);
		}
		
		if(is_cancelable)
		{
			cancel_bullet(self);
		}
		else
		{
			if(cancel_uncancelable)
			{
				cancel_bullet(self);
			}
		}
	}
	with(obj_enemy)
	{
		life = 0;
	}
	
}