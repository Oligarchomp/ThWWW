/// @function draw_text_outline(x,y,text,c1,c2,c3,c4,alpha,outline_color);
///@param x real
///@param y real
///@param text string
///@param c1 color
///@param c2 color
///@param c3 color
///@param c4 color
///@param alpha real
///@param outline_color color
function draw_text_outline(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8){

	var xx = argument0;
	var yy = argument1;
	var text = argument2;
	var c1 = argument3;
	var c2 = argument4;
	var c3 = argument5;
	var c4 = argument6;
	var alpha = argument7;
	var outline = argument8
	
	draw_text_color(xx,yy - 1,text,outline,outline,outline,outline,alpha);
	draw_text_color(xx,yy + 1,text,outline,outline,outline,outline,alpha);
	draw_text_color(xx + 1,yy ,text,outline,outline,outline,outline,alpha);
	draw_text_color(xx - 1,yy ,text,outline,outline,outline,outline,alpha);

	draw_text_color(xx,yy,text,c1,c2,c3,c4,alpha);
	
	
}