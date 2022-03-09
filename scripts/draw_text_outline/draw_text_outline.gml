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
function draw_text_outline(xx,yy,text,c1,c2,c3,c4,alpha,outline){
	
	draw_text_color(xx,yy - 1,text,outline,outline,outline,outline,alpha);
	draw_text_color(xx,yy + 1,text,outline,outline,outline,outline,alpha);
	draw_text_color(xx + 1,yy ,text,outline,outline,outline,outline,alpha);
	draw_text_color(xx - 1,yy ,text,outline,outline,outline,outline,alpha);

	draw_text_color(xx,yy,text,c1,c2,c3,c4,alpha);
	
}