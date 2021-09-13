/// draw_score(score,x,y,sprite,scale,alpha)
///@param score real
///@param x real
///@param y real
///@param sprite image
///@param scale real
///@param alpha real
function draw_score(argument0,argument1,argument2,argument3,argument4,argument5){
	var text = string(argument0);
	var x_pos = argument1;
	var y_pos = argument2;
	var spr = argument3;
	var scl = argument4;
	var char_dist = sprite_get_width(spr_score) * scl;
	var alph = argument5;
	
	var text_lengh = string_length(text);
	for(var i = text_lengh; i > 0 ; i -= 1)
	{
		var value = string_char_at(text,i)
		var im = real(value);
		draw_sprite_ext(spr,im, x_pos - (text_lengh * char_dist) + i * char_dist, y_pos,scl,scl,0,c_white,alph)
	}

}