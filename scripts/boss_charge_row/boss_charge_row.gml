///boss_charge_row(x,y,angle,dist,size,number_per_frame)
///@param x real
///@param y real
///@param angle real
///@param dist real
///@param size real
///@param number real
function boss_charge_row(xx,yy,angle,dist,size,nbr){
	var inst = instance_create_depth(xx,yy,global.boss_depth,obj_rowcharge);
	inst.size = size;
	inst.dist = dist;
	inst.number = nbr;
	inst.angle = angle;
}