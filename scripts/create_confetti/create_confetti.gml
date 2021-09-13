/// create_confett(x,y,number,spd)
///@param x real
///@param y real
///@param number real
///@param spd real
function create_confetti(argument0,argument1,argument2,argument3){
	repeat(argument2)
	{	
		var inst = instance_create_depth(argument0,argument1,global.boss_depth - 1,obj_confetti);
		inst.spd = argument3 + rng(argument3/ 3,false,2)
	}
}