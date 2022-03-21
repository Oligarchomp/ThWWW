/// create_confett(x,y,number,spd)
///@param x real
///@param y real
///@param number real
///@param spd real
function create_confetti(xx,yy,nbr,spd){
	repeat(nbr)
	{	
		var inst = instance_create_depth(xx,yy,global.boss_depth - 1,obj_confetti);
		inst.spd = spd + rng(spd / 3,false,2)
	}
}