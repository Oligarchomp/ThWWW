/// @description Insert description here
// You can write your code in this editor

draw_line_width_color(x,y,x_to,y_to,size,col,col);

if(global.view_hitbox)
{
	if(state == 1)
	{
		draw_sprite_ext(spr_laser_hitbox,0,x,y,1,1,image_angle,c_white,1);
	}
}