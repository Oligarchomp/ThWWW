///shoot(danmaku,color,x,y,angle,speed,sound,id_number)
///@param danmaku_id real
///@param color_id real
///@param x real
///@param y real
///@param angle real
///@param speed real
///@param sound sfx
///@param id_number real

function shoot(danmaku,color,x_pos,y_pos,angle,spd,snd,id_number){

	var dan = obj_danmaku1
	switch(id_number)
	{
		case 1:
			dan = obj_danmaku1;
		break;
		case 2:
			dan = obj_danmaku2;
		break;
		case 3:
			dan = obj_danmaku3;
		break;
		case 4:
			dan = obj_danmaku4;
		break;
		case 5:
			dan = obj_danmaku5;
		break;
		case 6:
			dan = obj_danmaku6;
		break;
		case 7:
			dan = obj_danmaku7;
		break;
		default: // and 8
			dan = obj_danmaku8;
		break;
	}
	
	angle = angle == 999 ? find_angle(x_pos,y_pos,obj_player.x,obj_player.y) : angle;
	
	angle = global.rng_patch ? rng(360,false,1) : angle;
	
	global.danmaku_id = danmaku;
	global.danmaku_color = color;
	global.danmaku_angle = angle;                                 
	global.danmaku_speed = spd;
	
	
	var inst = noone;
	if (instance_number(obj_danmaku) < global.bullet_cap)
	{
		var inst = instance_create_depth(x_pos,y_pos,0,dan)
	
		play_sound(snd,1,false);
	}
	
	return inst;
	
}