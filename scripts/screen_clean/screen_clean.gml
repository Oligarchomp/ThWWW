///screen_attack(star_item,including_uncancelable)
///@param star_item boolean
///@param including_uncancelable boolean
//same as screen_clear but ignore enemy
function screen_clean(argument0,argument1){
	
	var star_item = argument0;
	var cancel_uncancelable = argument1;
	
	with(obj_danmaku_spawn)
	{
		if(is_cancelable) or (cancel_uncancelable)
		{
			cancel = true;
		}
	}
	
	with(obj_danmaku)
	{
		if(is_cancelable) or (cancel_uncancelable)
		{
			cancel_bullet(self);
			if(star_item)
			{
				create_item(ITEM_CANCEL,x,y,);
			}
		}
		/*
		else
		{
			if(cancel_uncancelable)
			{
				cancel_bullet(self);
				if(star_item)
				{
					create_item(ITEM_CANCEL,x,y,);
				}
			}
		}
		*/
	}
	
}