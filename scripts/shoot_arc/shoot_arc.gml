///shoot_arc(danmaku,color,inst_number,x,y,angle,angle_dist,speed,sound,id_number)
///@param danmaku_id real
///@param color_id real
///@param inst_number real
///@param x real
///@param y real
///@param angle real
///@param angle_dist real
///@param speed real
///@param sound sfx
///@param id_number real
function shoot_arc(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9){

	var danmaku = argument0;
	var color = argument1;
	var inst_number = argument2;
	var x_pos = argument3;
	var y_pos = argument4;
	var angle = argument5;
	var angle_dist = argument6;
	var spd = argument7;
	var snd = argument8;
	var id_number = argument9;
	
	if (angle == 999)
	{
		angle = find_angle(x_pos,y_pos,obj_player.x,obj_player.y);
	}
	
	var off = ((inst_number - 1) * angle_dist / 2)
	var new_angle = angle - off
	
	repeat(inst_number)
	{
		shoot(danmaku,color,x_pos,y_pos,new_angle,spd,snd,id_number);
		new_angle += angle_dist;
	}
}
	