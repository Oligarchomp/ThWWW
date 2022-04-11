/// @description Insert description here
// You can write your code in this editor
switch(global.lan)
{
	case LAN_ENG:
		draw_set_font(font_credit);
	break;
	case LAN_JAP:
		draw_set_font(global.font_main_j);
	break;
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_ext_transformed_color(x,y,str,30,900,scale,scale,0,c_white,c_white,c_white,c_white,alpha)
