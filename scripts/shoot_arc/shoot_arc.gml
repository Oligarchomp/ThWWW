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
function shoot_arc(danmaku,color,inst_number,x_pos,y_pos,angle,angle_dist,spd,snd,id_number){

	
	angle = angle == 999 ? find_angle(x_pos,y_pos,obj_player.x,obj_player.y) : angle;
	
	var off = ((inst_number - 1) * angle_dist / 2)
	var new_angle = angle - off
	
	repeat(inst_number)
	{
		shoot(danmaku,color,x_pos,y_pos,new_angle,spd,snd,id_number);
		new_angle += angle_dist;
	}
}
	