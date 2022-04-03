/// create_credit(x,y,text,spawn_type)///@param x real
///@param y real
///@param text string
///@param spawn_type real

function create_credit(xx,yy,text,spawn_type){
	
	var inst = instance_create_depth(xx,yy,depth - 2,obj_credit_spawn);
	inst.spawn_type = spawn_type;
	inst.str = text;
	
	inst.angle = spawn_type ? 130 : 0;
	
	return inst;
}