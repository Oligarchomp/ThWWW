///screen_clear(star_item,including_uncancelable)
///@param star_item boolean
///@param including_uncancelable boolean
function screen_clear(argument0,argument1){
	
	screen_clean(argument0,argument1);
	
	with(obj_enemy)
	{
		life = 0;
	}
	
}