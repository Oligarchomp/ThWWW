/// @description Insert description here
// You can write your code in this editor
if(is_thunder)
{
	draw_sprite_ext(sprite_index,0,x,y,x_scale,1,angle,c_white,alpha);
}
else // feza warning
{
	draw_sprite_ext(spr_warning_line,0,x,y,100,1,w_angle + 90,c_red,w_alpha);
}
