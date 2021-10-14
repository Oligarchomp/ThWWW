/// @description Insert description here
// You can write your code in this editor


for(var i = -1; i < 3; i += 1)
{
	draw_sprite_ext(sprite_index,0,x + i * width * x_scale,y,x_scale,1,0,c_white,1);
}

//black bottom
var y_pos = y + height / 2;
draw_sprite_pos(spr_black,0,-50,y_pos,room_width + 50,y_pos,room_width + 50,room_height + 200,-50,room_height + 200,1);

//black top
var y_pos = y - height / 2 + 2;
draw_sprite_pos(spr_black,0,-50,-50,room_width + 50,-50,room_width + 50,y_pos,-50,y_pos,1);