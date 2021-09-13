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
function shoot_row(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9){

	var danmaku = argument0;
	var color = argument1;
	var inst_number = argument2;
	var x_pos = argument3;
	var y_pos = argument4;
	var angle = argument5;
	var spd_min = argument6;
	var spd_max = argument7;
	var snd = argument8;
	var id_number = argument9;
	
	for (var i = spd_min; i < spd_max; i += (spd_max - spd_min) / inst_number)
	{
		shoot(danmaku,color,x_pos,y_pos,angle,i,snd,id_number);
	}
}