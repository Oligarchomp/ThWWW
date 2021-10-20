///shoot_laser_pos(x1,y1,x2,y2,charge,lenght,col)
///@param x1 real
///@param y1 real
///@param x2 real
///@param y2 real
///@param charge real
///@param lenght real
///@param col color
function shoot_laser_pos(argument0,argument1,argument2,argument3,argument4,argument5,argument6){

	var x1 = argument0;
	var y1 = argument1;
	var x2 = argument2;
	var y2 = argument3;
	var charge = argument4;
	var lenght = argument5;
	var col = argument6;
	
	var inst = instance_create_depth(x1,y1,0,obj_laser);
	inst.x_to = x2;
	inst.y_to = y2;
	inst.charge_time = charge;
	inst.active_time = lenght;
	inst.col = col;
	inst.image_angle = find_angle(x1,y1,x2,y2);
}