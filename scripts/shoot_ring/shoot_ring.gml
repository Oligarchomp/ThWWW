///shoot_ring(danmaku,color,inst_number,x,y,angle,speed,sound,id_number)
///@param danmaku_id real
///@param color_id real
///@param inst_number real
///@param x real
///@param y real
///@param angle real
///@param speed real
///@param sound sfx
///@param id_number real

function shoot_ring(danmaku,color,inst_number,x_pos,y_pos,angle,spd,snd,id_number){
	
	switch(angle)
	{
		case 999:
			angle = find_angle(x_pos,y_pos,obj_player.x,obj_player.y);
		break;
		case 998:
			angle = find_angle(x_pos,y_pos,obj_player.x,obj_player.y) + (360 / inst_number / 2);
		break;
	}
	
	for (var i = 0; i < inst_number; i += 1)
	{
		shoot(danmaku,color,x_pos,y_pos,angle + i * (360 / inst_number),spd,snd,id_number);
	}
	
}