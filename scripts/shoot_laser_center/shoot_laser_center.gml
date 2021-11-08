///shoot_laser_center(x,y,angle,charge,lenght,col,sfx)
///@param x real
///@param y real
///@param angle real
///@param charge real
///@param lenght real
///@param col color
///@param sfx sound
function shoot_laser_center(argument0,argument1,argument2,argument3,argument4,argument5,argument6){

	var xx = argument0;
	var yy = argument1;
	var ang = argument2;
	var dist = sprite_get_width(spr_laser_hitbox) / 2;
	
	var x1 = xx - lengthdir_x(dist,ang);
	var y1 = yy - lengthdir_y(dist,ang);
	var x2 = xx + lengthdir_x(dist,ang);
	var y2 = yy + lengthdir_y(dist,ang);
	var charge = argument3;
	var lenght = argument4;
	var col = argument5;
	var sfx = argument6;
	
	var inst = instance_create_depth(x1,y1,0,obj_laser);
	inst.x_to = x2;
	inst.y_to = y2;
	inst.charge_time = charge;
	inst.active_time = lenght;
	inst.col = col;
	inst.sound = sfx;
	inst.image_angle = find_angle(x1,y1,x2,y2);
	
	return inst;
}