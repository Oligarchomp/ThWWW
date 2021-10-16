/// @description Insert description here
// You can write your code in this editor

var dist = room_width / 2;
draw_line_width(x - dist * image_xscale,y - dist,x + dist * image_xscale,y + dist,size);

if(global.view_hitbox)
{
	if(state == 1)
	{
		draw_sprite_ext(spr_winelaser_hitbox,0,x,y,image_xscale,1,0,c_white,1)
	}
}