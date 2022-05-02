///shoot_arc_row(danmaku,color,inst_number_arc,inst_number_row,x,y,angle,angle_dist,speed_min,speed_max,sound,id_number)
///@param danmaku_id real
///@param color_id real
///@param inst_number_arc real
///@param inst_number_row real
///@param x real
///@param y real
///@param angle real
///@param angle_dist real
///@param speed_min real
///@param speed_max real
///@param sound sfx
///@param id_number real
function shoot_arc_row(danmaku,color,inst_number_arc,inst_number_row,x_pos,y_pos,angle,angle_dist,spd_min,spd_max,snd,id_number){

	angle = angle == 999 ? find_angle(x_pos,y_pos,obj_player.x,obj_player.y) : angle;
	
	var off = ((inst_number_arc - 1) * angle_dist / 2)
	var new_angle = angle - off
	
	repeat(inst_number_arc)
	{
		shoot_row(danmaku,color,inst_number_row,x_pos,y_pos,new_angle,spd_min,spd_max,snd,id_number);
		new_angle += angle_dist;
	}
	

}