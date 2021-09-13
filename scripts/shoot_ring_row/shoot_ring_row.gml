///shoot_ring_row(danmaku,color,inst_number_ring,inst_number_row,x,y,angle,speed_min,speed_max,sound,id_number)
///@param danmaku_id real
///@param color_id real
///@param inst_number_ring real
///@param inst_number_row real
///@param x real
///@param y real
///@param angle real
///@param speed_min real
///@param speed_max real
///@param sound sfx
///@param id_number real

function shoot_ring_row(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10){
	
	var danmaku = argument0;
	var color = argument1;
	var inst_number_ring = argument2;
	var inst_number_row = argument3;
	var x_pos = argument4;
	var y_pos = argument5;
	var angle = argument6;
	var spd_min = argument7;
	var spd_max = argument8;
	var snd = argument9;
	var id_number = argument10;
	
	switch(angle)
	{
		case 999:
			angle = find_angle(x_pos,y_pos,obj_player.x,obj_player.y);
		break;
		case 998:
			angle = find_angle(x_pos,y_pos,obj_player.x,obj_player.y) + (360 / inst_number_ring / 2);
		break;
	}
	
	for (var i = 0; i < inst_number_ring; i += 1)
	{
		shoot_row(danmaku,color,inst_number_row,x_pos,y_pos,angle + i * (360 / inst_number_ring),spd_min,spd_max,snd,id_number);
	}
	
	
	
}