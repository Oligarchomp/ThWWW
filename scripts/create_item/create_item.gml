/// create_item(item,x,y)
///@param item real
///@param x real
///@param y real
function create_item(argument0,argument1,argument2){
	global.item = argument0;
	instance_create_depth(argument1,argument2,global.item_depth,obj_item);
}