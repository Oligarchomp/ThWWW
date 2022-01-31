///boss_charge_sfx(x,y,sfx)
///@param x real
///@param y real
///@param sfx id
function boss_charge_sfx(argument0,argument1,argument2){

	play_sound(argument2,1,false);

	var inst = instance_create_depth(argument0,argument1,global.boss_depth + 1,obj_boss_charge);
	
	return inst;
}