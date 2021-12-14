///boss_charge(x,y)
///@param x real
///@param y real
function boss_charge(argument0,argument1){

	play_sound(sfx_boss_charge,1,false);

	var inst = instance_create_depth(argument0,argument1,global.boss_depth + 1,obj_boss_charge);
	
	return inst;
}