///shoot_row(danmaku,color,inst_number,x,y,angle,speed_min,speed_max,sound,id_number)
///@param danmaku_id real
///@param color_id real
///@param inst_number real
///@param x real
///@param y real
///@param angle real
///@param speed_min real
///@param speed_max real
///@param sound sfx
///@param id_number real
function shoot_row(danmaku,color,inst_number,x_pos,y_pos,angle,spd_min,spd_max,snd,id_number){
	
	for (var i = spd_min; i < spd_max; i += (spd_max - spd_min) / inst_number)
	{
		shoot(danmaku,color,x_pos,y_pos,angle,i,snd,id_number);
	}
}