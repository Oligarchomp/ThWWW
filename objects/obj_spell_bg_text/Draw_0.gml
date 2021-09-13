/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_spell_bg);

var i_dist = 220;
var j_dist = 60;
for (var i = -2; i < 2; i += 1) //horizontal
{
	for (var j = 0; j < 4; j += 1)
	{
		var new_offset = offset;
		
		if (j % 2 == 0)
		{
			new_offset *= -1;
		}
		
		draw_text_transformed_color(x + i * i_dist - new_offset ,y + j * j_dist,text,1,1,0,c_white,c_white,c_white,c_white,alpha)
		draw_text_transformed_color(y - 100 + j * j_dist, x + 300 + i * i_dist - new_offset,text,1,1,90,c_white,c_white,c_white,c_white,alpha)
	}
}