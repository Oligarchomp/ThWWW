///shoot_laser(x1,y1,angle,charge,lenght,col,sfx)
///@param x1 real
///@param y1 real
///@param angle real
///@param charge real
///@param lenght real
///@param col color
///@param sfx sound
function shoot_laser(x1,y1,ang,charge,lenght,col,sfx){
	
	ang = global.rng_patch ? rng(360,false,1) : ang;
	var size = sprite_get_width(spr_laser_hitbox);
	
	var inst = instance_create_depth(x1,y1,0,obj_laser);
	inst.x_to = x1 + lengthdir_x(size,ang);
	inst.y_to = y1 + lengthdir_y(size,ang);
	inst.charge_time = charge;
	inst.active_time = lenght;
	inst.col = col;
	inst.sound = sfx;
	inst.image_angle = ang;
	
	return inst;
}