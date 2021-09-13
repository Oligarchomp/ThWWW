///shoot(danmaku,color,x,y,angle,speed,sound,id_number)
///@param danmaku_id real
///@param color_id real
///@param x real
///@param y real
///@param angle real
///@param speed real
///@param sound sfx
///@param id_number real

function shoot(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7){

	var danmaku = argument0;
	var color = argument1;
	var x_pos = argument2;
	var y_pos = argument3;
	var angle = argument4;
	var spd = argument5;
	var snd = argument6;
	var id_number = argument7;
	
	switch(id_number)
	{
		case 1:
			var dan = obj_danmaku1;
		break;
		case 2:
			var dan = obj_danmaku2;
		break;
		case 3:
			var dan = obj_danmaku3;
		break;
		case 4:
			var dan = obj_danmaku4;
		break;
		case 5:
			var dan = obj_danmaku5;
		break;
		case 6:
			var dan = obj_danmaku6;
		break;
		case 7:
			var dan = obj_danmaku7;
		break;
		default: // and 8
			var dan = obj_danmaku8;
		break;
	}
	
	if (angle == 999) //aimed
	{
		angle = find_angle(x_pos,y_pos,obj_player.x,obj_player.y)
	}
	
	//home made rng patch!!
	//angle = rng(360,false,3);
	
	global.danmaku_id = danmaku;
	global.danmaku_color = color;
	global.danmaku_angle = angle;
	global.danmaku_speed = spd;
	
	
	if (instance_number(obj_danmaku) < global.bullet_cap)
	{
		var inst = instance_create_depth(x_pos,y_pos,0,dan)
	
		play_sound(snd,1,false);
		
		return inst;
	}
	
	
}