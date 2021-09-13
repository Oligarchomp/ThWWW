/// create_shot_hitbox(x,y,type,mask,damage,lifespan,cancel)
///@param x real
///@param y real
///@param type real
///@param mask instance
///@param damage real
///@param lifespan real
///@param cancel boolean
function create_shot_hitbox(argument0,argument1,argument2,argument3,argument4,argument5,argument6){

	var inst = instance_create_depth(argument0,argument1,depth - 1,obj_shot_hitbox);
	
	inst.my_shot = self;
	inst.hitbox_type = argument2;
	inst.sprite_index = argument3
	inst.damage = argument4;
	inst.life = argument5;
	inst.cancel = argument6;
	
	return inst;
}