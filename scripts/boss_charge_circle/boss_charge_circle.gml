///boss_charge_cirle(x,y,size)
///@param x real
///@param y real
///@param size real
function boss_charge_circle(xx,yy,size){
	var inst = instance_create_depth(xx,yy,global.boss_depth,obj_circlecharge);
	inst.size = size;
}