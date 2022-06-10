/// @description Insert description here
// You can write your code in this editor

var x_pos = global.game_x_offset;
var y_pos = global.game_y_offset + 18;
repeat (3)
{
	draw_line_width_color(x_pos - 1,y_pos,x_pos + 66,y_pos,2,c_red,c_red);
	
	y_pos += 1;
}
draw_line_width_color(x_pos - 1,y_pos,x_pos + 66,y_pos,1,c_black,c_black);