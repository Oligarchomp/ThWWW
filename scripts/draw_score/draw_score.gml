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
	
	var dot_dist = 6;
	
	var text_lenght = string_length(text);
	for(var i = 0; i < text_lenght; i += 1)
	{
		var value = string_char_at(text,text_lenght - i)
		var im = real(value);
		draw_sprite_ext(spr,im, x_pos - i * char_dist - floor(i / 3) * dot_dist, y_pos,scl,scl,0,c_white,alph)
	}
	//draw dots
	for(var i = 0; i < floor((text_lenght - 1) / 3); i += 1)
	{
		draw_sprite_ext(spr,10,x_pos - (i + 1) * char_dist * 3 - i * dot_dist + 4,y_pos,scl,scl,0,c_white,alph);	
	}
}