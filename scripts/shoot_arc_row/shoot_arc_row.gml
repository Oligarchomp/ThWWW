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
function shoot_arc_row(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11){

	var danmaku = argument0;
	var color = argument1;
	var inst_number_arc = argument2;
	var inst_number_row = argument3;
	var x_pos = argument4;
	var y_pos = argument5;
	var angle = argument6;
	var angle_dist = argument7;
	var spd_min = argument8;
	var spd_max = argument9;
	var snd = argument10;
	var id_number = argument11;
	
	if (angle == 999)
	{
		angle = find_angle(x_pos,y_pos,obj_player.x,obj_player.y);
	}
	
	
	var off = ((inst_number_arc - 1) * angle_dist / 2)
	var new_angle = angle - off
	
	repeat(inst_number_arc)
	{
		shoot_row(danmaku,color,inst_number_row,x_pos,y_pos,new_angle,spd_min,spd_max,snd,id_number);
		new_angle += angle_dist;
	}
	

}